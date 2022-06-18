<?php
/**
*@package LuckyPlugin
*/

class LuckyPluginProducts
{
     public function __construct() {
          add_filter( 'init', array( $this, 'init_shop') );
          add_filter( 'wp_nav_menu_items', array( $this, 'add_shop_menu' ), 10, 2 );
     }

     function register() {
          add_filter( 'the_content', array( $this, 'load_products') );

          add_filter( 'the_title', array( $this, 'product_title_update' ), 10, 2 );
          add_filter( 'pre_wp_nav_menu', array( $this, 'product_remove_title_filter_nav_menu' ), 10, 2 );
          add_filter( 'wp_nav_menu_items', array( $this, 'product_add_title_filter_non_menu' ), 10, 2 );

          add_action( 'admin_post_nopriv_test_disc_code', array( $this, 'test_disc_code' ) );
          add_action( 'admin_post_test_disc_code', array( $this, 'test_disc_code' ) );
          add_action( 'admin_post_nopriv_checkout_order', array( $this, 'checkout_order' ) );
          add_action( 'admin_post_checkout_order', array( $this, 'checkout_order' ) );
          add_action( 'admin_post_nopriv_update_products', array( $this, 'update_products' ) );
          add_action( 'admin_post_update_products', array( $this, 'update_products' ) );
          add_action( 'admin_post_nopriv_void_order', array( $this, 'void_order' ) );
          add_action( 'admin_post_void_order', array( $this, 'void_order' ) );
     }

     function init_shop( ) {
          global $post;

          define('DISCOUNT_ON', ( ISIN_DISTRI || ISIN_CUSTOMER ) ? $_SESSION['discount_code']!='' : isset($_SESSION['discount']) && trim($_SESSION['discount']['code'])!='' );
          define('DISCOUNT_CODE', ( ISIN_DISTRI || ISIN_CUSTOMER ) ? $_SESSION['discount_code'] : ( DISCOUNT_ON ? $_SESSION['discount']['code'] : null ) );
          define('DISCOUNT_DSDID', ISIN_DISTRI ? DISTRI_ID : ( DISCOUNT_ON ? $_SESSION['discount']['dsdid'] : null ) );
     }

     function test_disc_code() {
          require_once plugin_dir_path( __DIR__ ) . 'products/test_disc_code.php';
     }

     function checkout_order() {
          require_once plugin_dir_path( __DIR__ ) . 'products/checkout_order.php';
     }

     function update_products() {
          require_once plugin_dir_path( __DIR__ ) . 'products/update_products.php';
     }

     function void_order() {
          require_once plugin_dir_path( __DIR__ ) . 'products/void_order.php';
     }

