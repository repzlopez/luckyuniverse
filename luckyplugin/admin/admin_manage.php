<?php

switch ($post->post_name) {
     case 'manage-admin':
          $ttl = 'Admin';
          $wer = 'WHERE id<990';
          $ord = 'un';
          $is_web = 0;
          break;
     case 'manage-website':
          $ttl = 'Control';
          $wer = 'WHERE id>990';
          $ord = 'id';
          $is_web = 1;
          break;
}

if( $uri !== false ) {
     $id = $uri;
     if( $id==990 && ADMIN_ID!='repz' ) reloadTo( get_permalink( get_page_by_title( 'Manage Admin', '', 'page' )->ID ) );

     global $msg_ret,$msgclass;
	$con = SQLi(DBPRF);

     $rs = mysqli_query($con,"DESC admin");
	$r = mysqli_fetch_assoc($rs);
	while($r=mysqli_fetch_assoc($rs)) $$r['Field']=null;

     if( $id!='' ) {
     	$rs = mysqli_query( $con, "SELECT * FROM admin WHERE id='$id'" ) or die( mysqli_error($con) );
     	while( $r=mysqli_fetch_assoc($rs) ) foreach( $r as $k=>$v ) $$k=$v;
     }

	mysqli_close($con);
	$h=( $id>990 )?' class="hide"':'';
	$_SESSION['load_id'] = $id;

	$x  = '<form method="post" action="'.esc_url( admin_url('admin-post.php') ).'" id="admin"><input type="hidden" name="action" value="update_admin" /><ul>';
	$x .= '<li><label class="w3">Admin ID #:</label><input type="text" name="id" class="w4" placeholder="Admin ID" value="'.$id.'" maxlength=3 /><input type="hidden" name="oldid" value="'.$id.'" /></li>';
	$x .= '<li><label class="w3">Username:</label><input type="text" name="un" class="txt w4" placeholder="Admin Username" value="'.$un.'" /><input type="hidden" name="oldun" value="'.$un.'" /></li>';
     $x .= '<li><label class="w3">Name:</label><input type="text" name="nn" class="txt w4" placeholder="Admin Name" value="'.$nn.'" /></li>';

	if( IS_GLOBAL ) {
          if( $is_web ) $x .= '<li><label class="w3">Description:</label><span>'.$descrip.'</span></li>';
          $x .= '<li'.$h.'><label class="w3">Password:</label><input type="password" name="pw" class="txt w4" value="" /> <span class="dashicons dashicons-privacy"></span><span class="smaller"></span></li>';
		$x .= '<li'.$h.'><label class="w3">Global:</label><input type="hidden" name="global" value=0 /><input type="checkbox" name="global" value=1 '.($global?CHECKED:'').' /> <span class="smaller">Check to set as GLOBAL account</span></li>';
		$x .= '<li><label class="w3">Status:</label><label class="smaller"><input type="hidden" name="status" value=0 /><input type="checkbox" name="status" value=1 '.($status?CHECKED:'').' /> Check to ENABLE</label></li>';
	}

     $ret = get_page_by_title( 'Manage '.ucwords(substr($post->post_name,7)), '', 'page' );
     $back = ' <input type="button" href="'.get_permalink( $ret->ID ).'" class="btn link" value="Back" />';
	$x .= '<div><hr><input type="submit" name="submit" class="btn" value="Submit" />'.$back.' <span class="'.$msgclass.' smaller">'.$msg_ret.'</span></div>';

	$x .= '</ul></form>';
} else {
     $x  = '<ul id="admin_list">';
	$x .= '<li><strong class="w3">'.$ttl.'</strong>'.( IS_GLOBAL&&$is_web ? '<strong class="w6">Description</strong>' :'' ).'<strong class="w1">Status</strong></li>';

	$con = SQLi(DBPRF);
	$rs	= mysqli_query($con,"SELECT * FROM admin $wer ORDER BY $ord") or die(mysqli_error($con));
	while( $r=mysqli_fetch_assoc($rs) ) {
          foreach ($r as $k=>$v) $$k=$v;

		if( $id!=990 ) {
               $x.='<li rel="'.$id.'">';
               $x.='<a href="?'.$id.'" class="w3">'.$nn.'</a>';
               if( IS_GLOBAL&&$is_web ) $x.='<span class="w6">'.$descrip.'</span>';
               $x.='<span class="dashicons dashicons-'.($status?'yes':'no').'"></span>';
               $x.='</li>';
          }
	} mysqli_close($con);
	$x .= '</ul>';
	$x .= '<hr><div id="bottom_nav"><a href="?" class="btn">ADD NEW</a></div>';
}
echo $x . BACKTOTOP;
?>
