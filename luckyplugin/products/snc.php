<?php
if( !isset($_SESSION) ) session_start();

unset($_SESSION['snc_referrer']);
unset($_SESSION['order_id']);
unset($_SESSION['cart']);
$x= $y= '';

if( ISIN_DISTRI ) {

     $qry = "SELECT date,slot,
               COUNT(CASE WHEN package='".sncReq."' THEN 1 END) req,
          	(SELECT COUNT(CASE WHEN (dsdid<>'".DISTRI_ID."') THEN slot END)
          		FROM sharencare
          		WHERE dssid='".DISTRI_ID."'
              	     AND slot=e.slot) snc
          FROM enroll e
          WHERE dsdid='".DISTRI_ID."'
          AND ( package='".sncID."' OR package='".sncReq."' )
          GROUP BY slot";

     $con = SQLi(DBOPS);
     $rs  = mysqli_query( $con, $qry ) or die( mysqli_error($con) );
     $ret = get_page_by_path( 'snc/enroll' );
     $total_req = 0;

     if( mysqli_num_rows($rs)>0 ) {
          while( $r = mysqli_fetch_assoc( $rs ) ) {
               foreach ($r as $k=>$v) $$k = $v;

               if( $slot == 1 ) {
                    $open = date( mdY, strtotime($date) );
                    $clos = date( mdY, strtotime($date . '+ '. sncMaxExpiry .' days') );
               }

               $slot_open = date( mdY, strtotime($date) );
               $slot_close = date( mdY, strtotime($date . '+ '. sncSlotExpiry .' days') );
               $rets = get_page_by_path( 'snc' );

               $y .= '<li><a href="'. get_permalink( $rets->ID ) .'?slot'. $slot .'"><h5 class="bb">SLOT '.$slot.'</h5>';
               $y .= '<div><br>';
                    $y .= '<span title="Sponsored"><span class="dashicons dashicons-admin-users"></span> '.$snc.'</span>';
                    $y .= ' <span class="w0"></span> ';
                    $y .= '<span title="Requirements"><span class="dashicons dashicons-cart"></span> '.$req.'</span>';
               $y .= '</div>';
               $y .= '<p class="smaller">until '.$slot_close.'</p></a></li>';

               $total_req += $req;
          }

          $x .= '<h5><span class="w2">Opened</span> <span>'.$open.'</span></h5>';
          $x .= '<h5><span class="w2">Until</span> <span>'.$clos.'</span></h5>';

          $max1 = ( sncMaxSlots - $slot );
          $max2 = ( (sncMaxReq * $slot) - $total_req );

          if( sncMaxSlots > $slot ) {
               $get_slot = '<input type="number" class="w1 btn qty" data-id="'. sncID .'" data-pov=0 data-price=0 value=1 placeholder=0 min=1 max="'.$max1.'" /> <a href="'. get_permalink( $ret->ID ) .'?'. sncID .'" class="btn">Order Now</a> <a class="smaller" max='.$max1.'>**'.$max1.' remaining</a></a>';

          } else {
               $get_slot = ': COMPLETE';
          }

          if( (sncMaxReq * $slot) > $total_req ) {
               $get_req  = '<input type="number" class="w1 btn qty" data-id="'. sncReq .'" data-pov=0 data-price=0 value=1 placeholder=0 min=1 max="'.$max2.'" /> <a href="'. get_permalink( $ret->ID ) .'?'. sncReq .'" class="btn">Order Now</a> <a class="smaller" max='.$max2.'>**'.$max2.' remaining</a></a>';

          } else {
               $get_req  = ': COMPLETE';
          }

          $x .= '<br><div id="snc">';
          if( $get_slot != $get_req ) {
               $x .= '<h5 class=""><span class="w5">Get Slot</span> '.$get_slot.'</h5>';
               $x .= '<h5 class=""><span class="w5">Get Requirement</span> '.$get_req.'</h5>';

          } else {
               $x .= '<h3>Congratulations! You have completed our Share & Care program.</h3>';
          }

          $x .= '</div>';

          $x .= '<div class="clear"></div><hr>';
          $x .= '<ul class="account_main">' . $y . '</ul>';

     } else {

          $qry = "SELECT COUNT(id) c,
                    (SELECT dsfnam FROM luckyuni_".DBPRF.".distributors WHERE dsdid=".DISTRI_ID.") n
               FROM sales2021 s
               LEFT JOIN transactions2021 t ON t.trans_id=s.trans_id
               WHERE t.referrer=".DISTRI_ID." AND t.status=0";

          $con = SQLi(DBOPS);
          $rs  = mysqli_query( $con, $qry ) or die( mysqli_error($con) );

          if( mysqli_num_rows($rs)>0 ) {
               $r = mysqli_fetch_assoc( $rs );

               if( $r['c'] >0 ) {
                    $x .= '<h3>Hi '.$r['n'].'! You already sent your enrollment.</h3><p>Please wait for confirmation. Thank you.</p><hr>';
               } else $x .= enroll('You are not enrolled');

          } else $x .= enroll('You are not enrolled');
     }

} elseif( $uri!='' ) {

     require_once plugin_dir_path( __DIR__ ) . 'templates/init_setup.php';
     require_once 'test_disc_code.php';

     if( test_discount_code($uri) ) {
          $_SESSION['snc_referrer'] = $_SESSION['discount']['dsdid'];
          unset($_SESSION['discount']);
          unset($_SESSION['return_msg']);

          $x .= enroll('Would you like to join our Share & Care program?');

     } else {
          $x .= enroll('Invalid code', 1);
     }

} else {
     $x .= enroll('Would you like to join our Share & Care program?<br>Ask the person who introduced this for their promo link.', 1);
}

echo $x;

function enroll($msg,$fail=0) {
     $ret = get_page_by_path( 'snc/enroll' );

     $r  = '<h5>'.$msg.'</h5><hr>';
     if( !$fail )$r .= '<div id="bottom_nav"><a href="'. get_permalink( $ret->ID ) .'?'. sncID .'&1" class="btn">Enroll Now</a></div>';
     return $r;
}
?>
