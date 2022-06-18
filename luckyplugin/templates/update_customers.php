<?php
if( !isset($_SESSION) ) session_start();

$save_on = isset($_POST['save_on']) && $_POST['save_on'];
unset($_POST['save_on']);

if( !preg_match( "/admin|customers/i", $_SESSION['user_type'] ) && !$save_on ) exit;

if( isset($_POST) ) {
     defined('INCLUDE_CHECK') || define('INCLUDE_CHECK',1);
     require_once('init_setup.php');
     require_once('setup.php');

     $con = SQLi(DBPRF);
     if( isset($_POST['pw']) && $_POST['pw']!='' ) {
          $pw = $_POST['pw'] . ASIN . $_POST['contact'];
          $_POST['pw'] = sha1( trim_escape( $con, $pw ) );
     }

     foreach( $_POST as $k=>$v ) $$k=$v;
     $_SESSION['return_msg'] = null;
     $_SESSION['post'] = $_POST;
     $tbl = 'customers';

     if( $id==='' || $save_on ) {
          //test contact#
          $wer      = "WHERE receiver='".$_POST['receiver']."' AND contact='".$_POST['contact']."'";
          $qry      = "SELECT contact FROM $tbl $wer";
          $test     = mysqli_query( $con, $qry ) or die(mysqli_error($con));

          if( mysqli_num_rows($test)>0 ) {
               $_SESSION['return_msg']['msg'] = 'Welcome back!';
          }
     }

     if( !isset($_SESSION['return_msg']['msg']) ) {
          $int = "/pay_out|status/i";
          list($kdata,$idata,$udata) = set_kiu($con,$_POST,$int);

          $_SESSION['return_msg']['msg'] = 'Update success';
          $_SESSION['return_msg']['class'] = 1;
     }

     if( $_SESSION['return_msg']['class'] ) {
          insert_duplicate($con,$tbl,$kdata,$idata,$udata);
          init_logs(1,$tbl,$id,( ISIN_ADMIN ? ADMIN_ID : $id ));
     }

     if( $save_on ) {
          if( !$_SESSION['return_msg']['class'] ) {
               echo $_SESSION['return_msg']['msg'];
          } else{
               $_SESSION['dsdid']       = $id;
               $_SESSION['un']          = $contact;
               $_SESSION['nam']         = $receiver;
               $_SESSION['address']     = $address;
               $_SESSION['user_type']   = 'customers';
               $_SESSION['discount_code'] = $_SESSION['discount']['code'];
               $_SESSION['survey']['new_customer'] = 1;

               echo 'Your info has been saved';
          }
     } else {
          reloadTo( wp_get_referer() );
          exit;
     }
}
?>
