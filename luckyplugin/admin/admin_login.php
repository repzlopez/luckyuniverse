<?php
if( !empty( $_POST ) ) {
     defined('INCLUDE_CHECK') || define('INCLUDE_CHECK',1);
     require_once plugin_dir_path( __DIR__ ) . 'templates/setup.php';

     $con = SQLi(DBPRF);
     $_SESSION['return_msg'] = null;
     $_SESSION['un'] = null;

     foreach ( $_POST as $k=>$v ) $$k=$v;

     $pw   = sha1( trim_escape( $con, $pw . ASIN . $un ) );
     $qry  = "SELECT * FROM admin WHERE un='$un' AND status=1";
     $test = mysqli_query($con,$qry) or die(mysqli_error($con));

     if( mysqli_num_rows($test) == 0 ){               //test if acct exists
          $_SESSION['return_msg']['msg'] = 'Invalid username or password';
     } else {
          $r = mysqli_fetch_array($test);
          $pwsql = stripslashes($r['pw']);

          if( $pw == $pwsql ){                        //test pass
               foreach ( $r as $k=>$v ) $$k=$v;

               $_SESSION['id']          = $r['id'];
               $_SESSION['un']          = $r['un'];
               $_SESSION['nn']          = $r['nn'];
               $_SESSION['global']      = $r['global'];
               $_SESSION['user_type']   = 'admin';
          } else {
               $_SESSION['return_msg']['msg'] = 'Invalid username or password';
          }
     }
     mysqli_close($con);

     reloadTo( wp_get_referer() );
     exit;
}
?>
