<?php global $post,$luckyuser,$arrOrders;
unset($_SESSION['item-data']);
unset($_SESSION['cart']);

$sel = '<div class="rt"><select class="byDate">';
for ( $i = date('Y'); $i >= YEAR_1; $i-- ) {
     $sel .= '<option value="/stockist/orders/?'.$i.'" '.($i==SEL_YEAR?SELECTED:'').'>'.$i.'</option>';
}
$sel .= '</select><hr></div>';
echo $sel;

$tbl  = 'transactions' . SEL_YEAR;
$con  = SQLi(DBOPS);
$test = 0;
$oldstat = -1;

if( init_table($con,$tbl) ) {
     $qry = "SELECT t.*,CONCAT(dsfnam,' ',dslnam) nam FROM $tbl t
          LEFT JOIN ".DB.DBPRF.".distributors d ON dsdid=referrer
          WHERE encoded_by='".STOCKIST_ID."'
          ORDER BY status,trans_id";
     $rs  = mysqli_query($con,$qry) or die(mysqli_error($con));
     $test = 1;
}

if( mysqli_num_rows($rs)>0 && $test ) {
     $x  = '<ul id="orders" class="listing">';

     while( $r = mysqli_fetch_assoc( $rs ) ) {
          foreach ( $r as $k=>$v ) $$k = utf8_encode($v);

          if( $oldstat < $status ) {
               if($status) $x .= '<li><br></li>';
               $x .= '<li><strong>'.strtoupper($arrOrders[$status]).'</strong></li>';

               $x .= '<li>';
                    $x .= '<strong class="w2">DR#</strong> ';
                    $x .= '<strong class="w5">Distributor</strong> ';
                    $x .= '<strong class="w3">Date Ordered</strong> ';
                    $x .= '<strong class="w3 rt">Total Due</strong> ';
               $x .= '</li>';
          }

          $x .= '<li>';
          $x .= '<a href="'.get_permalink( $shop->ID ).'?'.$trans_id.'" class="w2">'.$trans_id.'</a> ';
          $x .= '<span class="w5">'.$nam.'</span> ';
          $x .= '<span class="w3">'.date(mdY,strtotime($submitted)).'</span> ';
          $x .= '<span class="w3 rt">'.number_format($pay_amount+$pay_fee,2).'</span> ';
          $x .= '</li>';

          $oldstat = $status;
     }

     $x .= '</ul>';
     mysqli_close($con);
} else $x = '<h5>Oops! No orders in '.SEL_YEAR.'!</h5>';

$x .= '<hr><div id="bottom_nav"><a href="?add" class="btn">ADD NEW</a></div>';

echo $x . BACKTOTOP;
?>
