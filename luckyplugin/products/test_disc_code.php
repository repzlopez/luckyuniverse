<?php
if( !isset($_SESSION) ) session_start();

if( !empty( $_POST ) ) {
     $_SESSION['return_msg'] = null;
     $_SESSION['discount'] = null;
     $code = $_POST['code'];
     unset($_POST['code']);

     require_once '../templates/init_setup.php';
     echo test_discount_code($code);
}

function test_discount_code($code) {
     $con = SQLi(DBPRF);
     $qry = "SELECT dsdid FROM distributors WHERE discount='$code'";
     $rs  = mysqli_query($con,$qry) or die(mysqli_error($con));
     $res = mysqli_num_rows($rs);

     if( $res>0 ) {
          $r = mysqli_fetch_assoc( $rs );

          $_SESSION['discount']['code']  = $code;
          $_SESSION['discount']['dsdid'] = $r['dsdid'];

          $_SESSION['return_msg']['msg'] = 'DISCOUNT CODE APPLIED';
          $_SESSION['return_msg']['class'] = 1;
     }
     return $res;
}
?>
