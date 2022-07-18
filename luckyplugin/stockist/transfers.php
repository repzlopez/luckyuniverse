<?php if( !preg_match( "/admin|stockist/i", $_SESSION['user_type'] ) ) exit;
if( !isset($_SESSION) ) session_start();

$reorders = ( isset($_SESSION['reorders']) ? $_SESSION['reorders'] :array() );
$is_reorder = !empty($reorders);
$transfer_out_to = null;

$ret = get_page_by_title( $post->post_title, '', 'page' );
$ror = get_page_by_title( (ISIN_ADMIN ? 'Manage Reorders' :'') . 'Reorder', '', 'page' );
$bak = $is_reorder ? $ror->ID : $ret->ID;

$trn = 'transfers' . SEL_YEAR;
$flo = 'transfers_float' . SEL_YEAR;
$stk = 'stocks';

global $msg_ret,$msgclass,$post;

$stockist_id = STOCKIST_ID;

if( strpos( $uri, '&' ) !== false ) {
     $data = explode('&', $uri);

     $uri  = $data[0];
     $stockist_id = str_replace('%20', ' ', $data[1]);
     $transfer_out_to = ( $data[2]=='out' ? 'STOCK OUT' : null );
}
// echo $stockist_id;
$exists = ( $uri != '' && $uri != 'add' );
$order  = 'ORDER BY p.sort_order,p.name';
$is_stok = ISIN_STOCKIST ? "AND (transfer_from='" . $stockist_id . "' OR transfer_to='" . $stockist_id . "')":'';
$not_found = '';

if( $uri != 'add' ) {
     $con = SQLi(DBOPS);

     $qry = "SELECT t.transfer_qty qty,t.reorder_qty r_qty,t.receive_qty d_qty,t.consolidate c_qty,f.float_qty f_qty,s.*,p.id pid,p.name,
          (SELECT warehouse FROM ".DB.DBPRF.".stockist WHERE id=transfer_from) t_fr,
          (SELECT warehouse FROM ".DB.DBPRF.".stockist WHERE id=transfer_to) t_to,
          (SELECT warehouse FROM ".DB.DBPRF.".stockist WHERE id=transfer_by) t_by,
          (SELECT warehouse FROM ".DB.DBPRF.".stockist WHERE id=receive_by) r_by,
          (SELECT warehouse FROM ".DB.DBPRF.".stockist WHERE id=void_by) v_by
          FROM $trn t
          LEFT JOIN ".DB.DBOPS.".$flo f ON f.transfer_id=t.transfer_id AND f.item=t.item
          LEFT JOIN ".DB.DBPRF.".products p ON p.id=t.item
          LEFT JOIN ".DB.DBSTK.".transfers s ON s.id=t.transfer_id
          WHERE t.transfer_id=$uri
          $is_stok
          $order";

     $not_found = '<h5>TRANSFER DETAILS NOT FOUND</h5>';

} else {
     $con = SQLi(DBPRF);

     if( $stockist_id=='' || strpos($stockist_id,'STOCK') !== false ) {
          $add = '';

          foreach ($reorders as $k=>$v) {
               if( $k!='id' && $k!='wh' ) {
                    $add .= "p.id=$k OR ";
               }
          }

          $add = ( $add!='' ? 'AND (' . substr($add,0,-3) . ')' :'' );

          $qry = "SELECT p.id pid,p.*
               FROM products p
               WHERE p.status=1
               $add $order";

     } else {
          $qry = "SELECT s.*,t.partners,p.id pid,p.name,p.wsp,p.status,p.sort_order
               FROM ".DB.DBSTK.".stocks s
               LEFT JOIN ".DB.DBPRF.".stockist t ON t.id=".$stockist_id."
               LEFT JOIN ".DB.DBPRF.".products p ON p.id=s.item
               WHERE s.warehouse=".$stockist_id."
               AND p.status=1
               ORDER BY p.sort_order,p.name";
     }
}
// echo $qry.'<br>';

