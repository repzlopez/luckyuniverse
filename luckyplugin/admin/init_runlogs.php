<?php if( !IS_GLOBAL ) exit;

defined('INCLUDE_CHECK') || define('INCLUDE_CHECK',1);
require_once plugin_dir_path( __DIR__ ) . 'templates/init_setup.php';

$yr = date('Y');
$tbl= "logs$yr";

$con = SQLi('logs');
$qry = "SELECT l.*,
          (SELECT concat(d.dslnam,', ',d.dsfnam,' ',substr(d.dsmnam,1,1),'.') FROM ".DB.DBPRF.".distributors d WHERE d.dsdid=l.affect) nam
     FROM $tbl l
     WHERE tbl='distributors'
     ORDER BY stamp DESC";
$rs  = mysqli_query($con,$qry) or die(mysqli_error($con));
$i   = mysqli_num_rows($rs);
if( $i > 0 ) {
     $x  = '<h4>Profile Edit Logs</h4>';
     $x .= '<ul id="runlogs" class="listing">';
     $x .= '<li><strong class="w6">Account</strong><strong class="w2">Edit by</strong><strong class="w4">Timestamp</strong></li>';

     $distri   = get_page_by_title( 'Manage Distributors', '', 'page' );
     while( $r = mysqli_fetch_assoc($rs) ) {
          foreach ($r as $k=>$v) $$k = $v;

          $x .= '<li><a href="'.get_permalink($distri->ID) . '?'. $affect.'" class="w6" target="_blank">'.$affect.' '.$nam.'</a><span class="w2">'.$who.'</span><span class="w4">'.$stamp.'</span></li>';
     }

     $x .= '</ul>';
} else {
     $x = "<h5>NO LOGS IN $yr</h5>";
}

mysqli_close($con);
echo $x . BACKTOTOP;
?>
