<?php

namespace App\Libraries;

use App\Models\ProductInvModel;
use App\Models\ProductInvTxnModel;

class InventoryLib
{
    private $inventoryModel;
    private $inventoryTxnModel;
    function __construct()
    {
        $this->inventoryModel = new ProductInvModel();
        $this->inventoryTxnModel =  new ProductInvTxnModel();
    }

    public function save($record, $id = 0)
    {
        if ($id) {
            $re = $this->inventoryModel->updateById($record, $id);
        } else {
            $re = $this->inventoryModel->insert($record);
        }
        return $re;
    }

    public function getInventoryByProdId($prodId = 0)
    {
        $cond = " AND `id_product`='$prodId'";
        $inventory =  $this->inventoryModel->find($cond);
        if ($inventory) {
            return  $inventory[0];
        } else {
            return [];
        }
    }

    public function addInvTxn($arr)
    {
    }

    public function getInvTxn($productId)
    {
    }
}
