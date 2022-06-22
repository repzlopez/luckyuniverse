<?php if( !ISIN_STOCKIST ) exit;
if( !isset($_SESSION) ) session_start();

$ret = get_page_by_title( $post->post_title, '', 'page' );

if( isset($_POST) && !empty($_POST) ) {

     defined('INCLUDE_CHECK') || define('INCLUDE_CHECK',1);
     require_once plugin_dir_path( __DIR__ ) . 'templates/setup.php';

     if( isset($_POST['freebies']) ) {
          foreach ($r as $k=>$v) $$k=$v;
          $use_discount = 'freebies';
          $last_id = $_POST['trans_id'];

          require_once plugin_dir_path( __DIR__ ) . 'products/update_sales.php';

          echo '<h5>Freebies added to Order # '. sprintf("%'.0".PAD."d\n", $last_id) .'</h5>';

     } else {

          // $_POST['pay_fee']    = 0;
          $_POST['encoded_by'] = STOCKIST_ID;
          $_POST['encoded_on'] = date(TMDSET);

          $_SESSION['return_msg'] = null;

          $con = SQLi(DBOPS);
          if( !isset($_SESSION['return_msg']['msg']) ) {
               $int = "/pay_amount|pov|status/i";
               list($kdata,$idata,$udata) = set_kiu($con,$_POST,$int);

               $_SESSION['return_msg']['msg'] = 'Update success';
               $_SESSION['return_msg']['class'] = 1;
          }

          if( $_SESSION['return_msg']['class'] ) {
               $tbl      = 'transactions' . SEL_YEAR;
// echo "<br><br>$tbl<br>$kdata<br>$idata<br>$udata<br><br>";
               $last_id  = insert_duplicate( $con, $tbl, $kdata, $idata, $udata );
               $last_id  = $trans_id!=''?$trans_id:$last_id;
          }

          if( isset( $_SESSION['cart'] ) && !empty($_SESSION['cart']) && ( $order_id=='' || isset($edit_on) ) ) {
               $use_discount = 'isdistri';

               require_once plugin_dir_path( __DIR__ ) . 'products/update_sales.php';

               $stock_array = array();
               foreach ($_SESSION['cart'] as $k => $v) {
                    $stock_array[$k] = (int)$v['qty'];
               }

               update_stocks( $stock_array, STOCKIST_ID, '-' );

               if( ISIN_STOCKIST ) {
                    require_once plugin_dir_path( __DIR__ ) . 'admin/update_bonus.php';
               }
          }

          echo '<h5>Order '. sprintf("%'.0".PAD."d\n", $last_id) .' Submitted</h5>';

     }

     unset($_SESSION['item-data']);
     unset($_SESSION['cart']);
     unset($_POST);

     reloadTo( get_permalink($ret->ID) );
     exit;
}

global $arrOrders,$pay;
$x= $o_l= $i_l= '';
$pay_amount= $pov= 0;

$exists = ( $uri != '' && $uri != 'add' );

if( $exists ) {
     $con  = SQLi(DBOPS);
     $sale = 'sales' . SEL_YEAR;
     $tran = 'transactions' . SEL_YEAR;

     $qry = "SELECT t.*,s.*,p.name
     FROM $tran t
     LEFT JOIN $sale s ON s.trans_id='$uri'
     LEFT JOIN ".DB.DBPRF.".products p ON p.id=item
     WHERE t.trans_id='$uri'
     AND encoded_by='".STOCKIST_ID."'";

     $rs = mysqli_query($con,$qry) or die(mysqli_error($con));

     if( mysqli_num_rows($rs)>0 ) {
          while( $r=mysqli_fetch_assoc($rs) ) {
               foreach ($r as $k=>$v) $$k=$v;

               $o_l .= '<li class="'.$item.'">
                    <span class="bb">'.$item.'</span>
                    <span>'.$name.( $discount_code=='freebies' ? ' <span class="bad">FREE</span>' :'' ).'</span>
                    <span class="bb rt">'.$qty.'</span>
                    <span>'.number_format( $price, 2 ).'</span>
               </li>';
          }
     }
}

$con = SQLi(DBSTK);
$tbl = 'stocks';
$qry = "SELECT s.*,p.id pid,p.name,p.wsp,p.pov,p.sort_order
     FROM ".DB.DBSTK.".$tbl s
     LEFT JOIN ".DB.DBPRF.".products p ON p.id=s.item
     WHERE s.warehouse=".STOCKIST_ID."
     ORDER BY p.sort_order,p.name";

$rs = mysqli_query($con,$qry) or die(mysqli_error($con));

while( $r=mysqli_fetch_assoc($rs) ) {
     $_SESSION['item-data'][$r['pid']]['name'] = $r['name'];
     $_SESSION['item-data'][$r['pid']]['stock'] = $r['qty'];

     $dprc = $exists ? 0 : $r['wsp'];
     $dpov = $exists ? 0 : $r['pov'];

     $chk  = array_key_exists($r['pid'],$_SESSION['cart']) ? CHECKED :'';
     $i_l .= '<li><label for="'.$r['pid'].'" title="'.$r['name'].'"><input type="checkbox" id="'.$r['pid'].'" data-name="'.$r['name'].'" data-price="'.$dprc.'" data-pov="'.$dpov.'" data-stock="'.$r['qty'].'" '.$chk.' />'.$r['pid'].' '.$r['name'].' [ '.$r['qty'].' ]'.'</label></li>';
}

