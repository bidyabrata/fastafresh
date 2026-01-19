<?php

namespace App\Models;

class HomeBannerModel extends BaseMySqlModel
{
    public $tabName = "home_banner";
    public $primaryKey = "id";
    function __construct()
    {
        parent::__construct($this->tabName, $this->primaryKey);
    }
}
