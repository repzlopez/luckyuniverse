<?php
global $luckyuser,$msg_ret,$msgclass;
global $arrSex,$arrPayout,$pay;

$id  = ISIN_DISTRI ? DISTRI_ID : ( $uri!='new' && !$_SESSION['enroll'] ? substr($uri, 0, 8) :null);
$mtp = array('Others','Starter','Dreamer','Fast Track','Share & Care');
$_SESSION['load_id']   = $id;
$_SESSION['newdistri'] = ( $uri=='new' );

$arr = array('dsdid','dslnam','dsfnam','dsmnam','dsmnother','nam',
     'dsstreet','dsbrgy','dscity','dsprov',
     'dscontact','dsemail','dsfb','dsbirth','dssex','dssid',
     'un','pw','payout','pay_type','pay_name','pay_acct',
     'dsencoded','dsencodedby','dsstatus',
     'i','bad','styleis','baddate','badspon','badscan','scan');

foreach ( $arr as $v ) { $$v=null; }

if( isset($_SESSION['post']) ) {
     foreach ( $_SESSION['post'] as $k=>$v ) $$k=$v;
     unset($_SESSION['post']);
}

$qry = "SELECT *,
          (SELECT CONCAT(dslnam,', ',dsfnam,' ',dsmnam) FROM distributors s WHERE s.dsdid=d.dssid) nam,
          (SELECT MAX(dsdid) FROM distributors WHERE dsdid < $id ) prv,
          (SELECT MIN(dsdid) FROM distributors WHERE dsdid > $id ) nxt
     FROM distributors d
     WHERE dsdid='$id'";
$con = SQLi(DBPRF);
$rs  = mysqli_query($con,$qry);
if( mysqli_num_rows($rs)>0 ) {
	$r = mysqli_fetch_assoc( $rs );
	foreach ( $r as $k=>$v ) $$k=stripslashes($v);
}

if( isset( $msg_ret ) ) {
     $ret = '<span class="'.$msgclass.' smaller">'.$msg_ret.'</span>';
     switch ( true ) {
          case stristr($msg_ret, 'success'):
               $success = $ret;
               $styleuser = 'class="good"';
               break;
          case stristr($msg_ret, 'already exists'):
               $bad_name = $ret;
               $stylename = 'class="bad"';
               break;
          case stristr($msg_ret, 'Distributor ID'):
               $bad_user = $ret;
               $styleuser = 'class="bad"';
               break;
          case stristr($msg_ret, 'Sponsor ID'):
               $bad_ssid = $ret;
               $stylessid = 'class="bad"';
               break;
          case stristr($msg_ret, 'Username'):
               $bad_un = $ret;
               $styleun = 'class="bad"';
               break;
          case stristr($msg_ret, 'years old'):
               $bad_bt = $ret;
               $stylebt = ' bad ';
               break;
          default:
               $styleun = '';
               break;
     }

     if(!stristr($msg_ret, 'success')) $x .= '<h5 class="bad">Unable to continue. Kindly review your submission.</h5><br><hr>';
}

$is_req = 'required';
$is_mrk = '*';
$is_snc = false;

if( ISIN_ADMIN ) {
     $is_req = $is_mrk = '';
}

if( $_SESSION['snc_referrer']!='' ) {
     $dssid = $_SESSION['snc_referrer'];
     $is_snc = true;
}

$x .= '<form method="post" action="'.esc_url( admin_url('admin-post.php') ).'" enctype="multipart/form-data" class="form-data '.(ISIN_STOCKIST?'stockist':'').'" id="profile"><input type="hidden" name="action" value="update_profile" /><ul>';

