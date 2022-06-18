<?php if( !ISIN_DISTRI ) exit;

if( !empty($_POST) ) {
     $withdraw_ids = explode( ',', substr($_POST['withdraw_ids'],0,-1) );

     $con = SQLi(DBOPS);
     $tbl = 'withdrawals' . SEL_YEAR;

     $qry = "INSERT INTO $tbl (id,dsdid,amount,purpose,requested) VALUES ('',". DISTRI_ID .",". $_POST['amount'] .",0,'". date(TMDSET) ."')";
     mysqli_query( $con, $qry ) or die( mysqli_error($con) );
     $last_id = mysqli_insert_id( $con );

     $tbl = 'bonus' . SEL_YEAR;
     foreach ($withdraw_ids as $v) {
          $qry = "UPDATE $tbl SET wid_id=$last_id WHERE id=$v";
          $rs  = mysqli_query($con,$qry);
     }

     mysqli_close($con);
     unset($_POST);

     echo '<h5>Payout request submitted</h5>';
     $ret = get_page_by_title( $post->post_title, '', 'page' );
     reloadTo( get_permalink($ret->ID), 3 );
     exit;
}

global $msg_ret,$msgclass,$arrWidStat;

$con  = SQLi(DBOPS);
$bns  = 'bonus' . SEL_YEAR;
$tns  = 'transactions' . SEL_YEAR;
$wds  = 'withdrawals' . SEL_YEAR;
$test = 0;

if( init_table($con,$tns) ) {
     $qry = "SELECT b.id,b.wid_id,b.pov,b.bonus,
               (SELECT released FROM $wds w WHERE id=b.wid_id) stat
          FROM $bns b
          LEFT JOIN $tns t ON t.trans_id=b.trans_id
          WHERE b.dsdid='".DISTRI_ID."'
          AND b.status=0
          ORDER BY b.id";

     $rs  = mysqli_query($con,$qry) or die(mysqli_error($con));
     $test = 1;
}

if( mysqli_num_rows($rs)>0 && $test ) {
     $x  = '<h4>Pending for '.SEL_YEAR.'<h4>';
     $x .= '<ul id="withdraw" class="listing"><li>';
     $x .= '<span class="w0"><input type="checkbox" id="check_all" title="Select All" data-id="" data-amt=0 /></span>';
     $x .= '<strong class="w3">Bonus ID</strong> ';
     $x .= '<strong class="w3 rt">Amount</strong> ';
     $x .= '<strong class="w3 ct">Status</strong> ';
     $x .= '<hr></li>';

     while( $r = mysqli_fetch_assoc( $rs ) ) {
          foreach ( $r as $k=>$v ) $$k = utf8_encode($v);

          $x .= '<li>';
          $x .= '<span class="w0">'.( $stat!='' ? '' : '<input type="checkbox" data-id="'.$id.'" data-amt='.$bonus.' />' ).'</span>';
          $x .= '<span class="w3">'. $id .'</span> ';
          $x .= '<span class="w3 rt amt">'.number_format($bonus,2).'</span> ';
          $x .= '<em class="w3 ct smaller">'.( $stat!='' ? $arrWidStat[$stat] : 'pending' ).'</em> ';
          $x .= '</li>';
     }

     $x .= '</ul>';

     $x .= '<hr><form method="post"><div class="rt"><span class="'.$msgclass.' smaller">'.$msg_ret.'</span> ';
     $x .= '<input type="hidden" id="withdraw_ids" name="withdraw_ids" value="" />';
     $x .= '<input type="hidden" id="withdraw_amt" name="amount" value="" />';
     $x .= '<input type="submit" id="to_withdraw" class="btn" min="'.MIN_WITHDRAW.'" data-to_withdraw=0 value="Withdraw P 0.00" />';
     $x .= '</div></form>';

} else $x = '<h5>NO WITHDRAWALS FOUND IN '. SEL_YEAR .'</h5>';

echo $x . BACKTOTOP;
?>
