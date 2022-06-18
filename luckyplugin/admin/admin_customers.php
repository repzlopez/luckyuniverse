<?php

if( $uri !== false ) {
     require_once plugin_dir_path( __DIR__ ) . 'account/customer_profile.php';
} else {
     $con = SQLi(DBPRF);
     $qry = "SELECT *,CONCAT(dsfnam,' ',dslnam) ref FROM customers c
          LEFT JOIN distributors d ON d.dsdid=c.referrer
          ORDER BY receiver";
     $rs  = mysqli_query($con,$qry) or die(mysqli_error($con));

     if( mysqli_num_rows($rs)>0 ) {
          $ret = get_page_by_title( 'Manage Customers', '', 'page' );

          $x  = '<ul id="product_list"><li>';
          $x .= '<strong class="w4">Customer</strong>';
          $x .= '<strong class="w3">Contact #</strong>';
          $x .= '<strong class="w4">Referrer</strong>';
          $x .= '<strong class="w1 ct">Status</strong>';
          $x .= '</li>';

          while( $r = mysqli_fetch_assoc( $rs ) ) {
               foreach ( $r as $k=>$v ) $$k = utf8_encode($v);

               $x .= '<li>';
               $x .= '<a href="'.get_permalink( $ret->ID ).'?'.$id.'" class="w4">'.$receiver.'</a>';
               $x .= '<span class="w3">'.$contact.'</span>';
               $x .= '<span class="w4">'.($ref?$ref:'- none -').'</span>';
               $x .= '<span class="w1 ct dashicons dashicons-'.($status?'yes':'no').'"></span>';
               $x .= '</li>';
          }

          $x .= '<li></li><li></li>';
          $x .= '</ul>';
     } else $x = '<h5>NO CUSTOMERS FOUND</h5>';

     $x .= '<hr><div id="bottom_nav"></div>';
     echo $x . BACKTOTOP;
}
?>
