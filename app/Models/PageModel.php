<?php

namespace App\Models;

class PageModel extends BaseMySqlModel
{
    public $tabName = "page_system";
    public $primaryKey = "id";
    function __construct()
    {
        parent::__construct($this->tabName, $this->primaryKey);
    }
}
