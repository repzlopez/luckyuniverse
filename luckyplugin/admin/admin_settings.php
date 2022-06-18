<?php
require_once plugin_dir_path( __DIR__ ) . 'templates/init_setup.php';
global $msg_ret,$msgclass;
list($a_reload,$s_disc,$s_mpov,$s_mraf,$s_sfee,$s_mwid,$s_pay,$s_sfpc,$s_ulvl) = init_settings();

$count_level = count(explode( ',', $s_ulvl ));

$x  = '<form method="post" action="'.esc_url( admin_url('admin-post.php') ).'" id="update_settings"><input type="hidden" name="action" value="update_settings" />';

$x .= '<ul>';
$x .= '<li><label class="w4">Discount (%):</label> <input type="text" name="discount" class="w5" value="'.$s_disc.'" /></li>';
$x .= '<li><label class="w4">Min. for Raffle:</label> <input type="text" name="min_raffle" class="w5" value="'.$s_mraf.'" /></li>';
$x .= '</ul><h5 class="rt"></h5><hr>';

$x .= '<ul>';
$x .= '<li><label class="w4">Min. POV for Bonus:</label> <input type="text" name="min_pov" class="w5" value="'.$s_mpov.'" /></li>';
$x .= '<li><label class="w4">Min. for Withdrawal:</label> <input type="text" name="min_withdraw" class="w5" value="'.$s_mwid.'" /></li>';
$x .= '<li><label class="w4">Unilevel (%):</label> <input type="text" name="unilevel" class="w5" value="'.$s_ulvl.'" />';
     $x .= '<br><label class="w4"></label><span class="smaller">**currently with <strong>'.$count_level.'</strong> levels including distributor</span>';
     $x .= '<br><label class="w4"></label><span class="smaller">**do not delete or change sequence, comma delimited</span>';
     $x .= '</li>';
$x .= '<li><label class="w4">Payment Options:</label> <input type="text" name="pay_options" class="w5" value="'.$s_pay.'" />';
     $x .= '<br><label class="w4"></label><span class="smaller">**do not delete or change sequence, comma delimited</span>';
     $x .= '</li>';
$x .= '</ul><h5 class="rt">Bonus</h5><hr>';

$x .= '<ul>';
$x .= '<li><label class="w4">Min. for Stockist Fee:</label> <input type="text" name="min_stockist" class="w5" value="'.$s_sfee.'" /></li>';
$x .= '<li><label class="w4">Stockist Fee (%):</label> <input type="text" name="pct_stockist" class="w5" value="'.$s_sfpc.'" />';
     $x .= '<br><label class="w4"></label><span class="smaller">**do not delete or change sequence, comma delimited</span>';
     $x .= '</li>';
$x .= '</ul><h5 class="rt">Stockist</h5><hr>';

$x .= '<ul>';
$x .= '<li><label class="w4">Admin Page Reload:</label> <input type="text" name="admin_reload" class="w5" value="'.$a_reload.'" />';
     $x .= '<br><label class="w4"></label><span class="smaller">**in minutes</span>';
     $x .= '</li>';
$x .= '</ul><h5 class="rt">Admin</h5><hr>';

$x .= '<ul>';
$x .= '<li><input type="submit" class="btn" value="Update" /> <span class="'.$msgclass.' smaller">'.$msg_ret.'</span></li>';
$x .= '</ul></form>';

echo $x . BACKTOTOP;
?>
