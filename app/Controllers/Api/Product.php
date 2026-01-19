<?php

namespace App\Controllers\Api;

use App\Controllers\BaseController;
use App\Libraries\CategoryLib;
use App\Libraries\ProductLib;

class Product extends BaseController
{
    private $productLib;
    private $categoryLib;

    function __construct()
    {
        $this->productLib = new ProductLib();
        $this->categoryLib = new CategoryLib();
    }

    public function getCategories()
    {
        $data = $this->categoryLib->getCategories();
        $resp = array(
            'status' => "success",
            'data'   => $data,
        );
        $this->apiOutput(200, $resp);
    }

    public function getProductsbyCatId($catId = 0)
    {
        $limit = $this->request->getGet('limit');
        $pageNo = $this->request->getGet('page_no');
        $data = $this->productLib->getProductsByCategoryId($catId, $pageNo, $limit);
        $resp = array(
            'status' => "success",
            'data'   => $data,
        );
        $this->apiOutput(200, $resp);
    }

    public function getProductsbyId($prodId = 0)
    {
        $data = $this->productLib->geProductByProductId($prodId);
        $resp = array(
            'status' => "success",
            'data'   => $data,
        );
        $this->apiOutput(200, $resp);
    }

    public function productSearch()
    {
        $searchKey = $this->request->getGet('searchKey');
        $limit = $this->request->getGet('limit');
        $data = $this->productLib->productSearch($searchKey, $limit);
        $resp = array(
            'status' => "success",
            'data'   => $data,
        );
        $this->apiOutput(200, $resp);
    }
}
