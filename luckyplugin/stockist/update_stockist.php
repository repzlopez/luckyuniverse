<?php if( !ISIN_ADMIN && !ISIN_STOCKIST ) exit;

if( isset($_POST) ) {
     defined('INCLUDE_CHECK') || define('INCLUDE_CHECK',1);
     require_once plugin_dir_path( __DIR__ ) . 'templates/setup.php';

     foreach( $_POST as $k=>$v ) $$k=$v;
     $_SESSION['return_msg'] = null;
     $slug = $_SESSION['load_id'];

     unset($_POST['oldid']);
     unset($_SESSION['load_id']);
     $_SESSION['post'] = $_POST;

     $tbl      = 'stockist';
     $con      = SQLi(DBPRF);

     $test     = mysqli_query( $con, "SELECT id FROM $tbl WHERE id='$id'" ) or die(mysqli_error($con));
     $r        = mysqli_fetch_assoc($test);
     if( ( $slug=='' && $r['id']==$id ) || ( $r['id']==$id && $id!=$oldid ) ) {
          $_SESSION['return_msg']['msg'] = 'Stockist ID exists';
     }

     if( !isset($_SESSION['return_msg']['msg']) ) {
          $int = "id|upline|level|status/i";
          $_POST['start_date'] = str_replace( '/', '', $_POST['start_date']);
          if( $_POST['pw']=='' ) unset($_POST['pw']);
          list($kdata,$idata,$udata) = set_kiu($con,$_POST,$int);
          $_SESSION['return_msg']['msg'] = 'Update success';
          $_SESSION['return_msg']['class'] = 1;
          $_SESSION['nn'] = $warehouse;
     }

     if( $_SESSION['return_msg']['class'] ) {
// echo "$kdata<br>$idata<br>$udata";
          $last_id = insert_duplicate($con,$tbl,$kdata,$idata,$udata);
          // init_logs(1,$tbl,$id,ADMIN_ID);
          if( $slug == '' ) {
               $con   = SQLi(DBPRF);
               $last_id = sprintf("%'.0".PAD."d\n", $last_id );
               $newpw = sha1( trim_escape( $con, '12345678' . ASIN . $last_id ) );
               $qry   = "UPDATE $tbl SET pw='$newpw' WHERE id=$last_id";

               mysqli_query($con,$qry) or die(mysqli_error($con));
          }
     }

     $ret = get_page_by_title( ISIN_ADMIN ? 'Manage Stockist' : 'Stockist Profile', '', 'page' );
     wp_redirect( get_permalink($ret->ID) );
     exit;
}
?>
