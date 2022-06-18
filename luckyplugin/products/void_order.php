<?php
$msg_ret = '';

if( !empty($_POST) ) {
     foreach ($_POST as $k=>$v) $$k = $v;
     $_SESSION['return_msg'] = null;
     $_POST = array();

     if( $confirm == 'cancel' ) {
          $tbl = 'transactions' . SEL_YEAR;
          $qry = "UPDATE $tbl SET status=4 WHERE trans_id=" . $trans_id;

          $con = SQLi(DBOPS);
          mysqli_query( $con, $qry ) or die( mysqli_error($con) );
          mysqli_close($con);

          init_logs( 4, $tbl, trim($trans_id), ADMIN_ID);

          $ret = get_page_by_title( 'Manage Orders', '', 'page' );
          $ret = get_permalink($ret->ID) .'?'. $trans_id;
     } else {
          $_SESSION['return_msg']['msg'] = 'Invalid command';
          $ret = wp_get_referer();
     }
}

wp_redirect( $ret );
exit;
?>
