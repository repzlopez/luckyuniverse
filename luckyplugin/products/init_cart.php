<?php
$discount_on   = DISCOUNT_ON;
$form_on       = ( $post->post_title != 'Thanks' );
$edit_on       = isset($_SESSION['edit_on']) ? $_SESSION['edit_on'] :null;
$distri_order  = 0;
$valid_id      = 1;
// print_r($_SESSION['cart']);

if( $edit_on ) {
     echo '<h5 class="edit_on">You are currently editing Order# ' . $edit_on .'</h5>';
}

if( isset($order_id) ) {
     $sale = 'sales' . SEL_YEAR;
     $tran = 'transactions' . SEL_YEAR;
     $qry = "SELECT s.item,s.discount_code,t.status
          FROM $sale s, $tran t
          WHERE s.trans_id=$order_id
          AND t.trans_id=$order_id";

     $con = SQLi(DBOPS);
     $rs  = mysqli_query($con,$qry) or die(mysqli_error($con));
     $r   = mysqli_fetch_array( $rs );
     $discount_on  = ( $r['discount_code']=='' || $r['discount_code'] == 'isdistri' ) ? 0:1 ;
     $order_status = $r['status'];

     $tbl = ($r['item']==sncID) ? 'packages' : 'products';
     $qry = "SELECT *,
               (SELECT name FROM ".DB.DBPRF.".$tbl WHERE id=item ) name
          FROM $sale
          WHERE trans_id=$order_id";

     if( ISIN_DISTRI ) reloadCart($order_id);

} else {
     $cart = '';
     $total_pov = 0;
     $order_status = 0;

     foreach ($_SESSION['cart'] as $k=>$v) { //remove empty array
          if( $k=='' ) unset( $_SESSION['cart'][$k] );
     }

     if( isset($_SESSION['cart']) && !empty($_SESSION['cart']) ) {
          $orders = '';
          foreach ($_SESSION['cart'] as $k=>$v) {
               $total_pov += $_SESSION['cart'][$k]['pov'] * $_SESSION['cart'][$k]['qty'];
               $orders .= "$k,";
          }
          $orders = substr($orders,0,-1);
          $tbl = ( ENROLL_ON && $orders != sncReq ) ? 'packages' : 'products';
          $qry = "SELECT * FROM $tbl WHERE id IN ($orders)";
          $con = SQLi(DBPRF);

     } else echo '<h5>Oops! Cart is empty!</h5>';
}

switch ($post->post_title) {
     case 'Thanks':
          $col1 = 'col1-ws';
          break;

     default:
          $col1 = 'w6';
          break;
}

