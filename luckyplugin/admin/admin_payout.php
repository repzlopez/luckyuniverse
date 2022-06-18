<?php
if( !empty($_POST) ) {
     if( $_POST['submit'] == 'Release' ) {
          $id  = $_POST['id'];
          releasePayout($id);

          $msg_ret = "Withdrawal # $id successfully APPROVED and RELEASED";
     } else {
          foreach ($_POST['withdraw_id'] as $k=>$v) {
               releasePayout($k);
          }
          $msg_ret = "Selected items successfully APPROVED and RELEASED";
     }

     $_POST = array();
     $msgclass = 'good';
}

global $post,$pay;

if( isset($uri) && strlen($uri) >4 ) {
     $con = SQLi(DBOPS);
     $tbl = 'withdrawals' . date('Y');
     $test = 0;

     if( init_table($con,$tbl) ) {
          $qry = "SELECT w.*,CONCAT(dsfnam,' ',dslnam) nam,payout,pay_acct,pay_name,withheld
               FROM $tbl w
               LEFT JOIN ".DB.DBPRF.".distributors d ON d.dsdid=w.dsdid
               WHERE w.id=$uri AND purpose<>1
               ORDER BY released,w.id";
          $rs  = mysqli_query($con,$qry) or die(mysqli_error($con));
          $r   = mysqli_fetch_assoc( $rs );
          $test = 1;
     }

     if( mysqli_num_rows($rs)>0 && $test ) {
          foreach ($r as $k=>$v) $$k=$v;

          $qrimg = '';
          $arrQR = array();
          $qr_img = glob("./qrcode/$dsdid"."_*.{jpg,jpeg,png,gif}", GLOB_BRACE);

          if( !empty($qr_img) ) {
               foreach ( $qr_img as $v ) {
                    $i = substr( $v, -5, 1 );
                    $arrQR[$i] = strrchr($v, '/');

                    if( strpos( $v, "$dsdid"."_$payout" ) !== false ) {
                         $qrimg = LKY_ROOT.substr($v,1);
                    }
               }
          }
          $x  = '<form method="post" id="manage_withdraw">';
          $x .= '<input type="hidden" name="id" value="'.$uri.'" /><ul>';
          $x .= '<li><label class="w3">Amount:</label> '.number_format($amount,2).'</li>';
          $x .= '<li><label class="w3">Requested By:</label> '.( $dsdid!='' ? $dsdid.' ( '.$nam.' )' :'' ).'</li>';
          $x .= '<li><label class="w3">Requested On:</label> '.$requested.'</li>';
          $x .= '<li><label class="w3">Pay Out:</label> '.trim($pay[$payout]).( $payout ? ' ( '.$pay_acct.' '.$pay_name.' )' :'').'</li>';
          $x .= '<li><label class="w3">QR Code:</label> '.( $qrimg!='' ? '<img src="'.$qrimg.'" />' :'No QR Code').'</li>';
          $x .= $withheld ? '<li><h4 class="bad">BONUS ON HOLD! DO NOT RELEASE!</h4></li>' :'';

          if( ISIN_ADMIN && isset($uri) ) {
               $ret = get_page_by_title( $post->post_title, '', 'page' );
               $back = ' <input type="button" href="'.get_permalink( $ret->ID ).'" class="btn link" value="Back" />';
          }

          $x .= '<li><div><hr>';
          if( $released ) {
               $msg_ret = 'Request released';
          } else {
               $x .= $payout && !$withheld ? '<input type="submit" name="submit" class="btn" value="Release" />' :'';
          }

          $x .= $back.' <span class="'.$msgclass.' smaller">'.$msg_ret.'</span></div>';
          $x .= '</li></ul></form>';

     } else $x = '<h4>INVALID WITHDRAWAL REQUEST</h4>';

} else {
     $arr = array( 'Pending', 'Released' );

     $sel = '<div class="rt"><select class="byDate">';
     for ( $i = date('Y'); $i >= YEAR_1; $i-- ) {
          $sel .= '<option value="/admin/'.$post->post_name.'/?'.$i.'" '.($i==SEL_YEAR?SELECTED:'').'>'.$i.'</option>';
     }
     $sel .= '</select><hr></div>';
     echo $sel;

     $con = SQLi(DBOPS);
     $tbl = 'withdrawals' . SEL_YEAR;
     $test = 0;

     if( init_table($con,$tbl) ) {
          $qry = "SELECT w.*,CONCAT(dsfnam,' ',dslnam) nam,payout,withheld FROM $tbl w
               LEFT JOIN ".DB.DBPRF.".distributors d ON d.dsdid=w.dsdid
               WHERE purpose<>1
               ORDER BY w.released,w.id";
          $rs  = mysqli_query($con,$qry) or die(mysqli_error($con));
          $test = 1;
     }

     if( mysqli_num_rows($rs)>0 ) {
          $ret = get_page_by_title( 'Manage Payout', '', 'page' );
          $led = null;

          $x  = '<form method="post" id="batch_withdraw">';

          while( $r = mysqli_fetch_assoc( $rs ) ) {
               foreach ( $r as $k=>$v ) $$k = utf8_encode($v);

               if( $led!= $released ) {
                    if( !is_null($led) ) $x .= '</ul><hr>';
                    $x .= '<ul><h4>'.$arr[$released].'</h4><li>';
                    $x .= '<span class="w1"></span>';
                    $x .= '<strong class="w3">ID</strong>';
                    $x .= '<strong class="w4">Requested By</strong>';
                    $x .= '<strong class="w2 rt">Amount</strong>';
                    $x .= '<strong class="w3 ct">Payout</strong>';
                    $x .= '</li>';
               }

               $x .= '<li'.( $withheld ? ' class="bad"' :'').'><span class="w1">';
               $x .= $payout && !$released && !$withheld ? '<input type="checkbox" name="withdraw_id['.$id.']" />' :'';
               $x .= '</span><a href="'.get_permalink( $ret->ID ).'?'.$id.'" class="w3">'.$id.'</a>';
               $x .= '<span class="w4" title="'.$dsdid.'">'.$nam.'</span>';
               $x .= '<span class="w2 rt">'.number_format($amount,2).'</span>';
               $x .= '<span class="w3 ct">'.( $withheld ? ' ON HOLD' :$pay[$payout]).'</span>';
               $x .= '</li>';

               $led = $released;
          }

          $x .= '<hr><div id="bottom_nav"><span class="'.$msgclass.' smaller">'.$msg_ret.'</span> <input type="submit" class="btn" value="Batch Approve/Release" /></div></form>';
     } else $x = '<h5>NO PAYOUT REQUEST FOUND</h5>';

}

echo $x . BACKTOTOP;

function releasePayout($id) {
     defined('INCLUDE_CHECK') || define('INCLUDE_CHECK',1);
     require_once plugin_dir_path( __DIR__ ) . 'templates/setup.php';

     $con = SQLi(DBOPS);
     $tbl = 'withdrawals' . SEL_YEAR;
     $qry = "UPDATE $tbl SET
          released_on=NOW(),
          released_by='".ADMIN_ID."',
          released=1
          WHERE id=$id";

     if( init_table($con,$tbl) ) {
          mysqli_query( $con, $qry ) or die( mysqli_error($con) );
     }

     $tbl = 'bonus' . SEL_YEAR;
     $qry = "UPDATE $tbl SET status=1 WHERE wid_id=$id";
     if( init_table($con,$tbl) ) {
          $rs  = mysqli_query($con,$qry);
     }

     mysqli_close($con);

}
?>
