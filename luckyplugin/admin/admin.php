<?php
$orders   = get_page_by_title( 'Manage Orders', '', 'page' );
$survey   = get_page_by_title( 'Manage Survey', '', 'page' );
$products = get_page_by_title( 'Manage Products', '', 'page' );
$packages = get_page_by_title( 'Manage Packages', '', 'page' );
$customer = get_page_by_title( 'Manage Customers', '', 'page' );
$distri   = get_page_by_title( 'Manage Distributors', '', 'page' );
$stockist = get_page_by_title( 'Manage Stockist', '', 'page' );
$olreg    = get_page_by_title( 'Manage Registration', '', 'page' );
$payout   = get_page_by_title( 'Manage Payout', '', 'page' );
$manage   = get_page_by_title( 'Manage Admin', '', 'page' );
$website  = get_page_by_title( 'Manage Website', '', 'page' );
$stocks   = get_page_by_title( 'Manage Stocks', '', 'page' );
$transfers= get_page_by_title( 'Manage Transfers', '', 'page' );
$reorders = get_page_by_title( 'Manage Reorders', '', 'page' );
$settings = get_page_by_title( 'Settings', '', 'page' );

$ds=$ps=$os=$as=0;

$os = countEm(DBOPS, 'transactions' . date('Y'), 'status=0');
$wi = countEm(DBOPS, 'withdrawals' . date('Y'), 'released=0');
$su = countEm(DBOPS, 'survey' . date('Y'));

$ps = countEm(DBPRF, 'products', 'status=1');
$pk = countEm(DBPRF, 'packages', 'status=1');
$cs = countEm(DBPRF, 'customers', 'status=1');
$ds = countEm(DBPRF, 'distributors', 'dsstatus=1');
$st = countEm(DBPRF, 'stockist', 'status=1');
$fe = countEm(DBPRF, 'for_encoding', "dsencoded IS NULL");
$as = countEm(DBPRF, 'admin', 'id<990 AND status=1');
$ws = countEm(DBPRF, 'admin', 'id>990');
$ss = countEm(DBPRF, 'settings');

// $fl = countEm(DBOPS, 'transfers' . date('Y'), 'transfer_qty>receive_qty', 'DISTINCT transfer_id', 'GROUP BY transfer_id');
$tr = countEm(DBSTK, 'transfers', "receive_date IS NULL AND conso_date IS NULL");
$ro = countEm(DBSTK, 'reorders', 'status=0');
$ro = countEm(DBSTK, 'reorders', 'status=0');
$sk = countEm(DBSTK, 'stocks', 'qty>0', 'qty');

$flqry = "SELECT COUNT(DISTINCT transfer_id) fl
     FROM transfers t
     LEFT JOIN ". DB . DBOPS . ".transfers_float" . date('Y') . " f ON f.transfer_id=t.id
     WHERE receive_date IS NOT NULL
     AND float_qty>0
     GROUP BY f.transfer_id
     ";

$cn = SQLi(DBSTK);
$rs= mysqli_query($cn,$flqry) or die(mysqli_error($cn));
$r  = mysqli_fetch_array($rs);
$fl = $r['fl'];

$tt = $tr;

global $luckyuser;
$x  = '<h4 class="rt" id="admin_user" data-reload="'. ADMIN_RELOAD .'">'.$luckyuser['nn'].'</h4>';
$x .= '<hr><ul class="admin_main">';
     $x .= '<li' .($os>0 ? ' class="bad"' :''). '><a href="'.get_permalink( $orders->ID ).'"><h5>ORDER'.($os!=1?'S':'').'</h5><span class="smaller"><strong class="bad">'.$os.'</strong> Pending</span></a></li>';
     $x .= '<li' .($wi>0 ? ' class="bad"' :''). '><a href="'.get_permalink( $payout->ID ).'"><h5>PAYOUT'.($wi!=1?'S':'').'</h5><span class="smaller"><strong class="bad">'.$wi.'</strong> Pending</span></a></li>';
     $x .= '<li><a href="'.get_permalink( $survey->ID ).'"><h5>SURVEY'.($su!=1?'S':'').'</h5><span class="smaller"><strong class="bad">'.$su.'</strong> in '.date('Y').'</span></a></li>';
