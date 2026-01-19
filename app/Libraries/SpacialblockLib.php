<?php

namespace App\Libraries;

use App\Models\ContentBlockModel;

class SpacialblockLib
{
    private $pageModel;

    function __construct()
    {
        $this->contentBlockModel = new ContentBlockModel();
    }

    public function getBlocks()
    {
        $select = "id,name,content,is_removeable,status,createdOn";
        $cond = " AND `status`='A' ORDER BY `createdOn` DESC";
        return $this->contentBlockModel->find($cond, $select);
    }

    public function saveBlock($record = array(), $id = 0)
    {
        if ($id) {
            $re = $this->contentBlockModel->updateById($record, $id);
        } else {
            $re = $this->contentBlockModel->insert($record);
        }
        return $re;
    }

    public function getBlockById($id)
    {
        $category = $this->contentBlockModel->findById($id);
        if ($category) {
            return  $category[0];
        } else {
            return [];
        }
    }
}
