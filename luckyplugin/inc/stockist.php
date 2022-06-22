<?php
/**
*@package LuckyPlugin
*/

class LuckyPluginStockist
{
     function __construct() {
          add_filter( 'init', array( $this, 'init_stockist') );
     }

     function register() {
          add_action( 'init', array( $this, 'load_if_stockist_logged_in' ) );
          add_action( 'wp_enqueue_scripts', array( $this, 'enqueue' ) );

          add_filter( 'the_content', array( $this, 'load_stockist') );

          add_action( 'admin_post_nopriv_stockist_login', array( $this, 'stockist_login' ) );
          add_action( 'admin_post_stockist_login', array( $this, 'stockist_login' ) );
          add_filter( 'wp_nav_menu_items', array( $this, 'add_stockist_menu' ), 10, 2 );
     }

     function init_stockist( ) {
          global $luckyuser;

          if( $_SESSION['user_type']=='stockist' ) {
               $luckyuser['id']         = $_SESSION['id'];
               $luckyuser['un']         = $_SESSION['un'];
               $luckyuser['nn']         = $_SESSION['nn'];
               $luckyuser['lvl']        = $_SESSION['lvl'];
               $luckyuser['user_type']  = $_SESSION['user_type'];
          }

          define( 'ISIN_STOCKIST', isset($_SESSION['user_type']) && $_SESSION['user_type']=='stockist' );
          define( 'STOCKIST_ID', ISIN_STOCKIST && isset($_SESSION['un']) ? $_SESSION['un'] : null );
          define( 'STOCKIST_OIC', isset($_SESSION['oic']) ? $_SESSION['oic'] : null );
          define( 'STOCKIST_LVL', isset($_SESSION['lvl']) ? $_SESSION['lvl'] : null );
     }

     function load_if_stockist_logged_in() {
          if( ISIN_STOCKIST ) {
               add_filter( 'the_title', array( $this, 'stockist_title_update' ), 10, 2 );
               add_filter( 'pre_wp_nav_menu', array( $this, 'stockist_remove_title_filter_nav_menu' ), 10, 2 );
               add_filter( 'wp_nav_menu_items', array( $this, 'stockist_add_title_filter_non_menu' ), 10, 2 );

               add_action( 'admin_post_nopriv_update_stockist', array( $this, 'update_stockist' ) );
               add_action( 'admin_post_nopriv_update_pass', array( $this, 'update_pass' ) );
               add_action( 'admin_post_nopriv_update_transfers', array( $this, 'update_transfers' ) );
          }
     }

     function load_stockist( $content ) {
          global $post,$luckyuser;

          $uri = substr( stristr( $_SERVER['REQUEST_URI'], '?' ), 1);
          $uri = strpos( $uri, 'testnet' ) !== false ? '': $uri;

          if( is_page() ) {

               $page   = 'stockist';
               $ninuno = get_post_ancestors( $post->ID );

               if( !empty($ninuno) && get_post($ninuno[0])->post_title == ucwords($page) && $luckyuser['user_type'] != $page ) {
                    echo '<h4>Warning. You are not allowed here.<br>Your IP '.$_SERVER['REMOTE_ADDR'].' has been logged</h4>';
                    $ret = get_page_by_title( ucwords($page), '', 'page' );
                    reloadTo( get_permalink($ret->ID), 3 );
                    exit;
               }

               if( $post->post_title == 'Stockist' ) {
                    if( isset( $luckyuser['id'] ) ) {
                         if( $uri == 'update_pass' ) {
                              require_once plugin_dir_path( __DIR__ ) . 'templates/update_pass.php';
                         } else {
                              require_once plugin_dir_path( __DIR__ ) . 'stockist/stockist.php';
                         }
                    } else {
                         require_once plugin_dir_path( __DIR__ ) . 'inc/login.php';
                    }

               } elseif( $post->post_title == 'Stockist Orders' ) {
                    if( $uri && ( $uri=='add' || strlen($uri) >4 ) ) {
                         require_once plugin_dir_path( __DIR__ ) . 'stockist/orders.php';
                    } else {
                         require_once plugin_dir_path( __DIR__ ) . 'stockist/stockist_orders.php';
                    }

               } elseif( $post->post_title == 'Stockist Distributors' ) {
                    if( $uri !== '' ) {
                         require_once plugin_dir_path( __DIR__ ) . 'account/profile.php';
                    } else {
                         require_once plugin_dir_path( __DIR__ ) . 'stockist/stockist_distributors.php';
                    }

               } elseif( $post->post_title == 'Stockist Profile' ) {
                    require_once plugin_dir_path( __DIR__ ) . 'stockist/stockist_profile.php';

               } elseif( $post->post_title == 'Fees' ) {
                    require_once plugin_dir_path( __DIR__ ) . 'stockist/stockist_fees.php';

               } elseif( $post->post_title == 'Transfers' ) {
                    if( $uri && ( strpos( $uri, 'add' ) !== false || strlen($uri) >4 ) ) {
                         require_once plugin_dir_path( __DIR__ ) . 'stockist/transfers.php';
                    } else {
                         require_once plugin_dir_path( __DIR__ ) . 'stockist/stockist_transfers.php';
                    }

               } elseif( $post->post_title == 'Reorder' ) {
                    if( $uri && ( $uri=='add' || strlen($uri) >4 ) ) {
                         require_once plugin_dir_path( __DIR__ ) . 'stockist/reorders.php';
                    } else {
                         require_once plugin_dir_path( __DIR__ ) . 'stockist/stockist_reorders.php';
                    }

               } elseif( $post->post_title == 'Stocks' ) {
                    require_once plugin_dir_path( __DIR__ ) . 'stockist/stocks.php';

               } else return $content;

          } else return $content;
     }

