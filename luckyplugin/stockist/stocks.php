<?php if( !preg_match( "/admin|stockist/i", $_SESSION['user_type'] ) ) exit;

global $post;

$stk = ISIN_ADMIN ? ( $uri!='' ? $uri : HEAD_OFFICE ) : STOCKIST_ID;
$order = 'ORDER BY p.sort_order,p.name';
$rem = TESTNET_ON ? '': "AND warehouse<>0";
$con = SQLi(DBSTK);

$trn = 'transfers' ;
$flo = 'transfers_float' . SEL_YEAR;

$qry = "SELECT (CASE WHEN s.item IS NULL THEN f.item ELSE s.item END) itm,
          s.warehouse,f.transfer_id,s.qty,SUM(f.float_qty) f_qty,
     	(SELECT name FROM ".DB.DBPRF.".products WHERE id=f.item) name
     FROM ".DB.DBOPS.".transfers_float2022 f
     LEFT JOIN (select * from ".DB.DBSTK.".transfers) tr ON tr.id=f.transfer_id
     LEFT JOIN (select item,qty,warehouse from ".DB.DBSTK.".stocks s WHERE warehouse='$stk') s ON s.item=f.item
     WHERE (tr.transfer_from='$stk' OR tr.transfer_to='$stk')
     GROUP BY f.item
     ORDER BY f.item
";
// echo $qry;
$rs  = mysqli_query($con,$qry) or die(mysqli_error($con));
$col1= 'w6';
$x= $y= '';
$total_float = 0;

if( mysqli_num_rows($rs)>0 ) {
     while( $r = mysqli_fetch_assoc( $rs ) ) {
          foreach ( $r as $k=>$v ) $$k = utf8_encode($v);
          $total_float += $f_qty;

          if( $qty==0 && $f_qty==0 ) {
          } else {
               $y .= '<li>';
                    $y .= '<span class="'.$col1.'">'.$itm.' '.$name.'</span> ';
                    $y .= '<span class="w2 rt '.( $qty<1 ? 'bad' :'' ).'">'. (int)$qty .'</span> ';
                    $y .= '<span class="w2 rt bad">'. (int)$f_qty .'</span> ';
               $y .= '</li>';
          }
     }

     $x .= '<ul><li>';
          $x .= '<strong class="'.$col1.'">Product Name</strong> ';
          $x .= '<strong class="w2 rt">Qty</strong> ';
          $x .= '<strong class="w2 rt bad">Float</strong> ';
     $x .= '</li>' . $y .'</ul><br>';

     $ret = get_page_by_title( ISIN_ADMIN ? 'admin' : 'stockist', '', 'page' );

     $x .= '<hr><div id="bottom_nav">';
     $x .= '<a href="'.get_permalink($ret->ID).'" class="btn">Back</a>';
     $x .= '</div>';

} else $x .= '<h5>NO STOCKS FOUND</h5>';

mysqli_close($con);
echo $x . BACKTOTOP;
?>
