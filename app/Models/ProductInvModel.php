<?php

namespace App\Models;

class ProductInvModel extends BaseMySqlModel
{
    public $tabName = "product_inventory";
    public $primaryKey = "id";
    function __construct()
    {
        parent::__construct($this->tabName, $this->primaryKey);
    }
}
