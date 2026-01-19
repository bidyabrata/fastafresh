<?php

namespace App\Models;

class ProductOfferModel extends BaseMySqlModel
{
    public $tabName = "catelog_offer";
    public $primaryKey = "id";
    function __construct()
    {
        parent::__construct($this->tabName, $this->primaryKey);
    }
}
