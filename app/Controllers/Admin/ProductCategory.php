<?php

namespace App\Controllers\Admin;

use App\Libraries\CategoryLib;
use App\Libraries\SeoLib;

// tested and rectified on: 20/06/2021
class ProductCategory extends AdminBaseController
{
    private $pageHeading;
    private $categoryLib;
    private $seoLib;

    function __construct()
    {
        $this->pageHeading = "Product Category";
        $this->categoryLib = new CategoryLib();
        $this->seoLib =  new SeoLib();
    }

    public function index()
    {
        $this->data["allCategories"] = $this->categoryLib->getProductCategories();
        if ($this->request->isAJAX()) {
            return view('admin/product-category/landing-content', $this->data);
        }
        $this->getIncludes($this->pageHeading);
        return view('admin/product-category/landing', $this->data);
    }

    public function addFiles()
    {
        $file = $this->request->getFile('file');
        $newName = time() . "-" . strtolower(preg_replace("![^a-z0-9_.]+!i", "-", $file->getName()));
        $uploaded = $file->move(ROOTPATH . '/public/uploads/product-category', $newName);
        echo $newName;
    }

    public function save($id = 0)
    {
        if ($this->request->getMethod(true) === 'POST') {
            $recordArr = array(
                'id_parent' => $this->request->getPost('parent_id'),
                'name' => $this->request->getPost('name'),
                'url_mask' => $this->request->getPost('url_mask'),
                'content' => $this->request->getPost('content'),
                'show_on_menu' => $this->request->getPost('show_on_menu'),
                'status' => $this->request->getPost('status'),
                'updatedOn' => date("Y-m-d H:i:s")
            );
            if ($this->request->getPost('old_file_name')) {
                $recordArr['default_image'] = $this->request->getPost('old_file_name');
            }
            if ($this->request->getPost('file_name')) {
                $recordArr['default_image'] = $this->request->getPost('file_name');
                if ($this->request->getPost('old_file_name')) {
                    unlink(ROOTPATH . '/public/uploads/product-category/' . $this->request->getPost('old_file_name'));
                }
            }
            if (empty($this->request->getPost('old_file_names')) && empty($this->request->getPost('file_name'))) {
                $recordArr['default_image'] = '';
            }
            if (!$id) {
                $recordArr['createdOn'] = date("Y-m-d H:i:s");
            }
            $re = $this->categoryLib->saveCategory($recordArr, $id);
            $seoArr = array(
                'title' => $this->request->getPost('seoTitle'),
                'keywords' => $this->request->getPost('seoKey'),
                'description' => $this->request->getPost('seoDes'),
                'type' => 'category',
                'ref_name' => $this->request->getPost('name')
            );
            if ($id > 0) {
                $seoId = $this->request->getPost('seoid');
                $seoArr['ref_id'] = $id;
            } else {
                $seoId = 0;
                $seoArr['ref_id'] = $re;
            }
            $res = $this->seoLib->saveSeo($seoArr, $seoId);
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
            $this->data["categories"] = $this->categoryLib->getProductCategories();
            if ($id) {
                $this->data['category'] = $this->categoryLib->getCategoryById($id);
                $this->data['seo'] = $this->seoLib->getSeoByTypeAndId("category", $id);
                return view('admin/product-category/update', $this->data);
            } else {
                return view('admin/product-category/add', $this->data);
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
        $status = $this->categoryLib->saveCategory($recordArr, $id);
        $this->seoLib->removeSeoByTypeAndId('category',$id);
        $response = array(
            "status" => $status
        );
        echo json_encode($response);
    }
}
