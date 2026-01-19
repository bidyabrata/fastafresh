<?php

namespace App\Models;

class ContentBlockModel extends BaseMySqlModel
{
    public $tabName = "static_content_block";
    public $primaryKey = "id";
    function __construct()
    {
        parent::__construct($this->tabName, $this->primaryKey);
    }
}
