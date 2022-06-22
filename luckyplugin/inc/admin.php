<?php
/**
*@package LuckyPlugin
*/

class LuckyPluginAdmin
{
     public function __construct() {
          add_filter( 'init', array( $this, 'init_admin') );
     }

     function register() {
          add_action( 'init', array( $this, 'load_if_admin_logged_in' ) );
          add_filter( 'the_content', array( $this, 'load_admin') );
          add_filter( 'wp_nav_menu_items', array( $this, 'add_admin_menu' ), 10, 2 );

          add_action( 'admin_post_nopriv_admin_login', array( $this, 'admin_login' ) );
          add_action( 'admin_post_admin_login', array( $this, 'admin_login' ) );
     }

     function init_admin( ) {
          global $luckyuser, $resetstatus;

          if( $_SESSION['user_type']=='admin' ) {
               $luckyuser['id']         = $_SESSION['id'];
               $luckyuser['un']         = $_SESSION['un'];
               $luckyuser['nn']         = $_SESSION['nn'];
               $luckyuser['user_type']  = $_SESSION['user_type'];
          }

          define( 'ISIN_ADMIN', isset($_SESSION['user_type']) && $_SESSION['user_type']=='admin' );
          define( 'IS_GLOBAL', isset($_SESSION['global']) && $_SESSION['global'] );
          define( 'ADMIN_ID', ISIN_ADMIN && isset($_SESSION['un']) ? $_SESSION['un'] : null );
          define( 'OVERLORD', IS_GLOBAL && $_SESSION['id']==990 );
     }

     function load_if_admin_logged_in() {
          if( ISIN_ADMIN ) {
               add_action( 'admin_post_nopriv_update_admin', array( $this, 'update_admin' ) );
               add_action( 'admin_post_update_admin', array( $this, 'update_admin' ) );
               add_action( 'admin_post_nopriv_admin_upload', array( $this, 'admin_upload' ) );
               add_action( 'admin_post_admin_upload', array( $this, 'admin_upload' ) );
               add_action( 'admin_post_nopriv_process_order', array( $this, 'process_order' ) );
               add_action( 'admin_post_process_order', array( $this, 'process_order' ) );
               add_action( 'admin_post_nopriv_update_settings', array( $this, 'update_settings' ) );
               add_action( 'admin_post_update_settings', array( $this, 'update_settings' ) );
               add_action( 'admin_post_nopriv_update_packages', array( $this, 'update_packages' ) );
               add_action( 'admin_post_update_packages', array( $this, 'update_packages' ) );
               add_action( 'admin_post_nopriv_update_stockist', array( $this, 'update_stockist' ) );
               add_action( 'admin_post_update_stockist', array( $this, 'update_stockist' ) );
               add_action( 'admin_post_nopriv_update_transfers', array( $this, 'update_transfers' ) );
               add_action( 'admin_post_update_transfers', array( $this, 'update_transfers' ) );
          }
     }