     function load_products( $content ) {
          global $post,$luckyuser;

          $uri = substr( stristr( $_SERVER['REQUEST_URI'], '?' ), 1);
          $uri = strpos( $uri, 'testnet' ) !== false ? '': $uri;

          if( is_page() ) {
               if( $post->post_title == 'Shop' ) {
                    if( $uri && ( strpos( $uri, 'edit' ) === false ) ) {
                         require_once plugin_dir_path( __DIR__ ) . 'products/test_disc_code.php';
                         test_discount_code($uri);

                         $ret = get_page_by_title( 'Shop', '', 'page' );
                         reloadTo( get_permalink( $ret->ID ) );
                    }

                    if( SHOP_ON ) {
                         require_once plugin_dir_path( __DIR__ ) . 'products/init_shop.php';
                    } else echo '<h4>We apologize for the inconvenience. Shop is temporarily unavailable.</h4>';

               } elseif( $post->post_title == 'Products' ) {
                    require_once plugin_dir_path( __DIR__ ) . 'products/products.php';

               } elseif( $post->post_title == 'Cart' ) {
                    require_once plugin_dir_path( __DIR__ ) . 'products/init_cart.php';

               } elseif( $post->post_title == 'Checkout' ) {
                    require_once plugin_dir_path( __DIR__ ) . 'products/checkout.php';

               } elseif( $post->post_title == 'Share & Care' ) {
                    if( strpos( $uri, 'slot' ) !==false ) {
                         require_once plugin_dir_path( __DIR__ ) . 'products/snc_slot.php';

                    } else {
                         require_once plugin_dir_path( __DIR__ ) . 'products/snc.php';
                    }

               } elseif( $post->post_title == 'Enroll' ) {
                    require_once plugin_dir_path( __DIR__ ) . 'products/enroll.php';

               } elseif( $post->post_title == 'Find my Order' ) {
                    require_once plugin_dir_path( __DIR__ ) . 'products/init_find.php';

               } elseif( $post->post_title == 'Orders' ) {
                    if( ISIN_CUSTOMER || ISIN_DISTRI || ISIN_ADMIN ) {
                         if( $uri ) {
                              $order_id = $uri;
                              if( strlen($uri) >4 ) {
                                   require_once plugin_dir_path( __DIR__ ) . 'products/orders.php';
                              } else {
                                   require_once plugin_dir_path( __DIR__ ) . 'products/init_orders.php';
                              }
                         } else {
                               require_once plugin_dir_path( __DIR__ ) . 'products/init_orders.php';
                         }
                    } elseif( ISIN_STOCKIST ) {
                    } else {
                         if( $uri ) {
                              $order_id = $uri;
                              require_once plugin_dir_path( __DIR__ ) . 'products/orders.php';
                         } else {
                              $ret = get_page_by_title( 'Account', '', 'page' );
                              echo '<h4>Login required. <a href="'.get_permalink( $ret->ID ).'">Click here</a>.</h4>';
                         }
                    }

               } elseif( $post->post_title == 'Thanks' ) {
                    if( stristr( $_SERVER['REQUEST_URI'], 'thanks/?print' ) ) {
                         require_once plugin_dir_path( __DIR__ ) . 'assets/print_pdf.php';
                    } else {
                         require_once plugin_dir_path( __DIR__ ) . 'products/init_thanks.php';
                    }

               } else return $content;

          } else return $content;
     }

     function add_shop_menu( $items, $args ) {
          if( $args->theme_location == 'top' ) {
               $shop  = get_page_by_title( 'Shop', '', 'page' );
               $cart  = get_page_by_title( 'Cart', '', 'page' );
               $cout  = get_page_by_title( 'Checkout', '', 'page' );
               $find  = get_page_by_title( 'Find my Order', '', 'page' );
               $orders= get_page_by_title( 'Orders', '', 'page' );

               if( SHOP_ON && !ISIN_ADMIN && !ISIN_STOCKIST ) {

                    $items .= init_menus( 1, 'Shop', get_permalink($shop->ID) );
                    if( CART_ON ) {
                         $items .= '<ul class="sub-menu">';
                              $items .= init_menus( 0, 'Cart', get_permalink($cart->ID) );
                              $items .= init_menus( 0, 'Checkout', get_permalink($cout->ID) );
                              $items .= init_menus( 0, 'Find my Order', get_permalink($find->ID) );
                         $items .= '</ul></li>';
                    }
               }
          }
          return $items;
     }

     function product_title_update( $title, $id = null ) {
          if( ! is_admin() && ! is_null( $id ) ) {
               $post = get_post( $id );

               if( is_page() && $post->post_title === 'Products' ) {

                    $p   = substr( strrchr( $_SERVER['REQUEST_URI'], '?' ), 1 );
                    $con = SQLi(DBPRF);
                    $qry = "SELECT name FROM products WHERE id=$p AND status=1";
                    $rs  = mysqli_query($con,$qry) or die(mysqli_error($con));
                    $r   = mysqli_fetch_array($rs);

                    $new_title = $r['name'];
                    if( ! empty( $new_title ) ) {
                         return $new_title;
                    }
                    unset( $_SESSION['product_name'] );
               }
          }
          return $title;
     }

     function product_remove_title_filter_nav_menu( $nav_menu, $args ) {
         remove_filter( 'the_title', array( $this, 'product_title_update'), 10, 2 );
         return $nav_menu;
     }

     function product_add_title_filter_non_menu( $items, $args ) {
         add_filter( 'the_title', array( $this, 'product_title_update'), 10, 2 );
         return $items;
     }
}
