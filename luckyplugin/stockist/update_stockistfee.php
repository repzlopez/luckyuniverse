<?php if( !isset($_SESSION) ) session_start();

function updateBonus($reorder_id,$warehouse,$upline,$pov,$s_pct) {
     global $stockist_fee;
// echo "$upline<br>$pov<br>$s_pct<br><br>";
     if( $dssid > 0  || $s_pct ) {
          //bonus data
          $bonus  = $pov * ( $s_pct / 100 );

          $kdata  = 'id,reorder_id,warehouse,pov,bonus,status';

          $idata  = "'',";
          $idata .= trim($reorder_id) . ",";
          $idata .= $warehouse . ",";
          $idata .= $pov . ",";
          $idata .= $bonus. ",0";

          $udata  = "reorder_id=" .trim($reorder_id). ",";
          $udata .= "warehouse=" .$warehouse. ",";
          $udata .= "pov=" .$pov. ",";
          $udata .= "bonus=" .$bonus. "";

          $con = SQLi(DBOPS);
          $tbl = 'stockistfee' . SEL_YEAR;
          insert_duplicate($con,$tbl,$kdata,$idata,$udata);
// echo "$kdata<br>$idata<br>$udata<br><br>";
          $con = SQLi(DBPRF);
          $qry = "SELECT id,upline,level FROM stockist WHERE id=$upline";
          $rs  = mysqli_query($con,$qry) or die(mysqli_error($con));
          $r   = mysqli_fetch_assoc($rs);

          foreach ($r as $k=>$v) $$k = $v;

          if( $upline != '' && $s_pct < $stockist_fee[$level] ) {
               updateBonus($reorder_id,$id,$upline,$pov,$stockist_fee[$level]);
          }
     }

}
?>
