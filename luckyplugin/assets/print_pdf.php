<?php
$print	= $_GET['print'];
$bk		= 'background';
$mar_0	= 'margin:0';
$pad_0	= 'padding:0';
$ov_hid	= 'overflow:hidden';
$imp		= '!important';
$print	= $print!='' ? $print : ( isset($_SESSION['print']['id']) ? $_SESSION['print']['id'] : null );
// unset($_SESSION['print']['id']);

$style_ops='
	body { '.$bk.':#fff;font:normal 12px courier,sans-serif '.$imp.';'.$mar_0.';'.$pad.';'.$ov_hid.';height:auto;width:740px; }
	ol,ul { list-style-type:none;margin:0 '.$imp.'; }
	li { padding:2px;margin:0 '.$imp.'; }

	.w0,.w1,.w2,.w3,.w4,.w5,.w6,.col1-ws { display:inline-block; }
	.w0 { width:30px '.$imp.'; }
	.w1 { width:60px '.$imp.'; }
	.w2 { width:100px '.$imp.'; }
	.w3 { width:150px '.$imp.'; }
	.w4 { width:200px '.$imp.'; }
	.w5 { width:260px '.$imp.'; }
	.w6 { width:400px '.$imp.';}
	.bb { border-bottom:#000 solid 1px; }
	.bb2 { border-bottom:#000 double 3px; }
	.col1-ws { overflow:hidden;white-space:nowrap;width:200px; }
	.lt { text-align:left '.$imp.'; }
	.ct { text-align:center '.$imp.'; }
	.rt { text-align:right '.$imp.'; }
	.printhide { display:none '.$imp.'; }
	.smaller { font-size:10px '.$imp.'; }

	#print_receipt { font-size:10px '.$imp.';width:310px;margin:0 '.$imp.';padding:0 '.$imp.'; }
	#print_receipt>li { width:310px;margin:0 '.$imp.'; }
	#print_receipt ul {  }
	#print_receipt * { padding:0 '.$imp.'; }
	#print_receipt span strong { font-weight:bold; }
';

$style = '<style type="text/css">'.$style_ops.'
@page{
    size:auto;
    margin:1cm;
}
</style>';

ob_start();
require_once plugin_dir_path( __DIR__ ) . 'assets/dompdf/autoload.inc.php';

use Dompdf\Dompdf;
$dompdf = new Dompdf();
	// $dompdf->set_paper(array(0,0,612.00,792.00),'landscape');	//uncomment if landscape preferred
$dompdf->load_html( utf8_decode( $style . $_SESSION['print_data'] ) );
$dompdf->render();
$pdf = $dompdf->output();

$dlpath = plugin_dir_url( __FILE__ ) . 'temp/Order_'.$print.'.pdf';
$path   = plugin_dir_path( __FILE__ ) . 'temp/Order_'.$print.'.pdf';

echo '<h3>Loading... Please wait.</h3>';
file_put_contents($path,$pdf);
echo '<META HTTP-EQUIV=Refresh CONTENT="1; URL='.$dlpath.'">';
?>
