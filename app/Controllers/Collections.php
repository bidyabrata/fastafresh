<?php

namespace App\Controllers;

use App\Libraries\CategoryLib;
use App\Libraries\ProductLib;
use App\Libraries\SeoLib;

class Collections extends BaseController
{
    private $productLib;
    private $categoryLib;
    private $seoLib;
    private $limit = 15;

    function __construct()
    {
        $this->productLib = new ProductLib();
        $this->categoryLib = new CategoryLib();
        $this->seoLib =  new SeoLib();
    }

    public function productByCategory($category = 'all')
    {
        $pageNo = $this->request->getGet('page_no');
        if (!$pageNo) {
            $pageNo = 1;
        }
        $categoryDetails = $this->categoryLib->getCategoryByMask($category);
        if ($categoryDetails) {
            $categoryId = $categoryDetails['id'];
            $this->data['categoryDetails'] = $categoryDetails;
            $this->data['seoDetails'] = $this->seoLib->getSeoByTypeAndId("category", $categoryId);
            $this->data["productsInfo"] = $this->productLib->getProductsByCategoryId($categoryId, $pageNo, $this->limit);

            $childCategories = $this->categoryLib->getSiblingCategoriesWithChild($categoryId);
            if (!$childCategories) {
                $childCategories = $this->categoryLib->getSiblingCategoriesWithChild($categoryDetails['id_parent']);
            }
            $this->data['siblingCategories'] = $childCategories;
        }
        if ($this->request->isAJAX()) {
            return view('product/list-product', $this->data);
        } else {
            $this->getIncludes();
            return view('product/list', $this->data);
        }
    }

    public function productDetails($catMask = "", $urlMask = "")
    {
        $this->data['item'] = $this->productLib->getProductByUrlMask($urlMask);
        $this->data['categoryDetails'] = $this->categoryLib->getCategoryByMask($catMask);
       # t($this->data['categoryDetails'],1);
        if ($this->data['item']) {
            $categoryId = $this->data['item']['id_default_category'];
            $itemId = $this->data['item']['id'];
            $this->data['seoDetails'] = $this->seoLib->getSeoByTypeAndId("product", $itemId);
            $this->data["reletedproducts"] = $this->productLib->getProductsByCategoryId($categoryId, 1, 3, $itemId);
        }
     #   t($this->data,1);
        $this->getIncludes();
        return view('product/details', $this->data);
    }
}
