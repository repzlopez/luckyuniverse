<?php
$tid = substr( strrchr( $uri, '&i=' ), 3 );

global $msg_ret;
$ret = get_page_by_title( 'Manage Orders', '', 'page' );

$x  = "<h4>Cancel Order # $tid?</h4>";
$x .= '<form method="post" action="'.esc_url( admin_url('admin-post.php') ).'" id="void_order"><input type="hidden" name="action" value="void_order" /><input type="hidden" name="trans_id" value="'.$tid.'" />
     <div><input type="text" name="confirm" class="w2 btn" accept="cancel" required /> <input type="submit" class="btn" name="submit" value="Submit" /> <span class="smaller bad">'.$msg_ret.'</span></div><br>
     <div><span class="smaller">** type "cancel" in the box to cancel this transaction</span></div>
</form>
<hr><div id="bottom_nav"><a href="'. get_permalink( $ret->ID ) . '?' . $tid . '" class="btn">BACK</a></div>';

echo $x;
?>
