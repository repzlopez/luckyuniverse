<?php
if( !empty( $_FILES ) ) {

     $tbl  = $_SESSION['uploadto'];
     $file = $_FILES['upload'];
     $i = 0;

     if( $file['error']==0 ) {
          if( ( $csv = fopen( $file['tmp_name'], 'r' ) ) !== false ) {
               $dbsrc = DBPRF;
               require plugin_dir_path( __DIR__ ) . 'templates/infoconfig.php';

     		while( ( $l = fgetcsv( $csv, 0, ',' ) ) !== false ) {
                    if( $i>0 ) {
                         switch ($tbl) {
                              case 'products':
                                   $l[3]     = (float)$l[3];
                                   $l[4]     = (float)$l[4];
                                   $l[5]     = (float)$l[5];
                                   $l[6]     = (float)$l[6];
                                   $l[7]     = (int)$l[7];

                                   $idata    = "$l[0],'$l[1]','$l[2]',$l[3],$l[4],$l[5],$l[6],$l[7]";

                                   $udata    = "name='$l[1]',short='$l[2]',wsp=$l[3],srp=$l[4],web_srp=$l[5],pov=$l[6],status=$l[7]";
                                   break;

                              case 'distributors':
                                   $l[1]     = str_replace("'"," ",$l[1]);
                                   $l[2]     = str_replace("'"," ",$l[2]);
                                   $l[3]     = str_replace("'"," ",$l[3]);
                                   $l[4]     = str_replace("'"," ",$l[4]);
                                   $l[5]     = str_replace("'"," ",$l[5]);
                                   $l[6]     = str_replace("'"," ",$l[6]);
                                   $l[7]     = str_replace("'"," ",$l[7]);

                                   $l[8]     = $l[8]+0;
                                   $l[12]    = (int)$l[12];
                                   $l[16]    = (int)$l[16];
                                   $l[19]    = (int)$l[19];
                                   $l[23]    = (int)$l[23];
                                   $l[0]     = sprintf("%'.0".PAD."d\n", $l[0] );
                                   $l[21]    = sprintf("%'.0".PAD."d\n", $l[21] );
                                   $l[11]    = sprintf("%'.0".PAD."d\n", ( $l[11] !='' ? $l[11] :'99999999' ) );
                                   // $l[11]    = trim( substr($l[11],4,2) . substr($l[11],-2) . substr($l[11],0,4) );

                                   $sha      = trim( $l[11] ) . ASIN . trim( $l[0] ) ;
                                   $newpw    = sha1( mysqli_real_escape_string( $con , stripslashes( trim( $sha ) ) ) );

                                   $idata    = "$l[0],'$l[1]','$l[2]','$l[3]','$l[4]','$l[5]','$l[6]','$l[7]',";
                                   $idata    .= "'$l[8]','$l[9]','$l[10]','$l[11]',$l[12],'$l[13]','$l[14]','$newpw',";
                                   $idata    .= "$l[16],'$l[17]','$l[18]',$l[19],'$l[20]','$l[21]','$l[22]',$l[23],$l[24]";

                                   $udata    = "dslnam='$l[1]',dsfnam='$l[2]',dsmnam='$l[3]',dsstreet='$l[4]',dsbrgy='$l[5]',dscity='$l[6]',dsprov='$l[7]',";
                                   $udata    .= "dscontact='$l[8]',dsemail='$l[9]',dsfb='$l[10]',dsbirth='$l[11]',dssex=$l[12],dssid='$l[13]',un='$l[14]',pw='$newpw',";
                                   $udata    .= "payout=$l[16],pay_name='$l[17]',pay_acct='$l[18]',dsmtype=$l[19],discount='$l[20]',dsencoded='$l[21]',dsencodedby='$l[22]',withheld=$l[23],dsstatus=$l[24]";
                                   break;
                         }

                         $qry="INSERT INTO $tbl VALUES ($idata) ON DUPLICATE KEY UPDATE $udata";
                         mysqli_query( $con, $qry ) or die( mysqli_error($con) );
                    } $i++;

     		} fclose($csv);

               $_SESSION['return_msg']['msg'] = 'File uploaded';
               $_SESSION['return_msg']['class'] = 1;
               $_SESSION['return_msg']['count'] = $i-1;

     	} else $_SESSION['return_msg']['msg'] = 'File error';
     }
}

unset($_SESSION['uploadto']);
wp_redirect( wp_get_referer() );
exit;
?>
