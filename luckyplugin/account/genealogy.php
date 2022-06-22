<?php
if( !isset($_SESSION) ) session_start();
require_once plugin_dir_path( __DIR__ ) . 'templates/init_setup.php';

global $total_downlines,$dl;
$total_downlines = 0;

$con = SQLi(DBPRF);
$rs  = mysqli_query($con,"SELECT dsdid FROM distributors") or die(mysqli_error($con));
$max = mysqli_num_rows($rs);
mysqli_close($con);
$max = 5; //max level to show
getDistList(DISTRI_ID,0,$max);

echo $dl . BACKTOTOP;

function getDistList($dssid,$lvl,$max) {
     global $total_downlines,$dl;

     if($lvl>=$max) {}
	else{
          $total_downlines++;
		$cn = SQLi(DBPRF);
		$qry = "SELECT * FROM distributors WHERE dssid=$dssid ORDER BY dsencoded";

		$rs  = mysqli_query($cn,$qry) or die(mysqli_error($cn));
		if( mysqli_num_rows($rs) == 0 ) {
			if( $lvl==0 ) $dl.='<ul><li class="">No data found</li></ul>';
		} else {
			if( $lvl == 0 ) {
                    $dl .= '<ul id="genealogy" class="listing"><li><span class="w1"></span>';
                    $dl .= '<strong class="w2">ID #</strong> ';
                    $dl .= '<strong class="w5">Name</strong> ';
                    $dl .= '<strong class="w3">Contact #</strong> ';
                    $dl .= '<strong class="w3">Joined</strong> ';
                    $dl .= '</li>';
               }

			while( $r=mysqli_fetch_assoc($rs) ) {
                    foreach ($r as $k=>$v) $$k=$v;

				$dname=$dsfnam.' '.(($dsmnam!='')?substr($dsmnam,0,1).'.':'').' '.$dslnam;

                    $d_e = substr($dsencoded,-4).'-'.substr($dsencoded,0,2).'-'.substr($dsencoded,2,2);

				// $d .= '</ul>'."\n\n".'<ul>';	/* if($lvl<$lastlvl) <li><ul> */
				$dl .= '<li class="l'.($lvl+1).'"><span class="w1 ct">'.($lvl+1).'</span>';
                    $dl .= '<span class="w2">'.$dsdid.'</span> ';
                    $dl .= '<span class="w5">'.($dname).'</span> ';
                    $dl .= '<span class="w3">'.$dscontact.'</span> ';
                    $dl .= '<span class="w3">'.date( mdY, strtotime($d_e.' 00:00:00') ).'</span> ';
                    $dl .= '</li>';
                    mysqli_close($cn);
                    getDistList($dsdid,($lvl+1),$max);
			}
		}
	}
}
?>
