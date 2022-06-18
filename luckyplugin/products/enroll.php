<?php
if( !isset($_SESSION) ) session_start();

if( strpos( $_SERVER['REQUEST_URI'], '?' )!==false ) {
     $item = substr( strrchr( $_SERVER['REQUEST_URI'], '?' ), 1, 5 );
     $_SESSION['enroll'] = ( $item == sncID );
     $msg = 'Ordering';

     if( $_SESSION['enroll'] && !$_SESSION['cart'][$item]['qty'] ) {
          $_SESSION['cart'][$item]['qty'] = 1;
          $msg = 'Enrolling';
     }

     catchOrder($item);
}

require_once plugin_dir_path( __DIR__ ) . 'templates/init_setup.php';

if( ISIN_DISTRI ) {
     $_SESSION['enroll_success']['referrer'] = DISTRI_ID;
     echo '<h5>'.$msg.'... Please wait.</h5><hr>';

     $ret = get_page_by_title( 'Checkout', '', 'page' );
     reloadTo( get_permalink( $ret->ID ) );
     exit;

} elseif( isset($_SESSION['snc_referrer']) ) {
     echo '<h5>Fill-in your details</h5><hr>';
     require_once plugin_dir_path( __DIR__ ) . 'account/profile.php';

} elseif( !empty($_SESSION['enroll_success']) ) {
     unset( $_SESSION['enroll'] );
     unset( $_SESSION['enroll_success'] );
     unset( $_SESSION['snc_referrer'] );

     echo '<h3>Congratulations on your enrollment!</h3><p class="smaller">We will send you a confirmation message once we process your enrollment.</p>';

} else {
     echo '<h5>Would you like to join our program?</h5><hr>';
}

function catchOrder($item) {
     $tbl = ( $item == sncReq ) ? 'products' : 'packages';
     $con = SQLi(DBPRF);
     $qry = "SELECT * FROM $tbl WHERE id=$item";

     $rs  = mysqli_query($con,$qry) or die(mysqli_error($con));

     if( mysqli_num_rows($rs)>0 ) {
          $r = mysqli_fetch_array($rs);

          foreach ($r as $k=>$v) $$k=$v;
          $price = ( $item == sncReq ) ? $wsp : $price;

          $_SESSION['cart'][$item]['id']    = $id;
          $_SESSION['cart'][$item]['pov']   = $pov;
          $_SESSION['cart'][$item]['price'] = $price;
          $_SESSION['cart'][$item]['less']  = 0;
     }
}
?>
