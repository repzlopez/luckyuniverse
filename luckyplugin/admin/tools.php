<?php
defined('INCLUDE_CHECK') || define('INCLUDE_CHECK',1);
require_once plugin_dir_path( __DIR__ ) . 'templates/init_setup.php';
require_once plugin_dir_path( __DIR__ ) . 'templates/setup.php';

$x = '';$mail_sent= null;
$mail= $sendto= $subject= $body= '';

if( isset($_POST) && !empty($_POST) ) {
     foreach ($_POST as $k => $v) $$k = $v;

     if( isset($_GET['mail'] ) ) {                    //send mail
          $_SESSION['reg_welcome']['to'] = $sendto;
          $mail_body = '<p>'.str_replace( "\r\n", '<br>', $body ).'</p>';
          $attach = null;

          $activity_type = 'Send Mail from TOOLS';
          // require_once plugin_dir_path( __DIR__ ) . 'account/confirm_email.php';
          // require_once plugin_dir_path( __DIR__ ) . 'account/send_welcome.php';
          require_once plugin_dir_path( __DIR__ ) . 'templates/init_mail.php';
     }

     unset($_POST);
}

if( isset($_GET) && !empty($_GET) ) {
     if( isset($_GET['id'] ) ) {
          $con = SQLi(DBPRF);
          $x .= '<div>'.$_GET['id'].'</div>';
          $x .= '<div>'.$_GET['b'].'</div>';
          $x .= sha1( trim_escape( $con, $_GET['b'] . ASIN . $_GET['id'] ) );

     } elseif( isset($_GET['backup'] ) ) {
          require_once plugin_dir_path( __DIR__ ) . 'admin/export_csv.php';

     } elseif( isset($_GET['mail'] ) ) {
          if( isset($mail_sent) ) {
               $msg = ( $mail_sent!==false ? 'message sent' : 'sending failed' );
          } else {
               $msg = '';
          }

          $x .= '<form method="post"><ul>';
          $x .= '<li><input type="text" name="sendto" placeholder="email address here" value="'.$sendto.'" required /></li>';
          $x .= '<li><input type="text" name="subject" placeholder="subject here" value="'.$subject.'" required /></li>';
          $x .= '<li><textarea name="body" placeholder="message here" required>'.$body.'</textarea></li>';
          $x .= '<li><input type="submit" class="btn" value="Send Email" /><span class="smaller"> '.$msg.'</span></li>';
          $x .= '</ul></form>';

          $mail_sent = 0;
     }
} else {
     $x .= '<hr>';

     $x .= '<br><ul class="admin_main">';
          if(IS_GLOBAL) $x.= '<li><a href="?rundc"><br><h5 title="Fill-in ALL empty Discount Codes">Fill<br>Discount</h5></a></li>';
          if(IS_GLOBAL) $x.= '<li><a href="?runlogs"><br><h5 title="View Distributor Profile logs">View<br>Profile Logs</h5></a></li>';
          $x.= '<li><a href="?runlineage"><br><h5 title="View Distributor Lineage">View<br>Lineage</h5></a></li>';
     $x .= '</ul>'.DIV_CLEAR;
     $x .= '<h4 class="rt">Distributors</h4><hr>';

     // if( IS_GLOBAL ) {
          $x .= '<br><ul class="admin_main">';
               $x.= '<li><a href="?backup=distributors'.'"><br><h5 title="Backup Distributors">Backup<br>Distributors</h5></a></li>';
               $x.= '<li><a href="?backup=customers'.'"><br><h5 title="Backup Customers">Backup<br>Customers</h5></a></li>';
               $x.= '<li><a href="?backup=stockist'.'"><br><h5 title="Backup Stockist">Backup<br>Stockist</h5></a></li>';
               $x.= '<li><a href="?backup=products'.'"><br><h5 title="Backup Products">Backup<br>Products</h5></a></li>';
          $x .= '</ul>'.DIV_CLEAR;
          $x .= '<h4 class="rt">Data</h4><hr>';
     // }

     $x .= '<br><ul class="admin_main">';
          $x.= '<li><a href="?mail'.'"><br><h5 title="Send Email">Send Email</h5></a></li>';
     $x .= '</ul>'.DIV_CLEAR;
     $x .= '<h4 class="rt">Misc</h4><hr>';

     $account = get_page_by_title( 'Account', '', 'page' );
     $x .= '<br><ul class="admin_main">';
          $x.= '<li><a href="'.get_permalink($account->ID) . '?update_pass'.'"><br><h5 title="Update Password">Update Password</h5></a></li>';
     $x .= '</ul>'.DIV_CLEAR;
     $x .= '<h4 class="rt">Me</h4><hr>';
}

echo $x . BACKTOTOP;
?>
