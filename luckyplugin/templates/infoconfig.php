<?php require_once('info.config');
$con = mysqli_connect( HOST, DB.USN, PSW, DB.$dbsrc );
if( !$con ){
     die('Connection failed: '.mysqli_connect_error());
     exit;
}
?>
