<?php

$con = SQLi(DBPRF);
$qry = "SELECT * FROM products WHERE id=$uri AND status=1";
$rs  = mysqli_query($con,$qry) or die(mysqli_error($con));
if( mysqli_num_rows($rs)>0 ) {
     $r = mysqli_fetch_array($rs);
     foreach ($r as $k=>$v) $$k=$v;

     $price = (WEB_SRP?$web_srp:$srp);
     $less  = ($price*DISCOUNT);
     $new_price = $price;

     if( DISCOUNT_ON ) $new_price -= $less;
     if( ISIN_DISTRI ) $new_price -= $wsp;
     // $x  = '<h4>'.$name.'</h4>';
     $x .= '<ul id="product" class="listing">';
     $x .= '<li><label class="w5">Code:</label> <span class="w2 rt">'.$id.'</span></li>';
     $x .= '<li><label class="w5">SRP:</label> <span class="w2 rt">'.number_format($price,2).'</span></li>';
     if( DISCOUNT_ON ) $x .= '<li><label class="w5">SRP w/ Discount Coupon:</label> <span class="w2 rt">'.number_format($price-$less,2).'</span></li>';
     if( ISIN_DISTRI ) $x .= '<li><label class="w5">WSP:</label> <span class="w2 rt">'.number_format($wsp,2).'</span></li>';
     $x .= '</ul>';

     $ret = get_page_by_title( 'Shop', '', 'page' );
     $back = '<a href="#" class="btn" onclick="window.history.go(-1); return false;">Back</a>';

     $x .= '<hr><div class="rt">';
     if( DISCOUNT_ON ) $x .= '<span class="rt smaller">Discount code '.DISCOUNT_CODE.' applied:</span> ';
     $x .= '<span style="font-size:larger"></span><a href="#" id="addtocart" class="btn" data-code="'.$id.'" data-price="'.$new_price.'" data-pov="'.$pov.'"><span class="dashicons dashicons-cart"></span> Add to Cart</a> '.$back;
     $x .= '</div>';
} else $x = '<h1>PRODUCT NOT FOUND</h1>';

mysqli_close($con);
echo $x;
?>
