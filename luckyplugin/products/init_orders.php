<?php global $post,$luckyuser,$arrOrders;
unset($_SESSION['distri_order']);
unset($_SESSION['reg_welcome']);
unset($_SESSION['print_data']);
unset($_SESSION['discount']);
unset($_SESSION['checkout']);
unset($_SESSION['edit_on']);
unset($_SESSION['cart']);

$sel = '<div class="rt"><select class="byDate">';
for ( $i = date('Y'); $i >= YEAR_1; $i-- ) {
     $sel .= '<option value="/'.( ISIN_ADMIN ? 'admin/manage-' : 'shop/' ).'orders/?'.$i.'" '.($i==SEL_YEAR?SELECTED:'').'>'.$i.'</option>';
}
$sel .= '</select><hr></div>';
echo $sel;

$add= $wer= '';
if( ISIN_ADMIN ) {
     $add = is_numeric($encoded_by) ? ",(SELECT CONCAT(dsfnam,' ',dslnam) FROM ".DB.DBPRF.".distributors WHERE dsdid=referrer) from_stk" : '';

     $wer = isset($filter_status) ? "WHERE status=$filter_status" : '';
} elseif( ISIN_CUSTOMER ) {
     $wer = "WHERE customer_id='".$luckyuser['id']."'";
} elseif( ISIN_DISTRI ) {
     $wer = "WHERE referrer='".DISTRI_ID."'";
}

$tbl  = 'transactions' . SEL_YEAR;
$con  = SQLi(DBOPS);
$test = 0;

if( init_table($con,$tbl) ) {
     $qry = "SELECT * $add FROM $tbl $wer ORDER BY status,trans_id";
     $rs  = mysqli_query($con,$qry) or die(mysqli_error($con));
     $test = 1;
}

$orders  = get_page_by_title( 'Orders', '', 'page' );
$path    = get_permalink( $orders );
$oldstat = -1;

if( ISIN_ADMIN ) {
     $total = 0;
     $qry = "SELECT status,count(trans_id) ctr FROM $tbl WHERE status<3 GROUP by status HAVING ctr>0";
     $rn  = mysqli_query($con,$qry) or die(mysqli_error($con));
     while( $r = mysqli_fetch_assoc( $rn ) ) {
          $count[$r['status']] = $r['ctr'];
          $total += $r['ctr'];
     }

     $path = get_permalink( get_page_by_title( 'Manage Orders', '', 'page' ) );

     $tabs = '<div>';
          $tabs .= '<a href="'. $path .'" style="padding:5px 10px 0 0">ALL'  . ( $total>0 ? '<sup class="bad">' . $total . '</sup>' : '') . '</a>';
          foreach ($arrOrders as $k => $v) {
               $tabs .= '<a href="'. $path . strtolower($v).'/" style="padding:5px 10px 0 0;margin-left:10px;">'.strtoupper($v) . '<sup class="bad">' . $count[$k]  . '</sup>' .'</a>';
          }
     $tabs .='</div><br>';

}
// echo $qry;
if( mysqli_num_rows($rs)>0 && $test ) {
     $x = '<ul id="orders" class="listing">';
     while( $r = mysqli_fetch_assoc( $rs ) ) {
          foreach ( $r as $k=>$v ) $$k = utf8_encode($v);

          if( $oldstat < $status ) {
               if($status) $x .= '<li><br></li>';
               $x .= '<li><strong>'.strtoupper($arrOrders[$status]).'</strong></li>';

               $x .= '<li>';
                    $x .= '<strong class="w2">DR#</strong> ';
                    $x .= '<strong class="w5">Receiver</strong> ';
                    $x .= '<strong class="w3">Ordered</strong> ';
                    $x .= '<strong class="w3 rt">Total Due</strong> ';
                    // $x .= '<strong class="w2 rt">Status</strong>';
               $x .= '</li>';
          }

          $x .= '<li>';
          $x .= '<a href="'.$path.'?'.$trans_id.'" class="w2">'.$trans_id.'</a> ';
          $x .= '<span class="w5">'.( is_numeric($encoded_by) && $encoded_by>1 ? 'STK:' . $from_stk : $del_receiver ).'</span> ';
          $x .= '<span class="w3">'.date(mdY,strtotime($submitted)).'</span> ';
          $x .= '<span class="w3 rt">'.number_format($pay_amount,2).'</span> ';
          // $x .= '<span class="w2 rt smaller">'.strtoupper($arrOrders[$status]).'</span>';
          $x .= '</li>';

          $oldstat = $status;
     }

     $x .= '</ul>';
     mysqli_close($con);

} else $x = '<h5>Oops! No orders in '.SEL_YEAR.'!</h5>';

if( $post->post_title == 'Orders' ) {
     $shop = get_page_by_title( 'Shop', '', 'page' );
     $x .= '<hr><div class="rt"><a href="'.get_permalink( $shop->ID ).'" class="btn">Shop</a></div>';
}

echo $tabs . $x . BACKTOTOP;
?>
