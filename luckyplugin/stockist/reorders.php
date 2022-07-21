<?php if( !preg_match( "/admin|stockist/i", $_SESSION['user_type'] ) ) exit;
if( !isset($_SESSION) ) session_start();

global $arrReorders,$arrLevel,$stockist_fee,$s_sfee;

$ret = get_page_by_title( $post->post_title, '', 'page' );
$mtr = get_page_by_title( (ISIN_ADMIN ? 'Manage ' : '') . 'Transfers', '', 'page' );
$fee = get_page_by_title( 'Fees', '', 'page' );

$edit = 0;

if( isset($_POST) && !empty($_POST) ) {
     defined('INCLUDE_CHECK') || define('INCLUDE_CHECK',1);
     require_once plugin_dir_path( __DIR__ ) . 'templates/setup.php';

     foreach ($_POST as $k=>$v) $$k = str_replace(',', '', $v);

     if( ISIN_ADMIN || STOCKIST_ID == $reorder_from ) {
          if( !$status ) {
               $con = SQLi(DBSTK);
               $qry = "UPDATE reorders SET approved='". date(TMDSET) ."',approved_by='". ( ISIN_ADMIN ? ADMIN_ID : STOCKIST_ID ) ."',status=1 WHERE id=$uri";
               $rs  = $con->query($qry);

               echo '<h5>Reorder '. sprintf("%'.0".PAD."d\n", $uri) .' approved</h5>';

               require_once plugin_dir_path( __DIR__ ) . 'stockist/update_stockistfee.php';
               // updateBonus($id,$warehouse,$upline,$pay_amount,$stockist_fee[$level]);

          } else echo '<h5>Loading transfers. Please wait.</h5>';

          $url = get_permalink( $mtr->ID ) .'?add';

     } else {

          if ($edit) {
               $_SESSION['cart'] = $_SESSION['edit_reorders'];
               echo '<h5>Editing Reorder # ' . sprintf("%'.0" . PAD . "d\n", $uri) . '</h5>';


          } elseif ($void) {
               $con = SQLi(DBSTK);
               $qry = "UPDATE reorders SET void_date='" . date(TMDSET) . "',void_by='" . STOCKIST_ID . "',status=3 WHERE id=$uri";
               $rs  = $con->query($qry);

               echo '<h5>Reorder ' . sprintf("%'.0" . PAD . "d\n", $uri) . ' voided</h5>';

          } else {
               $dis_id = isset($_SESSION['reorders']) ? $_SESSION['reorders']['id'] :'';
               $qry = "INSERT INTO reorders (id,pay_amount,s_fee,s_pct,warehouse,reorder_from,submitted,status) VALUES ($dis_id,$pay_amount,$s_fee,$s_pct,'". STOCKIST_ID ."','$reorder_from','". date(TMDSET) ."',$status) ON DUPLICATE KEY UPDATE pay_amount=$pay_amount,s_fee=$s_fee,submitted='" . date(TMDSET) . "'";
// echo '<br>' . $qry . '<br>';

               $con = SQLi(DBSTK);
               $con->query($qry) or die(mysqli_error($con));
               $last_id = mysqli_insert_id( $con );

               $con = SQLi(DBOPS);
               $tbl = 'transfers' . SEL_YEAR;
               foreach ($_SESSION['cart'] as $z) {
                    $item = $z['id'];
                    $qty  = $z['qty'];

                    if( $qty >0 ) {
                         if( $dis_id=='' ) {
                              $qry = "INSERT INTO $tbl (id,item,reorder_qty,reorder_id) VALUES ('',$item,$qty,$last_id)";
                         } else {
                              $last_id = $dis_id;
                              $qry = "UPDATE $tbl SET reorder_qty=$qty WHERE reorder_id=" . $dis_id . " AND item=$item";
                         }
// echo '<br>' . $qry . '<br>';
                         $con->query($qry) or die(mysqli_error($con));
                    }
               }

               $url = get_permalink( $ret->ID );
               echo '<h5>Reorder '. sprintf("%'.0".PAD."d\n", $last_id) .' submitted</h5>';
          }
     }
// echo $qry;

     if( !$edit ) {
          mysqli_close($con);
          unset($_POST);

          reloadTo($url);
          exit;
     }
}
$_SESSION['edit_reorders'] = array();
// echo "==$edit==<br>";

$x= $o_l= $i_l= '';
$pay_amount= $reorder_due= $pov= $under_stock= 0;
$stock = 99999;

$exists = ( ( $uri !='' && $uri !='add' ) || $edit );

