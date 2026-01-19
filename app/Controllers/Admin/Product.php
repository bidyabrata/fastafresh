<?php

namespace App\Controllers\Admin;

use App\Libraries\CategoryLib;
use App\Libraries\ProductLib;
use App\Libraries\SeoLib;
use App\Libraries\InventoryLib;
use App\Libraries\ProductOfferLib;

class Product extends AdminBaseController
{
    private $productLib;
    private $categoryLib;
    private $seoLib;
    private $inventoryLib;
    private $productOfferLib;
    private $pageHeading;

    function __construct()
    {
        $this->pageHeading = "Products";
        $this->productLib = new ProductLib();
        $this->categoryLib = new CategoryLib();
        $this->seoLib = new SeoLib();
        $this->inventoryLib =  new InventoryLib();
        $this->productOfferLib =  new ProductOfferLib();
    }

    // tested and rectified on: 20/06/2021
    public function index()
    {
        $this->data["allProducts"] = $this->productLib->getAllProductsWithDefaultCat();
        if ($this->request->isAJAX()) {
            return view('admin/product/landing-content', $this->data);
        }
        $this->getIncludes($this->pageHeading);
        return view('admin/product/landing', $this->data);
    }

    // tested and rectified on: 20/06/2021
    public function addFiles()
    {
        $file = $this->request->getFile('file');
        $newName = time() . "-" . strtolower(preg_replace("![^a-z0-9_.]+!i", "-", $file->getName()));
        $uploaded = $file->move(ROOTPATH . '/public/uploads/product', $newName);
        echo $newName;
    }

