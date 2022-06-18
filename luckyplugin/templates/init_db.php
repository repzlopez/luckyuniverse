<?php
$arr = array('logs','assemble','bonus','sales','stockistfee','survey','transactions','transfers','transfers_float','withdrawals');

foreach($arr as $k) {
     $db  = ( $k=='logs' ? $k : DBOPS );
     $tbl = $k . date('Y');
     $con = SQLi($db);
     $qry = "SELECT table_name
          FROM information_schema.tables
          WHERE table_schema = '" . DB . "$db'
          AND table_name = '$tbl'";

     $rs = mysqli_query($con,$qry) or die(mysqli_error($con));
     if( mysqli_num_rows($rs)<1 ) {
          $qry = createTable($k);
          mysqli_query($con,$qry) or die(mysqli_error($con));

          init_logs(0, $tbl, 0, 'auto');
          // if( ISIN_ADMIN ) echo '<h5>' . ucwords($k) .' '. date('Y') . ' created on '.$stamp.'</h5>';
     }
}

function createTable($k){
     $tbl = $k . date('Y');

     switch( $k ) {
          case 'logs': // initialize logs for the year
               $qry="CREATE TABLE IF NOT EXISTS $tbl (
                    id        INT(16)        unsigned zerofill NOT NULL auto_increment,
                    act       TINYINT(1)     NOT NULL default 0,
                    tbl       VARCHAR(16)    NULL default NULL,
                    affect    INT(8)         unsigned zerofill NOT NULL,
                    who       VARCHAR(16)    NULL default NULL,
                    stamp     DATETIME       NULL default NULL,
                              PRIMARY KEY (id) )";
               break;

          case 'assemble': // initialize assemble for the year
               $qry="CREATE TABLE IF NOT EXISTS $tbl (
                    id        INT(8)         unsigned zerofill NOT NULL auto_increment,
                    package   INT(5)         unsigned zerofill NOT NULL,
                    warehouse INT(8)         unsigned zerofill NOT NULL,
                    qty       INT(11)        unsigned zerofill NOT NULL,
                    date      DATETIME       NULL default NULL,
                              PRIMARY KEY (id) )";
               break;

          case 'bonus': // initialize bonus for the year
               $qry="CREATE TABLE IF NOT EXISTS $tbl (
                    id        INT(8)         unsigned zerofill NOT NULL auto_increment,
                    trans_id  INT(8)         unsigned zerofill NOT NULL,
                    wid_id    INT(8)         unsigned zerofill NOT NULL,
                    dsdid     INT(8)         unsigned zerofill NOT NULL,
                    pov       FLOAT          NOT NULL default 0,
                    bonus     FLOAT          NOT NULL default 0,
                    status    TINYINT(1)     NOT NULL default 0,
                              PRIMARY KEY (id) )";
               break;

          case 'sales': // initialize sales for the year
               $qry="CREATE TABLE IF NOT EXISTS $tbl (
                    id        INT(8)         unsigned zerofill NOT NULL auto_increment,
                    item      INT(5)         NOT NULL default 0,
                    qty       INT(4)         NOT NULL default 0,
                    pov       FLOAT          NOT NULL default 0,
                    price     FLOAT          NOT NULL default 0,
                    discount  FLOAT          NOT NULL default 0,
                    discount_code  VARCHAR(8)  NULL default NULL,
                    trans_id  INT(8)         unsigned zerofill NOT NULL,
                              PRIMARY KEY (id) )";
               break;

          case 'stockistfee': // initialize stockistfee for the year
               $qry="CREATE TABLE IF NOT EXISTS $tbl (
                    id        INT(8)         unsigned zerofill NOT NULL auto_increment,
                    reorder_id INT(8)         unsigned zerofill NOT NULL,
                    wid_id    INT(8)         unsigned zerofill NOT NULL,
                    warehouse INT(8)         unsigned zerofill NOT NULL,
                    pov       FLOAT          NOT NULL default 0,
                    bonus     FLOAT          NOT NULL default 0,
                    status    TINYINT(1)     NOT NULL default 0,
                              PRIMARY KEY (id) )";
               break;

          case 'survey': // initialize survey for the year
               $qry="CREATE TABLE IF NOT EXISTS $tbl (
                    id        INT(8)         unsigned zerofill NOT NULL auto_increment,
                    contact   VARCHAR(15)    NULL default NULL,
                    lu_fb     TINYINT(1)     NOT NULL default 0,
                    dhub_fb   TINYINT(1)     NOT NULL default 0,
                    lu_web    TINYINT(1)     NOT NULL default 0,
                    refer     INT(8)         unsigned zerofill NOT NULL,
                              PRIMARY KEY (id) )";
               break;

          case 'transactions': // initialize transactions for the year
               $qry="CREATE TABLE IF NOT EXISTS $tbl (
                    trans_id  INT(8)         unsigned zerofill NOT NULL auto_increment,
                    del_receiver VARCHAR(64) NULL default NULL,
                    del_address TEXT         NULL default NULL,
                    del_contact VARCHAR(15)  NULL default NULL,
                    del_note  TEXT           NULL default NULL,
                    pay_out   TINYINT(1)     NOT NULL default 0,
                    pay_amount FLOAT         NOT NULL default 0,
                    pay_fee   TEXT           NULL default NULL,
                    pay_date  VARCHAR(8)     NULL default NULL,
                    pay_note  TEXT           NULL default NULL,
                    pov       FLOAT          NOT NULL default 0,
                    submitted DATETIME       NULL default NULL,
                    referrer  INT(8)         unsigned zerofill NOT NULL,
                    customer_id INT(8)       unsigned zerofill NOT NULL,
                    encoded_by VARCHAR(16)   NULL default NULL,
                    encoded_on DATETIME      NULL default NULL,
                    status    TINYINT(1)     NOT NULL default 0,
                              PRIMARY KEY (trans_id) )";
               break;

          case 'transfers': // initialize transfers for the year
               $qry="CREATE TABLE IF NOT EXISTS $tbl (
                    id        INT(8)         unsigned zerofill NOT NULL auto_increment,
                    item      INT(5)         NOT NULL,
                    transfer_qty INT(11)     NOT NULL,
                    receive_qty  INT(11)     NOT NULL,
                    transfer_id  INT(8)      unsigned zerofill NULL default NULL,
                              PRIMARY KEY (id) )";
               break;

          case 'transfers_float': // initialize transfers for the year
               $qry="CREATE TABLE IF NOT EXISTS $tbl (
                    id        INT(8)         unsigned zerofill NOT NULL auto_increment,
                    item      INT(5)         NOT NULL,
                    float_qty INT(11)        NOT NULL,
                    transfer_date  DATETIME  NULL default NULL,
                    conso_date  DATETIME     NULL default NULL,
                    transfer_id  INT(8)      unsigned zerofill NULL default NULL,
                              PRIMARY KEY (id) )";
               break;

          case 'withdrawals': // initialize withdrawals for the year
               $qry="CREATE TABLE IF NOT EXISTS $tbl (
                    id        INT(8)         unsigned zerofill NOT NULL auto_increment,
                    dsdid     INT(8)         unsigned zerofill NOT NULL,
                    amount    FLOAT          NOT NULL default 0,
                    purpose   TINYINT(1)     NOT NULL default 0,
                    requested DATETIME       NULL default NULL,
                    released_on DATETIME     NULL default NULL,
                    released_by VARCHAR(16)  NULL default NULL,
                    released  TINYINT(1)     NOT NULL default 0,
                              PRIMARY KEY (id) )";
               break;

     }

     return $qry;
}
?>
