<?php
if( !empty($_POST) ) {
     $contact  = $_POST['contact'];
     $trans_id = $_POST['refno'];

     $tbl = 'transactions' . SEL_YEAR;
     $qry = "SELECT * FROM $tbl WHERE del_contact='$contact' AND trans_id='$trans_id'";
     $con = SQLi(DBOPS);
     $rs  = mysqli_query($con,$qry);

     if( mysqli_num_rows($rs)>0 ) {
          $ret = get_page_by_title( 'Orders', '', 'page' );
          reloadTo( get_permalink($ret->ID) .'?'. $trans_id );
          unset($_POST);
          exit;
     } else {
          echo '<h5>Oops! Invalid Order ID!</h5>';
     }
}

$x  = '';
$x .= '<form method="post" id="find_order"><ul>';
$x .= '<li><input type="text" name="refno" class="w5 btn" placeholder="Enter Order Reference #" /></li>';
$x .= '<li><input type="text" name="contact" class="w5 btn" placeholder="Enter Contact #" /></li>';
$x .= '<li><input type="submit" class="btn" value="Submit" /></li>';
$x .= '</ul></form>';
echo $x;
?>