    // tested and rectified on: 20/06/2026
    public function save($id = 0)
    {
        if ($this->request->getPost()) {
            $prodCatArr = [];
            $url = trim(strtolower($this->request->getPost('url_mask')));
            $url_mask = preg_replace("![^a-z0-9]+!i", "-", $url);
            $deafultCatId  = $this->request->getPost('default_category');
            $combinations  = $this->request->getPost('combinations') ? implode(",", $this->request->getPost('combinations')) : NULL;

            $recordArr = array(
                'sku' => $this->request->getPost('sku'),
                'name' => $this->request->getPost('name'),
                'url_mask' =>  $url_mask,
                'id_default_category' => $deafultCatId,
                'id_brand' => $this->request->getPost('brand'),
                'price' => $this->request->getPost('price'),
                'offer_price' => $this->request->getPost('offer_price'),
                'price_unit' => $this->request->getPost('price_unit'),
                'cost_of_product' => $this->request->getPost('cost_of_product'),
                'short_desc' => $this->request->getPost('srtext'),
                'description' => htmlentities($this->request->getPost('content')),
                'product_type' => $this->request->getPost('product_type'),
                'combinations' => $combinations,
                'tag' => null,
                'is_visible_to_list' => 1,
                'position' => $this->request->getPost('position'),
                'status' => $this->request->getPost('status'),
                'updatedOn' => date("Y-m-d H:i:s")
            );
            if (!$id) {
                $recordArr['createdOn'] = date("Y-m-d H:i:s");
            }
            if ($this->request->getPost('old_file_names')) {
                $recordArr['default_image'] = $this->request->getPost('old_file_names');
            }
            if ($this->request->getPost('file_name')) {
                $recordArr['default_image'] = $this->request->getPost('file_name');
                if ($this->request->getPost('old_file_name')) {
                    unlink(ROOTPATH . '/public/uploads/product/' . $this->request->getPost('old_file_names'));
                }
            }
            if (empty($this->request->getPost('old_file_names')) && empty($this->request->getPost('file_name'))) {
                $recordArr['default_image'] = '';
            }

            $re = $this->productLib->saveProduct($recordArr, $id);
            if ($id) {
                $id_product = $id;
            } else {
                $id_product = $re;
            }

            //product add completed//
            $seoArr = array(
                'title' => $this->request->getPost('seoTitle'),
                'keywords' => $this->request->getPost('seoKey'),
                'description' => $this->request->getPost('seoDes'),
                'type' => 'product',
                'ref_id' => $id_product,
                'ref_name' => $this->request->getPost('name')
            );
            if ($id > 0) {
                $seoId = $this->request->getPost('seoid');
            } else {
                $seoId = 0;
            }
            $res = $this->seoLib->saveSeo($seoArr, $seoId);
            //seo add completed//

            //entry in mapping table
            if ($deafultCatId) {
                array_push($prodCatArr, $deafultCatId);
            }
            $otherCat =  $this->request->getPost('other_categories');
            if ($otherCat) {
                foreach ($otherCat as $kCat => $vCat) {
                    array_push($prodCatArr, $vCat);
                }
            }
            $addMapRec = $this->productLib->saveProductCatMapp($id_product, array_unique($prodCatArr));
            // category add completed
            if (!$id) {
                $invArr = array(
                    'id_product' => $id_product,
                    'quantity' => $this->request->getPost("quantity"),
                    'min_quantity_to_sale' => $this->request->getPost("min_quantity_to_sale"),
                    'max_quantity_to_sale' => $this->request->getPost("max_quantity_to_sale"),
                    'low_stock_lavel' => $this->request->getPost("low_stock_lavel"),
                    'out_of_stock_order' => 0,
                    'updatedOn' => date("Y-m-d H:i:s")
                );
                $invId = $this->inventoryLib->save($invArr, 0);
            } else {
                $invId = $this->request->getPost("inventory_id");
                $invArr = array(
                    'id_product' => $id_product,
                    'min_quantity_to_sale' => $this->request->getPost("min_quantity_to_sale"),
                    'max_quantity_to_sale' => $this->request->getPost("max_quantity_to_sale"),
                    'low_stock_lavel' => $this->request->getPost("low_stock_lavel"),
                    'out_of_stock_order' => 0,
                    'updatedOn' => date("Y-m-d H:i:s")
                );
                $invId = $this->inventoryLib->save($invArr, $invId);
            }
            // added to inventory 
            //other_images
            $this->productLib->removeImages($id_product);
            if ($this->request->getPost('other_images')) {
                foreach ($this->request->getPost('other_images') as $value) {
                    if ($value) {
                        $offerArr = array(
                            'image_name' => $value,
                            'id_product' => $id_product
                        );
                        $this->productLib->addImage($offerArr);
                    }
                }
            }
            if ($re) {
                $response = array(
                    "status" => 1,
                    "resp" => $re
                );
            } else {
                $response = array(
                    "status" => 0,
                    "resp" => $re
                );
            }
        } else {
            $this->data['seo'] = [];
            $this->data['getCategory'] = $this->categoryLib->getProductCategories();
            $this->data['brands'] = $this->productLib->getBrands();
            if ($id) {
                $this->data['product'] = $this->productLib->getProductById($id);
                $defaultCat = $this->data['product']['id_default_category'];
                $this->data['otherCategories'] = $this->productLib->getPordOtherCategories($id, $defaultCat);
                $this->data['seo'] = $this->seoLib->getSeoByTypeAndId("product", $id);
                $this->data['inventoryInfo'] = $this->inventoryLib->getInventoryByProdId($id);
                $this->data['otherImages'] = $this->productLib->getImagesByProdId($id);
                $this->data['combinationProducts'] = $this->productLib->getProductByCategory($defaultCat);
                # t($this->data,1);
                return view('admin/product/update', $this->data);
            } else {
                return view('admin/product/add', $this->data);
            }
        }
        echo json_encode($response);
    }

    public function remove($id)
    {
        $recordArr = array(
            'status' => 'D',
            'updatedOn' => date("Y-m-d H:i:s")
        );
        $status = 0;
        $status = $this->productLib->saveProduct($recordArr, $id);
        $this->seoLib->removeSeoByTypeAndId('product', $id);
        $response = array(
            "status" => $status
        );
        echo json_encode($response);
    }

