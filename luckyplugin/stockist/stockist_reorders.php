<?php if( !preg_match( "/admin|stockist/i", $_SESSION['user_type'] ) ) exit;

global $post,$luckyuser,$arrReorders;
unset($_SESSION['item-data']);
unset($_SESSION['reorders']);
unset($_SESSION['cart']);

$sel = '<div class="rt"><select class="byDate">';
for ( $i = date('Y'); $i >= YEAR_1; $i-- ) {
     $sel .= '<option value="/stockist/'.$post->post_name.'/?'.$i.'" '.($i==SEL_YEAR?SELECTED:'').'>'.$i.'</option>';
}
$sel .= '</select><hr></div>';
echo $sel;

if( ISIN_STOCKIST ) {
     $add = "AND warehouse='".STOCKIST_ID."'";
}

$con  = SQLi(DBSTK);
$tbl  = 'reorders';
$test = 0;
$oldstat = -1;

if( init_table($con,$tbl) ) {
     $qry = "SELECT * FROM $tbl
          WHERE YEAR(submitted)=". SEL_YEAR ."
          $add
          ORDER BY status,id";

     $rs  = mysqli_query($con,$qry) or die(mysqli_error($con));
     $test = 1;
}

if( mysqli_num_rows($rs)>0 && $test ) {
     $x  = '<ul id="reorders" class="listing">';

     while( $r = mysqli_fetch_assoc( $rs ) ) {
          foreach ( $r as $k=>$v ) $$k = utf8_encode($v);

          if( $oldstat < $status ) {
               if($status) $x .= '<li><br></li>';
               $x .= '<li><strong>'.strtoupper($arrReorders[$status]).'</strong></li>';

               $x .= '<li>';
                    $x .= '<strong class="w3">Reorder#</strong> ';
                    $x .= '<strong class="w4">Stockist</strong> ';
                    $x .= '<strong class="w3 rt">Amount</strong> ';
                    $x .= '<strong class="w4 rt">Date Submitted</strong> ';
               $x .= '</li>';
          }

          $x .= '<li>';
          $x .= '<a href="?'.$id.'" class="w3">'.$id.'</a> ';
          $x .= '<span class="w4">'.$warehouse.'</span> ';
          $x .= '<span class="w3 rt">'.number_format($pay_amount, 2).'</span> ';
          $x .= '<span class="w4 rt">'.date(mdY,strtotime($submitted)).'</span> ';
          $x .= '</li>';

          $oldstat = $status;
     }

     $x .= '</ul>';
     mysqli_close($con);
} else $x = '<h5>Oops! No Reorders in '.SEL_YEAR.'!</h5>';

$x .= ISIN_STOCKIST ? '<hr><div id="bottom_nav"><a href="?add" class="btn">ADD NEW</a></div>' :'';

echo $x . BACKTOTOP;
?>
