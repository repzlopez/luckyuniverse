<?php
if( !isset($_SESSION) ) session_start();
require_once plugin_dir_path( __DIR__ ) . 'templates/init_setup.php';

if( isset($_GET['key']) ) {
     foreach ($_GET as $k=>$v) $$k=$v;

     $tbl = 'for_encoding';
     $con = SQLi(DBPRF);
     $rs  = mysqli_query($con,"SELECT * FROM $tbl WHERE discount='$verif'") or die(mysqli_error($con));
     $r   = mysqli_fetch_array($rs);
     $n   = '';

     foreach ($r as $k=>$v) $$k=$v;
     $test = ( $dsdid . ASIN . $discount );

     if( $dsemail_confirm ) {
          $n .= '<h5>Your email address has already been confirmed.</h5><br><h5>If you did not register, contact ADMIN.</h5>';
          $n .= CONTACT_US;

     } elseif( sha1($test) == $key ) {
          // $qry = "UPDATE distributors SET dsemail_confirm=1,dsstatus=1 WHERE dsdid=$dsdid";
          $qry = "UPDATE $tbl SET dsemail_confirm=1 WHERE dsdid=$dsdid";
          $rs  = mysqli_query($con,$qry);

          $n .= '<h3>Your email address has been confirmed.</h3>';
          $n .= '<p>You will receive your welcome email with your account information after we process your account.</p>';
          $n .= '<p>Thank you!</p>';

     } else {
          $n .= '<h5>Your confirmation link seem to have expired.</h5><br><h5>Contact ADMIN to send you a new confirmation email.</h5>';
          $n .= CONTACT_US;
     }

     mysqli_close($con);
     echo $n;

} else {
     echo '<h4>Warning. You are not allowed here.<br>Your IP '.$_SERVER['REMOTE_ADDR'].' has been logged</h4>';
     reloadTo( get_home_url(), 5 );
}

?>
