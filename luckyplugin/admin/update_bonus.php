<?php if( !isset($_SESSION) ) session_start();

$d     = 0;
$con   = SQLi(DBOPS);
$tbl   = 'transactions' . SEL_YEAR;
$qry   = "SELECT referrer,pay_out,pov,status FROM $tbl WHERE trans_id=$last_id";
$ls    = mysqli_query( $con, $qry ) or die( mysqli_error($con) );
$l     = mysqli_fetch_assoc( $ls );

if( $l['status'] == 1 ) {
     if( $l['pay_out'] == 99 ) {
          $tbl    = 'withdrawals' . date('Y');
          $qry    = "INSERT INTO $tbl VALUES ('',".$l['referrer'].",$pay_amount,1,'".date(TMDSET)."','".date(TMDSET)."','system',1)";
          mysqli_query( $con, $qry ) or die( mysqli_error($con) );
     }

     if( !isset($_SESSION['referral_bonus_only']) && $l['pov']>0 ) {
          updateBonus( $last_id, $l['referrer'], $l['pov'], $l['pov'], $d );
     }

     unset($_SESSION['referral_bonus_only']);
}

function updateBonus($trans_id,$dssid,$pov,$tpov,$d) {
     global $unilevel;

     if( $dssid != '00000000' && ( $dssid == '00000001' || $tpov >= MIN_POV ) ) {
          if( $d > 0 ) {
               //bonus data
               $bonus  = $pov * ( $unilevel[$d]/100 );

               $kdata  = 'id,trans_id,dsdid,pov,bonus,status';

               $idata  = "'',";
               $idata .= trim($trans_id) . ",";
               $idata .= $dssid . ",";
               $idata .= $pov . ",";
               $idata .= $bonus. ",0";

               $udata  = "trans_id=" .trim($trans_id). ",";
               $udata .= "dsdid=" .$dssid. ",";
               $udata .= "pov=" .$pov. ",";
               $udata .= "bonus=" .$bonus. "";

               $con = SQLi(DBOPS);
               $tbl = 'bonus' . SEL_YEAR;
               insert_duplicate($con,$tbl,$kdata,$idata,$udata);

               //total bonus
               $kdata  = 'dsdid,bonus';

               $idata  = $dssid . ",";
               $idata .= $bonus;

               $udata  = "dsdid=" .$dssid. ",";
               $udata .= "bonus=bonus+" .$bonus. "";

               $con = SQLi(DBPRF);
               $tbl = 'bonuses';
               insert_duplicate($con,$tbl,$kdata,$idata,$udata);
          }

     } else $d = ( $d>0 ? $d-- : $d );

     if( $dssid != '00000000' && $d <= MAX_LEVEL ) {
          $con = SQLi(DBPRF);
          $tra = DB.'ops.transactions' . SEL_YEAR;
          $qry = "SELECT dssid,SUM(pov) tpov
               FROM distributors d
               LEFT JOIN $tra s ON referrer = d.dsdid
               WHERE dsdid='$dssid'";

          $rs  = mysqli_query( $con, $qry ) or die( mysqli_error($con) );
          $r   = mysqli_fetch_assoc( $rs );

          updateBonus( $trans_id, $r['dssid'], $pov, (int)$r['tpov'], $d+1 );
     }
}
?>
