<?php
global $post,$msg_ret,$msgclass,$msg_count;
$ret_count = ( isset($msg_count) ) ? 'Updated '. $msg_count .' items' : null;
$ret  = get_page_by_title( $post->post_title, '', 'page' );
$_SESSION['uploadto'] = str_replace('manage-','',$post->post_name);
?>

<h4>Upload List</h4>
<form method="post" action="<?php echo admin_url('admin-post.php');?>" enctype="multipart/form-data" class="form-data" id="admin_upload"><input type="hidden" name="action" value="admin_upload" />
     <div><input type="file" name="upload" accept=".csv" /> <span class="smaller"><?php echo $msg_ret?></span></div><br>
     <div><input type="submit" class="btn" name="submit" value="Upload" /> <span class="smaller <?php echo $msgclass?>"><?php echo $ret_count?></span></div>
</form>
<hr><div id="bottom_nav"><a href="<?php echo get_permalink( $ret->ID )?>" class="btn">BACK</a></div>
