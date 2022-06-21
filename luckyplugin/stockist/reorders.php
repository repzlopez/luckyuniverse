<?php if( !preg_match( "/admin|stockist/i", $_SESSION['user_type'] ) ) exit;
if( !isset($_SESSION) ) session_start();

global $arrReorders,$arrLevel,$stockist_fee,$s_sfee;

$ret = get_page_by_title( $post->post_title, '', 'page' );
$mtr = get_page_by_title( (ISIN_ADMIN ? 'Manage ' : '') . 'Transfers', '', 'page' );
$fee = get_page_by_title( 'Fees', '', 'page' );

if( isset($_POST) && !empty($_POST) ) {
     defined('INCLUDE_CHECK') || define('INCLUDE_CHECK',1);
     require_once plugin_dir_path( __DIR__ ) . 'templates/setup.php';
// print_r($_POST);
     foreach ($_POST as $k=>$v) $$k = str_replace(',', '', $v);

     if( ISIN_ADMIN || STOCKIST_ID == $reorder_from ) {
          if( !$status ) {
               $con = SQLi(DBSTK);
               $qry = "UPDATE reorders SET approved='". date(TMDSET) ."',approved_by='". ( ISIN_ADMIN ? ADMIN_ID : STOCKIST_ID ) ."',status=1 WHERE id=$uri";
               $rs  = mysqli_query($con,$qry);

               echo '<h5>Reorder '. sprintf("%'.0".PAD."d\n", $uri) .' approved</h5>';

               require_once plugin_dir_path( __DIR__ ) . 'stockist/update_stockistfee.php';
               // updateBonus($id,$warehouse,$upline,$pay_amount,$stockist_fee[$level]);

          } else echo '<h5>Loading transfers. Please wait.</h5>';

          $url = get_permalink( $mtr->ID ) .'?add';

     } else {
          $con = SQLi(DBSTK);
          $qry = "INSERT INTO reorders (id,pay_amount,s_fee,s_pct,warehouse,reorder_from,submitted,status) VALUES ('',$pay_amount,$s_fee,$s_pct,'". STOCKIST_ID ."','$reorder_from','". date(TMDSET) ."',$status)";

          mysqli_query($con,$qry) or die(mysqli_error($con));
          $last_id = mysqli_insert_id( $con );

          $con = SQLi(DBOPS);
          $tbl = 'transfers' . SEL_YEAR;
          foreach ($_SESSION['cart'] as $z) {
               $item = $z['id'];
               $qty  = $z['qty'];

               if( $qty >0 ) {
                    $qry = "INSERT INTO $tbl (id,item,reorder_qty,reorder_id) VALUES ('',$item,$qty,". $last_id .")";
                    mysqli_query($con,$qry) or die(mysqli_error($con));
               }
          }

          $url = get_permalink( $ret->ID );
          echo '<h5>Reorder '. sprintf("%'.0".PAD."d\n", $last_id) .' submitted</h5>';
     }
// echo $qry;

     mysqli_close($con);
     unset($_POST);

     reloadTo( $url );
     exit;
}

$x= $o_l= $i_l= '';
$pay_amount= $reorder_due= $pov= 0;
$stock = 99999;

$exists = ( $uri != '' && $uri != 'add' );

if( $exists ) {
     $con = SQLi(DBSTK);
     $trn = 'transfers' . SEL_YEAR;
     $tbl = 'reorders';

     $qry = "SELECT t.*,r.*,p.name,s.upline,s.level,s.warehouse stockist_name
          FROM reorders r
          LEFT JOIN ".DB.DBOPS.".$trn t ON t.reorder_id=r.id
          LEFT JOIN ".DB.DBPRF.".products p ON p.id=t.item
          LEFT JOIN ".DB.DBPRF.".stockist s ON s.id=r.warehouse
          WHERE r.id='$uri' ";

} else {
     $con  = SQLi(DBPRF);
     $tbl  = 'products';
     $qry  = "SELECT * FROM $tbl WHERE status=1 ORDER BY sort_order,name";
     $qry = "SELECT p.id pid,p.*
          FROM $tbl p
          WHERE p.status=1
          ORDER BY p.sort_order,p.name";
     $status = 0;
}

$rs  = mysqli_query($con,$qry) or die(mysqli_error($con));

if( mysqli_num_rows($rs)>0 ) {
     while( $r=mysqli_fetch_assoc($rs) ) {

          if( $exists ) {
               foreach ($r as $k=>$v) $$k=$v;

               $o_l .= '<li class="'.$item.'">
                    <span class="">'.$item.'</span>
                    <span>'.$name.'</span>
                    <span class="rt">'.$reorder_qty.'</span>
                    <span></span>
               </li>';

               $_SESSION['reorders'][$item] = $reorder_qty;
               $_SESSION['reorders']['id'] = $id;
               $_SESSION['reorders']['wh'] = $warehouse;

          } else {
               $_SESSION['item-data'][$r['pid']]['name'] = $r['name'];
               $_SESSION['item-data'][$r['pid']]['stock'] = $stock;

               $chk  = array_key_exists($r['pid'],$_SESSION['cart']) ? CHECKED :'';
               $i_l .= '<li><label for="'.$r['pid'].'" title="'.$r['name'].'"><input type="checkbox" id="'.$r['pid'].'" data-name="'.$r['name'].'" data-price="'.$r['wsp'].'" data-pov="'.$r['pov'].'" data-stock="'.$stock.'" '.$chk.' />'.$r['pid'].' '.$r['name'].'</label></li>';
          }

     }
}

