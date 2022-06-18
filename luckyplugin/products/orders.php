<?php $o = '';

if( $order_id!='' ) {
     require_once plugin_dir_path( __DIR__ ) . 'products/checkout.php';
}

global $post;
if( $post->post_title == 'Orders' ) {
     $ret = get_page_by_title( 'Orders', '', 'page' );
     if( ISIN_ADMIN || ISIN_DISTRI ) $o .= '<hr><div class="rt"><a href="'.get_permalink( $ret->ID ).'" class="btn">Orders</a></div>';
}
echo $o . BACKTOTOP;
?>