$x .= '<li '.( $dsdid=='' ? ' class="hide"' :'' ).'><label>Distributor ID: *</label><input type="text" name="dsdid" '.$styleuser.' value="'.$dsdid.'" '.(ISIN_ADMIN?'':READ_ONLY).' placeholder="Distributor ID" maxlength=32  '.(ISIN_ADMIN?'':'required').' /><input type="hidden" name="oldid" value="'.$dsdid.'" /> '.$bad_user.'</li>';
$x .= '<li '.( $_SESSION['snc_referrer']!='' ? ' class="hide"' :'' ).'><label>Referred By: * </label><input type="text" name="dssid" '.$stylessid.' value="'.$dssid.'" '.( ISIN_ADMIN || ( ISIN_STOCKIST && $oldid=='' ) ? '': READ_ONLY ).' placeholder="Sponsor ID" maxlength=32 required /> <span class="smaller">'.$nam.'</span>'.$bad_ssid.' '.(ISIN_ADMIN?'<span class="dashicons dashicons-search" title="Search Sponsor"></span>':'').'</li>';

$x .= '<li '.( $_SESSION['snc_referrer']!='' ? ' class="hide"' :'' ).'><hr></li>';
$x .= '<li><label>Username: *</label><input type="text" name="un" '.$styleun.' value="'.$un.'" minlength=4 maxlength=32 required /><input type="hidden" name="oldun" value="'.$un.'" /> '.$bad_un.'</li>';
if( IS_GLOBAL ) $x .= '<li><label>Password: *</label><input type="hidden" name="pw" value="'.$pw.'" minlength=8 maxlength=32 /><span class="dashicons dashicons-privacy" title="Reset Password"></span> <span class="smaller"></span></li>';

$x .= '<li><hr></li>';
$x .= '<li><label>Last Name: * </label><input type="text" name="dslnam" '.$stylename.' value="'.$dslnam.'" maxlength=32 '.$is_req.' /> '.$bad_name.'</li>';
$x .= '<li><label>First Name: * </label><input type="text" name="dsfnam" '.$stylename.' value="'.$dsfnam.'" maxlength=32 '.$is_req.' /></li>';
$x .= '<li><label>Middle Name:</label><input type="text" name="dsmnam" '.$stylename.' value="'.$dsmnam.'" maxlength=32 /></li>';
$x .= '<li><label>Mother\'s Full Maiden Name: *</label><input type="text" name="dsmother" '.$stylename.' value="'.$dsmother.'" maxlength=64 '.$is_req.' /></li>';

if( !$is_snc ) {
     $x .= '<li><hr></li>';
     $x .= '<li><label>Street:</label><input type="text" name="dsstreet" value="'.$dsstreet.'" /></li>';
     $x .= '<li><label>Brgy: '.$is_mrk.'</label><input type="text" name="dsbrgy" value="'.$dsbrgy.'" '.$is_req.' /></li>';
     $x .= '<li><label>Town / City: '.$is_mrk.'</label><input type="text" name="dscity" value="'.$dscity.'" '.$is_req.' /></li>';
     $x .= '<li><label>Province: '.$is_mrk.' </label><input type="text" name="dsprov" value="'.$dsprov.'" '.$is_req.' /></li>';
}

$loc = '\s?(?: *[loc|ext]*(\d+))?';
$g1 = '^(\+?\d{2}?\s?\d{1,3}\s?\d{3,4}\s?\d{4}'.$loc.')$';
$g2 = '|';
$g3 = '^([0]\d{3}\s?\d{3}\s?\d{4}'.$loc.')$';

$x .= '<li><hr></li>';
$x .= '<li><label>Contact #: '.$is_mrk.' </label><input type="text" name="dscontact" value="'.$dscontact.'" placeholder="click icon for accepted formats"  pattern="^\s*'."$g1$g2$g3".'\s*$" minlength=8 '.$is_req.' /> <a href="#" class="smaller accepted_formats" title="click here for accepted formats">accepted formats</a></li>';
$x .= '<li><label>E-mail: '.$is_mrk.' </label><input type="email" name="dsemail" value="'.$dsemail.'" maxlength=64 '.$is_req.' /></li>';
if( !$is_snc ) $x .= '<li><label>FB Account: </label><input type="text" name="dsfb" value="'.$dsfb.'" maxlength=64 /> '.(ISIN_ADMIN&&$dsfb!=''?'<a href="'.$dsfb.'" class="dashicons dashicons-facebook" title="open Facebook" target="_blank"></a>':'').'</li>';

