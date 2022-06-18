<?php
if( isset($_POST) ) {
     defined('INCLUDE_CHECK') || define('INCLUDE_CHECK',1);
     require_once '../templates/init_setup.php';
     require_once '../templates/setup.php';

     if( !IS_GLOBAL ) exit;

     $con = SQLi(DBPRF);
     foreach ($_POST as $k=>$v) $$k=$v;
     echo sha1( trim_escape( $con, $pw . ASIN . $un ) );
}
?>
