<?php
if( !empty( $_POST ) ) {
     defined('INCLUDE_CHECK') || define('INCLUDE_CHECK',1);
     require_once plugin_dir_path( __DIR__ ) . 'templates/setup.php';

     foreach( $_POST as $k=>$v ) $$k=$v;
     $_SESSION['return_msg'] = null;
     $slug = $_SESSION['load_id'];

     unset($_SESSION['load_id']);

     if( !isset($_SESSION['return_msg']['msg']) ) {
          $int = "/dssex|payout|dsmtype|dsstatus/i";
          list($kdata,$idata,$udata) = set_kiu($con,$_POST,$int);
          $_SESSION['return_msg']['msg'] = 'Update success';
          $_SESSION['return_msg']['class'] = 1;
     }

     $slug = '?' . $slug ;

     if( $_SESSION['return_msg']['class'] ) {
          insert_duplicate($con,$tbl,$kdata,$idata,$udata);
     }

     $ret = get_page_by_title( 'Manage Orders', '', 'page' );
     wp_redirect( get_permalink($ret->ID) . $slug );
     exit;
}
?>