$dsbirth = ( $dsbirth!='' ? $dsbirth : date('mdY', strtotime("-5 year")) );
$brt = substr($dsbirth,-4).'-'.substr($dsbirth,0,2).'-'.substr($dsbirth,2,2);

if( !$is_snc ) {
     $sel_dssex = '<select name="dssex">';
     foreach ( $arrSex as $k=>$v ) {
          $sel_dssex .= '<option value='.$k.' '.($k==$dssex?SELECTED:'').'>'.$v.'</option>';
     } $sel_dssex.='</select>';
}

$x .= '<li><hr></li>';
$x .= '<li><label>Birth Date: '.$is_mrk.' </label><input type="text" class="datepicker '.$stylebt.'" value="'.date( DATFUL, strtotime($brt) ).'" title="At least 5 years old" /><input type="hidden" name="dsbirth" value="'.$dsbirth.'" /> '.$bad_bt.'<span class="bad smaller">'.($dsbirth=='99999999'?'INVALID':'').'</span></li>';
if( !$is_snc ) $x .= '<li><label>Gender:</label>'.$sel_dssex.'</li>';
if( !$is_snc ) $x .= '<li><label>TIN: '.$is_mrk.' </label><input type="text" name="dstin" value="'.$dstin.'" placeholder="123456789" maxlength=12 /> <br><span class="w3"></span> <span class="smaller">** type "TO FOLLOW" if you do not have TIN</span></li>';

if( !$is_snc ) {
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

     $sel_payout = '<select name="payout">';
     foreach ( $pay as $k=>$v ) {
          if( $v!='' ) $sel_payout.='<option value='.$k.' '.($k==$payout?SELECTED:'').' data-QR="'.$arrQR[$k].'">'.$v.'</option>';
     } $sel_payout .= '</select>';

     $x .= '<li><hr></li>';
     if( ISIN_DISTRI ) $x .= '<li><h4>TO RECEIVE YOUR REBATES</h4></li>';
     $x .= '<li><label>Payout Option:</label>'.$sel_payout.'</li>';
     $x .= '<li><label>Payout Type:</label><label title="Payout released every cutoff"><input type="radio" name="pay_type" value=0 '.(!$pay_type?CHECKED:'').' />Automatic</label> <label title="Payout released on-demand"><input type="radio" name="pay_type" value=1 '.($pay_type?CHECKED:'').' />Manual</label><br>';
     $x .= '<li><label>Account Name:</label><input type="text" name="pay_name" value="'.$pay_name.'" /></li>';
     $x .= '<li><label>Account #:</label><input type="text" name="pay_acct" value="'.$pay_acct.'" /></li>';
     $x .= '<li class="qrcode '.($payout<2?'hide':'').'"><label></label><img src="'.$qrimg.'" alt="Payout QR Code" title="Click to change QR Code" /></li>';
     $x .= '<li class="qrcode '.($payout<2?'hide':'').'"><label>QR Code:</label><input type="file" name="qrcode" '.($qrimg?'class="hide"':'').' accept="image/*" /> <span class="bad"></span></li>';
     $x .= '<li class="qrcode qrnote '.($payout<2||$qrimg?'hide':'').'"><p>';
     $x .= '<span class="smaller">Distributor will be charged Php 10.00 every transaction if no Payout QR Code is submitted</span>';
     $x .= '<span class="smaller">Kindly use your FULL NAME registered in the system as Nickname for your QR Code</span></p></li>';
}

