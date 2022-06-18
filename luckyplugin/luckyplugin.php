<?php
/**
*@package LuckyPlugin
*/
/*
Plugin Name: Lucky Plugin
Description: Lucky Plugin for WP
Version: 1.0.0
Author: Roasted Legumes
Author URI: http://roastedlegumes.org/
License: GPLv2 or later
Text Domain: lucky-plugin
*/

ob_clean();
ob_start();

defined( 'ABSPATH' ) or die;

class LuckyPlugin
{
     public $plugin;

     function __construct() {
          $this->plugin = plugin_basename( __FILE__ );
          add_action( 'init', array( $this, 'init_sessions' ) );
          add_action( 'init', array( $this, 'init_accounts' ) );
          add_action( 'init', array( $this, 'init_logout' ) );

          add_filter( 'login_headerurl', array( $this, 'load_login_logo_url') );
          add_action( 'login_enqueue_scripts', array( $this, 'load_login_logo') );

          add_action( 'admin_enqueue_scripts', array( $this, 'enqueue' ) );
     }

     function register() {
          //admin pages
          add_action( 'init', array( $this, 'custom_post_type') );
          add_action( 'admin_menu', array( $this, 'add_admin_pages') );

          add_filter( "plugin_action_links_$this->plugin", array( $this, 'settings_link'));

          // frontend
          add_action( 'wp_enqueue_scripts', array( $this, 'enqueue' ) );
     }

//initialize
     function init_sessions(){
          global $luckyuser, $msg_ret, $msgclass, $msg_count;
          if ( !isset($_SESSION) ) session_start();

          if ( isset($_SESSION['return_msg']) ) {
               $msg_ret   = $_SESSION['return_msg']['msg'];
               $msg_count = $_SESSION['return_msg']['count'];
               $msgclass  = isset($_SESSION['return_msg']['class'])?'good':'bad';
               unset($_SESSION['return_msg']);
          } else $msg=$msgclass='';
     }

     function init_accounts() {
          global $luckyuser, $resetstatus;

          if ( preg_match( "/distributors|customers/i", $_SESSION['user_type'] ) ) {
               $luckyuser['id']           = $_SESSION['dsdid'];
               $luckyuser['nam']          = $_SESSION['nam'];
               $luckyuser['un']           = $_SESSION['un'];
               $luckyuser['dssid']        = $_SESSION['dssid'];
               $luckyuser['snam']         = $_SESSION['snam'];
               $luckyuser['user_type']    = $_SESSION['user_type'];
               $luckyuser['pay_type']     = $_SESSION['pay_type'];
               $luckyuser['address']      = $_SESSION['address'];
               $luckyuser['discount_code']= $_SESSION['discount_code'];
          }

          $_SESSION['testnet'] = isset($_GET['testnet']) ? $_GET['testnet'] : ( isset($_SESSION['testnet']) ? $_SESSION['testnet'] : null );
          $_SESSION['roasted'] = isset($_GET['roasted']) ? $_GET['roasted'] : ( isset($_SESSION['roasted']) ? $_SESSION['roasted'] : null );
          $_SESSION['byDate'] = date('Y');
          $zzz = substr( stristr( $_SERVER['REQUEST_URI'], '?' ), 1);
          if ( strlen($zzz) == 4 && is_numeric($zzz) ) {
               $_SESSION['byDate'] = $zzz;
          }
          $sel_yr = $_SESSION['byDate'];

          define( 'ISIN_DISTRI', isset($_SESSION['user_type']) && $_SESSION['user_type']=='distributors' );
          define( 'ISIN_CUSTOMER', isset($_SESSION['user_type']) && $_SESSION['user_type']=='customers' );
          define( 'DISTRI_ID', ISIN_DISTRI && isset($_SESSION['dsdid']) ? $_SESSION['dsdid'] : null );
          define( 'DISTRI_UN', isset($_SESSION['un']) ? $_SESSION['un'] : null );
          define( 'PAY_TYPE', isset($_SESSION['pay_type']) ? $_SESSION['pay_type'] : 0 );
          define( 'ENROLL_ON', isset($_SESSION['enroll']) ? $_SESSION['enroll'] : 0 );
          define( 'TESTNET_ON', isset($_SESSION['testnet']) ? $_SESSION['testnet'] : null );
          define( 'ROASTED', isset($_SESSION['roasted']) ? $_SESSION['roasted'] : null );
          define( 'SEL_YEAR', $sel_yr );

          if ( TESTNET_ON ) echo '<h5 style="padding:5px !important;margin:0">DEMO</h5>';
          if ( ROASTED ) echo '<h5 style="padding:5px !important;margin:0">ROASTED</h5>';

          require plugin_dir_path( __FILE__ ) . 'templates/init_setup.php';
          require plugin_dir_path( __FILE__ ) . 'templates/init_db.php';
     }

