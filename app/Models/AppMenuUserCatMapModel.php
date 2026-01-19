<?php

namespace App\Models;

class AppMenuUserCatMapModel extends BaseMySqlModel
{
    public $tabName = "app_menu_user_cat_map";
    public $primaryKey = "id_user_category";
    function __construct()
    {
        parent::__construct($this->tabName, $this->primaryKey);
    }
}
