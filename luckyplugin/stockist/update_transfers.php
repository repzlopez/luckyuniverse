<?php if( !isset($_SESSION) ) session_start();
if( !preg_match( "/admin|stockist/i", $_SESSION['user_type'] ) ) exit;

defined('INCLUDE_CHECK') || define('INCLUDE_CHECK',1);
require_once plugin_dir_path( __DIR__ ) . 'templates/setup.php';

if( !empty($_POST) ) {
// print_r($_POST);
// echo '<br>';
     $reorder = $_SESSION['reorders'];

     $fm   = $_POST['transfer_from'];
     $to   = $_POST['transfer_to'];
     $so   = $_POST['stock_out'];
     $sb   = $_POST['submit'];
     $fn   = $_POST['final'];
     $uri  = $_POST['uri'];
     $bak  = $_POST['bak'];
     $void = $_POST['void'];
     $edit = $_POST['edit'];

     $test_stockist_id = $to;
     switch( $_SESSION['user_type'] ) {
          case 'admin':
               if( $fm=='STOCK IN' || $to=='STOCK OUT' ) {
                    $test_stockist_id = '00000001';
               }
               break;

          case 'stockist':
               $test_stockist_id = STOCKIST_ID;
               break;
     }

     unset($_SESSION['reorders']);
     unset($_POST['transfer_from']);
     unset($_POST['transfer_to']);
     unset($_POST['action']);
     unset($_POST['submit']);
     unset($_POST['final']);
     unset($_POST['void']);
     unset($_POST['edit']);
     unset($_POST['uri']);
     unset($_POST['bak']);

     $trn = 'transfers' . SEL_YEAR;
     $flo = 'transfers_float' . SEL_YEAR;
     $stk = 'stocks';

     if( isset($fn) ) {
          // receive final
          foreach ($_POST as $k=>$v) {
               $qry = "UPDATE $trn SET transfer_qty=transfer_qty-$v WHERE item=$k AND transfer_id=$uri";
               update(DBOPS,$qry);

               $qry = "UPDATE $flo SET float_qty=float_qty-$v,conso_date='". date(TMDSET) ."' WHERE item=$k AND transfer_id=$uri";
               update(DBOPS,$qry);
          }

          $qry = "UPDATE transfers SET conso_date='". date(TMDSET) ."',conso_by='". $_SESSION['un'] ."' WHERE id=$uri";
          update(DBSTK,$qry);

          if( $fm!='STOCK IN') {
               update_stocks($_POST, $fm, '+');
               $last_id = $uri;
          }

          $sb = 'Accept Receive Final';
          // end receive final

     } elseif( isset($void) ) {
          // void
          $qry = "UPDATE transfers SET void_date='". date(TMDSET) ."',void_by='". $_SESSION['un'] ."' WHERE id=$uri";
          update(DBSTK,$qry);

          foreach ($_POST as $k=>$v) {
               $qry = "UPDATE $trn SET transfer_qty=transfer_qty-$v WHERE item=$k AND transfer_id=$uri";
               update(DBOPS,$qry);

               $qry = "UPDATE $flo SET float_qty=float_qty-$v,transfer_date=null WHERE item=$k AND transfer_id=$uri";
               update(DBOPS,$qry);
          }

          if( $fm!='STOCK IN') {
               update_stocks($_POST, $fm, '+');
               $last_id = $uri;
          }

          $sb = 'Void';
     // end void

     } else {

          switch ( $sb ) {

               case 'Transfer':
                    // trannsfer
                    if( allow_submit( test_transfers(SQLi(DBSTK), $test_stockist_id) ) ) {
                         if( $fm=='STOCK IN' || $to=='STOCK OUT' ) {
                              $qry = "INSERT INTO transfers (id,transfer_from,transfer_to,transfer_date,transfer_by,receive_date,receive_by) VALUES ('','". $fm ."','". $to ."','". date(TMDSET) ."','". $_SESSION['un'] ."','". date(TMDSET) ."','". $to ."')";
                         } else {
                              $qry = "INSERT INTO transfers (id,transfer_from,transfer_to,transfer_date,transfer_by) VALUES ('','". $fm ."','". $to ."','". date(TMDSET) ."','". $_SESSION['un'] ."')";
                         }
                         $last_id = update(DBSTK,$qry);

                         if( !empty($reorder) ) {
                              $qry = "UPDATE reorders SET transfer_id='". $last_id ."',status=2 WHERE id=" . $reorder['id'];
                              update(DBSTK,$qry);
     // echo $qry;
                         }

                         foreach ($_POST as $k=>$v) {
                              if( $v > 0 ) {
                                   $kid = substr($k,-5);

                                   if( !empty($reorder) ) {
                                        $qry = "UPDATE $trn SET transfer_qty=$v,transfer_id='". $last_id ."' WHERE item='$k' AND reorder_id='" . $reorder['id'] ."'";

                                   } else {
                                        if( $fm=='STOCK IN' || $to=='STOCK OUT' ) {
                                             $qry = "INSERT INTO $flo (id,item,float_qty,transfer_date,transfer_id) VALUES ('',$kid,0,'". date(TMDSET) ."',". $last_id .")";
                                        } else {
                                             $qry = "INSERT INTO $flo (id,item,float_qty,transfer_date,transfer_id) VALUES ('',$kid,$v,'". date(TMDSET) ."',". $last_id .")";
                                        }
                                        update(DBOPS,$qry);

                                        if( $fm=='STOCK IN' || $to=='STOCK OUT' ) {
                                             $qry = "INSERT INTO $trn (id,item,transfer_qty,receive_qty,transfer_id) VALUES ('',$kid,$v,$v,". $last_id .")";
                                        } else {
                                             $qry = "INSERT INTO $trn (id,item,transfer_qty,transfer_id) VALUES ('',$kid,$v,". $last_id .")";
                                        }
                                   }

                                   update(DBOPS,$qry);

                                   if( strpos($fm,'STOCK') === false ) {
                                        $qry = "UPDATE ".DB.DBSTK.".stocks SET qty=qty-$v WHERE id=".$fm.$kid;
                                        update(DBSTK,$qry);
                                   }
                              }
                         }

                         if( $fm=='STOCK IN' ) {
                              update_stocks($_POST, $to, '+');
                              $sb = $fm;
                         }

                         init_logs(1,'transfers',$last_id, ISIN_ADMIN ? ADMIN_ID : STOCKIST_ID );
                    }

                    break;
               // end transfer

               case 'Receive':
                    foreach ($_POST as $k=>$v) {
                         $qry = "UPDATE $trn SET receive_qty=$v WHERE item=$k AND transfer_id=$uri";
                         update(DBOPS,$qry);

                         $qry = "UPDATE $flo SET float_qty=float_qty-$v WHERE item=$k AND transfer_id=$uri";
                         update(DBOPS,$qry);
                    }

                    $qry = "UPDATE transfers SET receive_date='". date(TMDSET) ."',receive_by='". $_SESSION['un'] ."' WHERE id=$uri";
                    update(DBSTK,$qry);

                    update_stocks($_POST, STOCKIST_ID, '+');
                    $last_id = $uri;

                    init_logs(1,'transfers',$last_id, ISIN_ADMIN ? ADMIN_ID : STOCKIST_ID );
                    break;
               // end receive

               case 'Consolidate':
                    foreach ($_POST as $k=>$v) {
                         $qry = "UPDATE $trn SET consolidate=consolidate+". ((int)$v) ." WHERE item=$k AND transfer_id=$uri";
                         update(DBOPS,$qry);

                         $qry = "UPDATE $flo SET float_qty=float_qty-". ((int)$v) .",conso_date='". date(TMDSET) ."' WHERE item=$k AND transfer_id=$uri";
                         update(DBOPS,$qry);
                    }

                    $qry = "UPDATE transfers SET conso_date='". date(TMDSET) ."',conso_by='". $_SESSION['un'] ."' WHERE id=$uri";
                    update(DBSTK,$qry);

                    update_stocks($_POST, $to, '+');
                    $last_id = $uri;

                    init_logs(1,'transfers',$last_id, ISIN_ADMIN ? ADMIN_ID : STOCKIST_ID );
                    break;
               // end consolidate

          }
     }

     mysqli_close($con);
     unset($_POST);

     echo '<h5 style="font-family:Spartan;text-align:center;">'.strtoupper($sb).': Transfer # '. sprintf("%'.0".PAD."d\n", $last_id) .' Submitted</h5>';
     reloadTo( get_permalink($bak), 3 );
     exit;

}

?>