if( ISIN_ADMIN ) {
     $dsencoded = ( $dsencoded!='' ? $dsencoded : date('mdY') );
     $enc = substr($dsencoded,-4).'-'.substr($dsencoded,0,2).'-'.substr($dsencoded,2,2);
     $sel_dsmtype = '<select name="dsmtype">';
     foreach ( $mtp as $k=>$v ) {
          $sel_dsmtype .= '<option value='.$k.' '.($k==$dsmtype?SELECTED:'').'>'.$v.'</option>';
     } $sel_dsmtype .= '</select>';

     $x .= '<li><hr></li>';
     $x .= '<li><label>Member Type:</label>'.$sel_dsmtype.'</li>';
     $x .= '<li><label>Discount Code:</label><input type="text" name="discount" value="'.$discount.'" /> <span id="generate_discount" class="dashicons dashicons-tickets-alt" title="Generate Code"></span></li>';
     $x .= '<li><label>Encoded:</label><input type="text" class="datepicker" value="'.date( DATFUL, strtotime($enc) ).'" /><input type="hidden" name="dsencoded" value="'.$dsencoded.'" /></li>';
     if( IS_GLOBAL ) $x.='<li><label>Encoded By:</label><input type="text" name="dsencodedby" value="'.($dsencodedby!=''?$dsencodedby:ADMIN_ID).'" '.READ_ONLY.' /></li>';

     $x .= '<li><hr></li>';
     $x .= '<li><label>Withhold Bonus:</label><label class="smaller"><input type="hidden" name="withheld" value=0 /><input type="checkbox" name="withheld" value=1 '.($withheld?CHECKED:'').' /> Check to withhold bonus</label></li>';
     $x .= '<li><label>Printed:</label><label class="smaller"><input type="hidden" name="printed" value=0 /><input type="checkbox" name="printed" value=1 '.($printed||!$id?CHECKED:'').' /> ' . ( $printed ? 'Uncheck to mark NOT PRINTED' : 'Check to mark PRINTED') . '</label><br>';
     $x .= '<li><label>Status:</label><label class="smaller"><input type="hidden" name="dsstatus" value=0 /><input type="checkbox" name="dsstatus" value=1 '.($dsstatus||!$id?CHECKED:'').' /> ' . ( $dsstatus ? 'Uncheck to DISABLE' : 'Check to ENABLE') . '</label><br>';
     $x .= '<span class="smaller">** To completely disable this account, Discount Code must be removed</span></li>';
}

if( ISIN_ADMIN ) {
     $ret   = get_page_by_title( 'Manage Distributors', '', 'page' );
     $back  = ' <input type="button" href="'.get_permalink( $ret->ID ).'" class="btn link" value="Cancel" /> ';
     $wlcm  = ' <input type="button" href="'.get_permalink( $ret->ID ).'?'.$id.'&send_welcome" class="btn link" value="Resend Welcome" /> ';
     $pvnx  = '<div class="prevnext">';
     $pvnx .= '<a href="'.get_permalink( $ret->ID ).'?'.( sprintf("%'.0".PAD."d\n", $prv ) ).'" class="prev btn"> < </a> ';
     $pvnx .= '<a href="'.get_permalink( $ret->ID ).'?'.( sprintf("%'.0".PAD."d\n", $nxt ) ).'" class="next btn"> > </a>';
     $pvnx .= '</div>';
}

$ttl = preg_match( "/admin|distributors|customers/i", $_SESSION['user_type'] ) ? 'Update' : 'Submit';
$x .= '<li><hr>';
     if( $_SESSION['enroll'] ) {
          $x .= '<div id="privacy">';
          $x .= '<a href="/privacy-policy" id="view_privacy" target="_blank"> View Privacy Statement</a><br>';
          $x .= '<label for="agree_privacy"> <input type="checkbox" id="agree_privacy" />I have read about the Data Privacy Statement as well as the <a href="'.LKY_ROOT.'" target="_blank">'.LKY_FULL.'</a> Privacy Policy and express my consent thereto. In the same manner, I hereby express my consent for <a href="'.LKY_ROOT.'" target="_blank">'.LKY_FULL.'</a> to collect and record my personal data as part of my registration.</label><br><br>';
          $x .= '</div>';
     }

     $x .= '<input type="submit" name="submit" class="btn" value="'.$ttl.' Profile" '.( !ISIN_ADMIN && $_SESSION['enroll'] ? DISABLED :'' ).' />'. $back . $wlcm . $pvnx .' '. $success;
$x .= '</li></ul></form>';

if( ISIN_DISTRI ) {
     $x .= '<div id="bottom_nav">
               <a href="'.get_permalink(get_page_by_title( 'Account', '', 'page' )->ID).'" class="btn">HOME</a>
          </div>';
}

echo $x . BACKTOTOP;
?>
