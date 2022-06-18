<?php

if( $uri !== false ) {
     global $msg_ret,$msgclass;
     $_SESSION['load_id'] = $uri;
     $wer = trim($uri)!='' ? $uri : "'NEW'";
     $qry = "SELECT * FROM products WHERE id=$wer";
     $x   = null;

     $con = SQLi(DBPRF);
     $rs  = mysqli_query($con,$qry) or die(mysqli_error($con));
     if( mysqli_num_rows($rs)>0 ) {
     	$r=mysqli_fetch_assoc($rs);
     	foreach ( $r as $k=>$v ) $$k=$v;
          // if( preg_match( "/wsp|srp|web_srp|pov/i", $k ) ) {
          //      $$k=0;
          // } else $$k=$v;
     } else {
     	$rs=mysqli_query("DESCRIBE products");
     	while( $r=mysqli_fetch_assoc($rs) ) {
     		foreach ( $r as $k=>$v ) {
                    if( preg_match( "/wsp|srp|web_srp|pov/i", $k ) ) {
                         $$k=0;
                    } else $$k=null;
               }
     	}
     }

     mysqli_close($con);

     $x .= '<form method="post" action="'.esc_url( admin_url('admin-post.php') ).'" id="update_products"><input type="hidden" name="action" value="update_products" /><ul>';
     $x .= '<li><label class="w3">Product ID:</label> <input type="number" name="id" min="0" max="99999" class="w4" value="'.$id.'" required /><input type="hidden" name="oldid" value="'.$id.'" /></li>';
     $x .= '<li><label class="w3">Name:</label> <input type="text" name="name" class="w4" value="'.$name.'" required /></li>';
     $x .= '<li><label class="w3">Short Name:</label> <input type="text" name="short" class="w4" value="'.$short.'" /></li>';
     $x .= '<li><label class="w3">WSP:</label> <input type="number" name="wsp" class="w3 rt" step="0.01" min="0" placeholder="0.00" value="'.$wsp.'" required /></li>';
     $x .= '<li><label class="w3">SRP:</label> <input type="number" name="srp" class="w3 rt" step="0.01" min="0" placeholder="0.00" value="'.$srp.'" required /></li>';
     $x .= '<li><label class="w3">Web SRP:</label> <input type="number" name="web_srp"" class="w3 rt" min="0" step="0.01" placeholder="0.00" value="'.$web_srp.'" required /></li>';
     $x .= '<li><label class="w3">POV:</label> <input type="number" name="pov" class="w3 rt" step="0.01" min="0" placeholder="0.00" value="'.$pov.'" required /></li>';
     $x .= '<li><label class="w3">Sort Order:</label> <input type="number" name="sort_order" class="w3 rt" min="0" placeholder="0" value="'.$sort_order.'" /></li>';
     $x .= '<li><label class="w3">Status:</label> <label class="smaller"><input type="hidden" name="status" value=0 /><input type="checkbox" name="status" value=1 '.($status?CHECKED:'').' /> Check to ENABLE</label></li>';

     $ret = get_page_by_title( 'Manage Products', '', 'page' );
     $back = ' <input type="button" href="'.get_permalink( $ret->ID ).'" class="btn link" value="Back" />';
	$x .= '<li><hr><input type="submit" name="submit" class="btn" value="Submit" />'.$back.' <span class="'.$msgclass.' smaller">'.$msg_ret.'</span></li>';
	$x .= '</ul></form>';

} else {

     $con = SQLi(DBPRF);
     $qry = "SELECT * FROM products ORDER BY sort_order,name";
     $rs  = mysqli_query($con,$qry) or die(mysqli_error($con));

     if( mysqli_num_rows($rs)>0 ) {
          $products = get_page_by_title( 'Manage Products', '', 'page' );

          $x  = '<ul id="product_list" class="manage_products listing"><li>';
          $x .= '<strong class="w2">Code</strong>';
          $x .= '<strong class="w6">Product Name</strong>';
          $x .= '<strong class="w2 rt">DP</strong>';
          $x .= '<strong class="w2 rt">SRP</strong>';
          $x .= '<strong class="w2 rt">Web</strong>';
          $x .= '<strong class="w2 ct">Status</strong>';
          $x .= '</li>';

          while( $r = mysqli_fetch_assoc( $rs ) ) {
               foreach ( $r as $k=>$v ) $$k = utf8_encode($v);

               $x .= '<li>';
               $x .= '<a href="'.get_permalink( $products->ID ).'?'.$id.'" class="w2">'.$id.'</a>';
               $x .= '<span class="w6">'.$name.'</span>';
               $x .= '<span class="w2 rt">'.$wsp.'</span>';
               $x .= '<span class="w2 rt">'.$srp.'</span>';
               $x .= '<span class="w2 rt">'.$web_srp.'</span>';
               $x .= '<span class="w2 ct"><span class="dashicons dashicons-'.($status?'yes':'no').'"></span></span>';
               $x .= '</li>';
          }

          $x .= '<li></li><li></li>';
          $x .= '</ul>';

     } else {
          $x = '<h5>NO PRODUCTS FOUND</h5>';
     }

     $x .= '<hr><div id="bottom_nav"><a href="?upload" class="btn">UPLOAD LIST</a> <a href="?" class="btn">ADD NEW</a></div>';
}

echo $x . BACKTOTOP;
?>
