<?php

namespace App\Controllers\Api;

use App\Controllers\BaseController;
use App\Libraries\PageLib;

class Page extends BaseController
{
    private $pageLib;
    function __construct()
    {
        $this->pageLib = new PageLib();
    }

    public function getPageById($id = 0)
    {
        $response = $this->pageLib->getPageById($id);
        if ($response) {
            $response['pagedesc'] = html_entity_decode($response['content']);
        }
        $res = array(
            'status' => "success",
            'data'   => $response
        );
        $this->apiOutput(200, $res);
    }
}
