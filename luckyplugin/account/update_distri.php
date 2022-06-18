<?php
if( !preg_match( "/admin|distributors|stockist/i", $_SESSION['user_type'] ) && !ENROLL_ON ) exit;

if( isset($_POST) ) {
     defined('INCLUDE_CHECK') || define('INCLUDE_CHECK',1);
     require_once plugin_dir_path( __DIR__ ) . 'templates/setup.php';
// print_r($_POST);
// echo '<br><br>';

     foreach( $_POST as $k=>$v ) $$k=$v;
     $_SESSION['return_msg'] = $_SESSION['found'] = null;
     $slug      = $_SESSION['load_id'];
     $newdistri = $_SESSION['newdistri'];

     unset($_POST['oldid']);
     unset($_POST['oldun']);
     unset($_SESSION['load_id']);
     unset($_SESSION['newdistri']);
     $_SESSION['post'] = $_POST;

     $tbl = 'distributors';
     $con = SQLi(DBPRF);
// echo '<br>test 0<br>';

     if( $slug == '' ) {
          $_POST['dsdid']    = sprintf("%'.0".PAD."d\n", find_lastid() );
          $_POST['pw']       = sha1( trim_escape( $con, $_POST['dsbirth'] . ASIN . $_POST['dsdid'] ) );
          $_POST['discount'] = hash( 'crc32', time() . $_POST['dsdid'] );
     }
// echo '<br>test 1<br>';

     if( isset($_SESSION['snc_referrer']) ) {
          $_POST['dssid'] = $_SESSION['snc_referrer'];
          $_POST['dsmtype'] = 4;
          $tbl = 'for_encoding';

     } elseif( $_SESSION['user_type'] == 'stockist' ) {
          $_POST['dsencoded'] = date('mdY');
          $_POST['dsencodedby'] = STOCKIST_ID;
     }
// echo '<br>test 2<br>';

     if( isset($_POST['un']) ) {
          testPOST( 'distributors', $_SESSION['post'] );
          if( !$_SESSION['found'] ) {
               testPOST( 'for_encoding', $_SESSION['post'] );
          }

          if( isset($_FILES) ) {
               $img = $_FILES['qrcode'];
               $ext = strtolower( pathinfo($img['name'], PATHINFO_EXTENSION));
               $fn  = $dsdid."_$payout.$ext";
               move_uploaded_file( $img['tmp_name'], DOC_ROOT."/qrcode/$fn");
          }

          if( !isset($_SESSION['return_msg']['msg']) ) {
               $int = "/dsdid|dssid|dssex|payout|dsmtype|dsstatus/i";
               list($kdata,$idata,$udata) = set_kiu($con,$_POST,$int);
               $_SESSION['return_msg']['msg'] = 'Update success';
               $_SESSION['return_msg']['class'] = 1;
          }

          $slug = ISIN_ADMIN ? '?' . $_POST['dsdid'] :'';
     }
// echo "$con<br><br>$tbl<br><br>$kdata<br><br>$idata<br><br>$udata";
     if( $_SESSION['return_msg']['class'] == 1 ) {
          $last_id = insert_duplicate($con,$tbl,$kdata,$idata,$udata);
          init_logs(1, $tbl, ( $dsdid!='' ? $dsdid :'99999999' ), ( ISIN_ADMIN ? ADMIN_ID : ( ISIN_DISTRI ? DISTRI_ID :'newdistri' ) ) );

          if( isset($_SESSION['snc_referrer']) ) {
               $_SESSION['enroll_success']['name'] = "$dsfnam $dslnam";
               $_SESSION['enroll_success']['address'] = "$dsstreet $dsbrgy $dscity $dsprov";
               $_SESSION['enroll_success']['contact'] = $dscontact;
               $_SESSION['enroll_success']['referrer'] = ( find_lastid() -1 );

               $ret = get_page_by_title( 'Checkout' );

               $_SESSION['confirm_email']['id'] = $_POST['dsdid'];
               $_SESSION['confirm_email']['name'] = "$dsfnam $dslnam";
               $_SESSION['confirm_email']['dc'] = $_POST['discount'];
               $_SESSION['confirm_email']['to'] = $_POST['dsemail'];
               $_SESSION['confirm_email']['type'] = 'SNC Application';
               require_once plugin_dir_path( __DIR__ ) . 'account/confirm_email.php';

          } elseif( $_SESSION['user_type'] == 'stockist' ) {
               $ret = get_page_by_title( 'Stockist Distributors' );

          } else {
               if( ISIN_DISTRI ) {
                    $_SESSION['pay_type'] = $pay_type;
               }

               $ret = get_page_by_title( (ISIN_ADMIN?'Manage Distributors':'Profile'), '', 'page' );
          }

          echo "<hr><div>Updating. Please wait.</div>";
          reloadTo( get_permalink($ret->ID) . $slug );
          exit;

     } else {
          back_to_form();
     }
}

