<?php
$x  = '<h4>Welcome back, <strong><em>'.$luckyuser['nam'].'</em></strong>.</h4>';
if( trim($luckyuser['discount_code'])!='' ) $x .= '<br><h5>You are using Discount Code: <strong><em>'.$luckyuser['discount_code'].'</em></strong></h5>';
echo $x;
?>
