<?php
$tbl = 'packages';

if( $uri !== false ) {
     global $msg_ret,$msgclass;
     $_SESSION['load_id'] = $uri;
     $wer = trim($uri)!='' ? $uri : "'NEW'";
     $qry = "SELECT * FROM $tbl WHERE id=$wer";
     $x   = null;

     $con = SQLi(DBPRF);
     $rs  = mysqli_query($con,$qry) or die(mysqli_error($con));
     if( mysqli_num_rows($rs)>0 ) {
     	$r=mysqli_fetch_assoc($rs);
     	foreach ( $r as $k=>$v ) $$k=$v;
     } else {
     	$rs=mysqli_query("DESCRIBE $tbl");
     	while( $r=mysqli_fetch_assoc($rs) ) {
     		foreach ( $r as $k=>$v ) {
                    if( preg_match( "/price|pov|referral/i", $k ) ) {
                         $$k=0;
                    } else $$k=null;
               }
     	}
     } mysqli_close($con);

     $x .= '<form method="post" action="'.esc_url( admin_url('admin-post.php') ).'" id="update_packages"><input type="hidden" name="action" value="update_packages" /><ul>';
     $x .= '<li><label class="w3">Package ID:</label> <input type="number" name="id" min="0" max="99999" placeholder="99999" class="w4" value="'.$id.'" required /><input type="hidden" name="oldid" value="'.$id.'" /></li>';
     $x .= '<li><label class="w3">Name:</label> <input type="text" name="name" placeholder="Package name" class="w4" value="'.$name.'" required /></li>';
     $x .= '<li><label class="w3">Items:</label> <textarea name="items" class="w4" placeholder="99999:9'."\n".'99999:9" required>'.$items.'</textarea></li>';
     $x .= '<li><label class="w3">Price:</label> <input type="number" name="price" class="w3 rt" step="0.01" min="0" placeholder="0.00" value="'.number_format($price, 2,'.','').'" required /></li>';
     $x .= '<li><label class="w3">POV:</label> <input type="number" name="pov" class="w3 rt" step="0.01" min="0" placeholder="0.00" value="'.number_format($pov, 2).'" required /></li>';
     $x .= '<li><label class="w3">Referral Fee:</label> <input type="number" name="referral" class="w3 rt" step="0.01" min="0" placeholder="0.00" value="'.number_format($referral, 2).'" required /></li>';
     $x .= '<li><label class="w3">Status:</label> <label class="smaller"><input type="hidden" name="status" value=0 /><input type="checkbox" name="status" value=1 '.($status?CHECKED:'').' /> Check to ENABLE</label></li>';

     $ret = get_page_by_title( 'Manage ' . ucwords($tbl), '', 'page' );
     $back = ' <input type="button" href="'.get_permalink( $ret->ID ).'" class="btn link" value="Back" />';
	$x .= '<li><hr><input type="submit" name="submit" class="btn" value="Submit" />'.$back.' <span class="'.$msgclass.' smaller">'.$msg_ret.'</span></li>';
	$x .= '</ul></form>';
} else {
     $con = SQLi(DBPRF);
     $qry = "SELECT * FROM $tbl ORDER BY name";
     $rs  = mysqli_query($con,$qry) or die(mysqli_error($con));

     if( mysqli_num_rows($rs)>0 ) {
          $pack = get_page_by_title( 'Manage ' . ucwords($tbl), '', 'page' );

          $x  = '<ul id="package_list" class="manage_packages"><li>';
          $x .= '<strong class="w2">Code</strong>';
          $x .= '<strong class="w5">Package Name</strong>';
          $x .= '<strong class="w2 rt">Price</strong>';
          $x .= '<strong class="w2 rt">POV</strong>';
          $x .= '<strong class="w2 ct">Status</strong>';
          $x .= '</li>';

          while( $r = mysqli_fetch_assoc( $rs ) ) {
               foreach ( $r as $k=>$v ) $$k = utf8_encode($v);

               $x .= '<li>';
               $x .= '<a href="'.get_permalink( $pack->ID ).'?'.$id.'" class="w2">'.$id.'</a>';
               $x .= '<span class="w5">'.$name.'</span>';
               $x .= '<span class="w2 rt">'.number_format($price,2).'</span>';
               $x .= '<span class="w2 rt">'.number_format($pov,2).'</span>';
               $x .= '<span class="w2 ct dashicons dashicons-'.($status?'yes':'no').'"></span>';
               $x .= '</li>';
          }

          $x .= '<li></li><li></li>';
          $x .= '</ul>';
     } else $x = '<h5>NO PACKAGES FOUND</h5>';

     $ass = get_page_by_title( 'Assemble Package', '', 'page' );
     $x .= '<hr><div id="bottom_nav"><a href="'.get_permalink( $ass->ID ).'" class="btn">ASSEMBLE</a> <a href="?" class="btn">ADD NEW</a></div>';
}

echo $x . BACKTOTOP;
?>
