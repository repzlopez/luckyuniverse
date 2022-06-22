<?php
if( !isset($_SESSION) ) session_start();

if( !empty( $_POST ) ) {
     defined('INCLUDE_CHECK') || define('INCLUDE_CHECK',1);
     require_once plugin_dir_path( __DIR__ ) . 'templates/setup.php';

     $con = SQLi(DBPRF);
     $_SESSION['return_msg'] = null;
     $_SESSION['contact'] = null;
     $rett= 'Account';

     foreach ( $_POST as $k=>$v ) $$k=$v;

     if( is_numeric($contact) && strlen($contact)>8 ) {
          $type = 'customers';
          $stat = 'status';
          $rett = 'Shop';
          $qry  = "SELECT id dsdid,receiver nam,address,contact un,referrer dssid,
               		pay_out,c.pw,status,
                         (SELECT discount FROM distributors WHERE dsdid=c.referrer AND c.referrer<>'/') discount,
                         (SELECT CONCAT(dslnam,', ',dsfnam,' ',dsmnam) FROM distributors WHERE dsdid=c.referrer AND c.referrer<>'/') snam
               FROM customers c
               LEFT JOIN distributors d ON dsdid=referrer
               WHERE receiver='$customer_name'
               AND contact='$contact'";
     }

     $test = mysqli_query($con,$qry) or die(mysqli_error($con));
     $r = mysqli_fetch_array($test);

     if( mysqli_num_rows($test) == 0 ) {                //test if acct exists
          $_SESSION['return_msg']['msg'] = 'Invalid login credentials';
     } elseif( !$r[$stat] ) {                      //test if disabled
          $_SESSION['return_msg']['msg'] = 'Account is DISABLED. Contact Admin.';
     } else {

          $pw = sha1( trim_escape( $con, $pw . ASIN . $r['un'] ) );
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
          $rett= 'Customers';
     }

     $ret  = get_page_by_title( $rett, '', 'page' );
     wp_redirect( get_permalink( $ret->ID ) );
     exit;
}
?>
