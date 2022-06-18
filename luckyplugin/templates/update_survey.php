<?php
if( !isset($_SESSION) ) session_start();

if( isset($_POST) ) {
     defined('INCLUDE_CHECK') || define('INCLUDE_CHECK',1);
     require_once('init_setup.php');
     require_once('setup.php');

     $con = SQLi(DBOPS);

     $_SESSION['return_msg'] = null;
     $tbl = 'survey' . date('Y');

     $int = "/lu_fb|dhub_fb|lu_web/i";
     list($kdata,$idata,$udata) = set_kiu($con,$_POST,$int);
     insert_duplicate($con,$tbl,$kdata,$idata,$udata);

     echo '<h4 class="good">Your response has been submitted</h4>';
}
?>
