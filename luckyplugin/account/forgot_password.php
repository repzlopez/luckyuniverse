<?php
if( !isset($_SESSION) ) session_start();
defined('INCLUDE_CHECK') || define('INCLUDE_CHECK',1);
require_once plugin_dir_path( __DIR__ ) . 'templates/init_setup.php';
require_once plugin_dir_path( __DIR__ ) . 'templates/setup.php';

if( isset($_GET['key']) ) {
     foreach ($_GET as $k=>$v) $$k=$v;

     $con = SQLi(DBPRF);
     $rs  = mysqli_query($con,"SELECT dsdid,dsfnam,discount,dsbirth,dsemail,pw FROM distributors WHERE discount='$verif'") or die(mysqli_error($con));
     $r   = mysqli_fetch_array($rs);
     $name= $r['dsfnam'];
     $x   = '';

     foreach ($r as $k=>$v) $$k=$v;

     $test=  ( $dsdid . ASIN . $discount );
     $pw  = sha1( trim_escape( $con, $dsbirth . ASIN . $dsdid ) );

     if( sha1($test) == $key ) {
          $rs  = mysqli_query($con,"UPDATE distributors SET pw='$pw' WHERE dsdid='$dsdid'") or die(mysqli_error($con));
          $r   = mysqli_fetch_array($rs);

          $x .= '<h3>Hey ' . ucwords($name) . '! Your password has been successfully reset</h3>';
          $x .= '<p><a href="'. LKY_ROOT . '/account">CLICK HERE TO LOGIN</a></p>';

     } else {
          $x .= '<h5>Your forgot password link seem to have expired.</h5><br><h5>Contact ADMIN to send you a new password reset link.</h5>';
          $x .= CONTACT_US;
     }

     mysqli_close($con);

} elseif( isset($_POST['email']) ) {
     $con = SQLi(DBPRF);
     $email = trim_escape( $con, $_POST['email'] );

     unset($_POST);

     $rs  = mysqli_query($con,"SELECT dsdid,dsfnam,discount FROM distributors WHERE dsemail='$email'") or die(mysqli_error($con));
     $r   = mysqli_fetch_array($rs);

     if( mysqli_num_rows($rs) >0 ) {
          foreach ($r as $k=>$v) $$k=$v;
          $sendto = $email;
          $id     = $dsdid;
          $dc     = $discount;

          require_once plugin_dir_path( __DIR__ ) . 'account/send_reset.php';

          $x .= '<h5>Hey '.ucwords($r['dsfnam']).'! We have sent your password reset instructions to your registered email address</h5>';

     } else {
          $x .= "<h5>Oops! We can't seem to find your email address.</h5>";
          $x .= '<div class="rt"><a href="" class="btn">BACK</a><div>';
     }

} else {
     $x .= '<form method="post">';
     $x .= '<h5>Enter your registered email address to search for your account:</h5>';
     $x .= '<p><input type="email" name="email" class="w6" placeholder="Email Address" required /><br><input type="submit" class="" value="Submit" /></p>';
     $x .= '</form>';
     $x .= '<p><br>or, look for your Welcome Email to reset your password.</p>';
     $x .= '<p>If you do not have a registered email address, or can no longer access your email, <a href="'. LKY_ROOT .'/contact-us">contact admin</a>.</p>';
}

echo $x;
?>
