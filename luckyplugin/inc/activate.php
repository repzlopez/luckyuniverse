<?php
/**
*@package LuckyPlugin
*/

class LuckyPluginActivate
{
     function activate() {
          flush_rewrite_rules();
     }

}
