<?php

namespace App\Models;

class ProductCatModel extends BaseMySqlModel
{
    public $tabName = "product_category";
    public $primaryKey = "id";
    function __construct()
    {
        parent::__construct($this->tabName, $this->primaryKey);
    }
}
