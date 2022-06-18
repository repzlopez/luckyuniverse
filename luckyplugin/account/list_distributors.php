<?php if( !isset($_SESSION) ) session_start();
if( !preg_match( "/admin|stockist/i", $_SESSION['user_type'] ) ) exit;

if( !empty( $_POST ) || $_SESSION['load_registration']!==false ) {
     defined('INCLUDE_CHECK') || define('INCLUDE_CHECK',1);
     define( 'DBPRF', 'profiles' . ( $_SESSION['testnet'] ? '_test' :'' ) );
     global $post;

     $wer= $mine= '';
     if( $_SESSION['load_registration'] ) {
          $encode_only = 1;
          unset($_SESSION['load_registration']);
          require_once plugin_dir_path( __DIR__ ) . 'templates/init_setup.php';
          $tbl = 'for_encoding';
          $wer = "WHERE dsencoded IS NULL";

     } else {
          require_once '../templates/init_setup.php';
          $tbl = 'distributors';
          $encode_only = 0;

     }

     $search = isset($_POST['id']) ? $_POST['id'] :null;
     $box    = isset($_POST['src']) ? $_POST['src'] :'-';
     unset($_POST);

     if( $_SESSION['user_type']=='stockist' ) {
          $me   = ( $search == $_SESSION['oic'] ? "OR dsdid=" . $search :'' );
          $wer  = ''; // ( $box != 'dssid' ? "AND dsencodedby='" . $_SESSION['id'] ."'" :'' );
          $mine = ''; // "AND dsencodedby='" . $_SESSION['id'] ."'";
     }

     $add1= "(dsdid LIKE '%$search%' OR un LIKE '%$search%' OR dslnam LIKE '%$search%' OR dsfnam LIKE '%$search%' OR dsmnam LIKE '%$search%' OR discount LIKE '%$search%')";
     $add = isset($search) ? ( ($search=='*') ? '': "WHERE ( $add1 $mine)" ) :'';
     $qry = "SELECT dsdid,un,CONCAT(dslnam,', ',dsfnam,' ',dsmnam) nam,dsstatus
          FROM $tbl $add
          $wer $me
          ORDER BY dsdid";

     $con = SQLi(DBPRF);
     $rs  = mysqli_query( $con, $qry );
     $num = mysqli_num_rows($rs);

     if( $num == 0 ) {               //test if acct exists
          $x = '<li><h5>No match found</h5></li>';
     } else {
          $load_list = ( $num > 1 || 
               ( $num === 1 && ( $box == 'undefined' || $encode_only ) )
          );
// echo "= $num | $box | $search | " . ($encode_only?1:0) ." =";

          if( $load_list ) {
               while( $r = mysqli_fetch_assoc($rs) ) {
               	foreach ( $r as $k=>$v ) $$k=$v;

                    $span = ( (int)$_SESSION['oic'] == (int)$dsdid ) ? 'span' : 'a';
                    $y .= '<li>';
                         $y .= '<'.$span.' href="?'.$dsdid.'" class="w3">'.$dsdid.'</'.$span.'>';
                         $y .= '<span class="w4">'.$un.'</span>';
                         $y .= '<span class="w5">'.$nam.'</span>';
                         if( !$encode_only ) {
                              $y .= '<span class="w1 ct dashicons dashicons-'. ( $dsstatus ? 'yes' : 'no' ) .'"></span>';
                         } else {
                              $y .= '<span class="w1 ct '.(isset($dsstatus) ? '': 'bad').'">'.( isset($dsstatus) ? sprintf("%'.0".PAD."d\n", $dsstatus ) : 'NO ORDER' ).'</span>';
                         }
                    $y .= '</li>';
               }

               $x = '<li>';
                    $x .= '<strong class="w3">ID #</strong>';
                    $x .= '<strong class="w4">Username</strong>';
                    $x .= '<strong class="w5">Name</strong>';
                    $x .= '<strong class="w1 ct">'. ( !$encode_only ? 'Status' : 'Transaction' ) .'</strong>';
               $x .= '</li>'.$y;

          } else {
               $r = mysqli_fetch_assoc($rs);
          	foreach ( $r as $k=>$v ) $$k=$v;

               $x = $dsdid . $nam;
          }
     }
     mysqli_close($con);
     if( !$encode_only ) echo $x;
}
?>
