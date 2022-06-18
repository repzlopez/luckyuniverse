<?php
global $post;
$distri   = get_page_by_title( 'Stockist Distributors', '', 'page' );
$ret      = get_page_by_title( $post->post_title, '', 'page' );
?>

<div id="search_distributors" class="rt">
     <input type="text" id="search_box" placeholder="ID# or Username or Discount Code" required />
     <span class="dashicons dashicons-search" title="Search Distrbutor" /></span><br>
     <span class="smaller">Type * to search all records</span><span class="w1"></span>
</div><br>
<ul id="distri_list" class="listing"></ul>
<hr><div id="bottom_nav">
     <a href="?" class="btn" title="Add NEW Distributor">Add New</a>
</div>
