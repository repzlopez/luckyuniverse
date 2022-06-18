<?php
if( !isset($_POST) ) {
     reloadTo( get_home_url() );
}
echo hash( 'crc32', time().$_POST['id'] );
?>