    public function generateProductFromCSV()
    {
        $arrRes = [];
        if ($this->request->getPost('prodcsv')) {
            $filename = $_FILES["productCSV"]["tmp_name"];
            if ($_FILES["productCSV"]["size"] > 0) {
                $file = fopen($filename, "r");
                $firstline = true;
                $intVal = 0;
                while (($importdata = fgetcsv($file, 10000, ",")) !== FALSE) {
                    if (!$firstline) {
                        #t($importdata, 1);
                        $prodId = trim($importdata[0]);
                        $deafultCatId  =  trim($importdata[6]);
                        $productArr = array(
                            'sku' => trim($importdata[3]),
                            'name' => trim($importdata[1]),
                            'url_mask' => preg_replace("![^a-z0-9]+!i", "-", trim(strtolower($importdata[2]))),
                            'id_default_category' => $deafultCatId,
                            'id_brand' => trim($importdata[8]),
                            'price' => trim($importdata[9]),
                            'offer_price' => trim($importdata[10]),
                            'price_unit' => trim($importdata[11]),
                            'cost_of_product' => trim($importdata[12]),
                            'default_image' => trim($importdata[22]),
                            'short_desc' => trim($importdata[24]),
                            'description' => htmlentities($importdata[25]),
                            'product_type' => trim($importdata[4]),
                            'combinations' => trim($importdata[5]),
                            'tag' => null,
                            'is_visible_to_list' => 1,
                            'position' => trim($importdata[17]),
                            'status' => trim($importdata[18]),
                            'createdOn' => date("Y-m-d H:i:s"),
                            'updatedOn' => date("Y-m-d H:i:s")
                        );
                        $id_product = $this->productLib->saveProduct($productArr, 0);
                        // entry products table end here and SEO start here
                        $seoArr = array(
                            'title' => trim($importdata[19]),
                            'keywords' => trim($importdata[20]),
                            'description' => trim($importdata[21]),
                            'type' => 'product',
                            'ref_id' => $id_product,
                            'ref_name' => trim($importdata[1])
                        );
                        $seoRes = $this->seoLib->saveSeo($seoArr, 0);
                        // seo entry end here, product category start here
                        $prodCatArr = array();
                        array_push($prodCatArr, $deafultCatId);
                        array_push($prodCatArr, trim($importdata[7]));
                        $addMapRec = $this->productLib->saveProductCatMapp($id_product, array_unique($prodCatArr));
                        // product category map end here, inventory start here
                        $invArr = array(
                            'id_product' => $id_product,
                            'quantity' => trim($importdata[13]),
                            'min_quantity_to_sale' => trim($importdata[14]),
                            'max_quantity_to_sale' => trim($importdata[15]),
                            'low_stock_lavel' => trim($importdata[16]),
                            'out_of_stock_order' => 0,
                            'updatedOn' => date("Y-m-d H:i:s")
                        );
                        $invId = $this->inventoryLib->save($invArr, 0);
                        // offer end here, image start here
                        if (trim($importdata[23])) {
                            $offerArr = array(
                                'image_name' => trim($importdata[23]),
                                'id_product' => $id_product
                            );
                            $this->productLib->addImage($offerArr);
                        }
                        // image adding end here

                        $intVal = $intVal + 1;
                    }
                    $firstline = false;
                }
                fclose($file);
                $arrRes = array(
                    'message' => 'CSV import  suceessfully..',
                    'status' => 1
                );
            } else {
                $arrRes = array(
                    'message' => 'Uploaded file is missing..',
                    'status' => 0
                );
            }
        } else {
            $arrRes = array(
                'message' => 'Invalid post functionality..',
                'status' => 0
            );
        }
        echo json_encode($arrRes);
    }

    private function getSkuOfProduct($id = 0)
    {
        $retVal = '';
        $timeInterVal = time();
        $iniSkuFormat = $this->formatTwoDigitId($id);
        $retVal = 'SKU' . $timeInterVal . $iniSkuFormat;
        return $retVal;
    }

    private function formatTwoDigitId($numVal = 0)
    {
        $retID = '0';
        if (strlen($numVal) > 0) {
            $lenVal = strlen((string)$numVal);
            //
            $addedVal = '';
            if ($lenVal === 1) {
                $addedVal = '0' . $numVal;
                $retID = $addedVal;
            } else {
                $addedVal = $numVal;
                $retID = $addedVal;
            }
        }
        return $retID;
    }
}
