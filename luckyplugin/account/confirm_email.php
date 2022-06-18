<?php
if( !isset($_SESSION) ) session_start();
require_once plugin_dir_path( __DIR__ ) . 'templates/init_setup.php';

$id = trim($_SESSION['confirm_email']['id']);
$dc = $_SESSION['confirm_email']['dc'];
$nm = $_SESSION['confirm_email']['name'];
$tp = $_SESSION['confirm_email']['type'];

$sendto  = $_SESSION['confirm_email']['to'];
$subject = 'Confirm your email';

// $id = '00000500'; //test
// $dc = 'f37af39d'; //test

$confirm = sha1( $id . ASIN . $dc );
$confirm_url = LKY_ROOT . '/registration/confirmation?verif=' . $dc . '&key=' . $confirm;

$m  = '<h3>Welcome to ' . LKY_FULL . '.</h3>';
$m .= '<p>Please confirm your email address on '.$_SERVER['SERVER_NAME'].'.</p>';
$m .= '<p>Click the button below to complete your email address confirmation.</p><br>';
$m .= '<div><a href="'.$confirm_url.'" class="btn" target="_blank">Confirm Email Address</a></div><br><br>';

$m .= '<p>If the button above did not appear, please click on the link below to confirm your email address:</p>';
$m .= '<p><a href="'.$confirm_url.'" target="_blank">' . $confirm_url . '</a></p>';

$mail_body = $m;
$attach    = null;
// echo $mail_body;
$notif_body  = '<h3>An email confirmation request has been sent with the following details:</h3>';
$notif_body .= "<div>ID# : <strong>$id</strong></div>";
$notif_body .= "<div>Name: <strong>$nm</strong></div>";
$notif_body .= "<div>Code: <strong>$dc</strong></div>";
$notif_body .= "<div>Type: <strong>$tp</strong></div>";

$activity_type = 'Email confirmation sent';
require_once plugin_dir_path( __DIR__ ) . 'templates/init_mail.php';
// if( $mail_sent ) echo '<h5>'. $activity_type .'</h5>';
?>