$x .= '</ul>'.DIV_CLEAR;
$x .= '<h5 class="rt">Orders</h5><hr>';

$x .= '<ul class="admin_main">';
     $x .= '<li><a href="'.get_permalink( $products->ID ).'"><h5>PRODUCT'.($ps!=1?'S':'').'</h5><span class="smaller"><strong class="bad">'.$ps.'</strong> Active</span></a></li>';
     $x .= '<li><a href="'.get_permalink( $packages->ID ).'"><h5>PACKAGE'.($pk!=1?'S':'').'</h5><span class="smaller"><strong class="bad">'.$pk.'</strong> Active</span></a></li>';
     $x .= '<li><a href="'.get_permalink( $stocks->ID ).'"><h5>STOCK'.($sk!=1?'S':'').'</h5><span class="smaller"><strong class="bad">'.$sk.'</strong> Available</span></a></li>';
     $x .= '<li><a href="'.get_permalink( $transfers->ID ).'"><h5>TRANSFER'.($tt!=1?'S':'').'</h5><span class="smaller"><strong class="bad">'.$tt.'</strong> Pending'.($fl>0 ? ' / <strong class="bad">'.$fl.'</strong> Float' :'').'</span></a></li>';
     $x .= '<li><a href="'.get_permalink( $reorders->ID ).'"><h5>REORDER'.($ro!=1?'S':'').'</h5><span class="smaller"><strong class="bad">'.$ro.'</strong> Pending</span></a></li>';
$x .= '</ul>'.DIV_CLEAR;
$x .= '<h5 class="rt">Products</h5><hr>';

$x .= '<ul class="admin_main">';
     $x .= '<li><a href="'.get_permalink( $customer->ID ).'"><h5>CUSTOMER'.($cs!=1?'S':'').'</h5><span class="smaller"><strong class="bad">'.$cs.'</strong> Active</span></a></li>';
     $x .= '<li><a href="'.get_permalink( $distri->ID ).'"><h5>DISTRIBUTOR'.($ds!=1?'S':'').'</h5><span class="smaller"><strong class="bad">'.$ds.'</strong> Active</span></a></li>';
     $x .= '<li><a href="'.get_permalink( $stockist->ID ).'"><h5>STOCKIST'.($st!=1?'S':'').'</h5><span class="smaller"><strong class="bad">'.$st.'</strong> Active</span></a></li>';
     $x .= '<li><a href="'.get_permalink( $olreg->ID ).'"><h5>REGISTRATION'.($fe!=1?'S':'').'</h5><span class="smaller"><strong class="bad">'.$fe.'</strong> Pending</span></a></li>';
$x .= '</ul>'.DIV_CLEAR;
$x .= '<h5 class="rt">Users</h5><hr>';

if( IS_GLOBAL ) {
     $x .= '<ul class="admin_main">';
          $x .= '<li><a href="'.get_permalink( $manage->ID ).'"><h5>ADMIN</h5><span class="smaller"><strong class="bad">'.$as.'</strong> Active</span></a></li>';
          $x .= '<li><a href="'.get_permalink( $website->ID ).'"><h5>WEBSITE</h5><span class="smaller"><strong class="bad">'.$ws.'</strong> Controls</span></a></li>';
          $x .= '<li><a href="'.get_permalink( $settings->ID ).'"><h5>SETTINGS</h5><span class="smaller"><strong class="bad">'.$ss.'</strong> &nbsp;</span></a></li>';
     $x .= '</ul>'.DIV_CLEAR;
     $x .= '<h5 class="rt">Settings</h5><hr>';
}

unset($_SESSION['post']);
echo $x . BACKTOTOP;
?>
