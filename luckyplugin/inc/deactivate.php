<?php
/**
*@package LuckyPlugin
*/

class LuckyPluginDeactivate
{
     static function deactivate() {
          flush_rewrite_rules();
     }
}