     function update_stockist() {
          require_once plugin_dir_path( __DIR__ ) . 'stockist/update_stockist.php';
     }

     function update_transfers() {
          require_once plugin_dir_path( __DIR__ ) . 'stockist/update_transfers.php';
     }

     function update_pass() {
          require_once plugin_dir_path( __DIR__ ) . 'templates/update_pass.php';
     }

     function stockist_login() {
          require_once plugin_dir_path( __DIR__ ) . 'stockist/stockist_login.php';
     }

     function enqueue() {
          wp_enqueue_style( 'dashicons' );
          wp_enqueue_style( 'jquery-ui-datepicker-style' , '//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/themes/smoothness/jquery-ui.css');
          wp_enqueue_script( 'jquery-ui-datepicker' );
     }

     function add_stockist_menu( $items, $args ) {
          if( $args->theme_location == 'top' ) {
               $stockist  = get_page_by_title( 'Stockist', '', 'page' );
               $orders    = get_page_by_title( 'Stockist Orders', '', 'page' );
               $profile   = get_page_by_title( 'Stockist Profile', '', 'page' );
               $distri    = get_page_by_title( 'Stockist Distributors', '', 'page' );
               $fees      = get_page_by_title( 'Fees', '', 'page' );
               $stocks    = get_page_by_title( 'Stocks', '', 'page' );
               $transfers = get_page_by_title( 'Transfers', '', 'page' );
               $reorder   = get_page_by_title( 'Reorder', '', 'page' );

               if( ISIN_STOCKIST ) {
                    $items .= init_menus( 1, 'Stockist', get_permalink($stockist->ID) );

                    $items .= '<ul class="sub-menu">';
                         $items .= init_menus( 0, 'Sales Encoding', get_permalink($orders->ID) );
                         $items .= init_menus( 0, 'Distributors', get_permalink($distri->ID), 'dd' );

                         $items .= init_menus( 1, 'Logistics', '#', 'dd' );
                         $items .= '<ul class="sub-menu">';
                              $items .= init_menus( 0, 'Manage Stocks', get_permalink($stocks->ID) );
                              $items .= init_menus( 0, 'Manage Transfers', get_permalink($transfers->ID) );
                              $items .= init_menus( 0, 'Manage Reorders', get_permalink($reorder->ID) );
                         $items .= '</ul></li>';

                         $items .= init_menus( 1, 'Branch', '#', 'dd' );
                         $items .= '<ul class="sub-menu">';
                              $items .= init_menus( 0, 'Profile', get_permalink($profile->ID) );
                              $items .= init_menus( 0, 'Stockist Fees', get_permalink($fees->ID) );
                         $items .= '</ul></li>';

                         $items .= init_menus( 0, 'Update Password', get_permalink($stockist->ID) . '?update_pass', 'dd' );
                         $items .= init_menus( 0, 'Logout', '?logout' );
                    $items .= '</ul></li>';

               }
          }
          return $items;
     }

     function stockist_title_update( $title, $id = null ) {
          global $luckyuser;
          if( ! is_admin() && ! is_null( $id ) ) {
               $post = get_post( $id );
               if( is_page() && preg_match( "/Stockist/i", $post->post_title )  && ( isset($luckyuser['user_type']) ) ) {
                    $new_title = $luckyuser['nn'] ;
                    if( ! empty( $new_title ) ) {
                         return $new_title;
                    }
               }
          }
          return $title;
     }

     function stockist_remove_title_filter_nav_menu( $nav_menu, $args ) {
         remove_filter( 'the_title', array( $this, 'stockist_title_update'), 10, 2 );
         return $nav_menu;
     }

     function stockist_add_title_filter_non_menu( $items, $args ) {
         add_filter( 'the_title', array( $this, 'stockist_title_update'), 10, 2 );
         return $items;
     }
}
