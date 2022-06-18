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
$tbl  = 'sharencare';
$test = 0;

if( init_table($con,$tbl) ) {
     $qry = "SELECT s.*,
               (SELECT CONCAT(dslnam,', ',dsfnam) nam FROM ".DB.DBPRF.".distributors WHERE dsdid=(SELECT s.dsdid) ) nam,
               (SELECT COUNT(dsdid) FROM ".DB.DBOPS.".sharencare WHERE dsdid=(SELECT s.dsdid)) slots,
               (SELECT COUNT(dssid) FROM ".DB.DBOPS.".sharencare WHERE dssid=(SELECT s.dsdid)) spon,
               (SELECT COUNT(dsdid) FROM ".DB.DBOPS.".enroll WHERE dsdid=(SELECT s.dsdid) AND package=".sncReq.") reqs,
               (SELECT date FROM ".DB.DBOPS.".enroll WHERE dsdid=(SELECT s.dsdid) AND package=".sncID." LIMIT 1) open
          FROM $tbl s
          WHERE YEAR(date)=". SEL_YEAR;

     $rs  = mysqli_query($con,$qry) or die(mysqli_error($con));
     $test = 1;
}

if( mysqli_num_rows($rs)>0 && $test ) {
     $x .= '<ul id="snc_list">';
     $x .= '<li>';
          $x .= '<strong class="w3">ID #</strong> ';
          $x .= '<strong class="w5">Name</strong>';
          $x .= '<strong class="w1"><span title="Slots" class="dashicons dashicons-money"></strong>';
          $x .= '<strong class="w1"><span title="Sponsored" class="dashicons dashicons-admin-users"></span></strong>';
          $x .= '<strong class="w1"><span title="Requirements" class="dashicons dashicons-cart"></span></strong>';
          $x .= '<strong class="w1"><span title="Days Left" class="dashicons dashicons-calendar-alt"></span></strong>';
     $x .= '</li>';

     while( $r = mysqli_fetch_assoc($rs) ) {
          foreach ( $r as $k=>$v ) $$k=$v;

          $snc_close = date( mdY, strtotime($open . '+ '. sncSlotExpiry .' days') );
          $day = '86400'; //1 day = 86400 sec
          $d_1 = time();
          $d_2 = strtotime($open . '+ '. sncSlotExpiry .' days');
          $dif = round( ($d_2 - $d_1) / $day );// . ' days left';

          $x .= '<li>';
               $x .= '<span class="w3">'.$dsdid.'</span> ';
               $x .= '<span class="w5">'.$nam.'</span>';
               $x .= '<span class="w1">'.$slots.'</span>';
               $x .= '<span class="w1">'.$spon.'</span>';
               $x .= '<span class="w1">'.$reqs.'</span>';
               $x .= '<span class="w1 '.($dif<0?'bad':'').'" title="'.$snc_close.'">'.$dif.'</span>';
          $x .= '</li>';
     }
     $x .= '</ul>';

} else $x .= '<h5>NO SHARE & CARE FOUND IN '. SEL_YEAR .'</h5>';

echo $x . BACKTOTOP;
?>
