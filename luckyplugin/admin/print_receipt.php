<?php global $pay;
$con = SQLi(DBOPS);
$trans_id = $_SESSION['print']['id'];
$valid_id = 1;
$prt = '';

$tbl = 'transactions' . SEL_YEAR;
$qry = "SELECT *,CONCAT(d.dsfnam,' ',d.dslnam) snam
     FROM $tbl t
     LEFT JOIN ".DB.DBPRF.".distributors d ON d.dsdid=t.referrer
     WHERE trans_id='$trans_id'";

$rs  = mysqli_query($con,$qry);
if( mysqli_num_rows($rs)>0 ) {
     $rw = mysqli_fetch_assoc( $rs );
     foreach( $rw as $k=>$v ) $$k=stripslashes($v);
} else {
     $valid_id = 0;
     echo '<h5>Oops! Invalid Order ID!</h5>';
}

if( $valid_id ) {
     // $prt .= '<h3>DR # '.$trans_id.'</h3>';
     $prt .= '<ul id="print_receipt">';
     $prt .= '<li><span class="smaller">Receiver:</span> '.$del_receiver.'</li>';
     $prt .= '<li><span class="smaller">Contact#:</span> '.$del_contact.'</li>';
     $prt .= '<li><span class="smaller">Address :</span> '.$del_address.'</li>';
     $prt .= '<li><span class="smaller">Referrer:</span> '.$snam.'</li>';

     $prt .= '<li><br><br><ul>';

     $prt .= '<li>';
     $prt .= '<strong class="w0 smaller ct">Qty</strong>';
     $prt .= '<strong class="w3 smaller">Item</strong>';
     $prt .= '<strong class="w1 smaller rt">Unit Price</strong>';
     $prt .= '<strong class="w1 smaller rt">Total</strong>';
     $prt .= '</li>';

     $tbl  = 'sales' . SEL_YEAR;
     $qry  = "SELECT s.*,k.name kname,p.name pname,p.short FROM $tbl s
          LEFT JOIN ".DB.DBPRF.".products p ON p.id=s.item
          LEFT JOIN ".DB.DBPRF.".packages k ON k.id=s.item
          WHERE trans_id=$trans_id";
     $rs   = mysqli_query($con,$qry);

     $sub_total = 0;
     $total_discount = 0;
     $vatable = ( ($pay_amount - $pay_fee) / 1.12);
     $vat     = ($pay_amount - $pay_fee) - $vatable;

     while( $r = mysqli_fetch_assoc( $rs ) ) {
          foreach ( $r as $k=>$v ) $$k = utf8_encode($v);

          // $sub  = ($discount_code!='' ? $price - $discount : $price);
          $total_discount += $qty * $discount;
          $item_total = $qty * $price;
          $sub_total += $item_total;
          $disc_amt = ( $discount / $price ) * 100;

          $prt .= '<li class="">';
          $prt .= '<span class="w0 ct">'.$qty.'</span>';
          $prt .= '<span class="w3">'.substr( ($kname!='' ? $kname : ($pname!='' ? $pname : 'UNKNOWN ITEM')) ,0,24).'</span>';
          $prt .= '<span class="w1 rt">'.number_format($price,2).'</span>';
          $prt .= '<span class="w1 rt">'.number_format($item_total,2).'</span>';
          $prt .= '</li>';
     }

     $prt .= '<li><br>';
     $prt .= '<span class="w0"></span>';
     $prt .= '<span class="w3 smaller">Sub Total:</span>';
     $prt .= '<span class="w1"></span>';
     $prt .= '<span class="w1 rt">'.number_format($sub_total,2).'</span>';
     $prt .= '</li>';

     if( $discount_code!='' && $discount_code!='isdistri' ) {
          $prt .= '<li>';
          $prt .= '<span class="w0"></span>';
          $prt .= '<span class="w3 smaller">Discount applied:</span>';
          $prt .= '<span class="w1 rt smaller"><em>'.$disc_amt.'%</em></span>';
          $prt .= '<span class="w1 rt">'.number_format( $total_discount ,2).'</span>';
          $prt .= '</li>';
     }

     $prt .= '<li><br>';
     $prt .= '<span class="w0"></span>';
     $prt .= '<span class="w3 smaller">Net Total:</span>';
     $prt .= '<span class="w1"></span>';
     $prt .= '<span class="w1 smaller rt bb"><em>'.number_format( $sub_total-$total_discount ,2).'</em></span>';
     $prt .= '</li>';

     $prt .= '<li><br>';
     $prt .= '<span class="w0"></span>';
     $prt .= '<span class="w3 smaller">VATable sales:</span>';
     $prt .= '<span class="w1 smaller rt"><em>'.number_format( $vatable ,2).'</em></span>';
     $prt .= '<span class="w1"></span>';
     $prt .= '</li>';

     $prt .= '<li>';
     $prt .= '<span class="w0"></span>';
     $prt .= '<span class="w3 smaller">VAT:</span>';
     $prt .= '<span class="w1 smaller rt bb"><em>'.number_format( $vat ,2).'</em></span>';
     $prt .= '<span class="w1"></span>';
     $prt .= '</li>';

     $prt .= '<li><br>';
     $prt .= '<span class="w0"></span>';
     $prt .= '<span class="w3 smaller">Delivery Fee:</span>';
     $prt .= '<span class="w1"></span>';
     $prt .= '<span class="w1 rt">'.number_format($pay_fee,2).'</span>';
     $prt .= '</li>';

     $prt .= '<li><br>';
     $prt .= '<span class="w0"></span>';
     $prt .= '<span class="w3 smaller">Amount Due:</span>';
     $prt .= '<span class="w1"></span>';
     $prt .= '<strong class="w1 rt bb2">'.number_format( $pay_amount ,2).'</strong>';
     $prt .= '</li>';

     $prt .= '<li>';
     $prt .= '<span class="w0"></span>';
     $prt .= '<span class="w3 smaller">PAID via '.$pay[$pay_out].'</span>';
     $prt .= '<span class="w1"></span>';
     $prt .= '<strong class="w1"></strong>';
     $prt .= '</li>';

     $prt .= '<li><br><br>';
     $prt .= '<span class="w0">Date:</span> ';
     $prt .= '<span class="w3">'.( $encoded_on!='' ? date('m/d/Y',strtotime($encoded_on)) : 'NOT YET ENCODED').'</span>';
     $prt .= '<span class="w1 rt"><strong>CDR #</strong></span>';
     $prt .= '<span class="w1 rt"><strong>'.$trans_id.'</strong></span>';
     $prt .= '</li>';

     $prt .= '</ul></li><br>';
}

$prt .= '</ul>';

$_SESSION['print_data'] = $prt;
echo $prt;

?>
