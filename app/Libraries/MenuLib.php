<?php

namespace App\Libraries;

use App\Models\AppMenuModel;

class MenuLib
{
    private $menuModel;
    function __construct()
    {
        $this->menuModel = new AppMenuModel();
    }

    public function save($record = array(), $id = 0)
    {
        if ($id) {
            $re = $this->menuModel->updateById($record, $id);
        } else {
            $re = $this->menuModel->insert($record);
        }
        return $re;
    }

    public function getAllMenus()
    {
        $cond = " ORDER BY position ASC";
        return $this->menuModel->find($cond);
    }

    public function getMenuTree($parentId = 0)
    {
        $cond = " AND `id_parent`='$parentId' AND `status`='A' ORDER BY position ASC";
        $label1Menus = $this->menuModel->find($cond);
        if ($label1Menus) {
            foreach ($label1Menus as $key => $value) {
                $label1Menus[$key]['childMenus'] = $this->getMenuTree($value['id']);
            }
        }
        return $label1Menus;
    }
}