if( !empty($_SESSION['cart']) ) {
     foreach ($_SESSION['cart'] as $k=>$v) {
          $amt = $v['qty']*$v['price'];
          $pov += $v['qty']*$v['pov'];
          $pay_amount += $amt;

          $o_l .= '<li class="'.$v['id'].'">
               <span class="bb"><input type="number" class="item_code" placeholder="00000" max="99999" minlength=5 maxlength=5 value="'.$v['id'].'" /></span>
               <span>'.$v['name'].'</span>
               <span class="bb"><input type="number" class="rt item_qty" placeholder=0 min=0 max="'.$stock.'" maxlength=5 value="'.$v['qty'].'" data-price="'.$v['price'].'" data-pov="'.$v['pov'].'" /></span>
               <span>'.number_format( $amt, 2 ).'</span>
          </li>';
     }
}

$submitted = ( $submitted!='' ? $submitted : date(TMDSET) );
$submit    = !$exists ? '<input type="submit" class="w2 btn" value="Submit" /> ' :'';
$aprub     = ( ISIN_ADMIN || STOCKIST_ID == $reorder_from )? '<input type="submit" class="btn" value="'.( $status ? 'Transfer' : 'Approve' ).'" /> ' :''; //&& !$status
$gotrans   = '<input type="button" href="'.get_permalink( $mtr->ID ).'?'.$transfer_id.'" class="btn link" value="Go to Transfers" /> ';
$back      = !$_SESSION['fees_on'] ? '<input type="button" href="'.get_permalink( $ret->ID ).'" class="btn link" value="Back" /> ' :'';
$baktofees = $_SESSION['fees_on'] ? '<input type="button" href="'.get_permalink( $fee->ID ).'" class="btn link" value="Back to Fees" /> ' :'';
unset($_SESSION['fees_on']);

$co  = '<hr><li><form method="post" class="cart"><h3>Transaction Details</h3><ul>';
$co .= '<input type="hidden" name="id" value="'.($uri!=''?sprintf("%'.0".PAD."d\n", $uri):'').'" />';
$co .= ISIN_ADMIN ? '<input type="hidden" name="warehouse" value="'.$warehouse.'" />' :'';
$co .= ISIN_ADMIN ? '<input type="hidden" name="upline" value="'.$upline.'" />' :'';
$co .= ISIN_ADMIN ? '<input type="hidden" name="level" value="'.$level.'" />' :'';


$co .= '<li><label>Reorder From:</label> '.( $exists ? '<span class="w4 rt">'. $stockist_name . '</span><input type="hidden" name="reorder_from" value="'.$reorder_from.'" />' : '<select name="reorder_from" class="w4">' . load_stockist_list($reorder_from, '', 'from') . '</select>');
$co .= '</li>';

$co .= '<li><label>Order Date:</label> <input type="text" class="'.($exists ? '' : 'datepicker').' w4" value="'.date( DATFUL, strtotime($submitted) ).'" '.($exists ? READONLY : 'datepicker').' /><input type="hidden" name="submitted" value="'.$submitted.'" />';
$co .= '    <label>Total Amount:</label> <input type="text" name="pay_amount" class="w4 rt" placeholder="0.00" value="'. number_format($pay_amount,2) .'" '.READONLY.' required />';
$co .= '</li>';

if( !$exists ) {
     $s_fee = ( $pay_amount >= $s_sfee ? ($pay_amount * $stockist_fee[STOCKIST_LVL] / 100 ) : 0 );
}
$reorder_due = $pay_amount - $s_fee;

$co .= '<li><span class="w4">Min to get fee: </span> <label class="w2 min_fee" data-minfee="'.$s_sfee.'">P '. number_format($s_sfee,2) .'</label>';
$co .= '    <label class="rt">Fee ( '. ( ISIN_ADMIN ? $s_pct : $stockist_fee[STOCKIST_LVL] ) .'% ):</label> <input type="text" name="s_fee" class="w4 rt" value="'.number_format($s_fee,2).'" '.READONLY.' /> <input type="hidden" name="s_pct" value="'.( ISIN_ADMIN ? $s_pct : $stockist_fee[STOCKIST_LVL] ).'" />';
$co .= '</li>';

$co .= '<li><label class="w4">Status:</label> <span class="w4">'.strtoupper($arrReorders[$status]).'</span> <input type="hidden" value='.$status.' name="status" />';
$co .= '    <label>Amount Due:</label> <input type="text" class="w4 rt" id="reorder_due" value="'. number_format($reorder_due,2) .'" '.READONLY.' />';
$co .= '</li>';

$co .= '</ul><hr><div>'. ( $exists ? ( $transfer_id!='' ? $gotrans :$aprub ) : $submit ). $back . $baktofees .'<span class="smaller"></span></div>';
$co .= '</form></li>';

$empty_row = $exists ? '' : '<li>
     <span class="bb"><input type="text" class="item_code" placeholder="00000" max="99999" minlength=5 /></span>
     <span></span>
     <span class="bb"><input type="text" class="rt item_qty" placeholder=0 min=0 /></span>
     <span>0.00</span>
</li>';

echo '<div id="stockist_orders" class="reorders">
          <h3>Orders</h3>
          <ul>
               <li><ul id="order_list" class="listing">
                    <li class="ex">
                         <span>Code</span>
                         <span>Item</span>
                         <span class="rt">Qty</span>
                         <span></span>
                    </li>
                    '.$o_l.'
                    '.$empty_row.'
               </ul></li>
               <li><br>
                    <ul>'. $co .'</ul>
               </li>
          </ul>
     </div>' . ( !$exists ? (load_item_list($i_l,0)) :'') . BACKTOTOP;
?>
