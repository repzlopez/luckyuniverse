<?php if( !ISIN_STOCKIST ) exit;

unset($_SESSION['cart']);
foreach($luckyuser as $k=>$v){ $$k=$v;}

$x  .= '';
$tns = 'transactions' . SEL_YEAR;
$qry = "SELECT s.id,
          (SELECT receive_date FROM ".DB.DBSTK.".transfers WHERE transfer_to=s.id ORDER BY receive_date DESC LIMIT 1) last_transfer,
          (SELECT encoded_on FROM ".DB.DBOPS.".$tns WHERE encoded_by=s.id ORDER BY encoded_on DESC LIMIT 1) last_sale
     FROM stockist s WHERE id='".STOCKIST_ID."'";

$con = SQLi(DBPRF);
$rs	= mysqli_query($con,$qry) or die(mysqli_error($con));
$r   = mysqli_fetch_array($rs);
$dat = $r['last_transfer'] > $r['last_sale'] ? $r['last_transfer'] : $r['last_sale'];
$act = $r['last_transfer'] > $r['last_sale'] ? 'Transfer' : 'Sale';
list($rdate,$flushout,$rdiff) = countDays($dat);

//-----------------------------
$orders   = get_page_by_title( 'Stockist Orders', '', 'page' );
$distri   = get_page_by_title( 'Stockist Distributors', '', 'page' );
$profile  = get_page_by_title( 'Stockist Profile', '', 'page' );
$fees     = get_page_by_title( 'Fees', '', 'page' );
$stocks   = get_page_by_title( 'Stocks', '', 'page' );
$transfer = get_page_by_title( 'Transfers', '', 'page' );
$reorder  = get_page_by_title( 'Reorder', '', 'page' );

$ds= $ts= $ro= $st= $fl= 0;

$flqry = "SELECT COUNT(DISTINCT transfer_id) fl
     FROM transfers t
     LEFT JOIN ". DB . DBOPS . ".transfers_float" . date('Y') . " f ON f.transfer_id=t.id
     WHERE (transfer_from='".STOCKIST_ID."' OR transfer_to='".STOCKIST_ID."')
     AND receive_date IS NOT NULL
     AND float_qty>0
     GROUP BY f.transfer_id
     ";

$cn = SQLi(DBSTK);
$rs= mysqli_query($cn,$flqry) or die(mysqli_error($cn));
$r  = mysqli_fetch_array($rs);
$fl = $r['fl'];

// $os = countEm(DBOPS, 'transactions' . date('Y'), "encoded_by='".STOCKIST_ID."' AND status=0");
$ds = countEm(DBPRF, 'distributors', "dsencodedby='".STOCKIST_ID."' AND dsstatus=1");
$ts = countEm(DBSTK, 'transfers', "(transfer_from='".STOCKIST_ID."' OR transfer_to='".STOCKIST_ID."') AND receive_by IS NULL AND conso_by IS NULL");
$ro = countEm(DBSTK, 'reorders', "(warehouse='".STOCKIST_ID."' OR reorder_from='".STOCKIST_ID."') AND status=0");
$st = countEm(DBSTK, 'stocks', "warehouse='".STOCKIST_ID."' AND qty>0", 'qty');

$tt = $ts;

$x .= '<ul class="admin_main">';
$x .= '<li class="'. ($os>0 ? 'bad' :'') .'"><a href="'.get_permalink( $orders->ID ).'"><h5>SALES</h5><span class="smaller"><strong class="bad">'.$os.'</strong> Encoding</span></a></li>';
$x .= '<li><a href="'.get_permalink( $distri->ID ).'"><h5>DISTRIBUTOR'.($ds!=1?'S':'').'</h5><span class="smaller"><strong class="bad">'.$ds.'</strong> Add</span></a></li>';
$x .= '</ul>'.DIV_CLEAR;
$x .= '<h5 class="rt">Main</h5><hr>';

$x .= '<ul class="admin_main">';
     $x .= '<li><a href="'.get_permalink( $stocks->ID ).'"><h5>STOCK'.($st!=1?'S':'').'</h5><span class="smaller"><strong class="bad">'.$st.'</strong> Available</span></a></li>';
     $x .= '<li><a href="'.get_permalink( $transfer->ID ).'"><h5>TRANSFER'.($tt!=1?'S':'').'</h5><span class="smaller"><strong class="bad">'.$tt.'</strong> Pending'.($fl>0 ? ' / <strong class="bad">'.$fl.'</strong> Float' :'').'</span></a></li>';
     $x .= '<li><a href="'.get_permalink( $reorder->ID ).'"><h5>REORDER'.($ro!=1?'S':'').'</h5><span class="smaller"><strong class="bad">'.$ro.'</strong> Pending</span></a></li>';
$x .= '</ul>'.DIV_CLEAR;
$x .= '<h5 class="rt">Logistics</h5><hr>';

$x .= '<ul class="admin_main">';
$x .= '<li><a href="'.get_permalink( $profile->ID ).'"><h5>BRANCH PROFILE</h5><span class="smaller"><strong class="bad"></strong>Stockist Info</span></a></li>';
$x .= '<li><a href="'.get_permalink( $fees->ID ).'"><h5>STOCKIST FEES</h5><span class="smaller"><strong class="bad"></strong>'.SEL_YEAR.'</span></a></li>';

$x .= '<li title="'.$rdiff.' days left" data-fo="'.$flushout.'"><a href="'.get_permalink( $fees->ID ).'"><h5>'.($rdiff=='-'?'NONE':$act.' '.$rdate).'</h5><span class="smaller"><strong class="bad"></strong>Last Activity</span></a></li>';
$x .= '</ul>'.DIV_CLEAR;
$x .= '<h5 class="rt">Setup</h5><hr>';

//-----------------------------
echo $x . BACKTOTOP;

?>
