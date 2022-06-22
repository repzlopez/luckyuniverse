<?php
if( !empty( $_POST ) ) {
     defined('INCLUDE_CHECK') || define('INCLUDE_CHECK',1);
     require_once plugin_dir_path( __DIR__ ) . 'templates/setup.php';

     $con = SQLi(DBPRF);
     $_SESSION['return_msg'] = null;
     $_SESSION['un'] = null;
     $rett= 'Account';

     foreach ( $_POST as $k=>$v ) $$k=$v;

     $type = 'distributors';
     $stat = 'dsstatus';
     $add  = is_numeric($un) ? "dsdid=$un" : "un='$un'";
     $qry  = "SELECT dsdid,CONCAT(dslnam,', ',dsfnam,' ',dsmnam) nam,dssid,un,pw,pay_type,dsstatus,discount,
          (SELECT CONCAT(dslnam,', ',dsfnam,' ',dsmnam) FROM distributors WHERE dsdid=d.dssid) snam
          FROM distributors d
          WHERE $add";
     $address = null;

     $test = mysqli_query($con,$qry) or die(mysqli_error($con));
     $r = mysqli_fetch_array($test);

     if( mysqli_num_rows($test) == 0 ) {                //test if acct exists
          $_SESSION['return_msg']['msg'] = 'Invalid username or password';
     } elseif( !$r[$stat] ) {                      //test if disabled
          $_SESSION['return_msg']['msg'] = 'Account is DISABLED. Contact Admin.';
     } else {

          $pw = sha1( trim_escape( $con, $pw . ASIN . $r['dsdid'] ) );
		$pwsql = stripslashes($r['pw']);

		if( $pw == $pwsql ) {					//test pass
               foreach ( $r as $k=>$v ) $$k=$v;

               $_SESSION['dsdid']             = $dsdid;
               $_SESSION['un']                = $un;
               $_SESSION['nam']               = $nam;
               $_SESSION['dssid']             = $dssid;
               $_SESSION['snam']              = $snam;
               $_SESSION['address']           = $address;
               $_SESSION['user_type']         = $type;
               $_SESSION['pay_type']          = $pay_type;
               $_SESSION['discount_code']     = $discount;
		} else {
               $_SESSION['return_msg']['msg'] = 'Invalid username or password';
          }
     }
     mysqli_close($con);

     if( isset($_SESSION['return_msg']['msg']) ) {
          $rett= 'Account';
     }

     $ret  = get_page_by_title( $rett, '', 'page' );
     wp_redirect( get_permalink( $ret->ID ) );
     exit;
}
?>
