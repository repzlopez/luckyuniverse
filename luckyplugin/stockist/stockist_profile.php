<?php if( !ISIN_ADMIN && !ISIN_STOCKIST ) exit;

global $arrLevel,$msg_ret,$msgclass;
$cid = ISIN_STOCKIST ? STOCKIST_ID : ( $uri!='' ? $uri :null );
$_SESSION['load_id'] = $cid;
$wer = trim($cid) !='' ? "WHERE id=$cid" : null;
$tns = 'transactions' . SEL_YEAR;
$qry = "SELECT *,
          (SELECT CONCAT(dsfnam,' ',dslnam) nam FROM ".DB.DBPRF.".distributors WHERE dsdid=s.oic) nam,
          (SELECT SUM(qty) FROM ".DB.DBSTK.".stocks WHERE warehouse=s.id) total_stock,
          (SELECT receive_date FROM ".DB.DBSTK.".transfers WHERE transfer_to=s.id ORDER BY receive_date DESC LIMIT 1) last_transfer,
          (SELECT encoded_on FROM ".DB.DBOPS.".$tns WHERE encoded_by=s.id ORDER BY encoded_on DESC LIMIT 1) last_sale
     FROM stockist s
     WHERE id>0 AND id='$cid'";

$x   = null;

$con = SQLi(DBPRF);
$rs  = mysqli_query($con,$qry) or die(mysqli_error($con));

if( mysqli_num_rows($rs) > 0 ) {
     $r = mysqli_fetch_assoc($rs);
     foreach ( $r as $k=>$v ) $$k = utf8_encode($v);
     $last_date = $last_transfer > $last_sale ? $last_transfer : $last_sale;
     $last_date = $last_date>0 ? $last_date :'na';
     list($rdate, $flushout, $rdiff) = countDays($last_date);

} else {
     $rs = mysqli_query("DESCRIBE stockist");
     while( $r=mysqli_fetch_assoc($rs) ) {
          foreach ( $r as $k=>$v ) {
               if( preg_match( "/level|status/i", $k ) ) {
                    $$k = 0;
               } else $$k = null;
          }
     }
}

mysqli_close($con);

if( ISIN_ADMIN ) {
     $sel_upline = '<select name="upline">';
     $con = SQLi(DBPRF);
     $qry = "SELECT id wid,warehouse wh FROM stockist WHERE id>0 AND id<>'$cid'";

     $rs  = mysqli_query($con,$qry) or die(mysqli_error($con));
     while( $r=mysqli_fetch_assoc($rs) ) {
          foreach ( $r as $k=>$v ) $$k=$v;
          $sel_upline .= '<option value='.$wid.' '.($wid==$upline?SELECTED:'').'>'.$wh.'</option>';
     } $sel_upline.='</select>';

     $sel_level = '<select name="level">';
     foreach ( $arrLevel as $k=>$v ) {
          $sel_level .= '<option value='.$k.' '.($k==$level?SELECTED:'').'>'.$v.'</option>';
     } $sel_level.='</select>';

} else $sel_level = '<strong>'.$arrLevel[$level].'</strong>';

