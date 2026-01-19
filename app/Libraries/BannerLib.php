<?php

namespace App\Libraries;

use App\Models\HomeBannerModel;

class BannerLib
{
    private $homeBannerModel;

    function __construct()
    {
        $this->homeBannerModel = new HomeBannerModel();
    }

    public function getBlocks()
    {
        $select = "id,name,banner,attached_link,createdOn";
        $cond = " AND `status`='A' ORDER BY `createdOn` DESC";
        return $this->homeBannerModel->find($cond, $select);
    }

    public function saveBlock($record = array(), $id = 0)
    {
        if ($id) {
            $re = $this->homeBannerModel->updateById($record, $id);
        } else {
            $re = $this->homeBannerModel->insert($record);
        }
        return $re;
    }

    public function getBlockById($id)
    {
        $category = $this->homeBannerModel->findById($id);
        if ($category) {
            return  $category[0];
        } else {
            return [];
        }
    }
}
