<?php if( !IS_GLOBAL ) exit;

defined('INCLUDE_CHECK') || define('INCLUDE_CHECK',1);
require_once plugin_dir_path( __DIR__ ) . 'templates/init_setup.php';

$con = SQLi(DBPRF);
$rs  = mysqli_query($con,"SELECT dsdid,discount FROM distributors WHERE discount=''") or die(mysqli_error($con));
$i   = mysqli_num_rows($rs);
if( $i > 0 ) {
     while( $r = mysqli_fetch_assoc($rs) ) {
          $dsc = hash( 'crc32', time().$r['dsdid'] );

          mysqli_query( $con, "UPDATE distributors SET discount='$dsc' WHERE dsdid='".$r['dsdid']."'" );
          echo "Discount Code '$dsc' for ID# ".$r['dsdid']."<br>";
     }
     $x = "<br><h5>$i DISCOUNT CODES ASSIGNED</h5>";
} else {
     $x = '<h5>NO EMPTY DISCOUNT CODES</h5>';
}
mysqli_close($con);
echo $x;
?>