if( $qry!='' ) {
     $cart = '';
// echo $qry;
     $rs  = mysqli_query($con,$qry) or die(mysqli_error($con));
     if( mysqli_num_rows($rs)>0 ) {
          if( $form_on ) $cart .= '<form method="post" action="'.esc_url( admin_url('admin-post.php') ).'" id="product_list"><input type="hidden" name="action" value="checkout_info" />';
          $cart .= '<ul '.( !$form_on? 'class="print_form"' : '' ).'><li>';
          $cart .= '<strong class="'.$col1.'">Product Name</strong>';
          $cart .= '<strong class="w2 rt">Price</strong>';

          if( !ISIN_DISTRI && $discount_on ) $cart .= '<strong class="w2 rt smaller">Discounted</strong>';

          $cart .= '<strong class="w1 ct">Qty</strong>';
          $cart .= '<strong class="w2 rt">Total</strong>';

          if( !ISIN_DISTRI && $discount_on ) $cart .= '<strong class="w2 rt smaller">Savings</strong>';

          $cart .= '</li>';

          $total_qty = 0;
          $total_less = 0;
          $total_checkout = 0;
// echo '<br><br>';
          while( $r = mysqli_fetch_assoc( $rs ) ) {
// print_r($r);
               foreach ( $r as $k=>$v ) $$k = utf8_encode($v);
// echo $discount_code;
               if( $qty > 0 || ( $_SESSION['cart'][$id]['qty'] > 0 ) ) {
                    $distri_order = ($discount_code=='isdistri');

                    if( ENROLL_ON ) {
                         foreach ( $_SESSION['cart'][$id] as $k=>$v ) $$k = utf8_encode($v);
                    } elseif( !isset($order_id) ) {
                         $qty   = (isset($_SESSION['cart'])?$_SESSION['cart'][$id]['qty']:0);
                         $price = ISIN_DISTRI ? $wsp : (WEB_SRP?$web_srp:$srp);
                    } else $id=$item;

                    $less  = ($price*DISCOUNT);
                    $total_less += ($qty*$less);
                    $total_qty += (int)$qty;

                    $cart .= '<li>';
                    $cart .= '<span class="'.$col1.'" title="'."$id $name".'">'.$name.'</span>';
                    $cart .= '<span class="w2 rt">'.number_format($price,2).'</span>';

                    $total = $price*$qty;
                    if( !ISIN_DISTRI && $discount_on ) {
                         $newdp = ($price-$less);
                         $cart .= '<span class="w2 rt">'.number_format($newdp,2).'</span>';
                         $total = $qty*$newdp;
                    }

                    $cart .= '<span class="w1 ct">'.$qty.'</span>';
                    $cart .= '<span class="cart_amt w2 rt">'.number_format($total,2).'</span>';

                    if( !ISIN_DISTRI && $discount_on ) $cart .= '<span class="w2 rt cart_dsc">'.number_format($qty*$less,2).'</span>';

                    $cart .= '</li>';
                    $total_checkout += $total;
               }
          }

          $cart .= '<li>';
          $cart .= '<span class="'.$col1.' rt smaller"></span>';
          $cart .= '<strong class="w2 rt">TOTAL</strong>';

          if( !ISIN_DISTRI && $discount_on ) $cart .= '<span class="w2"></span>';

          $cart .= '<strong class="w1 ct">'.$total_qty.'</strong>';
          $cart .= '<strong class="w2 rt">'.number_format($total_checkout,2).'</strong>';
          if( !ISIN_DISTRI && $discount_on ) $cart .= '<span class="w2 rt">'.number_format($total_less,2).'</span>';
          $cart .= '</li>';

          $cart .= '<li>';
          if( !ISIN_DISTRI ) $cart .= DISCOUNT_CODE!=''?'<br><span>Discount Code: <strong>'.DISCOUNT_CODE.'</strong> applied</span>':'';
          $cart .= '</li>';

          $cart .= '</ul>';
          if( $form_on ) $cart .= '</form><hr>';
     } else {
          $valid_id = 0;
          echo '<h5>Oops! Cart is empty!</h5><br><hr>';
     }
     mysqli_close($con);
}

global $post;
$shop     = get_page_by_title( 'Shop', '', 'page' );
$checkout = get_page_by_title( 'Checkout', '', 'page' );

if( !preg_match( "/Orders|Thanks/i", $post->post_title ) && !isset( $_SESSION['order_id']) ) {
     $cart .= '<div class="rt">';
     if( !ISIN_ADMIN && !isset($_SESSION['enroll_success']) ) $cart .= '<a href="'.get_permalink( $shop->ID ).'" class="btn">Continue Shopping</a> ';
     if( $post->post_title != 'Checkout' && !empty($_SESSION['cart']) ) $cart .= '<a href="'.get_permalink( $checkout->ID ).'" class="btn">Checkout</a>';
     $cart .= '</div>';
}

if( ISIN_DISTRI && !$order_status && isset( $order_id ) && !isset($_SESSION['edit_on']) ) {
     $_SESSION['distri_order'] = $distri_order;

     $cart .= '<div class="rt">';
     $cart .= ( $distri_order ) ? '<a href="'.get_permalink( $shop->ID ).'?edit='.$_SESSION['order_id'].'" class="btn">Edit Order</a> ' : '<span class="smaller">Edit Unavailable. Customer Order.</span>';
     $cart .= '</div><hr>';
}

if( $post->post_title != 'Thanks' ) {
     echo $cart . BACKTOTOP;
}

function reloadCart($order_id) {
     $sale = 'sales' . SEL_YEAR;
     $tran = 'transactions' . SEL_YEAR;
     $qry = "SELECT s.*
          FROM $sale s, $tran t
          WHERE s.trans_id=$order_id
          AND t.trans_id=$order_id
          AND t.status=0";

     $con = SQLi(DBOPS);
     $rs  = mysqli_query($con,$qry) or die(mysqli_error($con));
     $r   = mysqli_fetch_array( $rs );
     foreach ($r as $k=>$v) $$k = $v;

     $_SESSION['cart'][$item]['id'] = $item;
     $_SESSION['cart'][$item]['qty'] = $qty;
     $_SESSION['cart'][$item]['pov'] = $pov;
     $_SESSION['cart'][$item]['price'] = $price;
     $_SESSION['cart'][$item]['less'] = $discount;

     if( $_SESSION['edit_on'] ) $_SESSION['order_id'] = $order_id;
}
?>
