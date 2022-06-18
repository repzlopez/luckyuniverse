<?php if( !ISIN_DISTRI ) exit;

$con = SQLi(DBPRF);
$qry = "SELECT * FROM customers c WHERE referrer='".DISTRI_ID."' ORDER BY receiver";
$rs  = mysqli_query($con,$qry) or die(mysqli_error($con));

if( mysqli_num_rows($rs)>0 ) {
     $ret = get_page_by_title( 'Manage Customers', '', 'page' );

     $x  = '<ul id=""><li>';
     $x .= '<strong class="w4">Customer</strong>';
     $x .= '<strong class="w5">Address</strong>';
     $x .= '<strong class="w3">Contact #</strong>';
     $x .= '</li>';

     while( $r = mysqli_fetch_assoc( $rs ) ) {
          foreach ( $r as $k=>$v ) $$k = utf8_encode($v);

          $x .= '<li>';
          $x .= '<span class="w4">'.$receiver.'</span>';
          $x .= '<span class="w5">'.$address.'</span>';
          $x .= '<span class="w3">'.$contact.'</span>';
          $x .= '</li>';
     }

     $x .= '<li></li><li></li>';
     $x .= '</ul>';
} else $x = '<h5>NO CUSTOMERS FOUND</h5>';

echo $x . BACKTOTOP;
?>
