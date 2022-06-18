<?php if( !ISIN_ADMIN ) exit;

$sid = $uri !== false ? $uri : 1;

global $post;
$con = SQLi(DBPRF);
$add_test = TESTNET_ON ? '': "WHERE id>0";
$qry = "SELECT * FROM stockist $add_test ORDER BY warehouse";
$rs  = mysqli_query($con,$qry) or die(mysqli_error($con));
$sel = '';

if( mysqli_num_rows($rs)>0 ) {
     while( $r = mysqli_fetch_assoc( $rs ) ) {
          foreach ( $r as $k=>$v ) $$k = $v;
          $sel .= '<option class="link" value="/admin/'.$post->post_name.'/?'.$id.'" '.($id==$sid?SELECTED:'').'>'.$warehouse.'</option>';
     }
}

$x  = '<div id="stockist_list" class="rt"><select>';
$x .= $sel;
$x .= '</select><hr></div>';

echo $x;

require_once plugin_dir_path( __DIR__ ) . 'stockist/stocks.php';

?>
