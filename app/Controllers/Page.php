<?php

namespace App\Controllers;

use App\Libraries\PageLib;
use App\Libraries\SeoLib;

class Page extends BaseController
{
    private $pageLib;
    private $seoLib;

    function __construct()
    {
        $this->pageLib = new PageLib();
        $this->seoLib =  new SeoLib();
    }

    public function index($urlMask = "")
    {
        $this->data["pageContent"] = $this->pageLib->getPageByUrlMask($urlMask);
        if($this->data["pageContent"]){
            $this->data['seoDetails'] = $this->seoLib->getSeoByTypeAndId("page", $this->data["pageContent"]['id']);
        }
        $this->getIncludes();
        return view('page', $this->data);
    }
}
