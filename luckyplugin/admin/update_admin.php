<?php if( !ISIN_ADMIN ) exit;

if( isset($_POST) ) {
     defined('INCLUDE_CHECK') || define('INCLUDE_CHECK',1);
     require_once('setup.php');

     foreach( $_POST as $k=>$v ) $$k=$v;
     $_SESSION['return_msg'] = null;
     $slug = $_SESSION['load_id'];

     unset($_POST['oldid']);
     unset($_POST['oldun']);
     unset($_SESSION['load_id']);
     $_SESSION['post'] = $_POST;

     if( isset($_POST['un']) ) {            //test admin
          $tbl      = 'admin';
          $con      = SQLi(DBPRF);
          $ret = get_page_by_title( 'Manage Admin', '', 'page' );

          //test un
          $testun   = mysqli_query( $con, "SELECT un FROM $tbl WHERE un='$un'" ) or die(mysqli_error($con));
          $r        = mysqli_fetch_assoc($testun);
          if( ( $slug=='' && $r['un']==$un ) || ( $r['un']==$un && $un!=$oldun ) ) {
// echo 'un fail<br>';
               $_SESSION['return_msg']['msg'] = 'Username exists';
          }

          //test id/un
          $testun   = mysqli_query( $con, "SELECT id FROM $tbl WHERE id='$id'" ) or die(mysqli_error($con));
          $r        = mysqli_fetch_assoc($testun);
          if( ( $slug=='' && $r['id']==$id ) || ( $r['id']==$id && $id!=$oldid ) ) {
// echo 'id fail<br>';
               $_SESSION['return_msg']['msg'] = 'Admin ID exists';
          }

          if( !isset($_SESSION['return_msg']['msg']) ) {
               $int = "/global|status/i";
               if( $_POST['pw']=='' ) unset($_POST['pw']);
               list($kdata,$idata,$udata) = set_kiu($con,$_POST,$int);
               $_SESSION['return_msg']['msg'] = 'Update success';
               $_SESSION['return_msg']['class'] = 1;
               $slug = $id;
          }

          $slug = '?id=' . $slug;
     }

     if( $_SESSION['return_msg']['class'] ) {
// echo 'pass';
          insert_duplicate($con,$tbl,$kdata,$idata,$udata);
          init_logs(1,$tbl,$id,ADMIN_ID);
     }

     wp_redirect( wp_get_referer() );
     exit;
}
?>
