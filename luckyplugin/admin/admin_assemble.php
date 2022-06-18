<?php if( !ISIN_ADMIN ) exit;

defined('INCLUDE_CHECK') || define('INCLUDE_CHECK',1);
require_once plugin_dir_path( __DIR__ ) . 'templates/init_setup.php';

$yr = $uri !== false ? $uri : date('Y');

global $post;
$sel = '<div class="rt"><select class="byDate">';
for ( $i = date('Y'); $i >= YEAR_1; $i-- ) {
     $sel .= '<option value="/'.$post->post_name.'/?'.$i.'" '.($i==$yr?SELECTED:'').'>'.$i.'</option>';
}
$sel .= '</select><hr></div>';
$x  = $sel;

$con  = SQLi(DBOPS);
$tbl  = 'assemble' . SEL_YEAR;
$test = 0;

if( init_table($con,$tbl) ) {
     $qry = "SELECT * FROM $tbl WHERE YEAR(date)=". SEL_YEAR;
     $rs  = mysqli_query($con,$qry) or die(mysqli_error($con));
     $test = 1;
}

if( mysqli_num_rows($rs)>0 && $test ) {
     $x .= '<ul>';
     $x .= '<li>';
          $x .= '<strong class="w3">ID #</strong> ';
          $x .= '<strong class="w4">Package</strong>';
          $x .= '<strong class="w4">Warehouse</strong>';
          $x .= '<strong class="w3">Date</strong>';
     $x .= '</li>';

     while( $r = mysqli_fetch_assoc($rs) ) {
          foreach ( $r as $k=>$v ) $$k=$v;

          $x .= '<li>';
               $x .= '<a href="?'.$id.'" class="w3">'.$id.'</a> ';
               $x .= '<span class="w4">'.$package.'</span>';
               $x .= '<span class="w4">'.$warehouse.'</span>';
               $x .= '<span class="w3">'.date(mdY,strtotime($date)).'</span>';
          $x .= '</li>';
     }
     $x .= '</ul>';

} else $x .= '<h5>NO ASSEMBLY FOUND IN '. SEL_YEAR .'</h5>';

$x .= '<hr><div id="bottom_nav"><a href="?add" class="btn">ADD NEW</a></div>';

echo $x . BACKTOTOP;
?>