if( $exists ) {
     $con = SQLi(DBSTK);
     $trn = 'transfers' . SEL_YEAR;
     $tbl = 'reorders';

     $qry = "SELECT t.id,t.item,t.reorder_qty,t.transfer_id,r.*,p.name,p.wsp,p.srp,p.pov,
               s.upline,s.level,s.warehouse stockist_name,ss.qty ss_qty,
               (SELECT warehouse FROM " . DB . DBPRF . ".stockist WHERE id=r.reorder_from) from_name
          FROM reorders r
          LEFT JOIN " . DB . DBOPS . ".$trn t ON t.reorder_id=r.id
          LEFT JOIN " . DB . DBPRF . ".products p ON p.id=t.item
          LEFT JOIN (SELECT id,upline,level,warehouse FROM " . DB . DBPRF . ".stockist) s ON s.id=r.warehouse
          LEFT JOIN (SELECT id,qty FROM " . DB . DBSTK . ".stocks) ss ON ss.id=CONCAT(r.reorder_from,t.item)
          WHERE r.id='$uri' ";

} else {
     $con  = SQLi(DBPRF);
     $tbl  = 'products';
     $qry = "SELECT p.id pid,p.*
          FROM $tbl p
          WHERE p.status=1
          ORDER BY p.sort_order,p.name";
     $status = 0;
}

$rs = $con->query($qry) or die(mysqli_error($con));

if( $rs->num_rows>0 ) {
     while( $r=$rs->fetch_assoc() ) {

          if( $exists ) {
               foreach ($r as $k=>$v) $$k=$v;

               $ss_class = $ss_qty > $reorder_qty ? 'good' : 'bad';
               $stock_qty = (!$status && $reorder_from==STOCKIST_ID ? ''. (int)$ss_qty .'' :'');

               $under_stock += ($reorder_qty >= $ss_qty);

               $o_l .= '<li class="' . $item. '">
                    <span class="">' . $item . '</span>
                    <span>' . $name . '</span>
                    <span class="rt">' . $reorder_qty . '</span>
                    <span class="' . $ss_class . ' rt w2">'. $stock_qty . '</span>
               </li>';

               $_SESSION['edit_reorders'][$item]['id']    = $item;
               $_SESSION['edit_reorders'][$item]['qty']   = $reorder_qty;
               $_SESSION['edit_reorders'][$item]['pov']   = $pov;
               $_SESSION['edit_reorders'][$item]['price'] = $wsp;
               $_SESSION['edit_reorders'][$item]['less']  = 0;
               $_SESSION['edit_reorders'][$item]['name']  = $name;
               $_SESSION['edit_reorders'][$item]['stock'] = $stock_qty;

               $_SESSION['reorders'][$item] = $reorder_qty;
               $_SESSION['reorders']['id'] = $id;
               $_SESSION['reorders']['wh'] = $warehouse;

          } else {
               $_SESSION['item-data'][$r['pid']]['name'] = $r['name'];
               $_SESSION['item-data'][$r['pid']]['stock'] = $stock;

               $chk  = array_key_exists($r['pid'],$_SESSION['cart']) ? CHECKED :'';

               $add_info = 'data-name="' . $r['name'] . '" data-price="' . $r['wsp'] . '" data-pov="' . $r['pov'] . '" data-stock="' . $stock . '" ' . $chk ;
          }

          $i_l .= '<li><label for="' . $r['pid'] . '" title="' . $r['name'] . '">';
          $i_l .= '<input type="checkbox" id="' . $r['pid'] . '" ' . $add_info . ' />';
          $i_l .= $r['pid'] . ' ' . $r['name'] . '</label></li>';
     }
}
// print_r($_SESSION['cart']);
if( !empty($_SESSION['cart']) ) {
     if( $edit ) $o_l = '';

     foreach ($_SESSION['cart'] as $k=>$v) {
          $amt = $v['qty'] * $v['price'];
          $pov += $v['qty'] * $v['pov'];
          if(!$edit) $pay_amount += $amt;

          $o_l .= '<li class="'.$v['id'].'">
               <span class="bb"><input type="number" class="item_code" placeholder="00000" max="99999" minlength=5 maxlength=5 value="'.$v['id'].'" /></span>
               <span>'.$v['name'].'</span>
               <span class="bb"><input type="number" class="rt item_qty" placeholder=0 min=0 max="'.$stock.'" maxlength=5 value="'.$v['qty'].'" data-price="'.$v['price'].'" data-pov="'.$v['pov'].'" /></span>
               <span>'.number_format( $amt, 2 ).'</span>
          </li>';
     }
}

$submitted = ( $submitted != '' ? $submitted : date(TMDSET));
$submit    = '<input type="submit" class="w2 btn" value="Submit" /> ';
$editbtn   = $exists && !$status && $warehouse == STOCKIST_ID ? '<input type="hidden" name="edit" value=1 /><input type="submit" class="w2 btn" value="Edit" /> ' : '';
$void      = $exists && !$status && $warehouse == STOCKIST_ID ? '<input type="hidden" name="void" value=1 /><input type="submit" class="w2 btn" value="Void" /> ' : '';
$aprub     = ( (ISIN_ADMIN || $reorder_from == STOCKIST_ID) && !$under_stock) ? '<input type="submit" class="btn" value="' . ($status ? 'Transfer' : 'Approve') . '" /> ' : ''; //&& !$status
$gotrans   = '<input type="button" href="' . get_permalink($mtr->ID) . '?' . $transfer_id . '" class="btn link" value="Go to Transfers" /> ';
$back      = !$_SESSION['fees_on'] ? '<input type="button" href="' . get_permalink($ret->ID) . '" class="w2 btn link" value="'. ( $uri=='add' || $edit ? 'Cancel' : 'Back').'" /> ' : '';
$baktofees = $_SESSION['fees_on'] ? '<input type="button" href="' . get_permalink($fee->ID) . '" class="w2 btn link" value="Back to Fees" /> ' : '';

