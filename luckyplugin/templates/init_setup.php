<?php if( !isset($_SESSION) ) session_start();
date_default_timezone_set('Asia/Manila');

if( !defined('TESTNET_ON') ) {
     define( 'TESTNET_ON', isset($_SESSION['testnet']) ? $_SESSION['testnet'] : null );
     define( 'ISIN_ADMIN', isset($_SESSION['user_type']) && $_SESSION['user_type']=='admin' );
}

define( 'DBPRF', 'profiles' . ( TESTNET_ON ? '_test' :'' ) );
define( 'DBOPS', 'ops' . ( TESTNET_ON ? '_test' :'' ) );
define( 'DBSTK', 'stockist' . ( TESTNET_ON ? '_test' :'' ) );

global $arrCB,$arrSex,$arrOrders,$arrReorders,$arrTransfer,$arrPayout,$arrLevel,$pay,$unilevel,$s_pay,$s_sfee,$s_ulvl,$s_sfpc,$stockist_fee;

list($s_999,$s_998,$s_997,$s_996,$s_995,$s_994,$s_993) = init_status();
list($a_reload,$s_disc,$s_mpov,$s_mraf,$s_sfee,$s_mwid,$s_pay,$s_sfpc,$s_ulvl) = init_settings();

$protocol   = strpos( strtolower($_SERVER['SERVER_PROTOCOL']), 'https') === false ? 'http://' : 'https://';
$arrCB	  = array( 'No', 'Yes' );
$arrSex	  = array( 'Choose Gender', 'Male', 'Female', 'I choose not to answer' );
$arrOrders  = array( 'Pending', 'Processing', 'For Delivery', 'Delivered', 'Cancelled' );
$arrReorders= array( 'Pending', 'Approved', 'Transferred' );
$arrTransfer= array( 'Pending', 'Transferred' );
$arrPurpose = array( 'Withdraw', 'Purchase', 'Auto-Payout' );
$arrPayout  = array( 'Automatic', 'Manual' );
$arrWidStat = array( 'requested', 'released', 'cancelled' );
$arrLevel   = array( 'Company', 'Consignment', 'Stockist', 'Megastockist', '001' );
$arrStockFee= array( 'Company', 'Stockist', 'Megastockist', '001' );
$pay		  = explode( ",", $s_pay );
$unilevel   = explode( ",", $s_ulvl );
$stockist_fee= explode( ",", $s_sfpc );

define( 'LKY_FULL', 'Lucky Universe Philippines' );
define( 'LKY_ROOT', $protocol.$_SERVER['SERVER_NAME'] );
define( 'DOC_ROOT', $_SERVER['DOCUMENT_ROOT'] );
define( 'LKY_MSGR', 'https://m.me/luckyuniversephilippines' );
define( 'NOTIF_MAIL', 'luckynotif@luckyuniverseph.com' );
define( 'SUPPORT_MAIL', 'talktous@luckyuniverseph.com' );
define( 'ROASTED_MAIL', 'roastedtesters@gmail.com' );

define( 'WEB_STATUS', $s_999 );
define( 'WEB_UPDATE', $s_998 );
define( 'LOGIN_ON', $s_997 );
define( 'WEB_NOTIF', $s_996 );
define( 'SHOP_ON', $s_995 );
define( 'CART_ON', $s_994 );
define( 'WEB_SRP', $s_993 );

define( 'ASIN', '|u(kyd0k!' );
define( 'ADMIN_RELOAD', $a_reload );
define( 'DISCOUNT', ($s_disc/100) ); // 10%
define( 'MIN_STOCKIST', $s_sfee );
define( 'MIN_WITHDRAW', $s_mwid );
define( 'MIN_RAFFLE', $s_mraf );
define( 'MIN_POV', $s_mpov );
define( 'MAX_LEVEL', count($unilevel) );
define( 'VOID', 4 );
define( 'PAD', 8 );

define( 'Ymd', 'Y-m-d' );
define( 'TMDSET', Ymd.' H:i:s' );
define( 'DATFUL', 'F d, Y' );
define( 'DATSET', 'M d, Y' );
define( 'mdY', 'm.d.Y' );
define( 'mdYs', 'm/d/Y' );
define( 'TIMSET', 'h:ia' );
define( 'ZERO', '0000-00-00 00:00:00' );
define( 'YEAR_1', 2020 );
define( 'SUBMIT_INTERVAL', 10 ); //seconds

