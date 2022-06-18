<?php
$data = explode('&', $uri);
$dsdid = $data[0];

$con = SQLi(DBPRF);
$rs  = mysqli_query($con, "SELECT un,pw,dsbirth,discount,dsemail,CONCAT(dsfnam,' ',dslnam) dname FROM distributors WHERE dsdid=$dsdid");
$r   = mysqli_fetch_assoc( $rs );

$_SESSION['reg_welcome']['id'] = $dsdid;
$_SESSION['reg_welcome']['un'] = $r['un'];
$_SESSION['reg_welcome']['pw'] = $r['dsbirth'];
$_SESSION['reg_welcome']['dc'] = $r['discount'];
$_SESSION['reg_welcome']['to'] = $r['dsemail'];

require_once plugin_dir_path( __DIR__ ) . 'account/send_welcome.php';

echo '<h5>Welcome Email sent to Distributor # '. $dsdid . ' ' . $r['dname'] .'</h5>';

unset($_SESSION['reg_welcome']);

$ret = get_page_by_title( 'Manage Distributors', '', 'page' );
reloadTo( get_permalink($ret->ID) . '?' . $dsdid, 5 );
exit;

?>
