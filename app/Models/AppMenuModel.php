<?php

namespace App\Models;

class AppMenuModel extends BaseMySqlModel
{
    public $tabName = "app_menus";
    public $primaryKey = "id";
    function __construct()
    {
        parent::__construct($this->tabName, $this->primaryKey);
    }
}
