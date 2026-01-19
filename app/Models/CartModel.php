<?php

namespace App\Models;

class CartModel extends BaseMySqlModel
{
    public $tabName = "carts";
    public $primaryKey = "id";
    function __construct()
    {
        parent::__construct($this->tabName, $this->primaryKey);
    }
}
