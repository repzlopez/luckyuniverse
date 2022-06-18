<?php if( !preg_match( "/admin|stockist/i", $_SESSION['user_type'] ) ) exit;

global $post;
unset($_SESSION['reorders']);
$_SESSION['fees_on'] = 1;

$sel = '<div class="rt"><select class="byDate">';
for ( $i = date('Y'); $i >= YEAR_1; $i-- ) {
     $sel .= '<option value="/stockist/'.$post->post_name.'/?'.$i.'" '.($i==SEL_YEAR?SELECTED:'').'>'.$i.'</option>';
}
$sel .= '</select><hr></div>';
echo $sel;

if( ISIN_STOCKIST ) {
     $add = "WHERE s.warehouse='".STOCKIST_ID."'";
}

$con  = SQLi(DBOPS);
$tbl  = 'stockistfee' . SEL_YEAR;
$test = 0;

if( init_table($con,$tbl) ) {
     $qry = "SELECT s.*,r.approved FROM $tbl s
          LEFT JOIN ".DB.DBSTK.".reorders r ON r.id=s.reorder_id
          $add
          ORDER BY s.status,s.id";

     $rs  = mysqli_query($con,$qry) or die(mysqli_error($con));
     $test = 1;
}

if( mysqli_num_rows($rs)>0 && $test ) {
     $x  = '<ul id="reorders">';

     $x .= '<li>';
          $x .= '<strong class="w3">Reorder#</strong> ';
          $x .= '<strong class="w3 rt">Date</strong> ';
          $x .= '<strong class="w3 rt">POV</strong> ';
          $x .= '<strong class="w3 rt">Stockist Fee</strong> ';
     $x .= '</li>';

     $rdr = get_page_by_title( 'Reorder', '', 'page' );

     while( $r = mysqli_fetch_assoc( $rs ) ) {
          foreach ( $r as $k=>$v ) $$k = utf8_encode($v);

          $x .= '<li>';
          $x .= '<a href="'.get_permalink($rdr->ID).'?'.$reorder_id.'" class="w3">'.$reorder_id.'</a> ';
          $x .= '<span class="w3 rt">'.date(mdY, strtotime($approved)).'</span> ';
          $x .= '<span class="w3 rt">'.number_format($pov, 2).'</span> ';
          $x .= '<span class="w3 rt">'.number_format($bonus, 2).'</span> ';
          $x .= '</li>';
     }

     $x .= '</ul>';
     mysqli_close($con);
} else $x = '<h5>Oops! No Stockist Fees in '.SEL_YEAR.'!</h5>';

echo $x . BACKTOTOP;
?>
