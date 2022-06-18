<?php
if( !isset($_SESSION) ) session_start();
require_once 'init_cart.php';
global $pay;

if( !isset($_SESSION['survey']['last_id']) ) {
     global $post;
     echo '<META HTTP-EQUIV=Refresh CONTENT="0;URL='.get_permalink( $post->post_parent ).'">';exit;
}

$last_id = sprintf("%'.0".PAD."d\n", $_SESSION['survey']['last_id'] );
$contact = $_SESSION['survey']['contact'];
$payopt  = $_SESSION['survey']['payopt'];
$payamt  = $_SESSION['survey']['payamt'];
$submit  = $_SESSION['survey']['submit'];
$new_customer = $_SESSION['survey']['new_customer'];

unset( $_SESSION['survey'] );
unset( $_SESSION['discount'] );
unset( $_SESSION['checkout'] );
unset( $_SESSION['cart'] );
unset( $_SESSION['enroll'] );
unset( $_SESSION['enroll_success'] );
unset( $_SESSION['snc_referrer'] );

$x  = '<h3 class="print_form">Order # <strong><em>'. $last_id .'</em></strong></h3>';
$x .= $cart;

$x .= '<hr><div class="print_form">';
$x .= '<p>Your order has been posted on <strong><em>'.$submit.'</em></strong> and is being processed.</p>';
$x .= $payopt<2 ? '<p>You opted to pay <strong><em>Php '.number_format($payamt,2).'</em></strong> with <strong><em>'.$pay[$payopt].'</em></strong>.</p>' :'';
$x .= '<p>You will receive an SMS at <strong><em>'.$contact.'</em></strong> to confirm your order';
$x .= $payopt>1 ? ' and payment of <strong><em>Php '.$payamt.'</em></strong> plus delivery fee <strong><em>'.( $payopt<99 ? 'via ' . $pay[$payopt] : 'using your Bonus').'</em></strong>.</p>' :'.</p>';
$x .= '<p>Kindly wait for the confirmation of the total amount to be paid before uploading your proof of payment and we\'ll let you know once your order is on its way.</p>';
$x .= '<p>Thank you for trusting <strong>Lucky Universe</strong>.</p>';
$x .= '</div>';

$_SESSION['print_data'] = $x;
$x .= '<hr><div class="rt"><a href="?print='.$last_id.'" class="btn" target="_blank">PRINT</a></div><br>';

if( ( !ISIN_DISTRI && !ISIN_CUSTOMER ) || ( ISIN_CUSTOMER && $new_customer ) ) {
     $action = 'https://luckyuniverseph.com/wp-admin/admin-post.php';
     $x .= '<div id="thanks_survey">';
     $x .= '<form method="post" action="'.$action.'" id="submit_survey">';
     $x .= '<input type="hidden" name="action" value="submit_survey" />';
     $x .= '<ul><input type="hidden" name="contact" value="'.$contact.'" />
          <li><h4 class="good">We would like to get to know you better:</h4></li>
          <li></li>
          <li><h5>How did you learn about Lucky Universe?</h5></li>
          <li><label><input type="hidden" name="lu_fb" value=0 /><input type="checkbox" name="lu_fb" value=1 /> Lucky Universe Philippines FB page</label></li>
          <li><label><input type="hidden" name="dhub_fb" value=0 /><input type="checkbox" name="dhub_fb" value=1 /> D-Hub Cares TV FB page</label></li>
          <li><label><input type="hidden" name="lu_web" value=0 /><input type="checkbox" name="lu_web" value=1 /> Lucky Universe website</label></li>
          <li><label><input type="hidden" name="refer" value=0 /><input type="checkbox" name="refer" value="'.DISCOUNT_DSDID.'" '.(DISCOUNT_CODE!=''?CHECKED:'').' /> Referred by friend '.( DISCOUNT_CODE!='' ? '( Code: '.DISCOUNT_CODE.' )' :'' ).'</label></li>
          <li><input type="submit" name="submit" class="btn" value="Answer" /></li>
     </ul></form>';
}
$x .= '</div>';

$x .= '<hr><div id="bottom_nav">
          <a href="'.get_permalink(get_page_by_title( 'Shop', '', 'page' )->ID).'" class="btn">Shop</a>
          <a href="'.get_home_url().'" class="btn">Home</a>
     </div>';

echo $x;
?>
