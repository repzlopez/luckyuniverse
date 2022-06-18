<?php
if( !isset($_SESSION) ) session_start();

$y= $z= $req= $package= $stockist= null;
$ret = get_page_by_title( $post->post_title, '', 'page' );

if( strpos($uri ,'add') !== false ) {
     $uris = explode("&", $uri);

     $package = substr($uris[1], strpos($uris[1],'=') +1);
     $stockist = substr($uris[2], strpos($uris[2],'=') +1);

     if( $stockist != '' ) {
          $con = SQLi(DBPRF);
          $qry = "SELECT *,
                    (SELECT warehouse FROM stockist WHERE id = $stockist) stk
               FROM packages
               WHERE id = $package";

          $rs  = mysqli_query($con,$qry) or die(mysqli_error($con));

          foreach (mysqli_fetch_array($rs) as $k=>$v) $$k = $v;

          $itm = explode("\n", $items);
          $arr = array();
          $avail= $fail= $can_build= 0;
          $count_items = count($itm);
          $count= array();

// echo $count_items . '<br><br>';

          foreach ( $itm as $n ) { // SCAN AVAILABLE STOCKS
               $avail = 0;
               $ndv = explode(':', $n);
               $hav = (int)scan_stocks($stockist . $ndv[0]);
               $arr[ $ndv[0] ] = $ndv[1];

               $fail += $hav < $ndv[1];
               $avail = $hav / $ndv[1];

               $count[] = floor( $avail );

               $req .= '<div>';
                    $req .= '<span class="w0"></span> ';
                    $req .= '<span class="w1">' . $ndv[0] . '</span> ';

                    $req .= '<span class="w1"></span> ';
                    $req .= '<span class="w1">' . $ndv[1] . '</span> ';

                    $req .= '<span class="w1"></span> ';
                    $req .= '<span class="w1 '.( $hav<$ndv[1] ? 'bad' :'good').'">' . $hav . '</span>';
               $req .= '</div>';
          }
          sort($count);
          $can_build = $count[0];
// echo "<br>FAIL = $fail<br>";

          $z .= '<hr>';
          $z .= $fail ? '<h5 class="bad">Stockist does not have enough stocks</h5><br>' :'';
          $z .= '<h5><span class="w5">This package requires</span> : <span class="w5">Stockist has</span></h5><br>';
          $z .= $req;

     }


}

if( !empty($_POST) ) {
     foreach ($_POST as $k=>$v) $$k = $v;

     if( !$fail ) {

          for ($i=0; $i < $build_qty; $i++) { // BUILD QUANTITY
               foreach ( $arr as $k=>$v ) { // BUILD PACKAGE
     // echo "$package, $k, $stockist, $v<br>";
                    build_package( $package, $k, $stockist, $v );
                              // $pak, $req, $stk, $qty
               }
// echo '<br>';
          }

          $con = SQLi(DBOPS);
          $tbl = 'assemble' . SEL_YEAR;
          $dat = date(TMDSET);
          $qry = "INSERT INTO $tbl VALUES ('', $package, $stockist, $build_qty, '$dat');";

          mysqli_query( $con, $qry ) or die( mysqli_error($con) );
     }

     mysqli_close($con);
     unset($_POST);

     if( !$fail ) {
          echo '<h5>'. $build_qty .' unit'. ($build_qty>1 ? 's':'') .' of '. $name .'</h5>';
          echo '<div>has been added to<br><div>';
          echo '<h5>'. $stk .'</h5>';
          echo $z;

          reloadTo( get_permalink($ret->ID), 5 );
          exit;
     }

// } else {
//
//      $con  = SQLi(DBOPS);
//      $tbl  = 'assemble' . SEL_YEAR;
//
//      if( strpos($uri ,'add') === false ) {
//           $rs  = mysqli_query($con, "SELECT * FROM $tbl WHERE id=$uri") or die(mysqli_error($con));
//           foreach (mysqli_fetch_array($rs) as $k=>$v) $$k = $v;
//
//      }

} // end _POST

$submit = ( strpos($uri ,'add') !== false ) ? '<input type="submit" class="btn" value="Submit" /> ' :'';

$x  = '<h4>Assemble Package</h4><form method="post" id="assemble"><ul>';
$x .= '<li><label class="w3">Package</label> <select name="package" required>'.load_package_list($package).'</select></li>';
$x .= '<li><label class="w3">Warehouse</label> <select name="stockist" required>'.load_stockist_list($stockist).'</select></li>';
$x .= '<li><label class="w3">Quantity</label> <input type="number" name="build_qty" class="w3" value="'.(int)$can_build.'" min=0 max='.(int)$can_build.' step=1 required /></li>';
$x .= '<li>'.$z.'</li>';
$x .= '<li><hr>'. $submit .'<input type="button" href="'.get_permalink( $ret->ID ).'" class="btn link" value="Back" /></li>';
$x .= '</ul></form>';

echo $x . BACKTOTOP;

function scan_stocks($id){
     $con = SQLi(DBSTK);
     $qry = "SELECT qty FROM stocks WHERE id = $id";
     $rs  = mysqli_query($con,$qry) or die(mysqli_error($con));
     $r   = mysqli_fetch_assoc($rs);

     return $r['qty'];
}

function build_package($pak,$req,$stk,$qty) {
     $con = SQLi(DBSTK);
     $qry = "UPDATE stocks SET qty = qty - $qty WHERE id = $stk$req;";
     // mysqli_query($con,$qry) or die(mysqli_error($con));

     $qry = "INSERT INTO stocks VALUES ('$stk$pak',$pak,$stk,null,1) ON DUPLICATE KEY UPDATE qty=qty+1;";
     // mysqli_query($con,$qry) or die(mysqli_error($con));
}
?>
