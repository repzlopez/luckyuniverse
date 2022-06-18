<?php
/**
*@package LuckyPlugin
*/

class LuckyPluginAccount
{
     function __construct() {
     }

     function register() {
          add_action( 'init', array( $this, 'unset_accounts' ) );
          add_action( 'init', array( $this, 'load_if_logged_in' ) );
          add_action( 'wp_enqueue_scripts', array( $this, 'enqueue' ) );

          add_filter( 'the_content', array( $this, 'load_accounts' ) );

          add_action( 'admin_post_nopriv_account_login', array( $this, 'account_login' ) );
          add_action( 'admin_post_nopriv_customers_login', array( $this, 'customers_login' ) );
          add_action( 'admin_post_nopriv_update_profile', array( $this, 'update_profile' ) );
          add_action( 'admin_post_update_profile', array( $this, 'update_profile' ) );

          add_filter( 'wp_nav_menu_items', array( $this, 'add_account_menu' ), 10, 2 );
     }

     function load_if_logged_in() {
          if( isset( $_SESSION['user_type'] ) && ( preg_match( "/admin|distributors|customers/i", $_SESSION['user_type'] ) ) ) {
               add_filter( 'the_title', array( $this, 'distributor_title_update' ), 10, 2 );
               add_filter( 'pre_wp_nav_menu', array( $this, 'distributor_remove_title_filter_nav_menu' ), 10, 2 );
               add_filter( 'wp_nav_menu_items', array( $this, 'distributor_add_title_filter_non_menu' ), 10, 2 );

               add_action( 'admin_post_nopriv_submit_survey', array( $this, 'submit_survey' ) );
               add_action( 'admin_post_submit_survey', array( $this, 'submit_survey' ) );
               add_action( 'admin_post_nopriv_update_customers', array( $this, 'update_customers' ) );
               add_action( 'admin_post_update_customers', array( $this, 'update_customers' ) );
               add_action( 'admin_post_nopriv_update_pass', array( $this, 'update_pass' ) );
               add_action( 'admin_post_update_pass', array( $this, 'update_pass' ) );
          }
     }

     function unset_accounts() {
     }

     function load_accounts( $content ) {
          global $post,$luckyuser;

          $uri = substr( stristr( $_SERVER['REQUEST_URI'], '?' ), 1);
          $uri = strpos( $uri, 'testnet' ) !== false ? '': $uri;

          if( is_page() ) {
               if( $post->post_title == 'Account' ) {
                    if( isset( $luckyuser['id'] ) ) {
                         if( $uri == 'update_pass' ) {
                              require_once plugin_dir_path( __DIR__ ) . 'templates/update_pass.php';

                         } else {
                              if( ISIN_CUSTOMER ) {
                                   require_once plugin_dir_path( __DIR__ ) . 'account/customers.php';

                              } elseif( ISIN_DISTRI ) {
                                   require_once plugin_dir_path( __DIR__ ) . 'account/accounts.php';
                              }
                         }

                    } else {
                         require_once plugin_dir_path( __DIR__ ) . 'inc/login.php';
                    }

               } elseif( $post->post_title == 'Profile' ) {
                    if( preg_match( "/distributors|admin/i", $luckyuser['user_type'] ) ) {
                         require_once plugin_dir_path( __DIR__ ) . 'account/profile.php';

                    } elseif( ISIN_CUSTOMER ) {
                         require_once plugin_dir_path( __DIR__ ) . 'account/customer_profile.php';

                    } else {
                         echo '<h4>You are NOT ALLOWED here.</h4>';
                    }

               } elseif( $post->post_title == 'Customers' ) {
                    if( isset( $luckyuser['id'] ) ) {
                         require_once plugin_dir_path( __DIR__ ) . 'account/mycustomers.php';
                    } else {
                         require_once plugin_dir_path( __DIR__ ) . 'inc/customer_login.php';
                    }

               } elseif( $post->post_title == 'Genealogy' ) {
                    require_once plugin_dir_path( __DIR__ ) . 'account/genealogy.php';

               } elseif( $post->post_title == 'Bonus History' ) {
                    require_once plugin_dir_path( __DIR__ ) . 'account/bonus_history.php';

               } elseif( $post->post_title == 'Payout' ) {
                    require_once plugin_dir_path( __DIR__ ) . 'account/payout.php';
               // } elseif( $post->post_title == 'Registration' ) {
               //      require_once plugin_dir_path( __DIR__ ) . 'account/register.php';

               } elseif( $post->post_title == 'Confirmation' ) {
                    require_once plugin_dir_path( __DIR__ ) . 'account/confirm_registration.php';

               } elseif( $post->post_title == 'Forgot Password' ) {
                    require_once plugin_dir_path( __DIR__ ) . 'account/forgot_password.php';

               } else return $content;

          } else return $content;
     }