$rs   = mysqli_query($con,$qry) or die(mysqli_error($con));
$col1 = 'w6';
$col2 = (ISIN_ADMIN ? 'w1' : 'w1') .' ct smaller';
$col4 = (ISIN_ADMIN ? 'w2' : 'w2') .' rt smaller';
$x= $y= $add= '';
$new_qty= $new_dp= $new_tdp= $f_qty= $has_float= $stock_in= $stock_out= 0;

if( mysqli_num_rows($rs)>0 ) {
     $products = get_page_by_title( 'Products', '', 'page' );
     $total_items = $total_conso = 0;

     while( $r = mysqli_fetch_assoc( $rs ) ) {
          foreach ( $r as $k=>$v ) $$k = utf8_encode($v);

          $tt_from = strpos($transfer_from,'STOCK') !== false ? $transfer_from : $t_fr;
          $tt_to   = strpos($transfer_to,'STOCK') !== false ? $transfer_to : $t_to;
          $tt_by   = strpos($transfer_from,'STOCK') !== false ? ( ISIN_ADMIN ? $transfer_by :'ADMIN' ) : $t_to;
          $vv_by   = strpos($void_by,'STOCK') !== false ? $void_by : $v_by;

          $stock_in  = ($tt_from=='STOCK IN');
          $stock_out = ($tt_to=='STOCK OUT');
          $_SESSION['stock_out'] = $tt_to;

          $has_float += $f_qty;
          $total_conso += $c_qty;

          $add_float = ($f_qty > 0 || $has_reorder) ? '<span class="w2 ct">' . (ISIN_ADMIN ?
               '<input type="number" name="' . $pid . '" class="f_qty btn w2 ct" min="0" max="' . $f_qty . '" value="' . $f_qty . '" placeholder="0" />' :
               '<strong class="bad" title="Contact Admin to consolidate">' . $f_qty . '</strong>') . '</span> '
               :'' ;

          $has_reorder = ($r_qty >= $d_qty && $r_qty >= $f_qty);

          if( ($stockist_id!='' && $stockist_id<1) || $qty>0 || $is_reorder ) {
               $y .= '<li>';
               if ($is_reorder) {
                    if (array_key_exists($pid, $reorders)) $y .= '<span class="'.$col1.'">'.$pid.' '.$name.'</span> ';

               } else $y .= '<span class="'.$col1.'">'.$pid.' '.$name.'</span> ';

                    if( $exists ) {
                         if( $has_reorder ) {
                              $y .= '<span class="w2 ct">' . $r_qty . '</span> ';
                         }

                         $y .= '<span class="w2 ct">' . $qty . '</span> ';
                         $y .= ( ISIN_STOCKIST && !$stock_in && !$stock_out ) ? '<input type="hidden" name="'.$pid.'" value="'.( $received_date ? $d_qty : $qty ).'" />' :'';

                         if( $receive_by=='' && $transfer_to==$stockist_id ) {
                              $y .= '<span class="w2 ct"><input type="number" name="'.$pid.'" class="r_qty btn w2 ct" min="0" max="'.$qty.'" value="'.( $received_date ? $d_qty : $qty ).'" placeholder="0" /></span> ';

                              $y .= $add_float;

                         } else {
                              if( !$stock_in && !$stock_out ) $y .= '<span class="w2 ct">'. ($d_qty + $c_qty) .'</span> ';

                              $y .= $add_float;

                              $y .= '<input type="hidden" name="transfer_from" value="'.$transfer_from.'" />';
                              $y .= '<input type="hidden" name="transfer_to" value="'.$transfer_to.'" />';
                         }

                    } else {
                         $max = 'max="'.$qty.'"';

                         if( $is_reorder ) {
                              if( array_key_exists($pid, $reorders) ) {
                                   $new_qty  = $reorders[$pid];
                                   $new_dp   = $new_qty * $wsp;
                                   $new_tdp += $new_dp;

                                   $open_qty = array_key_exists($pid, $reorders) ? '' : DISABLED;

                                   $y .= '<span class="' . $col2 . '">' . $qty . '</span> ';
                                   $y .= '<span class="w2 ct"><input type="number" name="' . $id . '" class="qty btn w2 ct" data-dp="' . $wsp . '" min="0" ' . $max . ' value="' . $new_qty . '" placeholder="0" ' . $open_qty . ' /></span> ';
                                   $y .= '<span class="' . $col4 . ' amt_dp">' . number_format($new_dp, 2) . '</span> ';
                              }

                         } else {
                              $y .= '<span class="' . $col2 . '">' . $qty . '</span> ';
                              $y .= '<span class="w2 ct"><input type="number" name="' . $id . '" class="qty btn w2 ct" data-dp="' . $wsp . '" min="0" ' . $max . ' value="' . $new_qty . '" placeholder="0" /></span> ';
                              $y .= '<span class="' . $col4 . ' amt_dp">' . number_format($new_dp, 2) . '</span> ';
                         }

                    }

               $y .= '</li>';

               if ($is_reorder) {
                    if (array_key_exists($pid, $reorders)) $total_items++;

               } else $total_items++;
          }

     }

} else $x .= $not_found;