$insufficient_stocks = (!$status && $reorder_from == STOCKIST_ID && $under_stock ? '<span class="bad smaller">Insufficient stocks</span>' : '');

unset($_SESSION['fees_on']);

$co  = '<hr><li><form method="post" class="cart"><h3>Transaction Details</h3><ul>';
$co .= '<input type="hidden" name="id" value="' . ($uri != '' ? sprintf("%'.0" . PAD . "d\n", $uri) : '') . '" />';
$co .= ISIN_ADMIN ? '<input type="hidden" name="warehouse" value="' . $warehouse . '" />' : '';
$co .= ISIN_ADMIN ? '<input type="hidden" name="upline" value="' . $upline . '" />' : '';
$co .= ISIN_ADMIN ? '<input type="hidden" name="level" value="' . $level . '" />' : '';

$select_reorder_from = ( $exists ?
          '<strong class="w4"> ' . $from_name . '</strong><input type="hidden" name="reorder_from" class="reorder_from" value="' . $reorder_from . '" />' :
          '<select name="reorder_from" class="reorder_from w4" required>' . load_stockist_list(($reorder_from=='' ? 1: $reorder_from), '', 'from') . '</select>'
     );

$co .= '<li><label>Stocks From:</label> '. $select_reorder_from;
$co .= '    <label>To:</label> <strong class="w4">'. $stockist_name .'</strong>';
$co .= '</li>';

$co .= '<li><label>Order Date:</label> <input type="text" class="'.($exists ? '' : 'datepicker').' w4" value="'.date( DATFUL, strtotime($submitted) ).'" '.($exists ? READ_ONLY : 'datepicker').' /><input type="hidden" name="submitted" value="'.$submitted.'" />';
$co .= '    <label>Total Amount:</label> <input type="text" name="pay_amount" class="w4 rt" placeholder="0.00" value="'. number_format($pay_amount,2) .'" '.READ_ONLY.' required />';
$co .= '</li>';

if( !$exists ) {
     $s_fee = ( $pay_amount >= $s_sfee ? ($pay_amount * $stockist_fee[STOCKIST_LVL] / 100 ) : 0 );
}
$reorder_due = $pay_amount - $s_fee;

$co .= '<li><span class="w4">Min to get fee: </span> <label class="w2 min_fee" data-minfee="'.$s_sfee.'">P '. number_format($s_sfee,2) .'</label>';
$co .= '    <label class="rt">Fee ( '. ( ISIN_ADMIN ? $s_pct : $stockist_fee[STOCKIST_LVL] ) .'% ):</label> <input type="text" name="s_fee" class="w4 rt" value="'.number_format($s_fee,2).'" '.READ_ONLY.' /> <input type="hidden" name="s_pct" value="'.( ISIN_ADMIN ? $s_pct : $stockist_fee[STOCKIST_LVL] ).'" />';
$co .= '</li>';

$co .= '<li '. ($status==3 ? 'class="void"' :'') .'><label class="w4">Status:</label> <span class="w4">'.strtoupper($arrReorders[$status]).'</span> <input type="hidden" value='.$status.' name="status" />';
$co .= '    <label>Amount Due:</label> <input type="text" class="w4 rt" id="reorder_due" value="'. number_format($reorder_due,2) .'" '.READ_ONLY.' />';
$co .= '</li>';
// echo "$exists ? $edit";
$co .= '</ul><hr><div>'. ( $exists ? ($edit ? $submit : ( $transfer_id!='' ? $gotrans :$aprub )) : $submit) . ( !$edit ? $editbtn :'' ) . $back . ( $exists && !$edit ? $void : '' ) . $insufficient_stocks . $baktofees .'<span class="smaller"></span></div>';
$co .= '</form></li>';

$empty_row = $exists ? '' : '<li>
     <span class="bb"><input type="text" class="item_code" placeholder="00000" max="99999" minlength=5 /></span>
     <span></span>
     <span class="bb"><input type="text" class="rt item_qty" placeholder=0 min=0 /></span>
     <span>0.00</span>
</li>';

$stock_qty_hdr = ( !$status && $reorder_from == STOCKIST_ID ? 'Stock' : '');

echo '<div id="stockist_orders" class="reorders">
          <h3>Orders</h3>
          <ul>
               <li><ul id="order_list" class="listing">
                    <li class="ex">
                         <span>Code</span>
                         <span>Item</span>
                         <span class="rt">Qty</span>
                         <span class="rt w2">'. $stock_qty_hdr . '</span>
                    </li>
                    '.$o_l.'
                    '.$empty_row.'
               </ul></li>
               <li><br>
                    <ul>'. $co .'</ul>
               </li>
          </ul>
     </div>' . ( !$exists || $edit ? (load_item_list($i_l,0)) :'') . BACKTOTOP;
?>
