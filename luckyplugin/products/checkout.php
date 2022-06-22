<?php
require_once 'init_cart.php';

$order_id = isset( $order_id ) ? $order_id : ( isset( $_SESSION['order_id'] ) ? $_SESSION['order_id'] :null );
unset($_SESSION['print_data']);
// print_r($_SESSION);
// echo '<br><br>';
// print_r($_SESSION['cart']);

if( isset($order_id) || ( isset($_SESSION['cart']) && !empty($_SESSION['cart']) ) ) {
     global $post,$luckyuser,$pay,$arrOrders;
     define('MANAGE',( $post->post_title == 'Manage Orders' ));

     $lock= $trans_id= $del_receiver= $del_address= $del_contact= $del_note= null;
     $pay_out= $pay_fee= $pay_date= $pay_note= $submitted= $encoded_on= null;
     $pay_amount= $status= 0;

     $referrer = DISCOUNT_DSDID;
     $pov      = $total_pov;
     $valid_id = 1;
     $mybonus  = $_SESSION['mybonus'];

     if( isset($order_id) ) {
          $_SESSION['print']['id'] = $order_id;
          $trans_id = $order_id;
          $lock     = READ_ONLY;

          $tbl = 'transactions' . SEL_YEAR;
          $qry = "SELECT *,
	          (SELECT CONCAT(dsfnam,' ',dslnam) FROM ".DB.DBPRF.".distributors WHERE dsdid=referrer) ref
               FROM $tbl WHERE trans_id='$trans_id'";
          $con = SQLi(DBOPS);
          $rs  = mysqli_query($con,$qry);
          if( mysqli_num_rows($rs)>0 ) {
          	$rw = mysqli_fetch_assoc( $rs );
          	foreach( $rw as $k=>$v ) { $$k=stripslashes($v); }
          } else {
               $valid_id = 0;
               echo '<h5>Oops! Invalid Order ID!</h5>';
          }
     } else $pay_amount = $total_checkout;

     $in_text  = MANAGE ? 'text' : 'hidden';
     $cart_on = !empty($_SESSION['cart']);

     if( isset($_SESSION['checkout']) ) {
          foreach( $_SESSION['checkout'] as $k=>$v ) $$k=$v;
          unset($_SESSION['checkout']);
     }

     if( ISIN_DISTRI || ISIN_CUSTOMER ) {
          if( ISIN_DISTRI ) {
               $qry = "SELECT CONCAT(dsstreet,' ',dsbrgy,' ',dscity,' ',dsprov) address,dscontact,payout,withheld FROM distributors WHERE dsdid='".DISTRI_ID."'";
          } elseif( ISIN_CUSTOMER ) {
               $qry = "SELECT address,contact dscontact,pay_out payout FROM customers WHERE id='".$luckyuser['id']."'";
          }

          $con = SQLi(DBPRF);
          $rs  = mysqli_query($con,$qry);
     	$r   = mysqli_fetch_assoc( $rs );
     	foreach( $r as $k=>$v ) { $$k=stripslashes($v); }
     }

     $update_only = ( $pay_fee!='' && is_numeric($pay_fee) ? 0:1 );
     $co .= '<form method="post" action="'.esc_url( admin_url('admin-post.php') ).'" enctype="multipart/form-data" id="checkout_order" data-cart="'.($cart_on).'">';
     $co .= '<input type="hidden" name="action" value="checkout_order" />';
     $co .= '<input type="hidden" name="update_only" value="'.$update_only.'" />';
     $co .= '<input type="hidden" name="trans_id" value="'.($trans_id!=''?sprintf("%'.0".PAD."d\n", $trans_id):'').'" />';
     $co .= '<input type="hidden" name="customer_id" value="" />';

     // if( !is_numeric($encoded_by) ) {     //web order only

          //delivery details
          if( ISIN_CUSTOMER ) {
               $del_receiver = $luckyuser['nam'];
               $del_address  = $address;
               $del_contact  = $dscontact;
          } elseif( !empty($_SESSION['enroll_success']) ) {
               $enrolling    = 1;
               $del_receiver = $_SESSION['enroll_success']['name'];
               $del_address  = $_SESSION['enroll_success']['address'];
               $del_contact  = $_SESSION['enroll_success']['contact'];
               $referrer     = $_SESSION['enroll_success']['referrer'];
          }

          $co .= '<div class="cart"><h3>DELIVERY INFO</h3><ul>';
          if( ( ISIN_DISTRI ) && $post->post_title != 'Orders' ) $co .= '<li><label class="w2"></label> <span><input type="checkbox" id="use_details" data-receiver="'.$luckyuser['nam'].'" data-address="'.$address.'" data-contact="'.$dscontact.'" data-pay="'.$pay_out.'" /> <label for="use_details">Use my details</label></span></li>';
          $co .= '<li><label class="w2">Receiver:</label> <input type="text" name="del_receiver" class="w7" placeholder="Name of receiver" value="'.$del_receiver.'" '.$lock.' required /></li>';
          $co .= '<li><label class="w2">Address:</label> <textarea name="del_address" placeholder="Address of receiver" '.$lock.' required>'.$del_address.'</textarea></li>';
          $co .= '<li><label class="w2">Contact #:</label> <input type="text" name="del_contact" class="w5" placeholder="Contact# of receiver" pattern="^([0][9]\d{2}\s?\d{3}\s?\d{4})$" value="'.$del_contact.'" '.$lock.' required /> <a href="#" class="smaller accepted_formats" title="click here for accepted formats">accepted formats</a></li>';
          $co .= '<li><label class="w2">NOTE:</label> <textarea name="del_note" '.$lock.' placeholder="Enter note here">'.$del_note.'</textarea></li>';
          if( !$enrolling && !preg_match( "/admin|distributors|customers/i", $luckyuser['user_type'] ) ) $co .= '<li><label class="w2"></label> <label><input type="checkbox" id="save_details" data-lastid="" data-extra="'.DBPRF.'" /> Save info for my next order</label></li>';
          $co .= '</ul></div><hr>';

          //payment details
          // $payout = 0;
          $arrQR = array();$qrimg='';
          $qr_img = glob("./qrcode/lupay_*.{jpg,jpeg,png,gif}", GLOB_BRACE);
          if( !empty($qr_img) ) {
               foreach ( $qr_img as $v ) {
                    $i = substr( $v, -5, 1 );
                    $arrQR[$i] = strrchr($v, '/');

                    if( strpos( $v, "lupay_$payout" ) !== false ) {
                         $qrimg = LKY_ROOT.substr($v,1);
                    }
               }
          }

          if( isset($order_id) ) {
               $payimg='';
               $pay_img = glob( plugin_dir_path( __DIR__ ) . "/assets/payments/Order_$order_id.{jpg,jpeg,png,gif}", GLOB_BRACE);

               if( !empty($pay_img) ) {
                    foreach ($pay_img as $k=>$v) {
                         if( strpos( $v, "Order_$order_id" ) !== false ) {
                              $payimg = plugin_dir_url( __DIR__ ) . "/assets/payments/" . strstr($v,"Order_$order_id");
                         }
                    }
               }
          }

          $sel_payout='<select name="pay_out" class="w3" '.( $pay_out<2 && $pay_out==99 ? '': ( $payimg!='' ? $lock :'' ) ).' '.( $status ? DISABLED :'' ).'>';
          foreach( $pay as $k=>$v ) {
               if( $v!='' ) $sel_payout.='<option value='.$k.' '.($k==$pay_out?SELECTED:'').' data-QR="'.$arrQR[$k].'">'.$v.'</option>';
          }
          if( ISIN_ADMIN || ISIN_DISTRI && !$withheld ) $sel_payout.='<option value=99 '.(99==$pay_out?SELECTED:'').' '.($mybonus<$pay_amount?'class="disabled" title="Unavailable. You only have P'.number_format($mybonus,2).' balance." ' . DISABLED:' title="You have P'.number_format($mybonus,2).' balance."').' >Use Bonus</option>';
          $sel_payout.='</select>';

          $pay_date = ( $pay_date!='' ? $pay_date : date('mdY') );
          $pd       = substr($pay_date,-4).'-'.substr($pay_date,0,2).'-'.substr($pay_date,2,2);

          $co .= '<div class="cart"><h3>PAYMENT DETAILS</h3><ul>';
          $co .= '<li><label class="w2">Order Total:</label> <span class="w3 box order_total">'.number_format($total_checkout,2,'.','').'</span>';
          $co .= '<span class="w1"></span><label class="w2">Delivery Fee:</label> <input type="text" name="pay_fee" class="w3 order_fee" placeholder="0.00" value="'.( $update_only ? 'TO FOLLOW' : number_format($pay_fee,2) ).'" '.( ISIN_ADMIN ? '' : READ_ONLY ).' required />';
          if(ISIN_DISTRI) {
               $co .= '<br><span class="w2"></span> <span class="smaller">**Shipping fee may change depending on package and location</span>';
               $co .= '<br><span class="w2"></span> <span class="smaller">**In case of changes, you will be contacted for confirmation.</span></li>';
          } else $co .= '</li>';

          $co .= '<li><label class="w2">Pay with:</label> '.$sel_payout;
          // if( $pay_fee!='' ) {
               $co .= '<span class="w1"></span><label class="w2">Amount Due:</label> <input type="number" name="pay_amount" class="w3" placeholder="0.00" value="'.number_format($total_checkout+$pay_fee,2,'.','').'" '.READ_ONLY.' required />';
          // } else $co .= '<span class="w1"></span><strong>Delivery Fee TO FOLLOW</strong>';
          $co .= '</li>';

          if( $pay_out<99 ) {
               if( is_numeric($pay_fee) ) {
                    $co .= '<li class="qrcode '.($pay_out<2?'hide':'').'"><label class="w2"></label>';
                         if( $payimg!=''&& $pay_out>1 ) {
                              $co .= '<div><br><a href="'.$payimg.'" target="_blank"><img src="'.$payimg.'" class="pay_thumb" title="Click to enlarge" /></a> <p class="smaller">Copy of Payment</p></div>';
                              if( !ISIN_ADMIN ) $co .= '<div><br><h4>Change Copy of Payment</h4><input type="file" name="pay_copy" accept="image/*" /><br><p class="smaller">Order will not be processed until a copy of payment has been submitted</p></div>';
                         } else {
                              if( !ISIN_ADMIN ) {
                                   $co .= '<div><br><h4>1. Scan QR Code</h4><img src="'.$qrimg.'" /></div>';
                                   $co .= '<div><br><h4>2. Upload copy of Payment</h4><input type="file" name="pay_copy" accept="image/*" /><br><p class="smaller">Order will not be processed until a copy of payment has been submitted</p></div>';
                              } else {
                                   $co .= '<div><br><h4>** Waiting for Copy of Payment</h4></div>';
                              }
                         }
                    $co .= '</li>';
               }
          }

          $co .= '<li><label class="w2">Date Paid:</label> <input type="text" class="datepicker w4" value="'.date( DATFUL, strtotime($pd) ).'" '.($status?DISABLED:'').' /><input type="hidden" name="pay_date" value="'.$pay_date.'" />';
          if(ISIN_DISTRI)
               $co .= '<br><span class="w2"></span> <span class="smaller">** orders will be processed upon verification of payment</span></li>';
          $co .= '<li><label class="w2">NOTE:</label> <textarea class="" name="pay_note" '.$lock.' placeholder="Enter note here">'.$pay_note.'</textarea></li>';
          $co .= '</ul></div><hr>';
     // } //web order only

     if( MANAGE ) $co .= '<div class="cart"><h3>TRANSACTION DETAILS</h3><ul>';
     $co .= ( MANAGE ? '<li><label class="w2">Total POV:</label> ' :'' ) . '<input type="'.$in_text.'" name="pov" class="w4" '.$lock.' value="'.$pov.'" />';
     $co .= ( MANAGE ? '      <label class="w2">Submitted:</label> ' :'' ) . '<input type="'.$in_text.'" name="submitted" class="w4" '.$lock.' value="'.$submitted.'" />';
     $co .= ( MANAGE ? '<li><label class="w2">'.( $distri_order ? 'Distributor' : 'Referrer' ).':</label> ' :'') . '<input type="'.$in_text.'" name="referrer" class="w4" '.(IS_GLOBAL ? '': $lock ).' value="'.$referrer.'" title="'.$ref.'" />';
     $co .= ( MANAGE ? ' <em>'.$ref.'</em>' :'' );

     if( MANAGE ) {
          $dis = ( $encoded_by != '' ? $encoded_by : HEAD_OFFICE );
          $enc = '<select name="encoded_by" class="w4" '.( !IS_GLOBAL && $status>1 ? DISABLED :'').' required>'.load_stockist_list($dis).'</select>';//<input type="text" name="encoded_by" class="w4" '.$lock.' value="'.$encoded_by.'" />
          $co .= '</li><li><label class="w2">Encoded By:</label> ' . $enc;
          $co .= '    <label class="w2">On:</label> <input type="text" name="encoded_on" class="w4" '.$lock.' value="'.$encoded_on.'" /></li>';
     }
     $co .= '</ul></div><input type="hidden" name="status" value='.$status.' />';

     if( isset($order_id) ) {
          // if( !ISIN_ADMIN && ( $pay_out<99 ) && $payimg==='' )
          //      $co .= '<br><input type="submit" name="submit" class="btn" value="Update Payment" /><br>';

          $co .= '<hr><h4><span class="w2">STATUS:</span> '.( $update_only ? 'Waiting for Delivery Fee' : strtoupper($arrOrders[$status]) ).'</h4>';
     }

     switch ($status) {
          case 0: $submit = ISIN_ADMIN ?
                         ( is_numeric($pay_fee) ? 'Process Order' : 'Update Delivery Fee' ) :
                         ( $_SESSION['edit_on'] ? 'Update Order' : ( is_numeric($pay_fee) ? 'Confirm Order' : 'Submit Order' ) );
                    break;
          case 1: $submit = 'Send for Delivery'; break;
          case 2: $submit = 'Confirm Delivery'; break;
          case 3: $submit = 'VOID Order'; break;
          case 4: $submit = 'Reopen Order'; break;
     }

     $forenc= $encode= null;
     if( isset($_SESSION['reg_welcome']['id']) ) {
          $forenc= $_SESSION['reg_welcome']['id'];
          $enc   = get_page_by_title( 'Manage Registration', '', 'page' );
          $encode= '<input type="button" href="'.get_permalink( $enc->ID ).'?'.$forenc.'" class="btn link" value="Back to Encode" /> ';
     }

     $ret   = get_page_by_title( (MANAGE? 'Manage Orders' : 'Orders'), '', 'page' );

     $void  = ISIN_ADMIN && !$status ? '<input type="button" href="?void_order&i='.$order_id.'" class="btn link" value="Void Order" /> ' :'';
     $sms   = ISIN_ADMIN && $status ? '<input type="button" href="#" class="btn link" value="Send SMS" /> ' :'';
     $back  = '<input type="button" href="'.get_permalink( $ret->ID ).'" class="btn link" value="Back" /> ';
     $sub   = '<input type="submit" name="submit" class="btn" value="'.$submit.'" /> ';
     $print = ISIN_ADMIN && $status>0 && $status<4 ? ' <input type="button" href="?print" class="btn link" value="Print Receipt" /> ' :'';

     if( ( ISIN_ADMIN ) || ( !ISIN_ADMIN && !$status ) ) $co .= '<hr>' . ( $status<3 ? $sub :'' ) . $print . (isset($encode) ? $encode :'') . $void . $sms . $back;

     $co .= '</form>';
}

echo $valid_id ? $co :'';
?>
