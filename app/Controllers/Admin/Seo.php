<?php

namespace App\Controllers\Admin;

use App\Libraries\SeoLib;

class Seo extends AdminBaseController
{
    private $seoLib;
    private $pageHeading;

    function __construct()
    {
        $this->pageHeading = "SEO";
        $this->seoLib = new SeoLib();
    }

    public function index()
    {
        if ($this->data['userInfo']) {
            $this->data["allSeo"] = $this->seoLib->getAllSeo();
            if ($this->request->isAJAX()) {
                return view('admin/seo/landing-content', $this->data);
            }
            $this->getIncludes($this->pageHeading);
            return view('admin/seo/landing', $this->data);
        } else {
            $url = $this->data['adminBaseUrl'] . '/login';
            return redirect()->to($url);
        }
    }
    public function save($id = 0)
    {
        if ($this->request->getPost()) {
            $recordArr = array(
                'title' => $this->request->getPost('seoTitle'),
                'keywords' => $this->request->getPost('seoKey'),
                'description' => $this->request->getPost('seoDes'),
            );
            $re = $this->seoLib->saveSeo($recordArr, $id);
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
            if ($id > 0) {
                $this->data['seo'] = $this->seoLib->getSeoById($id);
                return view('admin/seo/update', $this->data);
            } else {
                return view('admin/seo/add', $this->data);
            }
        }
        echo json_encode($response);
    }
}