     function load_admin( $content ) {
          global $post;

          $uri = substr( stristr( $_SERVER['REQUEST_URI'], '?' ), 1);
          $uri = strpos( $uri, 'testnet' ) !== false ? '': $uri;

          if( is_page() ) {
               if( $uri == 'upload' ) {
                    require_once plugin_dir_path( __DIR__ ) . 'admin/admin_upload.php';

               } elseif( $uri == 'phpinfo' ) {
                    phpinfo();

               } elseif( $uri == 'rundc' ) {
                    require_once plugin_dir_path( __DIR__ ) . 'admin/init_rundiscount.php';

               } elseif( $uri == 'runlogs' ) {
                    require_once plugin_dir_path( __DIR__ ) . 'admin/init_runlogs.php';

               } elseif( $uri == 'runlineage' ) {
                    require_once plugin_dir_path( __DIR__ ) . 'admin/init_lineage.php';

               } elseif( strpos( $uri, 'void_order' ) !== false ) {
                    require_once plugin_dir_path( __DIR__ ) . 'products/void.php';

               } elseif( $post->post_title == 'Admin' ) {
                    if( ADMIN_ID!='' ) {
                         if( $uri == 'update_pass' ) {
                              require_once plugin_dir_path( __DIR__ ) . 'templates/update_pass.php';

                         } else {
                              if( $this->test_admin( ) )
                                   require_once plugin_dir_path( __DIR__ ) . 'admin/admin.php';
                         }

                    } else {
                         require_once plugin_dir_path( __DIR__ ) . 'inc/login.php';

                    }

               } elseif( $post->post_title == 'Manage Admin' ) {
                    if( $this->test_admin( 1 ) )
                         require_once plugin_dir_path( __DIR__ ) . 'admin/admin_manage.php';

               } elseif( $post->post_title == 'Manage Website' ) {
                    if( $this->test_admin( 1 ) )
                         require_once plugin_dir_path( __DIR__ ) . 'admin/admin_manage.php';

               } elseif( $post->post_title == 'Manage Distributors' ) {
                    if( $this->test_admin( ) )

                    if( $uri != '' ) {
                         if( strpos( $uri, 'send_welcome' ) !==false ) {
                              require_once plugin_dir_path( __DIR__ ) . 'account/resend_welcome.php';

                         } else {
                              require_once plugin_dir_path( __DIR__ ) . 'account/profile.php';
                         }

                    } else {
                         require_once plugin_dir_path( __DIR__ ) . 'admin/admin_distributors.php';
                    }

               } elseif( $post->post_title == 'Manage Customers' ) {
                    if( $this->test_admin( ) )
                         require_once plugin_dir_path( __DIR__ ) . 'admin/admin_customers.php';

               } elseif( $post->post_title == 'Manage Stockist' ) {
                    if( $this->test_admin( ) )
                         require_once plugin_dir_path( __DIR__ ) . 'admin/admin_stockist.php';

               } elseif( $post->post_title == 'Manage Registration' ) {
                    if( $this->test_admin( ) )
                         require_once plugin_dir_path( __DIR__ ) . 'admin/admin_registration.php';

               } elseif( $post->post_title == 'Manage Products' ) {
                    if( $this->test_admin( ) )
                         require_once plugin_dir_path( __DIR__ ) . 'admin/admin_products.php';

               } elseif( $post->post_title == 'Manage Packages' ) {
                    if( $this->test_admin( ) )
                         require_once plugin_dir_path( __DIR__ ) . 'admin/admin_packages.php';

               } elseif( $post->post_title == 'Assemble Package' ) {
                    if( $this->test_admin( ) )

                    if( $uri && ( $uri=='add' || strlen($uri) >4 ) ) {
                         require_once plugin_dir_path( __DIR__ ) . 'products/package_assemble.php';
                    } else {
                         require_once plugin_dir_path( __DIR__ ) . 'admin/admin_assemble.php';
                    }

               } elseif( $post->post_title == 'Manage Survey' ) {
                    if( $this->test_admin( ) )
                         require_once plugin_dir_path( __DIR__ ) . 'admin/admin_survey.php';

               } elseif( $post->post_title == 'Manage Share & Care' ) {
                    if( $this->test_admin( ) )
                         require_once plugin_dir_path( __DIR__ ) . 'admin/admin_snc.php';

               } elseif( $post->post_title == 'Manage Payout' ) {
                    if( $this->test_admin( ) )
                         require_once plugin_dir_path( __DIR__ ) . 'admin/admin_payout.php';

               } elseif( $post->post_title == 'Manage Bonuses' ) {
                    if( $this->test_admin( ) )
                         require_once plugin_dir_path( __DIR__ ) . 'admin/admin_bonus.php';

               } elseif( $post->post_title == 'Manage Stocks' ) {
                    if( $this->test_admin( ) )
                         require_once plugin_dir_path( __DIR__ ) . 'admin/admin_stocks.php';

               } elseif( $post->post_title == 'Manage Transfers' ) {
                    if( $this->test_admin( ) )

                    if( $uri && ( $uri=='add' || strlen($uri) >4 ) ) {
                         require_once plugin_dir_path( __DIR__ ) . 'stockist/transfers.php';
                    } else {
                         require_once plugin_dir_path( __DIR__ ) . 'admin/admin_transfers.php';
                    }

               } elseif( $post->post_title == 'Manage Reorders' ) {
                    if( $this->test_admin( ) )

                    if( strlen($uri) >4 ) {
                         require_once plugin_dir_path( __DIR__ ) . 'stockist/reorders.php';
                    } else {
                         require_once plugin_dir_path( __DIR__ ) . 'admin/admin_reorders.php';
                    }

               } elseif( $post->post_title == 'Manage Orders' ) {
                    if( $this->test_admin( ) )

                    if( $uri ) {
                         $order_id = $uri;
                         if( $uri == 'print' ) {
                              require_once plugin_dir_path( __DIR__ ) . 'admin/print_receipt.php';
                              require_once plugin_dir_path( __DIR__ ) . 'assets/print_pdf.php';
                         } elseif( strlen($uri) >4 ) {
                              require_once plugin_dir_path( __DIR__ ) . 'products/orders.php';
                         } else {
                              require_once plugin_dir_path( __DIR__ ) . 'admin/admin_orders.php';
                         }
                    } else {
                          require_once plugin_dir_path( __DIR__ ) . 'admin/admin_orders.php';
                    }

               } elseif( $post->post_title == 'Pending' ) {
                    if( $this->test_admin( ) )

                    $filter_status = 0;
                    require_once plugin_dir_path( __DIR__ ) . 'products/init_orders.php';

               } elseif( $post->post_title == 'Processing' ) {
                    if( $this->test_admin( ) )

                    $filter_status = 1;
                    require_once plugin_dir_path( __DIR__ ) . 'products/init_orders.php';

               } elseif( $post->post_title == 'For Delivery' ) {
                    if( $this->test_admin( ) )

                    $filter_status = 2;
                    require_once plugin_dir_path( __DIR__ ) . 'products/init_orders.php';

               } elseif( $post->post_title == 'Delivered' ) {
                    if( $this->test_admin( ) )

                    $filter_status = 3;
                    require_once plugin_dir_path( __DIR__ ) . 'products/init_orders.php';

               } elseif( $post->post_title == 'Cancelled' ) {
                    if( $this->test_admin( ) )

                    $filter_status = 4;
                    require_once plugin_dir_path( __DIR__ ) . 'products/init_orders.php';

               } elseif( $post->post_title == 'Settings' ) {
                    if( $this->test_admin( ) )
                         require_once plugin_dir_path( __DIR__ ) . 'admin/admin_settings.php';

               } elseif( $post->post_title == 'Tools' ) {
                    if( $this->test_admin( ) )
                         require_once plugin_dir_path( __DIR__ ) . 'admin/tools.php';
               } else return $content;

          } else return $content;
     }

