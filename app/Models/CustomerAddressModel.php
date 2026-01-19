<?php

namespace App\Models;

class CustomerAddressModel extends BaseMySqlModel
{
    public $tabName = "customers_address";
    public $primaryKey = "id";
    function __construct()
    {
        parent::__construct($this->tabName, $this->primaryKey);
    }
}
