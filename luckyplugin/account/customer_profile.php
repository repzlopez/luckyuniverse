<?php
if( !isset($_SESSION) ) session_start();

global $msg_ret,$msgclass,$pay;
$id= $receiver= $address= $contact= $pay_out= $status= $back= null;

if( isset($_SESSION['user_type']) && $_SESSION['user_type']=='customers' ) {
     $cid = $luckyuser['id'];
} elseif( $uri != '' ) {
     $cid = $uri;
}

if( isset($cid) && trim($cid)!='' ) {
     $qry = "SELECT *,
               (SELECT CONCAT(dsfnam,' ',dslnam) FROM distributors WHERE dsdid=referrer) ref
          FROM customers WHERE id=$cid";

     $con = SQLi(DBPRF);
     $rs  = mysqli_query($con,$qry) or die(mysqli_error($con));
     if( mysqli_num_rows($rs)>0 ) {
     	$r=mysqli_fetch_assoc($rs);
     	foreach ( $r as $k=>$v ) $$k=$v;
     } else {
     	$rs=mysqli_query("DESCRIBE customers");
     	while( $r=mysqli_fetch_assoc($rs) ) {
     		foreach ( $r as $k=>$v ) $$k=null;
     	}
     } mysqli_close($con);
     $action = esc_url( admin_url('admin-post.php') );
}

if( isset($_POST['save']) && $_POST['save'] ) {
     include_once '../templates/init_setup.php';
     $save_on  = 1;

     if( trim($_POST['lastid'])=='' ) {
          $con      = SQLi($_POST['dbp']);
          $rs       = mysqli_query($con,"SELECT id FROM customers ORDER BY id DESC LIMIT 1") or die(mysqli_error($con));
          $r        = mysqli_fetch_assoc($rs);
          $id       = sprintf("%'.0".PAD."d\n", $r['id']+1 );
     } else {
          $id = $_POST['lastid'];
          $save_on += 1;
     }

     $action   = 'https://luckyuniverseph.com/wp-admin/admin-post.php';
}

$sel_payout = '<select name="pay_out">';
foreach( $pay as $k=>$v ){
     $sel_payout.='<option value='.$k.' '.($k==$pay_out?SELECTED:'').'>'.$v.'</option>';
} $sel_payout .= '</select>';

$x  = '<form method="post" action="'.$action.'" id="update_customers"><input type="hidden" name="action" value="update_customers" />';
$x .= '<input type="hidden" name="id" value="'.$id.'" /><ul>';
$x .= '<li><label class="w3">Name:</label> <input type="text" name="receiver" class="w5" placeholder="Customer name" value="'.$receiver.'" required /></li>';
$x .= '<li><label class="w3">Address:</label> <textarea name="address" class="w5" style="vertical-align:top;" placeholder="Customer address" required >'.$address.'</textarea></li>';
$x .= '<li><label class="w3">Contact #:</label> <input type="text" name="contact" class="w5" placeholder="Contact number" value="'.$contact.'" placeholder="09987654321" pattern="^([0][9]\d{2}\s?\d{3}\s?\d{4})$" required /></li>';
$x .= '<li><label class="w3">Pay with:</label> '.$sel_payout.'</li>';

if( $save_on ) {
     $x .= '<li><input type="hidden" name="referrer" value='.$_SESSION['discount']['dsdid'].' />';
     $x .= '<label class="w3">Password:</label> <input type="password" name="pw" class="w5" value="'.$pw.'" placeholder="Create your password" minlength=8 required />';
     $x .= '<input type="hidden" name="status" value=1 /><input type="hidden" name="save_on" value='.$save_on.' /></li>';
}

if( ISIN_ADMIN && isset($cid) ) {
     $x .= '<li><label class="w3">Referrer:</label> <span>'.($ref?$ref:'- none -').'</span></li>';
     $x .= '<li><label class="w3">Status:</label> <label class="smaller"><input type="hidden" name="status" value=0 /><input type="checkbox" name="status" value=1 '.($status?CHECKED:'').' /> Check to ENABLE</label></li>';
}

if( ISIN_ADMIN && isset($cid) ) {
     $ret = get_page_by_title( 'Manage Customers', '', 'page' );
     $back = ' <input type="button" href="'.get_permalink( $ret->ID ).'" class="btn link" value="Cancel" />';
}

$x .= '<li><hr><input type="submit" name="submit" class="btn" value="Submit" />'.$back.' <span class="'.$msgclass.' smaller">'.$msg_ret.'</span></li>';
$x .= '</ul></form>';

echo $x . BACKTOTOP;
?>