//-- Share & Care
define( 'sncID', '77779' );
define( 'sncReq', '77780' );
define( 'sncMaxSlots', 5 );
define( 'sncMaxReq', 25 );
define( 'sncMaxExpiry', 180 );
define( 'sncSlotExpiry', 90 );
//-- Share & Care

//-- Stockist
define( 'HEAD_OFFICE', '00000001' );
define( 'FLUSHOUT', 60 );
//-- Stockist

define( 'IMG_EXISTS', $_SERVER['DOCUMENT_ROOT'].'/img/folder/' );
define( 'DIV_CLEAR', '<div class="clear"></div>' );
define( 'READ_ONLY', 'readonly="readonly"' );
define( 'DISABLED', 'disabled="disabled"' );
define( 'SELECTED', 'selected="selected"' );
define( 'CHECKED', 'checked="checked"' );
define( 'ONCLICK', 'onclick="this.disabled=true;this.value=Submitting;this.form.submit();"' );
define( 'BACKTOTOP', '<div id="backtotop"><a href="#" title="Back to top"></a></div>' );
define( 'GODOWN', '<div id="godown"><a href="#bottom" title="Go to bottom"></a></div>' );
define( 'CONTACT_US', '<p><a href="mailto:'.SUPPORT_MAIL.'"><span class="dashicons dashicons-email"></span> Send us an email</a><br><a href="'.LKY_MSGR.'"><span class="dashicons dashicons-admin-users"></span> Chat on Messenger</a></p>' );

function SQLi($dbsrc) {
     require_once('info.config');
     $con = mysqli_connect( HOST, DB.USN, PSW, DB.$dbsrc );
     if( !$con ) {
          die('Connection failed: '.mysqli_connect_error());
          exit;
     } else return $con;
}

function active_order($status) {
     // 0 - pending
     // 4 - cancel
     return ( $status > 0 && $status < 4 );
}

function init_status() {
     $arr = array();
     $con = SQLi(DBPRF);
     $rs	= mysqli_query( $con, "SELECT id,status FROM admin WHERE id>990 ORDER BY id DESC" ) or die( mysqli_error($con) );
     while( $r=mysqli_fetch_array($rs) ) {
          $arr[] = $r['status'];
     }
     return $arr;
}

function init_settings() {
     $arr = array();
     $con = SQLi(DBPRF);
     $rs	= mysqli_query( $con, "SELECT * FROM settings ORDER BY id" ) or die( mysqli_error($con) );
     while( $r=mysqli_fetch_array($rs) ) {
          $arr[] = $r['dataset'];
     }
     return $arr;
}

function init_table($con,$tbl) {
     $r = mysqli_query( $con, "SHOW TABLES LIKE '$tbl'" ) or die(mysqli_error($con));
     return ( mysqli_num_rows($r) > 0 );
}

function init_menus($has_sub,$title,$url,$class='') {
     switch ($has_sub) {
          case 0:
               $x = '<li class="menu-item menu-item-type-post_type menu-item-object-page '.$class.'"><a href="'.$url.'">'.$title.'</a></li>';
               break;

          case 1:
               $x  = '<li class="menu-item menu-item-type-post_type menu-item-object-page page_item menu-item-has-children '.$class.'">';
               $x .= '<a href="'.$url.'" aria-current="page">'.$title.'<svg class="icon icon-angle-down" aria-hidden="true" role="img"> <use href="#icon-angle-down" xlink:href="#icon-angle-down"></use> </svg></a>';
               $x .= '<button class="dropdown-toggle" aria-expanded="false"><svg class="icon icon-angle-down" aria-hidden="true" role="img"> <use href="#icon-angle-down" xlink:href="#icon-angle-down"></use> </svg><span class="svg-fallback icon-angle-down"></span><span class="screen-reader-text">Expand child menu</span></button>';
               break;
     }
     return $x;
}

function load_item_list($list,$freebies=0) {
     $ttl = $freebies ? 'Freebies' : 'Available';

     if( !TESTNET_ON && $freebies ) {}
     else
          if( ISIN_ADMIN || ISIN_STOCKIST ) {
               return '<div id="item_list">
                    <h5>'.$ttl.'</h5>
                    <ul>'. $list .'</ul>
               </div>';
          }
}

function load_package_list($sel='') {
     global $post;

     $con = SQLi(DBPRF);
     $qry = "SELECT * FROM packages ORDER BY id";
     $rs  = mysqli_query($con,$qry) or die(mysqli_error($con));

     $ret  = '<option value="">Select Package</option>';

     if( mysqli_num_rows($rs)>0 ) {
          while( $r = mysqli_fetch_assoc( $rs ) ) {
               foreach ( $r as $k=>$v ) $$k = $v;
               $ret .= '<option value="'.$id.'" '. ( $sel==$id ? SELECTED :'' ) .'>'.$name.'</option>';
          }
     }

     return $ret;
}

