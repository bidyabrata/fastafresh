<?php

namespace App\Libraries;

use App\Models\UserCatModel;
use App\Models\AppMenuUserCatMapModel;


class UserCatLib
{
    private $userCatModel;
    private $menuUserCatMapModel;

    function __construct()
    {
        $this->userCatModel = new UserCatModel();
        $this->menuUserCatMapModel = new AppMenuUserCatMapModel();
    }

    public function save($record = array(), $id = 0)
    {
        if ($id) {
            $re = $this->userCatModel->updateById($record, $id);
        } else {
            $re = $this->userCatModel->insert($record);
        }
        return $re;
    }

    public function saveCatWiseMenu($var = null)
    {
        # code...
    }

    public function getMenuTreeById($id = 0)
    {
    }
}
