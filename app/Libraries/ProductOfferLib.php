<?php

namespace App\Libraries;

use App\Models\ProductOfferModel;
use App\Models\ProductOfrMapModel;

class ProductOfferLib
{
    private $productOfferMapModel;
    private $productOfrModel;
    function __construct()
    {
        $this->productOfferMapModel = new ProductOfrMapModel();
        $this->productOfrModel =  new ProductOfferModel();
    }

    function getValidOffers()
    {
        $currentDateTime = date("Y-m-d H:i:s");
        $cond = " AND `ofr_start_date`<'$currentDateTime' AND `ofr_end_date`>'$currentDateTime'";
        return $this->productOfrModel->find($cond);
    }

    function getOfferByProdId($prodId)
    {
        $retArr = [];
        $select = "id_offer";
        $cond = " AND id_product  = $prodId";
        $prodOffers =  $this->productOfferMapModel->find($cond, $select);
        foreach ($prodOffers as $key => $value) {
            array_push($retArr, $value['id_offer']);
        }
        return $retArr;
    }

    function addToMap($mapArr)
    {
        $resVal = $this->productOfferMapModel->insert($mapArr);
        return $resVal;
    }

    function removeMap($prodId)
    {
        $cond = " AND id_product  = $prodId";
        return $this->productOfferMapModel->deleteOnCond($cond);
    }
}
