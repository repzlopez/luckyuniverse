<?php

if( isset($_GET['encode']) ) {
     $encode = $_GET['encode'];
     $qry = "INSERT INTO distributors
          SELECT *
          FROM for_encoding
          WHERE dsdid=$encode";

     $con = SQLi(DBPRF);
     $rs  = mysqli_query($con,$qry);

     $dsencoded = date('mdY');
     $dsencodedby = ADMIN_ID;

     $qry = "UPDATE distributors SET dsencoded='$dsencoded',dsencodedby='$dsencodedby',dsstatus=1 WHERE dsdid=$encode";
     mysqli_query($con,$qry);

     // $qry = "DELETE FROM for_encoding WHERE dsdid=$encode";
     $qry = "UPDATE for_encoding SET dsencoded='$dsencoded',dsencodedby='$dsencodedby',dsstatus=1 WHERE dsdid=$encode";
     mysqli_query($con,$qry);

     $rs  = mysqli_query($con, "SELECT un,pw,dsbirth,discount,dsemail FROM for_encoding WHERE dsdid=$encode");
     $r   = mysqli_fetch_assoc( $rs );

     $_SESSION['reg_welcome']['id'] = $encode;
     $_SESSION['reg_welcome']['un'] = $r['un'];
     $_SESSION['reg_welcome']['pw'] = $r['dsbirth'];
     $_SESSION['reg_welcome']['dc'] = $r['discount'];
     $_SESSION['reg_welcome']['to'] = $r['dsemail'];

     require_once plugin_dir_path( __DIR__ ) . 'account/send_welcome.php';

     echo '<h5>Distributor '.$encode.' successfully encoded</h5>';

     unset($_SESSION['reg_welcome']);

     $ret = get_page_by_title( $post->post_title, '', 'page' );
     reloadTo( get_permalink($ret->ID), 3 );
     exit;

} elseif( isset($_GET['void']) ) {

     if( isset($_GET['confirm']) ) {
          $encode      = $_GET['void'];
          $dsencoded   = date('mdY');
          $dsencodedby = ADMIN_ID;

          $con = SQLi(DBPRF);
          $qry = "UPDATE for_encoding SET dsencoded='$dsencoded',dsencodedby='$dsencodedby',discount='isvoid' WHERE dsdid=$encode";
          $rs  = mysqli_query($con,$qry);

          echo "<h5>Entry ". $_GET['void'] ." voided</h5>";

          $ret  = get_page_by_title( $post->post_title, '', 'page' );
          reloadTo( get_permalink($ret->ID) );
          exit;

     } else {
          $vid  = $_GET['void'];
          $snam = $_SESSION['reg_welcome']['nm'];

          echo "<h5>Are you sure you want to void this entry:</h5>";
          echo "<h4>$vid $snam</h4>";

          $x  = '<hr><div id="bottom_nav">';

          $ret  = get_page_by_title( $post->post_title, '', 'page' );
          $void = '<a href="'.get_permalink( $ret->ID ).'?void='.sprintf("%'.0".PAD."d\n", $vid ).'&confirm" class="btn">YES</a> ';
          $bak  = '<a href="'.get_permalink( $ret->ID ).'" class="btn">NO</a>';

          $x .= $void . $bak;
          $x .= '</div>';
     }

     echo $x;

} else {

     if( $uri !== false ) {
          $qry = "SELECT *,trans_id,e.package pak,p.name pakname,
     	    (SELECT CONCAT(dslnam,', ',dsfnam,' ',dsmnam) FROM distributors WHERE dsdid=f.dssid) snam
               FROM for_encoding f
               LEFT JOIN (SELECT dsdid,trans_id,package FROM ".DB.DBOPS.".enroll) e ON e.dsdid=f.dsdid
               LEFT JOIN (SELECT id,name FROM packages) p ON p.id=e.package
               WHERE f.dsdid=$uri";

          $con = SQLi(DBPRF);
          $rs  = mysqli_query($con,$qry);
          if( mysqli_num_rows($rs)>0 ) {
          	$rw = mysqli_fetch_assoc( $rs );
          	foreach ( $rw as $k=>$v ) $$k=stripslashes($v);
               $fail=0;
          } else $fail=1;

          $ret= get_page_by_title( 'Manage Orders', '', 'page' );

          $dsc  = hash( 'crc32', time().$uri );
          $enam = ucwords($dsfnam.' '.($dsmnam!=''?$dsmnam:'').' '.$dslnam);

          $x  = '<ul id="profile">';
          $x .= '<li><label>Distributor ID: </label>'.$uri.'</li>';
          $x .= '<li><label>Username: </label>'.$un.'</li>';
          $x .= '<li><label>Name: </label>'.$enam.'</li>';
          $x .= '<li><label>Address: </label>'.($dsstreet!=''?$dsstreet:'').' '.($dsbrgy!=''?$dsbrgy:'').' '.($dscity!=''?$dscity:'').' '.($dsprov!=''?$dsprov:'').'</li>';
          $x .= '<li><label>Contact: </label>'.$dscontact.'</li>';
          $x .= '<li><label>Email: </label>'.$dsemail. ' <em>(' . ($dsemail_confirm ? '': 'not ') . 'confirmed)</em></li>';
          $x .= '<li><label>Birthday: </label>'.$dsbirth.'</li>';
          $x .= '<li><label>TIN: </label>'.$dstin.'</li>';
          $x .= '<li><label>Discount Code: </label>'.$dsc.'</li>';
          $x .= '<li><label>Sponsor: </label>'.$dssid.' '.$snam.'</li>';
          $x .= '<li><label>Package: </label>'.( $dsstatus !='' ? ( $pak!='' ? $pak .' '. $pakname : '<a href="'.get_permalink( $ret->ID ).'?'.sprintf("%'.0".PAD."d\n", $dsstatus ).'" class="btn">Process Order</a> <span class="smaller">**process order before encoding</span>' ) : '<strong class="bad">NO ORDER</strong>' ).'</li>';
          $x .= '</ul>';

          $x .= '<hr><div id="bottom_nav">';

          $ret  = get_page_by_title( $post->post_title, '', 'page' );
          $void = '<a href="'.get_permalink( $ret->ID ).'?void='.sprintf("%'.0".PAD."d\n", $uri ).'" class="btn">VOID</a> ';
          $bak  = '<a href="'.get_permalink( $ret->ID ).'" class="btn">BACK</a>';

          if( $fail ) {
               $x .= '<span>NOT FOUND</span> '. $bak;

          } else {
               if( $pak!='' ) $x .= '<a href="?encode='.$uri.'" class="btn">ENCODE</a> ';
               $x .= $void . $bak;
          }

          $x .= '</div>';

          echo $x . BACKTOTOP;
     } else {
          $_SESSION['load_registration'] = 1;
          require_once plugin_dir_path( __DIR__ ) . 'account/list_distributors.php';

          echo '<ul id="distri_list" class="registration">'.$x.'</ul><hr>' . BACKTOTOP;
     }
}
?>
