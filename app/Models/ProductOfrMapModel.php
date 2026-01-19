<?php

namespace App\Models;

class ProductOfrMapModel extends BaseMySqlModel
{
    public $tabName = "product_offer_map";
    public $primaryKey = "id_product";
    function __construct()
    {
        parent::__construct($this->tabName, $this->primaryKey);
    }
}
