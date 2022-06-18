<?php
     global $post,$msg_ret,$msgclass;
?>
<form method="post" action="<?php echo esc_url( admin_url('admin-post.php') ); ?>" class="form-data" id="login"><ul>
     <li><h3>Login</h3><input type="hidden" name="action" value="<?php echo strtolower($post->post_title);?>_login" /></li>
     <li><input type="text" name="un" class="w5" placeholder="username" minlength=4 required /></li>
     <li><input type="password" name="pw"class="w5"  placeholder="password" minlength=8 required /></li>
     <li><input type="submit" class="btn" value="Login" /> <a href="forgot_password/" class="smaller">Forgot password?</a></li>
     <li class="<?php echo $msgclass;?> smaller"><?php echo $msg_ret; ?></li>
</ul></form>
