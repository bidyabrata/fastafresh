<?php

namespace App\Models;

class UserModel extends BaseMySqlModel
{
    public $tabName = "users";
    public $primaryKey = "id";
    function __construct()
    {
        parent::__construct($this->tabName, $this->primaryKey);
    }
}
