<?php

namespace App\Libraries;

use App\Models\ProductBrandModel;
use App\Models\ProductCatMapModel;
use App\Models\ProductImageModel;
use App\Models\ProductModel;

class ProductLib
{
    private $productModel;
    private $productCatMapModel;
    private $productImageModel;
    private $productBrandModel;

    function __construct()
    {
        $this->productModel = new ProductModel();
        $this->productCatMapModel =  new ProductCatMapModel();
        $this->productImageModel =  new ProductImageModel();
        $this->productBrandModel =  new ProductBrandModel();
    }

    // used by backend
    public function getAllProductsWithDefaultCat()
    {
        $cond = " AND a.status!='D' ORDER BY a.updatedOn DESC";
        $select = "a.id, a.name, a.price, a.offer_price,a.price_unit, a.cost_of_product, a.product_type, a.id_default_category, b.name as cat_name";
        return $this->productModel->join_cond($cond, $select);
    }

    public function getProductByCategory($catId = 0, $notIncludeProdId = 0)
    {
        $cond = "AND id_default_category='$catId' AND id!='$notIncludeProdId' ORDER BY name ASC";
        return $this->productModel->find($cond);
    }

    // get product by id
    public function getProductById($id)
    {
        $product = $this->productModel->findById($id);
        if ($product) {
            return  $product[0];
        } else {
            return [];
        }
    }

    //used by backend
    public function saveProduct($record = array(), $id = 0)
    {
        if ($id) {
            $re = $this->productModel->updateById($record, $id);
        } else {
            $re = $this->productModel->insert($record);
        }
        return $re;
    }

    //used by backend
    public function saveProductCatMapp($prodId = 0, $arrProd = [])
    {
        $resVal = false;
        if ($prodId > 0) {
            $cond = " AND id_product  = $prodId";
            $delRec = $this->productCatMapModel->deleteOnCond($cond);
            foreach ($arrProd as $k => $v) {
                $arrAdd = array(
                    'id_product' => $prodId,
                    'id_product_category' => $v
                );
                $addMapId = $this->productCatMapModel->insert($arrAdd);
            }
        }
        return $resVal;
    }

    function getPordOtherCategories($prodId = 0, $defaultCatId = 0)
    {
        $retArr = [];
        $select = "id_product_category";
        $cond = " AND `id_product`='$prodId' AND `id_product_category`!='$defaultCatId'";
        $prodInfoArr = $this->productCatMapModel->find($cond, $select);
        foreach ($prodInfoArr as $key => $value) {
            array_push($retArr, $value['id_product_category']);
        }
        return $retArr;
    }

    //used by backend 
    function addImage($mapArr)
    {
        $resVal = $this->productImageModel->insert($mapArr);
        return $resVal;
    }

    //used by backend
    function removeImages($prodId)
    {
        $cond = " AND id_product  = $prodId";
        return $this->productImageModel->deleteOnCond($cond);
    }

    function getBrands()
    {
        $cond = " AND status='A' ORDER BY name ASC";
        return $this->productBrandModel->find($cond);
    }

    //used by backend
    function getImagesByProdId($prodId)
    {
        $cond = " AND id_product  = $prodId";
        return $this->productImageModel->find($cond);
    }


