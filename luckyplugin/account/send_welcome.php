<?php
require_once plugin_dir_path( __DIR__ ) . 'templates/init_setup.php';

$id = $_SESSION['reg_welcome']['id'];
$un = $_SESSION['reg_welcome']['un'];
$pw = $_SESSION['reg_welcome']['pw'];
$dc = $_SESSION['reg_welcome']['dc'];

$sendto  = $_SESSION['reg_welcome']['to'];
$subject = 'Welcome to ' . LKY_FULL;

$m  = '<h3>CONGRATULATIONS! '.$subject.'.</h3>';

$m .= '<p><strong>Your login information:</strong><br>';
$m .= 'Username: <strong>'.$un.'</strong><br>';
$m .= 'Default Password: <strong>'.$pw.'</strong> (NOTE: please change your password immediately)</p>';
$m .= '<p>Login at '.LKY_ROOT.' then click on "Account" and enter the following details to view your Genealogy, Personal Orders, Customer Orders, Request for Bonus Withdrawals, etc.:</p>';

$forgot = sha1( $id . ASIN . $dc );
$forgot_url = LKY_ROOT . '/account/forgot_password?verif=' . $dc . '&key=' . $forgot;
$m .= '<p><strong>Password Reset link</strong> (<em>if you forget your password</em>):<br>';
$m .= '<a href="'.$forgot_url.'" target="_blank">'.$forgot_url.'</a></p>';

$m .= '<p><strong>HOW TO MAXIMIZE YOUR LUCKY UNIVERSE BUSINESS:</strong><br>';
$m .= 'Your friends can enjoy the benefits of Lucky Universe products at '. (DISCOUNT * 100) .'% discount using your personalized link and the sales will be credited to your account. This will be considered part of the monthly maintenance requirement of P'. MIN_POV .' POV personal sales beginning March 1, 2021 for all distributors in order to qualify for the Unilevel Bonus.</p>';

$personal = LKY_ROOT.'/shop/?'.$dc;
$m .= '<p><strong>Your personalized link:</strong><br>';
$m .= '<a href="'.$personal.'" target="_blank">'.$personal.'</a></p>';

$snc_link = LKY_ROOT.'/snc/?'.$dc;
$m .= '<p><strong>Your Share & Care Enrollment link:</strong><br>';
$m .= 'Introduce your friends the Share&Care package to enjoy the benefits of being a member of Lucky Universe, give your Share&Care Enrollment link:<br>';
$m .= '<a href="'.$snc_link.'" target="_blank">'.$snc_link.'</a></p>';

$mail_body = $m;
$attach    = null;
// echo $mail_body;
$activity_type = 'Welcome email sent';
require_once plugin_dir_path( __DIR__ ) . 'templates/init_mail.php';
// if( $mail_sent ) echo '<h5>'. $activity_type .'</h5>';
?>