function load_stockist_list($sel='',$add='',$options='', $lock=0) {
     global $post;
     $inc_test_warehouse = TESTNET_ON ? '1=1': "id>0 $add";
     $return_one = $lock ? "AND id=$sel" :'';

     $con = SQLi(DBPRF);
     $qry = "SELECT * FROM stockist WHERE $inc_test_warehouse $return_one ORDER BY warehouse";
     $rs  = mysqli_query($con,$qry) or die(mysqli_error($con));

     if( !$lock ) {
          switch ($options) {
               case 'from':
                    $add_option = '<option value="STOCK IN" '. ( $sel=='STOCK IN' ? SELECTED :'' ) .'>STOCK IN</option>';
                    break;

               case 'to':
                    $add_option = '<option value="STOCK OUT" '. ( $sel=='STOCK OUT' ? SELECTED :'' ) .'>STOCK OUT</option>';
                    break;

               case 'both':
                    $add_option = '<option value="STOCK IN" '. ( $sel=='STOCK IN' ? SELECTED :'' ) .'>STOCK IN</option><option value="STOCK OUT" '. ( $sel=='STOCK OUT' ? SELECTED :'' ) .'>STOCK OUT</option>';
                    break;

               default:
                    $add_option = '';
                    break;
          }
     }

     $ret  = !$lock ? '<option value="" '. ( $sel=='' ? SELECTED :'' ) .'>Select Warehouse</option>' :'';
     $ret .= ( ISIN_ADMIN && !preg_match( "/manage orders|manage packages/i", $post->post_title ) ) ? $add_option :'';

     if( mysqli_num_rows($rs)>0 ) {
          while( $r = mysqli_fetch_assoc( $rs ) ) {
               foreach ( $r as $k=>$v ) $$k = $v;
               if( ISIN_STOCKIST && $id == STOCKIST_ID ) {}
               else{
                    $ret .= '<option value="'.$id.'" '. ( $sel==$id ? SELECTED :'' ) .'>'.$warehouse.'</option>';
               }
          }
     }

     return $ret;
}

function countEm($dbsrc,$tbl,$wer='',$sum='*',$groupby='') {
     require plugin_dir_path( __DIR__ ) . 'templates/infoconfig.php';

     $do  = $sum !='*' ? 'SUM' : 'COUNT';
     $wer = ( $wer!='' ? "WHERE $wer" : '' );
     $qry = "SELECT $do($sum) n
          FROM $tbl
          $wer
          $groupby
     ";

     $rs	= mysqli_query($con, $qry) or die(mysqli_error($con));
     $r   = mysqli_fetch_array($rs);
     return $r['n'];
     mysqli_close($con);
}

function countDays($dat) {
     $rdate = $flushout = $ret = '';

     if( $dat != 'na') {
          $rdate    = date( mdY, strtotime($dat) );
          $flushout = strtotime( "+" . FLUSHOUT . " days", strtotime($dat) );

          $day = '86400'; //1 day = 86400 sec
          $d_1 = time();
          $d_2 = $flushout;
          $dif = round( ($d_2 - $d_1) / $day );// . ' days left';

          $ret = date( 'Y', strtotime($dat) ) < YEAR_1 ? '-' : $dif;
     }

     return array($rdate, date(mdY, $flushout), $ret);
}

function init_logs($act,$tbl,$affected,$editor) {
     // id,act,tbl,affect,who,stamp
     if( !TESTNET_ON ) {
          $arrAct = array('Add','Edit','Delete');
          $con = SQLi('logs');
          $stamp = date(TMDSET);
          $log   = "INSERT INTO logs".date('Y')." VALUES ('',$act,'$tbl',$affected,'$editor','$stamp')";
          mysqli_query($con,$log) or die(mysqli_error($con));
     }
}

function test_transfers($con,$id) {
     $rs = mysqli_query( $con, "CALL test_transfers($id)" ) or die(mysqli_error($con));
     $r  = mysqli_fetch_array($rs);
     return $r['ret'];
}

function allow_submit($last) {
     $d1 = strtotime($last);
     $d2 = strtotime('now');
     return abs($d1-$d2) > SUBMIT_INTERVAL;
}

function reloadTo($url,$delay=0) {
	echo '<META HTTP-EQUIV=Refresh CONTENT="'.$delay.';URL='.$url.'">';exit;
}
?>
