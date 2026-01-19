<?php

namespace App\Libraries;

use App\Models\PageModel;

class PageLib
{
    private $pageModel;

    function __construct()
    {
        $this->pageModel = new PageModel();
    }

    public function getPage()
    {
        $select = "id,name,url_mask,inc_header_footer,status,createdOn, updatedOn";
        $cond = " AND `status`='A' ORDER BY `createdOn` DESC";
        return $this->pageModel->find($cond, $select);
    }

    public function savePage($record = array(), $id = 0)
    {
        if ($id) {
            $re = $this->pageModel->updateById($record, $id);
        } else {
            $re = $this->pageModel->insert($record);
        }
        return $re;
    }

    public function getPageById($id)
    {
        $page = $this->pageModel->findById($id);
        if ($page) {
            return  $page[0];
        } else {
            return [];
        }
    }

    function getPageByUrlMask($urlMask)
    {
        $cond = " AND `url_mask`='$urlMask' AND `status`='A'";
        $page =  $this->pageModel->find($cond);
        if ($page) {
            return $page[0];
        } else {
            return [];
        }
    }
}
