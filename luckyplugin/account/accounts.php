<?php if( !ISIN_DISTRI ) exit;
$total_bal= $mtd_sales= $mtd_bonus= $total_ptd= $total_wdraw= $total_used= $pend_wdraw= $pend_used= $avail_bal= 0;
$year = date('Y');

$ds = 0;
$cs = calc_customers();
$os = calc_orders($year);
list($mtd_sales,$mtd_bonus) = calc_mtd($year);

while( $year >= YEAR_1 ) {
     $total_bal   += calc_bonus($year);

     list( $wd, $wp, $ud, $up, $ad, $ap ) = calc_withdraw($year);
     $total_wdraw += $wd + $ad;
     $pend_wdraw  += $wp;
     $total_used  += $ud;
     $pend_used   += $up;

     $year--;
}

$avail_bal = ($total_bal - $total_wdraw - $pend_wdraw - $total_used - $pend_used);
$_SESSION['mybonus'] = $avail_bal;

$qry = "SELECT dsencoded,withheld,CONCAT(dslnam,', ',dsfnam,' ',dsmnam) nam,slots,req,
          (SELECT COUNT(CASE WHEN (dsdid<>'".DISTRI_ID."') THEN slot END)
               FROM ".DB.DBOPS.".sharencare WHERE dssid='".DISTRI_ID."' AND slot=e.slot) snc
     FROM distributors,
          (SELECT slot,COUNT(CASE WHEN (package=".sncID.") THEN 1 END) slots,COUNT(CASE WHEN (package=".sncReq.") THEN 1 END)  req
               FROM ".DB.DBOPS.".enroll WHERE dsdid='".DISTRI_ID."') e
     WHERE dsdid='".DISTRI_ID."'";

$con = SQLi(DBPRF);
$rs  = mysqli_query( $con, $qry ) or die( mysqli_error($con) );
$r   = mysqli_fetch_assoc( $rs );

foreach ($r as $k=>$v) $$k = $v;
$member_since = ( substr($dsencoded,0,2) .'.'. substr($dsencoded,2,2) .'.'. substr($dsencoded,-4) );

$x  = '<ul id="distributor" class="form-data">';
$x .= '<li><h3>'.utf8_encode($nam).'</h3><h6>'.DISTRI_ID.'</h6><span class="smaller">member since '.$member_since.'</span></li>';

if( $dssid!=0 ) {
     $x .= '<li><hr></li>';
     $x .= '<li><h5>'.$dssid.' '.ucwords(strtolower($snam)).'</h5><h6 class="smaller">Referred by</h6></li>';
}

$x .= '<li><hr></li>';
$x .= '<li><h3>'.(DISCOUNT_CODE!='' ? DISCOUNT_CODE :'NOT SET').'</h3><h6 class="smaller">Discount Code</h6></li>';

if( $slots ) {
     $_SESSION['snc'] = 1;
     $x .= '<li><hr></li>';
     $x .= '<li><a href="/snc">';
          $x .= '<span title="Slots"><span class="dashicons dashicons-money"></span> '.$slots.'</span>';
          $x .= ' <span class="w0"></span> ';
          $x .= '<span title="Sponsored"><span class="dashicons dashicons-admin-users"></span> '.$snc.'</span>';
          $x .= ' <span class="w0"></span> ';
          $x .= '<span title="Requirements"><span class="dashicons dashicons-cart"></span> '.$req.'</span>';
     $x .= '<h6 class="smaller">Share & Care</h6></a></li>';
} else {
     $x .= '<li><hr></li>';
     $x .= '<li><a href="/snc" class="btn">Share & Care</a></li>';
}

$x .= '<li><hr></li>';
$x .= '</ul>';

//-----------------------------

$orders   = get_page_by_title( 'Orders', '', 'page' );
$customer = get_page_by_title( 'Customers', '', 'page' );
$distri   = get_page_by_title( 'Genealogy', '', 'page' );
$payout    = get_page_by_title( 'Payout', '', 'page' );

$x.= '<ul class="account_main">';
     $x.= '<li><a href="'.get_permalink( $orders->ID ).'"><h3>'.$os.'</h3><h5>ORDER'.($os>1?'S':'').'</h5><span class="smaller">PENDING</span></a></li>';
     $x.= '<li><a href="'.get_permalink( $customer->ID ).'"><h3>'.$cs.'</h3><h5>CUSTOMER'.($cs>1?'S':'').'</h5><span class="smaller">ACTIVE</span></a></li>';
     $x.= '<li><a href="'.get_permalink( $distri->ID ).'"><h3>&nbsp;</h3><h5>GENEALOGY</h5><span class="smaller"></span></a></li>';
$x .= '</ul>';

