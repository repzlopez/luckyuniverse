<?php
if( !defined('INCLUDE_CHECK') ) die('Invalid Operation');

function find_lastid() {
     $con = SQLi(DBPRF);
     $qry = "SELECT dsdid FROM distributors
          UNION
          SELECT dsdid FROM for_encoding
          ORDER BY dsdid DESC
          LIMIT 1";
     $rs = mysqli_query( $con, $qry ) or die(mysqli_error($con));
     $r  = mysqli_fetch_assoc($rs);
     return $r['dsdid']+1;
}

function set_kiu($con,$post,$int) {
     $no = "/old|\bsubmit\b|action|qrcode/i";
     foreach ( $post as $k=>$v ) {
          if( !preg_match( $no,$k ) ) {
               $kdata .= trim_escape( $con, $k ) .",";
               if( preg_match($int,$k) ) {
                    $idata .= trim_escape( $con, $v ) .",";
                    $udata .= $k."=" .trim_escape( $con, $v ). ",";
               }else{
                    $idata .= "'" .trim_escape( $con, $v ). "',";
                    $udata .= $k."='" .trim_escape( $con, $v ). "',";
               }
          }
     }
     $kdata = substr($kdata,0,-1);
     $idata = substr($idata,0,-1);
     $udata = substr($udata,0,-1);
     return array($kdata,$idata,$udata);
}

function insert_duplicate($con,$tbl,$kdata,$idata,$udata) {
	$qry = "INSERT INTO $tbl ($kdata) VALUES ($idata) ON DUPLICATE KEY UPDATE $udata";
// echo "<br>$qry<br>";
	mysqli_query( $con, $qry ) or die( mysqli_error($con) );
	$last_id = mysqli_insert_id( $con );
	mysqli_close( $con );
	return $last_id;
}

function update_stocks($post, $stk, $do) {
     foreach ($post as $k=>$v) {
          $kdata  = 'id,item,warehouse,qty';

          $idata  = "'". $stk . $k ."',";
          $idata .= $k . ",";
          $idata .= $stk . ",";
          $idata .= ((int)$v);

          $udata = "qty=qty" . $do . ((int)$v) . "";

// echo "$kdata<br>$idata<br>$udata";
          if( $v>0 ) {
               insert_duplicate( SQLi(DBSTK), 'stocks', $kdata, $idata, $udata );
          }
     }

}

function update($db,$qry) {
// echo "$qry<br><br>";
     $con = SQLi($db);
     mysqli_query($con,$qry) or die(mysqli_error($con));
     return mysqli_insert_id($con);
}

function test_input(&$dat) {
    return htmlspecialchars ( stripslashes( trim($dat) ), ENT_QUOTES );
}

function trim_escape($con,$str) {
	return mysqli_real_escape_string ( $con , stripslashes( trim( $str ) ) );
}

function logout($url) {
	setOL(0);
	if(isset($_COOKIE[session_name()])) setcookie(session_name(),'',time()-3600,'/');
	$_SESSION=array();
	@session_destroy();
	reloadTo($url);
}
?>
