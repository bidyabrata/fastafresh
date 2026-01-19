<?php

namespace App\Controllers\Admin;

use App\Libraries\PageLib;
use App\Libraries\SeoLib;

class Pages extends AdminBaseController
{
    private $pageLib;
    private $seoLib;
    private $pageHeading;

    function __construct()
    {
        $this->pageLib = new PageLib();
        $this->seoLib = new SeoLib();
        $this->pageHeading = "Page System";
    }

    public function index()
    {
        $this->data["allPages"] = $this->pageLib->getPage();
        if ($this->request->isAJAX()) {
            return view('admin/pages/landing-content', $this->data);
        }
        $this->getIncludes($this->pageHeading);
        return view('admin/pages/landing', $this->data);
    }


    public function save($id = 0)
    {
        if ($this->request->getPost()) {
            $recordArr = array(
                'name' => $this->request->getPost('name'),
                'url_mask' => $this->request->getPost('url_mask'),
                'inc_header_footer' => $this->request->getPost('headfoot'),
                'content' => htmlentities($this->request->getPost('content')),
                'status' => $this->request->getPost('status'),
                'updatedOn' => date("Y-m-d H:i:s")
            );
            if (!$id) {
                $recordArr['createdOn'] = date("Y-m-d H:i:s");
            }
            $re = $this->pageLib->savePage($recordArr, $id);
            if ($id) {
                $id_page = $id;
            } else {
                $id_page = $re;
            }
            $seoArr = array(
                'title' => $this->request->getPost('seo_title'),
                'keywords' => $this->request->getPost('seo_keywords'),
                'description' => $this->request->getPost('seo_description'),
                'type' => 'page',
                'ref_id' => $id_page,
                'ref_name' => $this->request->getPost('name')
            );
            if ($id > 0) {
                $seoId = $this->request->getPost('seo_id');
            } else {
                $seoId = 0;
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
            if ($id) {
                $this->data['pages'] = $this->pageLib->getPageById($id);
                $this->data['seo'] = $this->seoLib->getSeoByTypeAndId("page", $id);;
                return view('admin/pages/update', $this->data);
            } else {
                return view('admin/pages/add', $this->data);
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
        $status = $this->pageLib->savePage($recordArr, $id);
        $response = array(
            "status" => $status
        );
        echo json_encode($response);
    }
}