function testPOST($tbl,$post) {
     foreach( $post as $k=>$v ) $$k=$v;

     $con = SQLi(DBPRF);
     $min_age = 5;
// echo '<br>test 3<br>';

     $d = DateTime::createFromFormat('mdY',$dsbirth);
     if( $d && $d->format('mdY') == $dsbirth ) {
          $d1 = new DateTime( $d->format('Y-m-d') );
          $i  = $d1->diff(new DateTime());

          if( $i->y < $min_age ) {
               $_SESSION['return_msg']['msg'] = 'Should be at least ' . $min_age . ' years old';
               back_to_form();
          }
     }
// echo '<br>test 4<br>';

     $wer      = ISIN_ADMIN ? "dsdid='".$dsdid."' OR un='".$un."'" : "dsdid<>'".DISTRI_ID."' AND un='".$un."'";
     $qry      = "SELECT dsdid,un FROM $tbl WHERE $wer";
     $testuser = mysqli_query( $con, $qry ) or die(mysqli_error($con));
     $_SESSION['found'] = mysqli_num_rows($testuser);
// echo '<br>test 5<br>';
// echo '<br>'.$qry.'<br>';

     $testun   = mysqli_query( $con, "SELECT dsdid,un FROM $tbl WHERE un='$un'" ) or die(mysqli_error($con));
     $r        = mysqli_fetch_assoc($testun);
// echo '<br>test 6<br>';
// echo '<br>'."( $un!=$oldun || $slug=='' ) && ( ". $r['un'] ."==$un && ". $r['dsdid'] ."!=$dsdid )".'<br>';

     if( ( $un!=$oldun || $slug=='' ) && ( $r['un']==$un && $r['dsdid']!=$dsdid ) ) {
          $_SESSION['return_msg']['msg'] = 'Username exists';
          back_to_form();
     }
// echo '<br>test 7<br>';

     if( $r['dsdid']!=$dsdid ) {
          $duplicate = mysqli_query( $con, "SELECT * FROM $tbl WHERE dslnam='$dslnam' AND dsfnam='$dsfnam' AND dsmother='$dsmother' AND dsbirth='$dsbirth'" ) or die(mysqli_error($con));
          if( mysqli_num_rows($duplicate)>0 ) {
               $_SESSION['return_msg']['msg'] = 'User already exists';
               back_to_form();
          }
     }
// echo '<br>test 8<br>';

     if( ISIN_ADMIN ) {
// echo "<br>SELECT dsdid FROM $tbl WHERE dsdid='$dssid'<br>";
          $testssid = mysqli_query( $con, "SELECT dsdid FROM $tbl WHERE dsdid='$dssid'" ) or die(mysqli_error($con));
          if( mysqli_num_rows($testssid)==0 ) {
               $_SESSION['return_msg']['msg'] = 'Sponsor ID not found';
               back_to_form();
          }

          $testuser = mysqli_query( $con, "SELECT dsdid FROM $tbl WHERE dsdid='$dsdid'" ) or die(mysqli_error($con));
          $r        = mysqli_fetch_assoc($testuser);
          if( $newdistri && ( ( $slug=='' && $r['dsdid']==$dsdid ) || ( $r['dsdid']==$dsdid && $dsdid!=$oldid ) ) ) {
               $_SESSION['return_msg']['msg'] = 'Distributor ID exists';
               back_to_form();
          }
     }
// echo '<br>test 9<br>';

     if( ISIN_DISTRI ) {
          if( mysqli_num_rows($testuser)>0 ) {
               $_SESSION['return_msg']['msg'] = 'Username exists';
               back_to_form();
          }
     }

}

function back_to_form() {
// echo $_SESSION['return_msg']['msg'];
     reloadTo( wp_get_referer() );
     exit;
}
?>
