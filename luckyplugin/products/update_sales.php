<?php
// print_r($_SESSION['cart']);
foreach ( $_SESSION['cart'] as $k=>$v ) {
     $tbl    = 'sales' . SEL_YEAR;
     $kdata = 'id,item,qty,pov,price,discount,discount_code,trans_id';
     $idata  = "'',";
     $udata  = '';

     $price  = str_replace( ',', '', $_SESSION['cart'][$k]['price'] );
     $less   = str_replace( ',', '', $_SESSION['cart'][$k]['less'] );
     $pov    = str_replace( ',', '', $_SESSION['cart'][$k]['pov'] );
     $qty    = str_replace( ',', '', $_SESSION['cart'][$k]['qty'] );
     $id     = $_SESSION['cart'][$k]['id'];

     $idata .= $id . ",";
     $idata .= $qty . ",";
     $idata .= $pov . ",";
     $idata .= $price . ",";
     $idata .= $less . ",";
     $idata .= "'" . $use_discount . "',$last_id";

     $udata .= "item=" . $id . ",";
     $udata .= "qty=" . $qty . ",";
     $udata .= "pov=" . $pov . ",";
     $udata .= "price=" . $price . ",";
     $udata .= "discount=" . $less . ",";
     $udata .= "discount_code='" . $use_discount . "'";

// echo '<br><br>' . DBOPS . "<br>$tbl<br>$kdata<br>$idata<br>$udata<br><br>";
     insert_duplicate( SQLi(DBOPS), $tbl, $kdata, $idata, $udata );
}

?>
