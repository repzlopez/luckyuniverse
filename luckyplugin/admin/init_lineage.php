<?php if( !ISIN_ADMIN ) exit;

global $post,$z;
$z   = array();
$did = '';

if( isset( $_POST['dsdid'] ) && $_POST['dsdid']!=='' ) {
     defined('INCLUDE_CHECK') || define('INCLUDE_CHECK',1);
     require_once plugin_dir_path( __DIR__ ) . 'templates/init_setup.php';

     $did = $_POST['dsdid'];
     getDistList($did,0);
     krsort($z);

     $y  = '<hr><ul id="lineage" class="listing">';
     $y .= implode( '', $z );
     $y .= '</ul>';
     unset( $_POST );
}

$ret  = get_page_by_title( $post->post_title, '', 'page' );

$x  = '<h4>Distributor Lineage</h4>';
$x .= '<form method="post"><div>';
     $x .= '<input type="number" class="w5" name="dsdid" placeholder="Distributor #" min=0 value="'.$did.'" required /> ';
     $x .= '<input type="submit" class="btn" name="submit" value="Submit" />';
$x .= '</div></form><br>';

echo $x . $y . BACKTOTOP;
echo '<hr><div id="bottom_nav"><a href="'. get_permalink( $ret->ID ) .'" class="btn">BACK</a></div>';

function getDistList($id,$n) {
	global $z;
     $con = SQLi(DBPRF);
     $qry = "SELECT dsdid,dssid,CONCAT(dslnam,', ',dsfnam,' ',dsmnam) nam FROM distributors WHERE dsdid=$id";
     $rs  = mysqli_query($con, $qry) or die(mysqli_error($con));
	$r   = mysqli_fetch_array($rs);

     $mgd  = get_page_by_title( "Manage Distributors", '', 'page' );
	$z[] = '<li'.( $n>0 ? '': ' class="bad"').'><a href="'. get_permalink( $mgd->ID ) .'?'.$r['dsdid'] .'" class="w2" target="_blank">'.$r['dsdid'].'</a> <span class="w6">'.$r['nam'].'</span></li>';
     mysqli_close($con);
     $n++;
	if( $id != 0 ) getDistList( $r['dssid'], $n );
}
?>
