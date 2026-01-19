<?php

namespace App\Models;

class ProductInvTxnModel extends BaseMySqlModel
{
    public $tabName = "product_inventory_txn";
    public $primaryKey = "id";
    function __construct()
    {
        parent::__construct($this->tabName, $this->primaryKey);
    }
}
