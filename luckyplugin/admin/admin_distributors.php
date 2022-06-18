<?php
global $post;
$distri   = get_page_by_title( 'Distributors', '', 'page' );
$ret      = get_page_by_title( $post->post_title, '', 'page' );
?>

<div id="search_distributors" class="rt">
     <input type="text" id="search_box" placeholder="ID# or Username or Discount Code" required />
     <span class="dashicons dashicons-search" title="Search Distrbutor" /></span><br>
     <span class="smaller">Type * to search all records</span><span class="w1"></span>
</div><br><?php echo GODOWN ?>
<ul id="distri_list" class="listing"></ul>

<hr><div id="bottom_nav"><a id="bottom">
     <?php if( IS_GLOBAL ) echo '<a href="?rundc" id="rundc" class="btn" title="Fill-in ALL empty Discount Codes">Fill Discount</a> '; ?>
     <?php if( IS_GLOBAL ) echo '<a href="?runlogs" id="runlogs" class="btn" title="View change logs">View Logs</a> '; ?>
     <a href="?upload" class="btn" title="Upload a NEW batch of Distributors">Upload List</a>
     <a href="?new" class="btn" title="Add NEW Distributor">Add New</a>
</div>

<?php echo BACKTOTOP ?>
