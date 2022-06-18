<?php if( !ISIN_DISTRI ) exit;

$sel = '<div class="rt"><select class="byDate">';
for ( $i = date('Y'); $i >= YEAR_1; $i-- ) {
     $sel .= '<option value="/bonus-history?'.$i.'" '.($i==SEL_YEAR?SELECTED:'').'>'.$i.'</option>';
}
$sel .= '</select><hr></div>';
echo $sel;

global $arrWidStat;
$con  = SQLi(DBOPS);
$bns  = 'bonus' . SEL_YEAR;
$tns  = 'transactions' . SEL_YEAR;
$test = 0;

if( init_table($con,$tns) ) {
     $qry = "SELECT b.dsdid,b.trans_id,b.wid_id,b.pov,b.bonus,b.status,del_receiver,referrer
          FROM $bns b
          LEFT JOIN $tns t ON t.trans_id=b.trans_id
          WHERE b.dsdid='".DISTRI_ID."'
          ORDER BY b.id";
     $rs  = mysqli_query($con,$qry) or die(mysqli_error($con));
     $test = 1;
}

if( mysqli_num_rows($rs)>0 && $test ) {
     $ret = get_page_by_title( 'Orders', '', 'page' );

     $x  = '<ul id="bonus_history" class="listing"><li>';
     $x .= '<strong class="w2">Order #</strong> ';
     $x .= '<strong class="w4">Receiver</strong> ';
     $x .= '<strong class="w3 rt">POV</strong> ';
     $x .= '<strong class="w3 rt">Bonus</strong> ';
     $x .= '<strong class="w2 rt">Status</strong> ';
     $x .= '</li>';

     while( $r = mysqli_fetch_assoc( $rs ) ) {
          foreach ( $r as $k=>$v ) $$k = utf8_encode($v);

          $x .= '<li>';
          $x .= ( $dsdid==$referrer ? '<a href="'.get_permalink( $ret->ID ).'?'.$trans_id.'" class="w2">'. $trans_id .'</a> ' : '<span class="w2">'. $trans_id .'</span> ' );
          $x .= '<span class="w4" style="white-space:nowrap">'.$del_receiver.'</span> ';
          $x .= '<span class="w3 rt">'.number_format($pov,2).'</span> ';
          $x .= '<span class="w3 rt">'.number_format($bonus,2).'</span> ';
          $x .= '<span class="w2 rt smaller">'.($wid_id!='' ? $arrWidStat[$status] : 'pending').'</span> ';
          $x .= '</li>';
     }

     $x .= '<li></li><li></li>';
     $x .= '</ul>';
} else $x = '<h5>NO BONUS FOUND IN '. SEL_YEAR .'</h5>';

echo $x . BACKTOTOP;
?>
