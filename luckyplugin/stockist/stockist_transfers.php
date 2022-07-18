<?php if( !preg_match( "/admin|stockist/i", $_SESSION['user_type'] ) ) exit;
unset($_SESSION['reorders']);

defined('INCLUDE_CHECK') || define('INCLUDE_CHECK',1);
require_once plugin_dir_path( __DIR__ ) . 'templates/init_setup.php';

$yr = $uri !== false ? $uri : date('Y');

global $post;
$sel = '<div class="rt"><select class="byDate">';
for ( $i = date('Y'); $i >= YEAR_1; $i-- ) {
     $sel .= '<option value="/admin/'.$post->post_name.'/?'.$i.'" '.($i==$yr?SELECTED:'').'>'.$i.'</option>';
}
$sel .= '</select><hr></div>';
$x  = $sel;

if( ISIN_STOCKIST ) {
     $add = "AND (transfer_from='" . STOCKIST_ID . "' OR transfer_to='" . STOCKIST_ID ."')";
}

$con  = SQLi(DBSTK);
$tbl  = 'transfers';
$flo  = 'transfers_float' . SEL_YEAR;
$test = 0;

if( init_table($con,$tbl) ) {
     $qry = "SELECT t.*,
               (SELECT warehouse FROM ".DB.DBPRF.".stockist WHERE id=transfer_from) t_from,
               (SELECT warehouse FROM ".DB.DBPRF.".stockist WHERE id=transfer_to) t_to,
               (SELECT SUM(float_qty) FROM ".DB.DBOPS.".$flo WHERE transfer_id=t.id AND float_qty>0) t_float
          FROM $tbl t
          WHERE YEAR(transfer_date)=". SEL_YEAR ."
          $add";

     $rs  = mysqli_query($con,$qry) or die(mysqli_error($con));
     $test = 1;
}

if( mysqli_num_rows($rs)>0 && $test ) {
     $x .= '<ul id="transfers" class="listing">';
     $x .= '<li>';
          $x .= '<strong class="w2">ID #</strong> ';
          $x .= '<strong class="w4">From</strong>';
          $x .= '<strong class="w4">To</strong>';
          // $x .= '<strong class="w3">Date</strong>';
          $x .= '<strong class="w2 ct">Status</strong>';
     $x .= '</li>';

     while( $r = mysqli_fetch_assoc($rs) ) {
          foreach ( $r as $k=>$v ) $$k=$v;

          $tt_from = strpos($transfer_from,'STOCK') !== false ? $transfer_from : $t_from;
          $tt_to   = strpos($transfer_to,'STOCK') !== false ? $transfer_to : $t_to;
          $has_float = $t_float > 0;

          $float_params = ( $has_float ? 'class="bad" title="Transfer has '. $t_float .' floating item'.($t_float>1 ? 's' :'').'"' :'');
          $void_params  = ( ( $void_date != '' ) ? 'class="void" style="text-decoration: line-through;" title="Transfer has been voided"' :'==');

          $x .= '<li '. $float_params . $void_params .'>';
               $x .= '<a href="?'.$id.'" class="w2">'. $id .'</a> ';
               $x .= '<span class="w4">'. $tt_from .' '. ( $has_float ? '<sup class="bad smaller">('.$t_float.')</sup>' :'') .'</span>';
               $x .= '<span class="w4">'. $tt_to .'</span>';
               // $x .= '<span class="w3">'.date(mdY,strtotime($transfer_date)).'</span>';
               $x .= '<span class="w2 ct dashicons dashicons-'.($has_float ? 'warning' : ( $receive_by || $conso_by ? 'yes' : 'no' )).'"></span>';
          $x .= '</li>';
     }
     $x .= '</ul>';

} else $x .= '<h5>NO TRANSFERS FOUND IN '. SEL_YEAR .'</h5>';

$x .= '<hr><div id="bottom_nav"><a href="?add" class="btn">ADD NEW</a></div>';

echo $x . BACKTOTOP;
?>
