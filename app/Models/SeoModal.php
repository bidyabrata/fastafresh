<?php

namespace App\Models;

class SeoModal extends BaseMySqlModel
{
    public $tabName = "seo";
    public $primaryKey = "id";
    function __construct()
    {
        parent::__construct($this->tabName, $this->primaryKey);
    }
}
