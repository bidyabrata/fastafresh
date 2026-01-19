<?php

namespace App\Models;

class UserCatModel extends BaseMySqlModel
{
    public $tabName = "user_category";
    public $primaryKey = "id";
    function __construct()
    {
        parent::__construct($this->tabName, $this->primaryKey);
    }
}
