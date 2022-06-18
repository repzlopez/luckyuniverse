<?php
defined('INCLUDE_CHECK') || define('INCLUDE_CHECK',1);
require_once plugin_dir_path( __DIR__ ) . 'templates/init_setup.php';

if( isset($_GET['backup'] ) ) {
     $tbl = $_GET['backup'];
     $pat = 'assets/temp/';
     $csv = 'Backup_' . ucwords($tbl) . '_' . date('mdY',time()) . '.csv';

     $ret = array();
     $con = SQLi(DBPRF);
     $qry = "SELECT * FROM $tbl";

     $ex  = plugin_dir_path( __DIR__ ) . $pat . $csv;
     $dl  = plugin_dir_url( __DIR__ ) . $pat . $csv;
     $qry = "SELECT * INTO OUTFILE '$dl'
     FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"'
     LINES TERMINATED BY \"\n\"
     FROM my_table";
echo $ex.'<br>';
     // $rs  = mysqli_query( $con, $qry );

     $ret = get_page_by_title( 'Tools', '', 'page' );
     echo '<hr><a href="'. $dl .'">'.$csv.'</a><br><br>';
     echo '<hr><div id="bottom_nav"><a href="'.get_permalink( $ret->ID ).'" class="btn">BACK</a></div>';
     // $i = 0;
     // if( mysqli_num_rows($rs) > 0 ) {
     //      while( $r = mysqli_fetch_assoc($rs) ) {
     //           foreach ($r as $k=>$v) {
     //                if( $k == 'pw') $v = null;
     //                $ret[$i][$k] = $v;
     //           }
     //
     //           $i++;
     //      }
     // }
// print_r($ret);
     // exportCSV($csv,$pat,$ret);
}

function exportCSV($csv,$pat,$dat){
     $ex = plugin_dir_path( __DIR__ ) . $pat . $csv;
     $dl = plugin_dir_url( __DIR__ ) . $pat . $csv;

     header( 'Content-type: text/csv' );
     header( 'Content-disposition: attachment; filename=' . $ex );
     // Disable caching
     header( 'Cache-Control: no-cache, no-store, must-revalidate' ); // HTTP 1.1
     header( 'Pragma: no-cache' ); // HTTP 1.0
     header( 'Expires: 0' ); // Proxies
     header( 'Content-Transfer-Encoding: UTF-8' );

     $file = fopen( $ex, 'w' );

      $past = 0;
      foreach ($dat as $v) {
          if( !$past ) {
               fputcsv( $file, array_keys($v) );
               $past = 1;
          }

          fputcsv( $file, $v );
     }

     fclose( $file );

     $ret = get_page_by_title( 'Tools', '', 'page' );
     echo '<a href="'. $dl .'">Download '.$csv.'</a>';
     echo '<hr><div id="bottom_nav"><a href="'.get_permalink( $ret->ID ).'" class="btn">BACK</a></div>';
}
?>
