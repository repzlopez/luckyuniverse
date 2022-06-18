<?php if( !ISIN_ADMIN ) exit;
if( !isset($_SESSION) ) session_start();

if( isset($_POST) ) {
     defined('INCLUDE_CHECK') || define('INCLUDE_CHECK',1);
     require_once plugin_dir_path( __DIR__ ) . 'templates/setup.php';
     foreach( $_POST as $k=>$v ) $$k=$v;
     $_SESSION['return_msg'] = null;
     $slug = $_SESSION['load_id'];

     unset($_POST['oldid']);
     unset($_SESSION['load_id']);
     $_SESSION['post'] = $_POST;

     $tbl      = 'packages';
     $con      = SQLi(DBPRF);

     $test     = mysqli_query( $con, "SELECT id FROM $tbl WHERE id='$id'" ) or die(mysqli_error($con));
     $r        = mysqli_fetch_assoc($test);
     if( ( $slug=='' && $r['id']==$id ) || ( $r['id']==$id && $id!=$oldid ) ) {
          $_SESSION['return_msg']['msg'] = 'Package ID exists';
     }

     if( !isset($_SESSION['return_msg']['msg']) ) {
          $int = "/price|pov|referral/i";
          list($kdata,$idata,$udata) = set_kiu($con,$_POST,$int);
          $_SESSION['return_msg']['msg'] = 'Update success';
          $_SESSION['return_msg']['class'] = 1;
     }

     if( $_SESSION['return_msg']['class'] ) {
          insert_duplicate($con,$tbl,$kdata,$idata,$udata);
          // init_logs(1,$tbl,$id,ADMIN_ID);
     }

     $ret = get_page_by_title( 'Manage Packages', '', 'page' );
     wp_redirect( get_permalink($ret->ID) );
     exit;
}
?>
