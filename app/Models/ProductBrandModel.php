<?php

namespace App\Models;

class ProductBrandModel extends BaseMySqlModel
{
    public $tabName = "product_brands";
    public $primaryKey = "id";
    function __construct()
    {
        parent::__construct($this->tabName, $this->primaryKey);
    }
}
