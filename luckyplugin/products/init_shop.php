<?php global $msg_ret,$msgclass;

if( isset($_GET['edit']) ) {
     if( $_SESSION['distri_order'] ) {
          $_SESSION['edit_on'] = $_GET['edit'];
     } else
          echo '<h5 class="bad">You are NOT ALLOWED to edit this order</h5>';

          $orders = get_page_by_title( 'Orders', '', 'page' );
          reloadTo( get_permalink( $orders->ID ), 1 );
}

if( isset($_SESSION['edit_on']) ) {
     echo '<h5 class="edit_on">You are currently editing Order# ' . $_SESSION['edit_on'] .'</h5>';
}

if( isset($_SESSION['enroll_success']) && isset($_SESSION['cart']) ) {
     $ret = get_page_by_title( 'Checkout' );

     $x  = '<h4>This will cancel your ongoing enrollment. Continue?</h4><hr>';
     $x .= '<div id="bottom_nav">';
          $x .= '<a href="#" id="clear_cart" class="btn">Yes</a>';
          $x .= '<span id="product_list"><a href="'. get_permalink( $ret->ID ) .'" class="btn">No</a></span>';
     $x .= '</div>';

     echo $x;
     exit;
}

$hide = 'AND id<>88882';
$con = SQLi(DBPRF);
$qry = "SELECT * FROM products WHERE status=1 $hide ORDER BY sort_order,name";
$rs  = mysqli_query($con,$qry) or die(mysqli_error($con));
$col1= 'w6';

if( mysqli_num_rows($rs)>0 ) {
     $products = get_page_by_title( 'Products', '', 'page' );

     $x  = '<form method="post" id="product_list"><ul><li>';
     // $x .= '<strong class="w1">Code</strong>';
     $x .= '<strong class="'.$col1.'">Product Name</strong> ';
     $x .= '<strong class="w2 rt">Price</strong> ';

     if( CART_ON ) {
          if( !ISIN_DISTRI && DISCOUNT_ON )
               $x .= '<strong class="w2 rt smaller discounted">Disc. Price</strong> ';

          $x .= '<strong class="w2 ct">Qty</strong> ';
          $x .= '<strong class="w2 rt">Total</strong> ';

          if( !ISIN_DISTRI && DISCOUNT_ON )
               $x .= '<strong class="w2 rt smaller discounted">Savings</strong>';
     }

     $x .= '</li>';
     $total_less = 0;

     while( $r = mysqli_fetch_assoc( $rs ) ) {
          foreach ( $r as $k=>$v ) $$k = utf8_encode($v);

          if( ($id!=sncReq) || ( ($id==sncReq) && $_SESSION['snc'] ) ) {
               $qty   = (isset($_SESSION['cart'][$id])?$_SESSION['cart'][$id]['qty']:0);
               $price = ISIN_DISTRI ? $wsp : (WEB_SRP?$web_srp:$srp);
               $less  = ($price*DISCOUNT);
               $price_now = $price;
               $total_less += $less;

               $x .= '<li>';
               $x .= '<a href="'.get_permalink( $products->ID ).'?'.$id.'" class="'.$col1.'">'.$name.'</a> ';
               // $x .= '<span class="w4">'.$name.'</span>';
               $x .= '<span class="w2 rt cart_dp">'.$price.'</span> ';

               if( CART_ON ) {
                    $total = $price*$qty;
                    if( !ISIN_DISTRI && DISCOUNT_ON ) {
                         $newdp = ($price-$less);
                         $x .= '<span class="w2 rt discounted">'.number_format($newdp,2).'</span> ';
                         $total = $qty*$newdp;
                         $price_now = $newdp;
                    }

                    $x .= '<span class="w2 ct"><input type="number" name="'.$id.'" class="cart_qty btn w2 rt" data-pov="'.$pov.'" data-price="'.$price.'" min="0" value="'.$qty.'" placeholder="0" /></span> ';
                    $x .= '<span class="cart_amt w2 rt">'.number_format($total,2).'</span> ';
                    $x .= '<input type="hidden" name="'.$id.'_price" value="'.$price_now.'" /> ';

                    if( !ISIN_DISTRI && DISCOUNT_ON )
                         $x .= '<span class="w2 rt cart_dsc discounted">'.number_format($qty*$less,2).'</span> ';
               }

               $x .= '</li>';
          }
     }

     if( CART_ON ) {
          $x .= '<li>';
          // $x .= '<span class="w1"></span>';
          $x .= '<span class="'.$col1.' rt smaller total_msg"></span> ';
          $x .= '<strong class="w2 rt">TOTAL</strong> ';

          if( !ISIN_DISTRI && DISCOUNT_ON )
               $x .= '<span class="w2 discounted"></span> ';

          $x .= '<strong class="w2 ct" id="total_qty">0</strong> ';
          $x .= '<strong class="w2 rt" id="total_amt">0.00</strong> ';
          if( !ISIN_DISTRI && DISCOUNT_ON ) {
               $x .= '<span class="w2 rt discounted" id="total_dsc">'.number_format($total_less,2).'</span><span class="w2 discounted"></span> ';
               $msg_ret = 'DISCOUNT CODE APPLIED';
               $msgclass= 'good';
          }
          $x .= '</li>';

          $x .= '<li><hr>';
          if( CART_ON && !ISIN_DISTRI && is_null(DISCOUNT_CODE) ) $x .= '<input type="text" id="discount_code" class="w4 btn" value="'.DISCOUNT_CODE.'" placeholder="enter discount code" /> <span id="apply_discount" class="dashicons dashicons-tickets-alt" title="Apply Discount Code"></span> ';
          $x .= '<span class="smaller '.$msgclass.'">'.$msg_ret.'</span>';
          $x .= '</li>';

     } else $x .= '<li></li><li></li>';

     $x .= '</ul></form>';
} else $x = '<h5>NO PRODUCTS FOUND</h5>';

if( CART_ON ) {
     $cart     = get_page_by_title( 'Cart', '', 'page' );
     $checkout = get_page_by_title( 'Checkout', '', 'page' );
     $x .= '<div class="rt">';
     $x .= '<a href="#" id="clear_cart" class="btn">Clear Cart</a> ';
     $x .= '<a href="'.get_permalink( $cart->ID ).'" class="btn">View Cart</a> ';
     $x .= '<a href="'.get_permalink( $checkout->ID ).'" class="btn">Checkout</a>';
     $x .= '</div>';
}

mysqli_close($con);
echo $x . BACKTOTOP;
?>
