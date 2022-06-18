<?php
if( !isset($_SESSION) ) session_start();

if( ISIN_DISTRI && strpos( $uri, 'slot' )!==false ) {
     $slot = substr($uri,4);
     $x    = "<h4>SLOT $slot</h4><hr>";

     $qry  = "SELECT s.dsdid,CONCAT(dsfnam,' ',dslnam) nam,trans_id,date
          FROM sharencare s
               LEFT JOIN ".DB.DBPRF.".distributors d ON d.dsdid=s.dsdid
          WHERE s.dssid='".DISTRI_ID."'
          AND slot=$slot";

     $con = SQLi(DBOPS);
     $rs  = mysqli_query( $con, $qry ) or die( mysqli_error($con) );
     $y   = '';

     if( mysqli_num_rows($rs)>0 ) {
          while( $r = mysqli_fetch_assoc( $rs ) ) {
               foreach ($r as $k=>$v) $$k = $v;

               $y .= '<li>';
                    $y .= '<span class="w5">'.$dsdid.' '.$nam.'</span> ';
                    $y .= '<span class="w3">'.$trans_id.'</span> ';
                    $y .= '<span class="w2">'.(isset($date) ? date( mdY, strtotime($date) ) :'').'</span> ';
               $y .= '</li>';
          }

          $x .= "<h5>Referrals</h5>";
          $x .= '<ul class="smaller">';
               $x .= '<li>';
                    $x .= '<span class="w5">Distributor</span> ';
                    $x .= '<span class="w3">Order #</span> ';
                    $x .= '<span class="w2">Date</span> ';
               $x .= '</li>';
          $x .= $y;
          $x .= '</ul>';
          $x .= '<div class="clear"></div><hr>';
     }

     $qry  = "SELECT trans_id,date
          FROM enroll
          WHERE dsdid='".DISTRI_ID."'
          AND package='".sncReq."'
          AND slot=$slot";

     $con = SQLi(DBOPS);
     $rs  = mysqli_query( $con, $qry ) or die( mysqli_error($con) );
     $y   = '';

     if( mysqli_num_rows($rs)>0 ) {
          $ret = get_page_by_title( 'Orders', '', 'page' );

          while( $r = mysqli_fetch_assoc( $rs ) ) {
               foreach ($r as $k=>$v) $$k = $v;

               $y .= '<li>';
                    $y .= '<a href="'. get_permalink( $ret->ID ) .'?'. $trans_id .'" class="w3">'.$trans_id.'</a> ';
                    $y .= '<span class="w2">'.(isset($date) ? date( mdY, strtotime($date) ) :'').'</span> ';
               $y .= '</li>';
          }

          $x .= "<h5>Requirements</h5>";
          $x .= '<ul class="smaller">';
               $x .= '<li>';
                    $x .= '<span class="w3">Order #</span> ';
                    $x .= '<span class="w2">Date</span> ';
               $x .= '</li>';
          $x .= $y;
          $x .= '</ul>';
     }

} else $x .= '<h5>Nothing to see here</h5><hr>';

$rets = get_page_by_path( 'snc' );
$x .= '<div id="bottom_nav"><a href="'. get_permalink( $ret->ID ) .'" class="btn">Back</a></div>';

echo $x;
?>
