<?php
require_once plugin_dir_path( __DIR__ ) . 'templates/init_setup.php';
unset( $_SESSION['reg_welcome'] );

$mail  = '';
$style = '<style>
p { padding:0 10px;text-align:justify; }

.btn { border:#ddd solid 1px !important;color:#75c32c!important;font-weight:bold;height:44px !important;padding:10px !important;text-decoration:none !important; }
.hdr { background-color:#fff;text-align:center; }
.smaller { font-size:10px; }
</style>';

$head = '<head>
<meta http-equiv="Content-Language" content="en" />
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
'.$style.'</head>';

$emblem       = LKY_ROOT . '/wp-content/uploads/2019/01/eb167.png';
$mail_header  = '<html>'.$head;
$mail_header .= '<body><div class="hdr"><img src="'.$emblem.'" alt="'.LKY_FULL.'" /></div><br><br>';

$mail_footer  = '<br><br><hr>';
$mail_footer .= '<p class="smaller">Need assistance? Message us at '.LKY_MSGR.'</p>';
$mail_footer .= '<p class="smaller"><em>This is a system generated message. DO NOT REPLY to this email.<br>To ensure reliable delivery of all emails from our system, please ensure you add donotreply@luckyuniverseph.com to your address book.</em></p>';
$mail_footer .= '<p class="smaller"><em>'.LKY_FULL.' &copy;2017-'.date('Y',time()).' All rights reserved.</em></p>';
$mail_footer .= '</body></html>';

$mail .= $mail_header;
$mail .= $mail_body;
$mail .= $mail_footer;

$header = array('Content-Type: text/html; charset=UTF-8','From: '.LKY_FULL.' <DONOTREPLY@luckyuniverseph.com>');

// echo $mail;
if( $sendto !== false ) {
     $mail_sent = wp_mail( $sendto, $subject, $mail, $header, $attach );
}

// luckynotif mail
$lky_notif_hdr      = array('Content-Type: text/html; charset=UTF-8','From: LUCKY NOTIF <DONOTREPLY@luckyuniverseph.com>');
$lky_notif_activity = isset($activity_type) ? 'NEW: ' . $activity_type : 'UNKNOWN ACTIVITY';
$lky_notif_body     = $notif_body;

// wp_mail( $to, $subject, $message, $headers, $attachments );
wp_mail( ( ROASTED ? ROASTED_MAIL : NOTIF_MAIL ), $lky_notif_activity, $lky_notif_body, $lky_notif_hdr );
?>
