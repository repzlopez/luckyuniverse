<?php global $luckyuser,$msg_ret,$msgclass;

if( !empty( $_POST ) ) {
     defined('INCLUDE_CHECK') || define('INCLUDE_CHECK',1);
     require_once('setup.php');

     switch ( $luckyuser['user_type'] ) {
          case 'admin':
               $wer = 'un';
               $lid = 'un';
               break;
          case 'distributors':
               $wer = 'dsdid';
               $lid = 'id';
               break;
          case 'customers':
          case 'stockist':
               $wer = 'id';
               $lid = 'id';
               break;
     }
     updatepass( $_POST, $luckyuser['user_type'], $wer, $luckyuser[$lid] );
}

if( isset( $msg_ret ) ) {
     $ret = '<span class="'.$msgclass.' smaller">'.$msg_ret.'</span>';
     switch (true) {
          case stristr($msg_ret,'success'):
               $success = $ret;
               break;
          case stristr($msg_ret,'Old'):
               $bad_old = $ret;
               $styleold = 'class="bad"';
               break;
          case stristr($msg_ret,'New'):
               $bad_new = $ret;
               $stylenew = 'class="bad"';
               break;
          default:
               $stylenew=$styleold='';
               break;
     }
}

function updatepass( $post, $tbl, $wer, $id ) {
     $con = SQLi(DBPRF);
     $pass_min = 8;
     $_SESSION['return_msg'] = null;

     foreach ( $post as $k=>$v ) $$k=$v;

     if( trim($newpw) != trim($conpw) ) {
          $_SESSION['return_msg']['msg']='New password mismatch';
     } elseif( strlen(trim($newpw)) < $pass_min ) {
          $_SESSION['return_msg']['msg']="Password must be at least $pass_min characters";
     } else {
          $oldpw    = sha1( trim_escape( $con, $oldpw . ASIN . $id ) );
          $newpw    = sha1( trim_escape( $con, $newpw . ASIN . $id ) );
          $qry      = "SELECT pw FROM $tbl WHERE $wer='$id'";

          $test     = mysqli_query( $con, $qry) or die(mysqli_error( $con ));
          $r        = mysqli_fetch_array( $test );
          $pwsql    = stripslashes( $r['pw'] );

          if( $oldpw != $pwsql ) {           //test old pw
               $_SESSION['return_msg']['msg']='Old password mismatch';
          } else {
               mysqli_query($con,"UPDATE $tbl SET pw='$newpw' WHERE $wer='$id'") or die(mysqli_error($con));
               $_SESSION['return_msg']['msg']='Password update success';
               $_SESSION['return_msg']['class']=1;
               init_logs(1,$tbl,( ISIN_ADMIN ? $_SESSION['id'] : $id ),( ISIN_ADMIN ? ADMIN_ID : $id ));
          }
          mysqli_close($con);
     }

     wp_redirect( wp_get_referer() );
	exit;
}
?>
<form method="post" action="<?php echo esc_url( admin_url('admin-post.php') ); ?>" class="form-data" id="update_pass"><ul>
     <li><h3>Update Password</h3><input type="hidden" name="action" value="update_pass" /></li>
     <li><input type="password" name="oldpw" <?php echo $styleold;?> placeholder="current password" required /> <?php echo $bad_old; ?></li>
     <li><hr></li>
     <li><input type="password" name="newpw" <?php echo $stylenew;?> placeholder="new password" minlength=8 required /></li>
     <li><input type="password" name="conpw" <?php echo $stylenew;?> placeholder="re-enter password" minlength=8 required /> <?php echo $bad_new; ?></li>
     <li><hr></li>
     <li><input type="submit" class="btn" value="Update Password" /> <?php echo $success; ?></li>
</ul></form>