     function test_admin($req_glob=0) {
          $warn = '<h4>Warning. You are not allowed here.<br>Your IP '.$_SERVER['REMOTE_ADDR'].' has been logged</h4>';

          if( !ISIN_ADMIN ) {
               echo $warn;
               reloadTo( get_home_url(), 3 );
          } else if( $req_glob && !IS_GLOBAL ) {
               echo $warn;
          } else return true;
     }

     function admin_login() {
          require_once plugin_dir_path( __DIR__ ) . 'admin/admin_login.php';
     }

     function update_admin() {
          require_once plugin_dir_path( __DIR__ ) . 'admin/update_admin.php';
     }

     function update_settings() {
          require_once plugin_dir_path( __DIR__ ) . 'admin/update_settings.php';
     }

     function update_packages() {
          require_once plugin_dir_path( __DIR__ ) . 'admin/update_packages.php';
     }

     function update_stockist() {
          require_once plugin_dir_path( __DIR__ ) . 'stockist/update_stockist.php';
     }

     function update_transfers() {
          require_once plugin_dir_path( __DIR__ ) . 'stockist/update_transfers.php';
     }

     function process_order() {
          require_once plugin_dir_path( __DIR__ ) . 'admin/process_order.php';
     }

     function admin_upload() {
          require_once plugin_dir_path( __DIR__ ) . 'templates/upload.php';
     }

