<?php

namespace App\Models;

class CustomerModel extends BaseMySqlModel
{
    public $tabName = "customers";
    public $primaryKey = "id";
    function __construct()
    {
        parent::__construct($this->tabName, $this->primaryKey);
    }
}
