<?php

namespace App\Libraries;

use App\Models\ProductCatModel;

// tested and rectified on: 20/06/2021 for admin section
class CategoryLib
{
    private $productCategoryModel;

    function __construct()
    {
        $this->productCategoryModel = new ProductCatModel();
    }

    // used by admin
    public function saveCategory($record = array(), $id = 0)
    {
        if ($id) {
            $re = $this->productCategoryModel->updateById($record, $id);
        } else {
            $re = $this->productCategoryModel->insert($record);
        }
        return $re;
    }

    // used by admin
    public function getProductCategories()
    {
        $select = "id,name,url_mask,show_on_menu,default_image,status";
        $cond = " AND `status`!='D' ORDER BY `updatedOn` DESC";
        return $this->productCategoryModel->find($cond, $select);
    }

    //used by admin
    public function getCategoryById($id)
    {
        $category = $this->productCategoryModel->findById($id);
        if ($category) {
            return  $category[0];
        } else {
            return [];
        }
    }

    /* frontend related functions */
    // for frontend use and api use
    public function getCategories()
    {
        $select = "id,name,url_mask,default_image,id_parent,icon_name";
        $cond = " AND `status`='A' AND `id_parent`=0 AND `show_on_menu`='Yes' ORDER BY `position`";
        $parentProductCategory =  $this->productCategoryModel->find($cond, $select);
        foreach ($parentProductCategory as $key => $value) {
            $parentId = $value['id'];
            $cond = " AND `status`='A' AND `id_parent`='$parentId' AND `show_on_menu`='Yes' ORDER BY `position`";
            $parentProductCategory[$key]['child_categories'] =  $this->productCategoryModel->find($cond, $select);
        }
        return $parentProductCategory;
    }

    /** frontend
     * 
     */
    public function getCategoryByMask($urlMask)
    {
        $select = "id,name,url_mask,content,id_parent";
        $cond = " AND `status`='A' AND `url_mask`='$urlMask' ORDER BY `position`";
        $res =  $this->productCategoryModel->find($cond, $select);
        if ($res) {
            return $res[0];
        } else {
            return [];
        }
    }

    /** frontend
     * 
     */

    public function getSiblingCategoriesWithChild($catId = 0)
    {
        $select = "id,name,url_mask";
        $cond = " AND `status`='A' AND `id_parent`='$catId' AND `show_on_menu`='Yes' ORDER BY `position`";
        $parentProductCategory =  $this->productCategoryModel->find($cond, $select);
        // foreach ($parentProductCategory as $key => $value) {
        //     $parentId = $value['id'];
        //     $cond = " AND `status`='A' AND `id_parent`='$parentId' AND `show_on_menu`='Yes' ORDER BY `position`";
        //     $parentProductCategory[$key]['child-categories'] =  $this->productCategoryModel->find($cond, $select);
        // }
        return $parentProductCategory;
    }

    // for api use- not used currently
    public function getParentCategories($id = 0)
    {
        $select = "id,name,default_image";
        $cond = " AND `status`='A' AND `id_parent`='$id' AND `show_on_menu`='Yes' ORDER BY `position`";
        $parentProductCategory =  $this->productCategoryModel->find($cond, $select);
        return $parentProductCategory;
    }
}
