<?php if( !ISIN_ADMIN ) exit;
if( !isset($_SESSION) ) session_start();

if( isset($_POST) ) {
     defined('INCLUDE_CHECK') || define('INCLUDE_CHECK',1);
     require_once plugin_dir_path( __DIR__ ) . 'templates/init_setup.php';
     require_once plugin_dir_path( __DIR__ ) . 'templates/setup.php';
//
     unset($_POST['action']);

     $cn = SQLi(DBPRF);
     foreach( $_POST as $k=>$v ) {
          $v = trim_escape($cn,$v);
          $qry = "INSERT INTO settings VALUES ('$k','$v') ON DUPLICATE KEY UPDATE dataset='$v'";

     	mysqli_query( $cn, $qry ) or die( mysqli_error($cn) );
     }
     mysqli_close( $cn );
     init_logs(1,'settings',0,ADMIN_ID);
//
     $_SESSION['return_msg'] = null;
     $_SESSION['return_msg']['msg'] = 'Update success';
     $_SESSION['return_msg']['class'] = 1;

     wp_redirect( wp_get_referer() );
     exit;
}
?>
