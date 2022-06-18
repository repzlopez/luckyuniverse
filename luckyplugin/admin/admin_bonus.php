<?php
global $msg_ret,$msgclass;
require_once plugin_dir_path( __DIR__ ) . 'templates/init_setup.php';

if( !empty($_POST) ) {
     $con = SQLi(DBOPS);
     $wds = 'withdrawals' . SEL_YEAR;
     if( init_table($con,$bns) ) {
          foreach ($_SESSION['autopayout'] as $k=>$v) {
               $qry1 = "INSERT INTO $wds (id,dsdid,amount,purpose,requested) VALUES ('',$k,$v,2,'". date(TMDSET) ."')";
               mysqli_query( $con, $qry1 ) or die( mysqli_error($con) );
               $last_id = mysqli_insert_id( $con );

               $bns  = 'bonus' . SEL_YEAR;
               if( init_table($con,$bns) ) {
                    $qry2 = "UPDATE $bns SET wid_id=$last_id WHERE dsdid=$k AND status=0";
                    mysqli_query($con,$qry2);
               }

          }
     }

     mysqli_close($con);
     unset($_POST);

     echo '<h5>Automatic Payout successfully processed</h5>';
     echo '<p>Loading... Please wait...</p>';
     $ret = get_page_by_title( $post->post_title, '', 'page' );
     reloadTo( get_permalink($ret->ID), 3 );
     exit;
}

$x  = '<div class="rt"><form method="post">';
$x .= '<input type="submit" name="submit" class="btn" title="Click to run bonus" value="Run Bonus" />';
$x .= '</form></div><hr>';

$con  = SQLi(DBOPS);
$bns  = 'bonus' . SEL_YEAR;
$tns  = 'transactions' . SEL_YEAR;
$test = 0;

if( init_table($con,$tns) ) {
     $qry = "SELECT b.dsdid,SUM(b.bonus) sum,d.nam
          FROM $bns b
          LEFT JOIN (SELECT dsdid,CONCAT(dsfnam,' ',dslnam) nam,pay_type FROM ".DB.DBPRF.".distributors) d ON d.dsdid=b.dsdid
          WHERE b.status=0
          AND b.wid_id IS NULL
          AND d.pay_type=0
          GROUP BY b.dsdid
          ORDER BY b.dsdid";

     $rs  = mysqli_query($con,$qry) or die(mysqli_error($con));
     $test = 1;
}

if( mysqli_num_rows($rs)>0 && $test ) {
     $_SESSION['autopayout'] = array();

     $x .= '<h4>Pending Automatic Payouts<h4>';
     $x .= '<ul id="autopayout" class="listing"><li>';
     $x .= '<strong class="w6">Distributor</strong> ';
     $x .= '<strong class="w3 rt">Amount</strong> ';
     $x .= '</li>';

     while( $r = mysqli_fetch_assoc( $rs ) ) {
          foreach ( $r as $k=>$v ) $$k = utf8_encode($v);

          $x .= '<li>';
          $x .= '<span class="w6" title="'. $nam.'">'. $dsdid . ' ' . $nam .'</span> ';
          $x .= '<span class="w3 rt amt">'.number_format($sum,2).'</span> ';
          $x .= '</li>';

          $_SESSION['autopayout'][$dsdid] = number_format( $sum, 2, '.', '' );
     }

     $x .= '</ul>';

} else $x = '<h5>NO PENDING AUTOMATIC PAYOUT FOUND IN '. SEL_YEAR .'</h5>';

echo $x . BACKTOTOP;
?>
