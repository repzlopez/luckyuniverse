<?php

if( $uri !== false ) {
     require_once plugin_dir_path( __DIR__ ) . 'stockist/stockist_profile.php';

} else {

     global $arrLevel;
     $con = SQLi(DBPRF);
     $tns = 'transactions' . SEL_YEAR;
     $qry = "SELECT s.*, CONCAT(d.dsfnam, ' ', d.dslnam) nam,
               (SELECT receive_date FROM ".DB.DBSTK.".transfers WHERE transfer_to=s.id ORDER BY receive_date DESC LIMIT 1) last_transfer,
               (SELECT encoded_on FROM ".DB.DBOPS.".$tns WHERE encoded_by=s.id ORDER BY encoded_on DESC LIMIT 1) last_sale,
               (SELECT SUM(qty) FROM ".DB.DBSTK.".stocks WHERE warehouse=s.id) invqty
          FROM stockist s
          LEFT JOIN ".DB.DBPRF.".distributors d ON dsdid=s.oic
          ORDER BY warehouse";
     $rs  = mysqli_query($con,$qry) or die(mysqli_error($con));

     if( mysqli_num_rows($rs)>0 ) {
          $ret = get_page_by_title( 'Manage Stockist', '', 'page' );

          $x  = '<ul id="stockist" class="listing"><li>';
          $x .= '<strong class="w2">ID</strong>';
          $x .= '<strong class="w4">Warehouse</strong>';
          $x .= '<strong class="w4 ct">Days to Flushout</strong>';
          $x .= '<strong class="w2 ct">Level</strong> ';
          $x .= '<strong class="w2 ct">InvQty</strong> ';
          $x .= '<strong class="w1 ct">Status</strong>';
          $x .= '</li>';

          $arrShortLvl = array('Co', 'Csgn', 'Stk', 'MStk', '001');
          while( $r = mysqli_fetch_assoc( $rs ) ) {
               foreach ( $r as $k=>$v ) $$k = utf8_encode($v);
               $last_date = $last_transfer > $last_sale ? $last_transfer : $last_sale;
               $last_date = $last_date>0 ? $last_date :'na';
               list($rdate,$flushout,$rdiff) = countDays($last_date);

               $x .= '<li class="'. ( $id==1 ? 'lock' : ( $id>1 && $rdiff<0 ? 'badrow' :'') ) .'">';
               $x .= '<a href="'.get_permalink( $ret->ID ).'?'.$id.'" class="w2">'.sprintf("%'.0".PAD."d\n", $id ).'</a>';
               $x .= '<span class="w4">'.$warehouse.'</span>';
               $x .= '<span class="w4 ct">'.( $rdiff<0 ? ( $id>1 ? 'FLUSHOUT' :'') : $rdiff ).'</span>';
               $x .= '<span class="w2 ct">'.$arrShortLvl[$level].'</span> ';
               $x .= '<span class="w2 ct">'.$invqty.'</span> ';
               $x .= '<span class="w1 ct dashicons dashicons-'. ( $status ? 'yes' : 'no' ) .'"></span>';
               $x .= '</li>';
          }

          $x .= '<li></li><li></li>';
          $x .= '</ul>';
     } else $x = '<h5>NO STOCKIST FOUND</h5>';

     $x .= '<hr><div id="bottom_nav"><a href="?" class="btn">ADD NEW</a></div>';
}

echo $x . BACKTOTOP;
?>