if( $exists ) {

     if( $void_date != '' ) {
          $rcv_date = date(mdY,strtotime($void_date));
          $rcv_by   = $vv_by;
     } else {
          $rcv_date = ($receive_date!='' ? date(mdY,strtotime($receive_date)) : 'pending');
          $rcv_by   = ($receive_by!='' ? ( is_numeric($receive_by) && strlen($receive_by)>=8 ? $r_by : $receive_by ) : '');
     }

     $x .= '<h5><span class="w3">TRANSFER ID:</span> '.$uri.'</h5>';
     $x .= '<br>';
     $x .= '<h5><span class="w3">FROM:</span> '.$tt_from.'</h5>';
     $x .= '<h5><span class="w3">TO:</span> '.$tt_to.'</h5>';
     $x .= '<br>';

     if( $void_date == '' ) {
          $x .= '<h5><span class="w3">TRANSFERRED:</span> '.date(mdY,strtotime($transfer_date)).'</h5>';
          $x .= '<h5><span class="w3">BY:</span> '.( is_numeric($transfer_by) && strlen($transfer_by)>=8 ? $t_by : $tt_by ).'</h5>';
          $x .= '<br>';
     }

     if( !$stock_in && !$stock_out ) {
          $x .= '<h5 '. ( $void_date!='' ? 'class="void"' :'') .'><span class="w3">'. ( $void_date!='' ? 'VOIDED' : 'RECEIVED' ) .':</span> '. $rcv_date .'</h5>';
          $x .= '<h5 '. ( $void_date!='' ? 'class="void"' :'') .'><span class="w3">BY:</span> '. $rcv_by .'</h5>';
     }

     $x .= '<br><hr>';

} else {

     $y .= '<li>&nbsp;</li><li>';
          $y .= '<h5 class="'.$col1.'">'. (int)$total_items .' product' . ($total_items>1 ? 's' :'') . ' available</h5> ';
          $y .= '<span class="'.$col2.'"></span> ';
          $y .= '<span class="w2 rt smaller">TOTAL</span> ';
          $y .= '<span id="total_dp" class="'.$col4.'">'. number_format($new_tdp,2) .'</span> ';
     $y .= '</li>';
}

if( $is_reorder ) {
     $lock= 1;
     $transfer_out_to = $reorders['wh'];
     $x .= '<h5>Reorder # '. $reorders['id'] .'</h5>';
}

$transfer_from_dropdown = $is_reorder ? '<option value="'. HEAD_OFFICE .'" '. SELECTED .'>Head Office</option>' : load_stockist_list($stockist_id, $add, 'from', $lock);

