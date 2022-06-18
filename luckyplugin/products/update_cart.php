<?php
if( !isset($_SESSION) ) session_start();

if( !empty( $_POST ) ) {
     require_once '../templates/init_setup.php';
     foreach ($_POST as $k=>$v) $$k=$v;

     if( $addtocart ) {
          $qty = $_SESSION['cart'][$item]['qty'] + 1;
     }

     if( $clear_cart ) {
          unset($_SESSION['cart']);
     }

     if( $qty>0 ) {
          $_SESSION['cart'][$item]['id'] = $item;
          $_SESSION['cart'][$item]['qty'] = $qty;
          $_SESSION['cart'][$item]['pov'] = $pov;
          $_SESSION['cart'][$item]['price'] = $price;
          $_SESSION['cart'][$item]['less'] = ($price*DISCOUNT);

          $_SESSION['cart'][$item]['name'] = $name;
          $_SESSION['cart'][$item]['stock'] = $stock;
     } else unset($_SESSION['cart'][$item]);

     if( $stockist ) {
          $li = '';
          foreach ($_SESSION['cart'] as $k=>$v) {
               $name       = $_SESSION['item-data'][$v['id']]['name'];
               $stock      = $_SESSION['item-data'][$v['id']]['stock'];
               $amt        = $v['qty']*$v['price'];
               $total_pov += $v['qty']*$v['pov'];
               $total     += $amt;

               $li .= '<li class="'.$v['id'].'">
                    <span class="bb"><input type="number" class="item_code" placeholder="00000" max="99999" minlength="5" maxlength="5" value="'.$v['id'].'" /></span>
                    <span>'.$name.'</span>
                    <span class="bb"><input type="number" class="rt item_qty" placeholder=0 min=0 max="'.$stock.'" title="'.$stock.' availabe" value="'.$v['qty'].'" data-price="'.$v['price'].'" data-pov="'.$v['pov'].'" /></span>
                    <span>'.number_format( $amt, 2 ).'</span>
               </li>';
          }

          $li .= '<li>
               <span class="bb"><input type="number" class="item_code" placeholder="00000" max="99999" minlength=5 maxlength=5 /></span>
               <span></span>
               <span class="bb"><input type="number" class="rt item_qty" placeholder=0 min=0 max=0 /></span>
               <span>0.00</span>
          </li>
          <li>&nbsp;</li>
          <li>
               <span></span>
               <span class="rt">TOTAL</span>
               <span></span>
               <span id="total_amt" data-pov="'.$total_pov.'" class="rt">'.number_format( $total, 2 ).'</span>
          </li>';

          echo $li;
     }
}
?>