     function enqueue() {
          // Register the JS file with a unique handle, file location, and an array of dependencies
          wp_register_script( "luckypluginjs", plugins_url( 'assets/script.js', __FILE__ ), array('jquery') );

          // localize the script to your domain name, so that you can reference the url to admin-ajax.php file easily
          wp_localize_script(
               'luckypluginjs', 'luckyAjax', array(
               'ajaxurl'      => admin_url( 'admin-ajax.php' ),
               'qr_url'       => get_site_url( null, 'qrcode' ),
               'hash_url'     => plugins_url( 'admin/init_hash.php', __FILE__ ),
               'gen_pass'     => plugins_url( 'admin/generatepass.php', __FILE__ ),
               'load_customer'=> plugins_url( 'account/customer_profile.php', __FILE__ ),
               'list_distri'  => plugins_url( 'account/list_distributors.php', __FILE__ ),
               'cart_url'     => plugins_url( 'products/init_cart.php', __FILE__ ),
               'test_discount'=> plugins_url( 'products/test_disc_code.php', __FILE__ ),
               'update_cart'  => plugins_url( 'products/update_cart.php', __FILE__ ),
               'search_distri'=> plugins_url( 'templates/admin_distributors.php', __FILE__ ),
               'phone_formats'=> plugins_url( 'templates/phone_formats.php', __FILE__ ),
               'save_customer'=> plugins_url( 'templates/update_customers.php', __FILE__ ),
               'submit_survey'=> plugins_url( 'templates/update_survey.php', __FILE__ ),
               'discount'     => DISCOUNT_ON
          ) );

          // enqueue jQuery library and the script you registered above
          wp_enqueue_script( 'jquery' );
          wp_enqueue_script( 'luckypluginjs' );

          // enqueue styles
          if ( !is_admin() ) {
               wp_enqueue_style( 'luckyplugincss', plugins_url( 'assets/styles.css', __FILE__ ) );
          }

          wp_enqueue_style( 'google-fonts', 'https://fonts.googleapis.com/css2?family=Spartan&family=Work+Sans&display=swap', [], null );
     }

//frontpage
     function load_login_logo() {
          ?>
               <style type="text/css">body.login div#login h1 a { background-image: url('https://luckyuniverseph.com/wp-content/uploads/2019/01/eb167.png');background-size:260px;height:216px;width:260px; } </style>
          <?php
     }

     function load_login_logo_url($url) {
          return get_home_url();
     }

     function init_logout() {
          if( stristr( $_SERVER['REQUEST_URI'], '?logout' ) ) {
               if ( isset( $_COOKIE[session_name()] ) ) setcookie( session_name(), '', time()-3600, '/');
               $_SESSION = $luckyuser = array();

               if ( ini_get("session.use_cookies") ) {
               	$params = session_get_cookie_params();
               	setcookie(session_name(),'',time() - 42000,
               	$params["path"], $params["domain"],
               	$params["secure"], $params["httponly"]
               	);
               }

               session_destroy();
               wp_redirect( get_home_url() );
               exit;
          }

          if ( stristr( $_SERVER['REQUEST_URI'], '?clear_cart' ) ) {
               unset($_SESSION['cart']);
          }
     }

//admin
     function custom_post_type() {
          register_post_type( 'luckypost', ['public' => true, 'label' => 'Lucky Posts', 'menu_icon' => 'dashicons-lock'] );
     }

     function settings_link( $links) {
          // custom plugin settings
          $settings_link = '<a href="admin.php?page=lucky_plugin">Settings</a>';
          array_push( $links, $settings_link );
          return $links;
     }

     function add_admin_pages() {
          add_menu_page( 'Lucky Plugin', 'Lucky Plugin', 'manage_options', 'lucky_plugin', array( $this, 'admin_index' ), 'dashicons-rest-api', 110 );
     }

     function admin_index() {
          require_once plugin_dir_path( __FILE__ ) . 'templates/admin.php';
     }

     // function update() {
     //      require_once plugin_dir_path( __FILE__ ) . 'inc/update_distri.php';
     // }

     function deactivate() {
          require_once plugin_dir_path( __FILE__ ) . 'inc/deactivate.php';
          LuckyPluginDeactivate::deactivate();
     }

}

if ( class_exists( 'LuckyPlugin' ) ) {
     $luckyplugin = new LuckyPlugin( );
     $luckyplugin->register();

     require_once plugin_dir_path( __FILE__ ) . 'inc/product.php';
     $luckyproducts = new LuckyPluginProducts( );
     $luckyproducts->register();

     require_once plugin_dir_path( __FILE__ ) . 'inc/account.php';
     $luckyaccounts = new LuckyPluginAccount( );
     $luckyaccounts->register();

     require_once plugin_dir_path( __FILE__ ) . 'inc/admin.php';
     $luckyadmin = new LuckyPluginAdmin( );
     $luckyadmin->register();

     require_once plugin_dir_path( __FILE__ ) . 'inc/stockist.php';
     $luckystockist = new LuckyPluginStockist( );
     $luckystockist->register();
}

// activation
require_once plugin_dir_path( __FILE__ ) . 'inc/activate.php';
register_activation_hook( __FILE__, array( 'LuckyPluginActivate', 'activate' ) );

// deactivation
register_activation_hook( __FILE__, array( $luckyplugin, 'deactivate' ) );
