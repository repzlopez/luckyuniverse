<?php
$yr = $uri !== false ? $uri : date('Y');

global $post;
$sel = '<div class="rt"><select class="byDate">';
for ( $i = date('Y'); $i >= YEAR_1; $i-- ) {
     $sel .= '<option value="/admin/'.$post->post_name.'/?'.$i.'" '.($i==$yr?SELECTED:'').'>'.$i.'</option>';
}
$sel .= '</select><hr></div>';
echo $sel;

$con  = SQLi(DBOPS);
$tbl  = 'survey' . $yr;
$test = 0;

if( init_table($con,$tbl) ) {
     $qry = "SELECT *,
          (SELECT COUNT(id) FROM $tbl WHERE lu_fb=1) lufb,
          (SELECT COUNT(id) FROM $tbl WHERE dhub_fb=1) dhubfb,
          (SELECT COUNT(id) FROM $tbl WHERE lu_web=1) luweb,
          (SELECT COUNT(id) FROM $tbl WHERE refer>0) referred
          FROM $tbl ORDER BY id";
     $rs  = mysqli_query($con,$qry) or die(mysqli_error($con));
     $test = 1;
}

if( mysqli_num_rows($rs)>0 && $test ) {
     $x  = '<ul class="survey"><li>';
     $x .= '<strong class="w3">Contact #</strong>';
     $x .= '<strong class="w2 ct">LU FB</strong>';
     $x .= '<strong class="w2 ct">DHub FB</strong>';
     $x .= '<strong class="w2 ct">LU Web</strong>';
     $x .= '<strong class="w3">Referrer</strong>';
     $x .= '</li>';

     while( $r = mysqli_fetch_assoc( $rs ) ) {
          foreach ( $r as $k=>$v ) $$k = utf8_encode($v);

          $x .= '<li>';
          $x .= '<span class="w3">'.$contact.'</span>';
          $x .= '<span class="w2 ct dashicons dashicons-'.($lu_fb?'yes':'no').'"></span>';
          $x .= '<span class="w2 ct dashicons dashicons-'.($dhub_fb?'yes':'no').'"></span>';
          $x .= '<span class="w2 ct dashicons dashicons-'.($lu_web?'yes':'no').'"></span>';
          $x .= '<span class="w3">'.($refer!=0?$refer:'- none -').'</span>';
          $x .= '</li>';
     }

     $x .= '<li></li><li></li>';
     $x .= '</ul>';
} else $x = '<h5>NO SURVEYS FOUND</h5>';

$x .= '<hr><br><ul class="survey">';
$x .= '<h5>Surveys in <strong><em>'.$yr.'</strong></em></h5>';
$x .= '<li><span class="w3">LU FB:</span><strong class="w2 ct">'.$lufb.'</strong></li>';
$x .= '<li><span class="w3">DHub FB:</span><strong class="w2 ct">'.$dhubfb.'</strong></li>';
$x .= '<li><span class="w3">LU Website:</span><strong class="w2 ct">'.$luweb.'</strong></li>';
$x .= '<li><span class="w3">Referred:</span><strong class="w2 ct">'.$referred.'</strong></li>';
$x .= '</ul>';

echo $x . BACKTOTOP;
?>