$x .= '<form method="post" action="'.esc_url( admin_url('admin-post.php') ).'" id="stock_transfer" data-head-office="' . HEAD_OFFICE . '"><input type="hidden" name="action" value="update_transfers" /><input type="hidden" name="uri" value="'.$uri.'" /><ul>';
$x .= ISIN_ADMIN && !$exists ? '<li class="rt"><hr>TRANSFER FROM <select name="transfer_from" id="transfer_from" required>'. $transfer_from_dropdown .'</select><hr><li>' :'';
$x .= '<li><strong class="'.$col1.'">Product Name</strong> ';

if( !$exists ) {
     $x .= '<span class="'.$col2.'">'. ($stock_in ? '': 'On Hand') .'</span> ';
}

if( $exists && $has_reorder ) {
     $x .= '<strong class="w2 ct">Reordered</strong> ';
}

$x .= '<strong class="w2 ct">'.( $exists ? ($stock_in ? 'Stock In' : ($stock_out ? 'Stock Out' : 'Transfer' )) : 'Qty' ).'</strong> ';

if( $exists ) {
     if( !$stock_in && !$stock_out ) $x .= '<strong class="w2 ct">Received</strong> ';
     if( $has_float ) $x .= '<strong class="w2 ct">Float</strong> ';

} else {
     $x .= '<span class="'.$col4.'">DP</span> ';
}

$x .= '</li>' . $y .'</ul><br>';

if( ISIN_STOCKIST && $warehouse>1 ) {
     $prtn = preg_split('/\r\n|[\r\n]/', $partners);
     $add .= "id=1 OR ";
     foreach ($prtn as $k=>$v) {
          $add .= "id='$v' OR ";
     }

     $add = 'AND (' . substr($add,0,-4) .')';
}

$transfer_to_dropdown = ( $stockist_id=='STOCK IN' ) ? '<option value="'. HEAD_OFFICE .'" '. SELECTED .'>Head Office</option>' : load_stockist_list($transfer_out_to, $add, 'to', $lock);

$x .= '<hr><div id="bottom_nav">';

if( $uri == 'add' ) {
     $x .= '<input type="hidden" id="transfer_from" name="transfer_from" value="'. ($stockist_id == 'STOCK IN' ? $stockist_id : sprintf("%'.0" . PAD . "d", $stockist_id) ) .'" />';
     $x .= '<span class="w0"></span>';

     $open_qty = $is_reorder ? READ_ONLY :'';

     $x .= '<span>TRANSFER TO <select name="transfer_to" id="transfer_to" required '. $open_qty .'>'. $transfer_to_dropdown .'</select></span><hr>';
     $x .= '<input type="submit" name="submit" class="btn" value="Transfer" /> ';
}

if( ($exists && $r_by=='' && $transfer_to==$stockist_id) ) {
     $x .= '<input type="submit" name="submit" class="btn" value="Receive" /> ';
}

if( $exists && ISIN_ADMIN && $has_float) {
     $x .= '<input type="submit" name="final" class="btn" value="Accept Receive Final" /> ';
     $x .= '<input type="submit" name="submit" class="btn" value="Consolidate" /> ';
}

$x .= '<input type="hidden" name="bak" value="'.$bak.'" /> ';

if(  $exists && !$transfer_by && !$receive_by && !$void_by && !$stock_in && !$stock_out ) {
     if( ISIN_ADMIN ) $x .= '<input type="submit" name="edit" class="btn" value="Edit" /> ';
     if( ISIN_STOCKIST ) $x .= '<input type="submit" name="void" class="btn" value="Void" /> ';
}

$x .= '<a href="'.get_permalink($bak).'" class="btn">Back</a>';
$x .= '</div></form>';

if( isset( $msg_ret ) ) {
     $x .= '<div class="'.$msgclass.' smaller">'.$msg_ret.'</div>';
}

mysqli_close($con);
echo $x . BACKTOTOP;
?>