     function update_profile() {
          require_once plugin_dir_path( __DIR__ ) . 'account/update_distri.php';
     }

     function submit_survey() {
          require_once plugin_dir_path( __DIR__ ) . 'templates/update_survey.php';
     }

     function update_customers() {
          require_once plugin_dir_path( __DIR__ ) . 'templates/update_customers.php';
     }

     function update_pass() {
          require_once plugin_dir_path( __DIR__ ) . 'templates/update_pass.php';
     }

     function account_login() {
          require_once plugin_dir_path( __DIR__ ) . 'account/account_login.php';
     }

     function customers_login() {
          require_once plugin_dir_path( __DIR__ ) . 'account/customers_login.php';
     }

     function enqueue() {
          wp_enqueue_style( 'dashicons' );
          wp_enqueue_style( 'jquery-ui-datepicker-style' , '//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/themes/smoothness/jquery-ui.css');
          wp_enqueue_script( 'jquery-ui-datepicker' );
     }

     function add_account_menu( $items, $args ) {
          if( $args->theme_location == 'top' ) {
               $account  = get_page_by_title( 'Account', '', 'page' );
               $profile  = get_page_by_title( 'Profile', '', 'page' );
               $orders   = get_page_by_title( 'Orders', '', 'page' );
               $gene     = get_page_by_title( 'Genealogy', '', 'page' );
               $customers= get_page_by_title( 'Customers', '', 'page' );
               $payout   = get_page_by_title( 'Payout', '', 'page' );
               $bonus    = get_page_by_title( 'Bonus History', '', 'page' );

               if( ISIN_DISTRI || ISIN_CUSTOMER ) {
                    $items .= init_menus( 1, 'Account', get_permalink($account->ID) );

                    $items .= '<ul class="sub-menu">';
                         $items .= init_menus( 0, 'Profile', get_permalink($profile->ID) );
                         $items .= init_menus( 0, 'Orders', get_permalink($orders->ID) );
                         if( ISIN_DISTRI ) $items .= init_menus( 0, 'Customers', get_permalink($customers->ID) );
                         if( ISIN_DISTRI ) $items .= init_menus( 0, 'Genealogy', get_permalink($gene->ID) );
                         if( ISIN_DISTRI ) $items .= init_menus( 0, 'Payout', get_permalink($payout->ID) );
                         if( ISIN_DISTRI ) $items .= init_menus( 0, 'Bonus History', get_permalink($bonus->ID), 'dd' );
                         $items .= init_menus( 0, 'Update Password', get_permalink($account->ID) . '?update_pass', 'dd' );
                         $items .= init_menus( 0, 'Logout', '?logout' );
                    $items .= '</ul></li>';
               } elseif( ISIN_ADMIN || ISIN_STOCKIST ) {
               } elseif( LOGIN_ON ) {
                    $items .= init_menus( 0, 'Account', get_permalink($account->ID) );
               }
          }
          return $items;
     }

     function distributor_title_update( $title, $id = null ) {
          global $luckyuser;
          if( ! is_admin() && ! is_null( $id ) ) {
               $post = get_post( $id );
               if( is_page() && preg_match( "/Account|Profile/i", $post->post_title )  && ( isset($luckyuser['user_type']) ) ) {
                    $new_title = '@' . DISTRI_UN;
                    if( ! empty( $new_title ) ) {
                         return $new_title;
                    }
               } elseif( is_page() && $post->post_title == 'Confirmation' ) {
                    $new_title = ( isset($_GET['key']) ? 'ACCOUNT CONFIRMATION' : 'WARNING' );

                    if( ! empty( $new_title ) ) {
                         return $new_title;
                    }
               }
          }
          return $title;
     }

     function distributor_remove_title_filter_nav_menu( $nav_menu, $args ) {
         remove_filter( 'the_title', array( $this, 'distributor_title_update'), 10, 2 );
         return $nav_menu;
     }

     function distributor_add_title_filter_non_menu( $items, $args ) {
         add_filter( 'the_title', array( $this, 'distributor_title_update'), 10, 2 );
         return $items;
     }
}
