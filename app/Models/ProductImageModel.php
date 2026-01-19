<?php

namespace App\Models;

class ProductImageModel extends BaseMySqlModel
{
    public $tabName = "product_image";
    public $primaryKey = "id_product";
    function __construct()
    {
        parent::__construct($this->tabName, $this->primaryKey);
    }
}
