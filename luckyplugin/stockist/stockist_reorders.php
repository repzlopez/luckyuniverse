<?php if( !preg_match( "/admin|stockist/i", $_SESSION['user_type'] ) ) exit;

global $post,$luckyuser,$arrReorders;
unset($_SESSION['item-data']);
unset($_SESSION['reorders']);
unset($_SESSION['cart']);

$sel = '<div class="rt"><select class="byDate">';
for ( $i = date('Y'); $i >= YEAR_1; $i-- ) {
     $sel .= '<option value="/stockist/'.$post->post_name.'/?'.$i.'" '.($i==SEL_YEAR?SELECTED:'').'>'.$i.'</option>';
}
$sel .= '</select><hr></div>';
echo $sel;

if( ISIN_STOCKIST ) {
     $add = "AND (r.warehouse='".STOCKIST_ID."' OR r.reorder_from='".STOCKIST_ID."')";
}

$con  = SQLi(DBSTK);
$tbl  = 'reorders';
$flo  = 'transfers_float' . SEL_YEAR;
$test = 0;
$oldstat = -1;

if( init_table($con,$tbl) ) {
     $qry = "SELECT r.*,s.warehouse stockist_name,
               (SELECT SUM(float_qty) FROM " . DB . DBOPS . ".$flo WHERE transfer_id=r.transfer_id AND float_qty>0) t_float
          FROM $tbl r
          LEFT JOIN ".DB.DBPRF.".stockist s ON s.id=r.warehouse
          WHERE YEAR(submitted)=". SEL_YEAR ."
          $add
          ORDER BY status,id";

     $rs  = mysqli_query($con,$qry) or die(mysqli_error($con));
     $test = 1;
}

if( mysqli_num_rows($rs)>0 && $test ) {
     $x  = '<ul id="reorders" class="listing">';

     while( $r = mysqli_fetch_assoc( $rs ) ) {
          foreach ( $r as $k=>$v ) $$k = utf8_encode($v);

          $has_float = $t_float > 0;
          $float_params = ($has_float ? 'class="bad" title="Transferred has ' . $t_float . ' floating item' . ($t_float > 1 ? 's' : '') . '"' : '');

          if( $oldstat < $status ) {
               if($status) $x .= '<li><br></li>';
               $x .= '<li><strong>'.strtoupper($arrReorders[$status]).'</strong></li>';

               $x .= '<li>';
                    $x .= '<strong class="w3">Reorder#</strong> ';
                    $x .= '<strong class="w4">Stockist</strong> ';
                    $x .= '<strong class="w3 rt">Amount</strong> ';
                    $x .= '<strong class="w4 rt">Date Submitted</strong> ';
               $x .= '</li>';
          }

          $x .= '<li '. ($status==3 ? 'class="void"' : $float_params ) .'>';
          $x .= '<a href="?'.$id.'" class="w3">'.$id.'</a> ';
          $x .= '<span class="w4">'. $warehouse . ' ' . ($has_float ? '<sup class="bad smaller">(' . $t_float . ')</sup>' : '').'</span> ';
          $x .= '<span class="w3 rt">'.number_format($pay_amount, 2).'</span> ';
          $x .= '<span class="w4 rt">'.date(mdY,strtotime($submitted)).'</span> ';
          $x .= '</li>';

          $oldstat = $status;
     }

     $x .= '</ul>';
     mysqli_close($con);
} else $x = '<h5>Oops! No Reorders in '.SEL_YEAR.'!</h5>';

$x .= ISIN_STOCKIST ? '<hr><div id="bottom_nav"><a href="?add" class="btn">ADD NEW</a></div>' :'';

echo $x . BACKTOTOP;
?>