    //FE and API functions
    // used by product listing
    public function getProductsByCategoryId($catId = 0, $pageNo = 1, $limit = 15, $notIncludeProdId = 0)
    {
        $select = "COUNT(*) as count";
        $cond = " AND a.id_product_category='$catId' AND b.is_visible_to_list='1' AND b.status='A'";
        if ($notIncludeProdId) {
            $cond = $cond . " AND b.id!='$notIncludeProdId'";
        }
        // $cond = $cond . " ORDER BY b.position ASC";
        $counts = $this->productCatMapModel->join_cond($cond, $select);

        $select = "b.id, b.name, b.sku, b.url_mask, b.id_default_category, b.id_brand, b.default_image, b.price, b.offer_price, b.price_unit, b.product_type, b.combinations,
            pb.name as brand_name, pb.default_image as brand_image, 
            pi.quantity as prod_stock, pi.min_quantity_to_sale, pi.max_quantity_to_sale, pi.out_of_stock_order,
            GROUP_CONCAT(
                JSON_OBJECT(
                    'id', vp.id,
                    'name', vp.name,
                    'sku', vp.sku,
                    'price', vp.price,
                    'offer_price', vp.offer_price,
                    'price_unit', vp.price_unit,
                    'default_image', vp.default_image
                )
            ) AS variations";
        $products = $this->productCatMapModel->join_cond_with_inventory_variations($cond, $select, $limit, ($limit * ($pageNo - 1)));

        // Convert variations string to array, return empty array if no variations
        foreach ($products as &$product) {
            $product['id'] = (int)$product['id'];
            if (isset($product['variations']) && !empty($product['variations'])) {
                $variations = json_decode('[' . $product['variations'] . ']', true);
                // Filter out variations with null id (no actual combinations)
                $product['variations'] = array_filter($variations, function ($var) {
                    return !empty($var['id']) || $var['id'] !== null;
                });
                // Reset array keys
                $product['variations'] = array_values($product['variations']);
            } else {
                $product['variations'] = [];
            }
            // $product['description_decoded'] = htmlspecialchars_decode($product['description']);
        }

        return array(
            "count" => $counts[0]['count'],
            "items" => $products,
            "currentPage" => $pageNo,
            "totalPage" => ceil($counts[0]['count'] / $limit)
        );
    }

    //FE and API functions
    public function geProductByProductId($prodId = 0)
    {
        $cond = " AND a.id='$prodId' AND a.status='A'";
        $select = "a.id, a.name, a.sku, a.url_mask, a.id_default_category, a.id_brand, a.default_image, a.price, a.offer_price, a.price_unit, a.product_type, a.combinations,a.short_desc,a.description,
            b.name as brand_name, b.default_image as brand_image,
            GROUP_CONCAT(
                JSON_OBJECT(
                    'id', vp.id,
                    'name', vp.name,
                    'sku', vp.sku,
                    'price', vp.price,
                    'offer_price', vp.offer_price,
                    'price_unit', vp.price_unit,
                    'default_image', vp.default_image
                )
            ) AS variations";
        $product = $this->productModel->join_cond_with_variations($cond, $select);

        if ($product) {
            $product = $product[0];
            $product['id'] = (int)$product['id'];
            // Parse variations
            if (isset($product['variations']) && !empty($product['variations'])) {
                $variations = json_decode('[' . $product['variations'] . ']', true);
                // Filter out variations with null id
                $product['variations'] = array_filter($variations, function ($var) {
                    return !empty($var['id']) || $var['id'] !== null;
                });
                // Reset array keys
                $product['variations'] = array_values($product['variations']);
            } else {
                $product['variations'] = [];
            }
            $product['description_decoded'] = htmlspecialchars_decode($product['description']);
            return $product;
        } else {
            return [];
        }
    }

    public function productSearch($searchKey = '', $limit = 12)
    {
        $select = "id,name,url_mask,id_default_category,default_image,price,offer_price,price_unit";
        $cond = " AND name LIKE '%$searchKey%' LIMIT $limit";
        return $this->productModel->find($cond, $select);
    }

    //used for product details
    public function getProductByUrlMask($url = null)
    {
        $cond = " AND a.url_mask='$url' AND a.status='A'";
        $select = "a.*,d.name as ofr_name,d.reduction_type,d.reduction";
        $product = $this->productModel->join_cond_details($cond, $select);
        if ($product) {
            return $product[0];
        } else {
            return [];
        }
    }

    public function getProductsCurrentPriceByIds($prodIds = [])
    {
        $prodInfoArr = [];
        if (count($prodIds) > 0) {
            $idsStr = implode(",", $prodIds);
            $cond = " AND id IN ($idsStr) AND status='A'";
            $select = "id,price,offer_price";
            $prodInfoArr = $this->productModel->find($cond, $select);
        }
        return $prodInfoArr;
    }

    public function calculateShippingCharges($totalAmount = 0, $zipcode = '')
    {
        // Example logic: free shipping for orders above ₹100, else ₹10 shipping
        $shippingCharge = 0;
        if ($totalAmount < 100) {
            $shippingCharge = 10;
        }
        return $shippingCharge;
    }
}