if( $withheld ) {
     $x .= '<div class="clear"></div><hr>';
     $x .= '<h3 class="bad">Bonus ON HOLD! Contact Head Office!</3>';
} else {
     $avail_sub = ( $avail_bal>=MIN_WITHDRAW ? '<a href="'.get_permalink( $payout->ID ).'" id="payout" class="btn" title="Request Payout" data-min="'.MIN_WITHDRAW.'" data-bal="'.$avail_bal.'"><span class="dashicons dashicons-vault"></span><span> Withdraw</span></a>' :'' );

     $x.= '<div class="clear"></div><hr>';
     $x .= '<ul class="account_main">';
          $x.= '<li><h3>'.number_format($total_bal,2).'</h3><h5>TOTAL BONUS</h5><span class="smaller">Since you started</span></li>';
          $x.= '<li><h3>'.number_format($mtd_bonus,2).'</h3><h5>MTD BONUS</h5><span class="smaller">Month To Date</span></li>';
          $x.= '<li><h3>'.number_format($mtd_sales,2).'</h3><h5>MTD SALES</h5><span class="smaller">Month To Date</span></li>';
     $x .= '</ul>';

     $x.= '<div class="clear"></div>';
     $x .= '<ul class="account_main">';
          if( PAY_TYPE ) $x.= '<li><h3>'.number_format($avail_bal,2).'</h3>'.($avail_bal>=MIN_WITHDRAW ? $avail_sub : '<h5>AVAILABLE</h5><span class="smaller">for purchase</span>' ).'</li>';
          $x.= '<li><h3>'.number_format($total_wdraw,2).'</h3><h5>BONUS RELEASED</h5><span class="smaller">Since you started</span></li>';
          $x.= '<li><h3>'.number_format($total_used,2).'</h3><h5>BONUS USED</h5><span class="smaller">for purchases</span></li>';
          if( PAY_TYPE ) $x.= '<li><a href="'.get_permalink( $payout->ID ).'?show_history"><h3>'.number_format($pend_wdraw,2).'</h3><h5>PAYOUTS</h5><span class="smaller">pending</span></a></li>';
          if( !PAY_TYPE ) $x.= '<li title="Payout released every cutoff"><h3>&nbsp;</h3><h5>AUTO-PAYOUT</h5><span class="smaller">every cutoff</span></li>';

     $x .= '</ul>';
}
//-----------------------------
echo $x . BACKTOTOP;

function calc_mtd($yr) {
     $con = SQLi(DBOPS);
     $tn  = 'transactions' . $yr;
     $bn  = 'bonus' . $yr;

     if( init_table($con,$tbl) ) {
          $qry = "SELECT

              (SELECT SUM(pay_amount-pay_fee)
              FROM $tn
              WHERE referrer = ".DISTRI_ID.
             " AND MONTH(submitted) = ".date('n').
             " AND status > 0) mtd_sales,

              (SELECT SUM(bonus)
              FROM $bn b
              LEFT JOIN $tn t ON t.trans_id=b.trans_id
              WHERE b.dsdid = ".DISTRI_ID.
             " AND MONTH(t.submitted) = ".date('n').
             " AND t.status > 0) mtd_bonus";
          $rs  = mysqli_query( $con, $qry ) or die( mysqli_error($con) );

          $r   = mysqli_fetch_assoc( $rs );
          return array( (float)$r['mtd_sales'], (float)$r['mtd_bonus'] );
     } else {
          return array( 0, 0 );
     }
}

function calc_bonus($yr) {
     $con = SQLi(DBOPS);
     $tbl = 'bonus' . $yr;
     $bonus = 0;

     if( init_table($con,$tbl) ) {
          $qry = "SELECT SUM(bonus) r FROM $tbl WHERE dsdid=".DISTRI_ID;
          $rs  = mysqli_query( $con, $qry ) or die( mysqli_error($con) );
          $r   = mysqli_fetch_assoc( $rs );

          $bonus = (float)$r['r'];
     }

     return $bonus;
}

function calc_withdraw($yr) {
     $con = SQLi(DBOPS);
     $tbl = 'withdrawals' . $yr;

     if( init_table($con,$tbl) ) {
          $qry = "SELECT
                    (SELECT SUM(amount) FROM $tbl WHERE dsdid=".DISTRI_ID." AND purpose=0 AND released=1) wd,
                    (SELECT SUM(amount) FROM $tbl WHERE dsdid=".DISTRI_ID." AND purpose=0 AND released=0) wp,
                    (SELECT SUM(amount) FROM $tbl WHERE dsdid=".DISTRI_ID." AND purpose=1 AND released=1) ud,
                    (SELECT SUM(amount) FROM $tbl WHERE dsdid=".DISTRI_ID." AND purpose=1 AND released=0) up,
                    (SELECT SUM(amount) FROM $tbl WHERE dsdid=".DISTRI_ID." AND purpose=2 AND released=1) ad,
                    (SELECT SUM(amount) FROM $tbl WHERE dsdid=".DISTRI_ID." AND purpose=2 AND released=0) ap
               ";
          $rs  = mysqli_query( $con, $qry ) or die( mysqli_error($con) );
          $r   = mysqli_fetch_assoc( $rs );
          return array( (float)$r['wd'], (float)$r['wp'], (float)$r['ud'], (float)$r['up'], (float)$r['ad'], (float)$r['ap'] );
     } else {
          return array( 0, 0, 0, 0, 0, 0 );
     }
}

function calc_orders($yr) {
     $con = SQLi(DBOPS);
     $tbl = 'transactions' . $yr;
     $qry = "SELECT COUNT(trans_id) r FROM $tbl WHERE referrer=".DISTRI_ID." AND status=0";
     $rs  = mysqli_query( $con, $qry ) or die( mysqli_error($con) );
     $r   = mysqli_fetch_assoc( $rs );
     return (int)$r['r'];
}

function calc_customers() {
     $con = SQLi(DBPRF);
     $tbl = 'customers';
     $qry = "SELECT COUNT(id) r FROM $tbl WHERE referrer=".DISTRI_ID." AND status=1";
     $rs  = mysqli_query( $con, $qry ) or die( mysqli_error($con) );
     $r   = mysqli_fetch_assoc( $rs );
     return (int)$r['r'];
}
?>
