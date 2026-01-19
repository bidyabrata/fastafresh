<?php

namespace App\Controllers\Admin;

use App\Libraries\BannerLib;

class Banner extends AdminBaseController
{
    private $bannerLib;
    private $pageHeading;
    function __construct()
    {
        $this->bannerLib = new BannerLib();
        $this->pageHeading = "Sliding Banner";
    }

    public function index()
    {
        if ($this->data['userInfo']) {
            $this->data["allBanner"] = $this->bannerLib->getBlocks();
            if ($this->request->isAJAX()) {
                return view('admin/banner/landing-content', $this->data);
            }
            $this->getIncludes($this->pageHeading);
            return view('admin/banner/landing', $this->data);
        } else {
            $url = $this->data['adminBaseUrl'] . '/login';
            return redirect()->to($url);
        }
    }

    public function addFiles()
    {
        $profile = $this->request->getFile('file');
        $newName = $profile->getName();
        $date = date("Y-m-d H-i-s");
        $newFile = substr_replace($newName, '_' .$date, -4, 0);
        $uploaded = $profile->move(ROOTPATH . '/public/uploads/banner', $newFile);
        echo $newFile;
    }


    public function save($id = 0)
    {
        if ($this->request->getPost('id')) {
            $id = $this->request->getPost('id');
        }
        if ($this->request->getPost()) {
            $recordArr = array(
                'name' => $this->request->getPost('name'),
                'attached_link' => $this->request->getPost('url_mask'),
                'status' => $this->request->getPost('status')
            );
            if ($this->request->getPost('old_file_name')) {
                $recordArr['banner'] = $this->request->getPost('old_file_name');
            }
            if ($this->request->getPost('file_name')) {
                $recordArr['banner'] = $this->request->getPost('file_name');
                if ($this->request->getPost('old_file_name')) {
                    unlink(ROOTPATH . '/public/uploads/banner/' . $this->request->getPost('old_file_name'));
                }
            }
            if (empty($this->request->getPost('old_file_names')) && empty($this->request->getPost('file_name'))) {
                $recordArr['banner'] = '';
            }
            if ($id) {
                $recordArr['updatedOn'] = date("Y-m-d H:i:s");
            } else {
                $recordArr['createdOn'] = date("Y-m-d H:i:s");
            }
            $re = $this->bannerLib->saveBlock($recordArr, $id);
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
            $this->data["block"] = $this->bannerLib->getBlocks();
            if ($id) {
                $this->data['blocks'] = $this->bannerLib->getBlockById($id);
                return view('admin/banner/update', $this->data);
            } else {
                return view('admin/banner/add', $this->data);
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
        $status = $this->bannerLib->saveBlock($recordArr, $id);
        $response = array(
            "status" => $status
        );
        echo json_encode($response);
    }
}