if( !empty($_SESSION['cart']) ) {
     foreach ($_SESSION['cart'] as $k=>$v) {
          $stock = $_SESSION['item-data'][$k]['stock'];
          $amt = $v['qty']*$v['price'];
          $pov += $v['qty']*$v['pov'];
          $pay_amount += $amt;

          $o_l .= '<li class="'.$v['id'].'">
               <span class="bb"><input type="number" class="item_code" placeholder="00000" max="99999" minlength=5 maxlength=5 value="'.$v['id'].'" /></span>
               <span>'.$v['name'].'</span>
               <span class="bb"><input type="number" class="rt item_qty" placeholder=0 min=0 max="'.$stock.'" title="'.$stock.' availabe" maxlength=5 value="'.$v['qty'].'" data-price="'.$v['price'].'" data-pov="'.$v['pov'].'" /></span>
               <span>'.number_format( $amt, 2 ).'</span>
          </li>';
     }
}

$ol_total = '<li>
          <span></span>
          <span class="rt">TOTAL</span>
          <span></span>
          <span id="total_amt" data-pov="'.$pov.'" class="rt">'.number_format( $pay_amount, 2 ).'</span>
     </li>';

$submitted = ( $submitted!='' ? $submitted : date(TMDSET) );
$submit = $status < VOID ? '<input type="submit" class="w2 btn" value="Submit" /> ' :'';
$back = '<input type="button" href="'.get_permalink( $ret->ID ).'" class="btn link" value="Back" /> ';

$co .= '<li><hr><h3>SOLD TO</h3><ul class="cart">';
$co .= '<li><label>Distributor:</label> <input type="text" name="referrer" class="w5" value="'.$referrer.'" '.($status > 0 && $status < VOID ? READ_ONLY :'').' required /> <span class="smaller"></span></li>';

$co .= '<li><label>Order Total:</label> <span class="w3 box pay_amt">'.number_format($pay_amount,2).'</span><span class="w1"></span><input type="hidden" name="pay_amount" class="pay_amt" value="'. $pay_amount .'" />';
     $co .= '<label class="rt">Total POV:</label> <input type="text" name="pov" class="w3" value="'.number_format($pov,2,'.','').'" />';
$co .= '</li>';

$sel_payout = '<select name="pay_out" class="w3">';
foreach( $pay as $k=>$v ) {
     if( $v!='' ) $sel_payout.='<option value='.$k.' '.($k==$pay_out?SELECTED:'').'>'.$v.'</option>';
}
$sel_payout.='</select>';

$co .= '<li><label class="w2 rt">Pay with:</label> '. $sel_payout .' <span class="w1"></span>';
     $co .= '<label class="rt">Date Sold:</label> <input type="text" class="'.($exists ? '' : 'datepicker').' w3" value="'.date( DATFUL, strtotime($submitted) ).'" '.($exists ? READ_ONLY : 'datepicker').' /><input type="hidden" name="submitted" value="'.$submitted.'" />';
$co .= '</li>';

$pd  = substr($pay_date,-4).'-'.substr($pay_date,0,2).'-'.substr($pay_date,2,2);

$co .= '<li>';
     $co .= '';

$co .= '<li><label class="w2 rt">NOTE:</label> <textarea class="w7">'.$pay_note.'</textarea></li>';
$co .= '</ul></li>';
//---------------------------

$co .= '<li>';
$co .= '<input type="hidden" name="trans_id" value="'.($trans_id!=''?sprintf("%'.0".PAD."d\n", $trans_id):'').'" />';
$co .= '<input type="hidden" name="status" value=3 />';
$co .= '<hr><div>'. $submit . $back .'<span class="smaller"></span></div>';
$co .= '</li>';

$empty_row = $exists ? '' : '<li>
     <span class="bb"><input type="text" class="item_code" placeholder="00000" max="99999" minlength=5 /></span>
     <span></span>
     <span class="bb"><input type="text" class="rt item_qty" placeholder=0 min=0 /></span>
     <span>0.00</span>
</li>';

$add_freebies = ( $exists ) ? '<div id="add_freebies" class="rt"><br><input type="hidden" name="trans_id" value="'.$uri.'" /><input type="submit" class="btn" name="freebies" value="Add Freebies" /></div>' :'';

echo '
     <div id="stockist_orders" class="orders">
          <h3>Orders</h3>
          <ul>
               <li><form method="post">
                    <ul id="order_list" class="listing">
                         <li class="ex">
                              <span>Code</span>
                              <span>Item</span>
                              <span class="rt">Qty</span>
                              <span class="rt">Amt</span>
                         </li>
                         '.$o_l.'
                         '.$empty_row.'
                         '.$ol_total.'
                    </ul>
                    '.$add_freebies.'
                    </form>
               </li>
               <li><br>
                    <form method="post">
                         <ul>'. $co .'</ul>
                    </form>
               </li>
          </ul>
     </div>' . load_item_list($i_l,$exists) . BACKTOTOP;
?>