$x .= '<form method="post" action="'.esc_url( admin_url('admin-post.php') ).'" id="admin" class="stockist"><input type="hidden" name="action" value="update_stockist" /><ul>';
$x .= '<li'.( ISIN_ADMIN ? '': ' class="hide"' ).'><strong class="w3">ID</strong> <input type="text" class="w4" name="id" placeholder="Stockist ID" value="'.$id.'" /><input type="hidden" name="oldid" value="'.$id.'" /></li>';
if( ISIN_ADMIN ) $x .= '<li><strong class="w3">Password:</strong> <input type="password" name="pw" class="txt w4" value="" minlength=8 autocomplete="new-password" /> <span class="dashicons dashicons-privacy" title="Click to encrypt password"></span><span class="smaller">Click to encrypt password</span></li>';
$x .= '<li><strong class="w3">Warehouse</strong> '.(ISIN_ADMIN ? '<input type="text" class="w4" name="warehouse" placeholder="Warehouse Name" value="'.$warehouse.'" />' : '<strong>'.$warehouse.'</strong>' ).'</li>';
$x .= '<li><strong class="w3">OIC</strong> '.(ISIN_ADMIN ? '<input type="text" class="w4" id="oic_id" name="oic" placeholder="OIC Distributor ID" value="'.$oic.'" /> <span class="smaller">'.utf8_decode($nam).'</span>' : '<strong>'.utf8_decode($nam).'</strong>' ).'</li>';
if( ISIN_ADMIN ) $x .= '<li><strong class="w3">Upline Stockist:</strong> '.$sel_upline.' <span class="smaller"></span></li>';
$x .= '<li><hr></li>';
$x .= '<li><strong class="w3">Receiver</strong> <input type="text" class="w6" name="receiver" placeholder="Name of usual receiver" value="'.$receiver.'" /></li>';
$x .= '<li><strong class="w3">Contact</strong> <input type="text" class="w6" name="contact" placeholder="Contact number" value="'.$contact.'" /></li>';
$x .= '<li><strong class="w3">Address</strong> <input type="text" class="w6" name="address" placeholder="Delivery address" value="'.$address.'" /></li>';
$x .= '<li><strong class="w3">Courier</strong> <input type="text" class="w6" name="courier" placeholder="Preferred courier" value="'.$courier.'" /></li>';
$x .= '<li><hr></li>';

$start_date = ( $start_date!='' ? $start_date : date('mdY') );
$srt = substr($start_date,0,2) .'/'. substr($start_date,2,2) .'/'. substr($start_date,-4);

$x .= '<li><strong class="w3">Start Date: </strong> '.(ISIN_ADMIN ? '<input type="text" name="start_date" class="w4" value="'.$srt.'" /> <span class="bad smaller">'.($start_date=='99999999'?'INVALID':'').'</span>' : '<strong>'.$srt.'</strong>' ).'</li>';
$x .= '<li><strong class="w3">Level</strong> '.$sel_level.'</li>';
if( ISIN_ADMIN ) $x .= '<li><strong class="w3">Status:</strong> <label class="smaller"><input type="hidden" name="status" value=0 /><input type="checkbox" name="status" value=1 '.($status?CHECKED:'').' /> Check to ENABLE</label></li>';

if( ISIN_ADMIN ) $x .= '<li><hr><strong class="w3" style="vertical-align:top;line-height:80px;">Partners:</strong> <textarea name="partners" class="w6" style="height:100px;" placeholder="ADD Partner Warehouse ID, one ID per row">'.$partners.'</textarea>';
if( ISIN_ADMIN ) $x .= '<br><strong class="w3"></strong> <span class="smaller">** ADD Partner Warehouse ID, one ID per row</span></li>';

if( $total_stock>0 ) {
     if( ISIN_ADMIN ) $x .= '<li><hr><strong class="w3">Stocks</strong> <strong>'.number_format((int)$total_stock,0,'',',').' items</strong></li>';
     if( ISIN_ADMIN ) $x .= '<li><strong class="w3">Flushout</strong> <strong class="w3 '. ( $rdiff<0 ? 'bad' :'') .'">'.$flushout.'</strong> <strong><em '. ( $rdiff<0 ? 'class="bad"' :'') .'>'.( $rdiff<0 ? 'FOR FLUSHOUT': $rdiff.' days left' ) .'</em></strong></li>';
} else {
     if( ISIN_ADMIN ) $x .= '<li><hr><strong class="w3">Stocks</strong> <strong>NO ON-HAND STOCK</strong></li>';
}

$ret = get_page_by_title( 'Manage Stockist', '', 'page' );
$back = ( ISIN_ADMIN ) ? ' <input type="button" href="'.get_permalink( $ret->ID ).'" class="btn link" value="Back" />' :'';
$x .= '<li><hr><input type="submit" name="submit" class="btn" value="Submit" />'.$back.' <span class="'.$msgclass.' smaller">'.$msg_ret.'</span></li>';
$x .= '</ul></form>';

if( ISIN_STOCKIST ) echo $x;
echo BACKTOTOP;
?>
