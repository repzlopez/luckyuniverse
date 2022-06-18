<?php
if( !empty( $_POST ) ) {
     defined('INCLUDE_CHECK') || define('INCLUDE_CHECK',1);
     require_once plugin_dir_path( __DIR__ ) . 'templates/setup.php';
// print_r($_POST);
// echo '<br><br>';
// print_r($_SESSION['cart']);
// echo '<br><br>';

     if( !ISIN_ADMIN && ( !isset($_SESSION['cart']) || empty($_SESSION['cart']) ) ) {
          $_SESSION['return_msg']['msg'] = 'Oops! Cart is empty!';
          reloadTo( wp_get_referer() );
     }

     if( ISIN_ADMIN ) {
          if( $_POST['update_only'] ) {
               // unset($_POST['encoded_by']);
               unset($_POST['encoded_on']);
          } else {
               if( !OVERLORD ) {
                    // $_POST['encoded_by'] = ADMIN_ID;
               }

               $_POST['encoded_on'] = date(TMDSET);
               $_POST['status'] = ( $_POST['status']>3 ? 0 : ( $_POST['status'] += 1 ) );
          }
     } else {
          $_POST['submitted'] = date(TMDSET);
     }

     if( $_SESSION['snc_referrer']!='' ) {
          $_POST['referrer'] = $_SESSION['snc_referrer'];
     }

     foreach( $_POST as $k=>$v ) $$k=$v;
     $update_payment = strpos($submit,'Update')!==false;
     $order_id       = isset($_SESSION['order_id']) ? $_SESSION['order_id'] :null;
     $edit_on        = isset($_SESSION['edit_on']) ? $_SESSION['edit_on'] :null;

     unset($_SESSION['order_id']);
     unset($_SESSION['edit_on']);
     unset($_POST['update_only']);
     unset($_POST['action']);
     unset($_POST['submit']);

     $_SESSION['return_msg'] = null;
     $_SESSION['checkout'] = $_POST;

     $con = SQLi(DBOPS);
     if( !isset($_SESSION['return_msg']['msg']) ) {
          $int = "/pay_out|pay_amount|status/i";
          list($kdata,$idata,$udata) = set_kiu($con,$_POST,$int);
          $_SESSION['return_msg']['msg'] = 'Update success';
          $_SESSION['return_msg']['class'] = 1;
     }

     if( $_SESSION['return_msg']['class'] ) {
          $tbl      = 'transactions' . SEL_YEAR;
          $last_id  = insert_duplicate( $con, $tbl, $kdata, $idata, $udata );
          $last_id  = $trans_id!=''?$trans_id:$last_id;
          init_logs( (isset($_SESSION['order_id'])?1:0), $tbl, trim($last_id), ADMIN_ID);

          if( !ISIN_ADMIN && $_SESSION['snc_referrer']!='' ) {
               $did = $_SESSION['enroll_success']['referrer'];
               insert_duplicate( SQLi(DBPRF), 'for_encoding', 'dsdid,dsstatus', "$did,1", 'dsstatus='.$last_id );
          }

          $_SESSION['survey']['contact'] = $del_contact;
          $_SESSION['survey']['payopt']  = $pay_out;
          $_SESSION['survey']['payamt']  = $pay_amount;
          $_SESSION['survey']['last_id'] = $last_id;
          $_SESSION['survey']['submit']  = date('l, j F, Y, H:i:s');

          if( isset( $_SESSION['cart'] ) && ( $order_id=='' || isset($edit_on) ) ) {
               $use_discount = ISIN_DISTRI ? 'isdistri' : DISCOUNT_CODE;

               if( isset($edit_on) ) {
                    $qry = "UPDATE $tbl SET qty=0 WHERE trans_id=$order_id";
                    $rs  = mysqli_query(SQLi(DBOPS),$qry) or die(mysqli_error($con));
               }

               require_once plugin_dir_path( __DIR__ ) . 'products/update_sales.php';
          }

          if( ISIN_ADMIN ) {
               if( $status===1 && !$update_payment ) require_once plugin_dir_path( __DIR__ ) . 'admin/update_enroll.php';
               require_once plugin_dir_path( __DIR__ ) . 'admin/update_bonus.php';
          }

          if( isset($_FILES) ) {
               $img = $_FILES['pay_copy'];
               $ext = strtolower( pathinfo($img['name'], PATHINFO_EXTENSION));
               $fn  = trim( "Order_" . sprintf("%'.0".PAD."d\n", $last_id) ).".$ext";
               move_uploaded_file( $img['tmp_name'], plugin_dir_path( __DIR__ )."/assets/payments/$fn");
          }

     }

// print_r($_POST);
     if( isset($_SESSION['reg_welcome']['id']) ) {
          if( $status > 1 ) {
// echo "test 0";
               $ret = get_page_by_title( 'Manage Registration', '', 'page' );
               reloadTo( get_permalink( $ret->ID ).'?'. $_SESSION['reg_welcome']['id'] );
          } else {
// echo "test 1";
               reloadTo( wp_get_referer() );
          }
     } elseif( isset($edit_on) ) {
// echo "test 2";
          $ret = get_page_by_title( ( 'Orders' ), '', 'page' );
          reloadTo( get_permalink($ret->ID) );

     } elseif( $update_payment ) {
// echo "test 3";
          reloadTo( wp_get_referer() );

     } else {
// echo "test 4";

          if( $status===1 && !$update_payment ) {
               global $pay;

               //send email pg_get_notif
               $mail= $sendto= $subject= $body= $attach = '';

               $ret = get_page_by_title( 'Manage Orders', '', 'page' );
               $rid = sprintf("%'.0".PAD."d\n", $last_id);

               $notif_body  = '<h3>We have an ORDER with the following details:</h3>';
               $notif_body .= "<div>Order # : <strong>$rid</strong></div>";
               $notif_body .= "<div>Amount due: <strong>$pay_amount</strong></div>";
               $notif_body .= '<div>Pay with: <strong>'. $pay[$pay_out] .'</strong></div>';
               $notif_body .= '<div>URL: <strong>'. get_permalink($ret->ID) . '?' . $rid .'</strong></div>';

               $activity_type = 'Checkout Order # ' . $rid;
               require_once plugin_dir_path( __DIR__ ) . 'templates/init_mail.php';
          }

          $ret = get_page_by_title( ( ISIN_ADMIN ? 'Manage Orders' : 'Thanks' ), '', 'page' );
          reloadTo( get_permalink($ret->ID) );

     }

     exit;
}
?>
