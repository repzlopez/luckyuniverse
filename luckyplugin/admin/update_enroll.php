<?php
if( !ISIN_ADMIN ) exit;

if( !empty( $_POST ) ) {
     defined('INCLUDE_CHECK') || define('INCLUDE_CHECK',1);
     require_once plugin_dir_path( __DIR__ ) . 'templates/setup.php';

     foreach ($_SESSION['checkout'] as $k=>$v) $$k=$v;

     $trans_id = trim($trans_id);
     $tbl = 'sales' . SEL_YEAR;
     $qry = "SELECT item,qty,e.dsdid edsdid,e.dssid edssid,p.pov,p.referral,
               (SELECT COUNT(*) FROM enroll WHERE dsdid=$referrer AND package='".sncID."') slots,
               (SELECT dssid FROM ".DB.DBPRF.".distributors WHERE dsdid=$referrer) ssid
          FROM $tbl s
               LEFT JOIN (SELECT dsdid,dssid,dsstatus FROM ".DB.DBPRF.".for_encoding) e ON e.dsstatus=$trans_id
               LEFT JOIN (SELECT id,pov,referral FROM ".DB.DBPRF.".packages) p ON p.id=s.item
          WHERE trans_id='$trans_id'";
// echo $qry;
     $con = SQLi(DBOPS);
     $rs  = mysqli_query($con,$qry);

     while( $r = mysqli_fetch_assoc( $rs ) ) {
          foreach ( $r as $k=>$v ) $$k=stripslashes($v);

          switch ($item) {
               case sncID:
                    $n = 1;
                    $_SESSION['referral_bonus_only'] = 1;

                    if( $edsdid != '' ) {   // NEW
                         $dsdid = $edsdid;
                         $dssid = $edssid;
                         $gets_ref = $dssid;
                         $slots = 0;
                    } else {                 // OLD DISTRI
                         $dsdid = $referrer;
                         $dssid = $ssid;
                         $gets_ref = $dsdid;
                    }

                    while( $n <= $qty ) {
                         $slots += 1;

                         if( $slots <= sncMaxSlots ) {
                              $qry = "INSERT INTO sharencare VALUES ($dsdid,$dssid,$trans_id,$slots,'$encoded_on')";
     // echo "<br>$qry<br>";
                              mysqli_query( $con, $qry ) or die( mysqli_error($con) );

                              run_enroll($dsdid,$item,$slots,$trans_id,$encoded_on);
                         } else {
                              $_SESSION['return_msg']['msg'] = 'Maximum slots exceeded';
                         }

     //referral bonus
                         update_referral($trans_id,$dssid,$pov,$referral);

                         $n++;
                    }

                    break;

               case sncReq:
                    $req_slots = array();

                    $con = SQLi(DBOPS);
                    $qry = "SELECT slot,COUNT(slot) ctr FROM enroll WHERE dsdid='$referrer' AND package='".sncReq."' GROUP BY slot";
                    $rs  = mysqli_query( $con, $qry ) or die( mysqli_error($con) );
                    while( $r = mysqli_fetch_assoc( $rs ) ) {
                         $req_slots[ $r['slot'] ] = $r['ctr'];
                    }

                    while( $qty > 0 ) {
                         $n = 1;

                         if( array_sum($req_slots) < ( $slots * sncMaxReq ) ) {
                              while( $n <= $slots && $qty > 0 ) {
                                   if( $req_slots[ $n ] < sncMaxReq ) {
                                        run_enroll($referrer,$item,$n,$trans_id,$encoded_on);
                                        $req_slots[ $n ]++;
                                        $qty--;
                                   }
                                   $n++;
                              }
                         } else break;
                    }
                    break;

               default:
// NOT REGISTRATION PACKAGE
                    // run_enroll($referrer,$item,0,$trans_id,$encoded_on);
                    break;

          } //switch
     }

}

function run_enroll($dsdid,$item,$slots,$trans_id,$encoded_on) {
     $con = SQLi(DBOPS);
     $qry  = "INSERT INTO enroll VALUES ('',$dsdid,$item,$slots,$trans_id,'$encoded_on')";
// echo "$qry<br>";
     mysqli_query( $con, $qry ) or die( mysqli_error($con) );
}

function update_referral($trans_id,$dsdid,$pov,$bonus) {
     $kdata  = 'id,trans_id,dsdid,pov,bonus,status';

     $idata  = "'',";
     $idata .= trim($trans_id) . ",";
     $idata .= $dsdid . ",";
     $idata .= $pov . ",";
     $idata .= $bonus. ",0";

     $udata  = "trans_id=" .trim($trans_id). ",";
     $udata .= "dsdid=" .$dsdid. ",";
     $udata .= "pov=" .$pov. ",";
     $udata .= "bonus=" .$bonus. "";

     $con = SQLi(DBOPS);
     $tbl = 'bonus' . SEL_YEAR;

     insert_duplicate($con,$tbl,$kdata,$idata,$udata);

//total bonus
     $kdata  = 'dsdid,bonus';

     $idata  = $dsdid . ",";
     $idata .= $bonus;

     $udata  = "dsdid=" .$dsdid. ",";
     $udata .= "bonus=bonus+" .$bonus. "";

     $con = SQLi(DBPRF);
     $tbl = 'bonuses';
// echo "<br>$tbl<br>$kdata<br>$idata<br>$udata<br>";
     insert_duplicate($con,$tbl,$kdata,$idata,$udata);
}
?>
