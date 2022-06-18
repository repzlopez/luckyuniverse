<?php
if( !isset($_SESSION) ) session_start();
require_once plugin_dir_path( __DIR__ ) . 'templates/init_setup.php';

$subject    = 'Password reset request';
$forgot     = sha1( trim_escape( $con, $id . ASIN . $dc ) );
$forgot_url = LKY_ROOT . '/account/forgot_password?verif=' . $dc . '&key=' . $forgot;

$m .= '<h4>Hi '.ucwords($dsfnam).',</h4>';
$m .= "<p>Let's reset your password so you can get back to your account.</p>";
$m .= '<p><a href="' . $forgot_url . '" class="btn" target="_blank">RESET PASSWORD</a></p><br><br>';

$m .= '<p>If the button above did not appear, please click on the link below to confirm your email address:</p>';
$m .= '<p><a href="' . $forgot_url . '" target="_blank">' . $forgot_url . '</a></p>';

$m .= '<p>If you did not ask to reset your password, <a href="' . LKY_ROOT . '/contact-us">contact admin</a></p>';
$m .= '<p></p>';

$mail_body = $m;
$attach    = null;
// echo $mail_body;
$activity_type = 'Password reset sent';
require_once plugin_dir_path( __DIR__ ) . 'templates/init_mail.php';
// if( $mail_sent ) echo '<h5>'. $activity_type .'</h5><br>';
?>