     function add_admin_menu( $items, $args ) {
          if( $args->theme_location == 'top'  ) {
               $admin    = get_page_by_title( 'Admin', '', 'page' );
               $manage   = get_page_by_title( 'Manage Admin', '', 'page' );
               $website  = get_page_by_title( 'Manage Website', '', 'page' );
               $customer = get_page_by_title( 'Manage Customers', '', 'page' );
               $register = get_page_by_title( 'Manage Registration', '', 'page' );
               $distri   = get_page_by_title( 'Manage Distributors', '', 'page' );
               $stockist = get_page_by_title( 'Manage Stockist', '', 'page' );
               $snc      = get_page_by_title( 'Manage Share & Care', '', 'page' );
               $products = get_page_by_title( 'Manage Products', '', 'page' );
               $packages = get_page_by_title( 'Manage Packages', '', 'page' );
               $orders   = get_page_by_title( 'Manage Orders', '', 'page' );
               $stocks   = get_page_by_title( 'Manage Stocks', '', 'page' );
               $transfers= get_page_by_title( 'Manage Transfers', '', 'page' );
               $reorders = get_page_by_title( 'Manage Reorders', '', 'page' );
               $survey   = get_page_by_title( 'Manage Survey', '', 'page' );
               $payout   = get_page_by_title( 'Manage Payout', '', 'page' );
               $bonus    = get_page_by_title( 'Manage Bonuses', '', 'page' );
               $account  = get_page_by_title( 'Account', '', 'page' );
               $settings = get_page_by_title( 'Settings', '', 'page' );
               $tools    = get_page_by_title( 'Tools', '', 'page' );

               if( ISIN_ADMIN ) {
                    $items .= init_menus( 1, $admin->post_title, get_permalink($admin->ID) );
                    $items .= '<ul class="sub-menu">';

                         $items .= init_menus( 1, 'Users', '#' );
                         $items .= '<ul class="sub-menu">';
                              $items .= init_menus( 0, $customer->post_title, get_permalink($customer->ID) );
                              $items .= init_menus( 0, $register->post_title, get_permalink($register->ID) );
                              $items .= init_menus( 0, $distri->post_title, get_permalink($distri->ID) );
                              $items .= init_menus( 0, $stockist->post_title, get_permalink($stockist->ID) );
                              if( IS_GLOBAL ) $items .= init_menus( 0, 'Manage Admin', get_permalink($manage->ID) );
                              $items .= init_menus( 0, $survey->post_title, get_permalink($survey->ID) );
                         $items .= '</ul></li>';

                         $items .= init_menus( 1, 'Logistics', '#' );
                         $items .= '<ul class="sub-menu">';
                              $items .= init_menus( 0, $orders->post_title, get_permalink($orders->ID) );
                              $items .= init_menus( 0, $products->post_title, get_permalink($products->ID) );
                              $items .= init_menus( 0, $packages->post_title, get_permalink($packages->ID) );
                              $items .= init_menus( 0, $stocks->post_title, get_permalink($stocks->ID) );
                              $items .= init_menus( 0, $transfers->post_title, get_permalink($transfers->ID) );
                              $items .= init_menus( 0, $reorders->post_title, get_permalink($reorders->ID) );
                         $items .= '</ul></li>';

                         $items .= init_menus( 1, 'Programs', '#' );
                         $items .= '<ul class="sub-menu">';
                              $items .= init_menus( 0, $snc->post_title, get_permalink($snc->ID) );
                         $items .= '</ul></li>';

                         $items .= init_menus( 1, 'Bonuses', '#', 'dd' );
                         $items .= '<ul class="sub-menu">';
                              $items .= init_menus( 0, $bonus->post_title, get_permalink($bonus->ID) );
                              $items .= init_menus( 0, $payout->post_title, get_permalink($payout->ID) );
                         $items .= '</ul></li>';

                              $items .= init_menus( 1, 'System', '#', 'dd' );
                              $items .= '<ul class="sub-menu">';
                              if( IS_GLOBAL ) {
                                   $items .= init_menus( 0, 'Manage Website', get_permalink($website->ID) );
                                   $items .= init_menus( 0, $settings->post_title, get_permalink($settings->ID) );
                              }
                                   $items .= init_menus( 0, 'Update Password', get_permalink($account->ID) . '?update_pass' );
                                   $items .= init_menus( 0, $tools->post_title, get_permalink($tools->ID) );
                              $items .= '</ul></li>';

                         $items .= init_menus( 0, 'Logout', '?logout' );
                    $items .= '</ul></li>';
               }
          }
          return $items;
     }
}
