<?php

namespace App\Controllers\Admin;

use App\Libraries\SpacialblockLib;

class SpecialBlocks extends AdminBaseController
{
    private $spacialblockLib;
    private $pageHeading;
    function __construct()
    {
        $this->pageHeading = "Static Block";
        $this->spacialblockLib = new SpacialblockLib();
    }

    public function index()
    {
        if ($this->data['userInfo']) {
            $this->data["allBlocks"] = $this->spacialblockLib->getBlocks();
            #t($this->data["allProducts"],1);
            if ($this->request->isAJAX()) {
                return view('admin/spacialblock/landing-content', $this->data);
            }
            $this->getIncludes($this->pageHeading);
            return view('admin/spacialblock/landing', $this->data);
        } else {
            $url = $this->data['adminBaseUrl'] . '/login';
            return redirect()->to($url);
        }
    }


    public function save($id = 0)
    {
        if ($this->request->getPost('id')) {
            $id = $this->request->getPost('id');
        }
        if ($this->request->getPost()) {
            $recordArr = array(
                'name' => $this->request->getPost('name'),
                'is_removeable' => $this->request->getPost('is_removeable'),
                'content' => $this->request->getPost('content'),
                'status' => $this->request->getPost('status')
            );
            if ($id) {
                $recordArr['updatedOn'] = date("Y-m-d H:i:s");
            } else {
                $recordArr['createdOn'] = date("Y-m-d H:i:s");
            }
            $re = $this->spacialblockLib->saveBlock($recordArr, $id);
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
            $this->data["block"] = $this->spacialblockLib->getBlocks();
            if ($id) {
                $this->data['blocks'] = $this->spacialblockLib->getBlockById($id);
                return view('admin/spacialblock/update', $this->data);
            } else {
                return view('admin/spacialblock/add', $this->data);
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
        $status = $this->spacialblockLib->saveBlock($recordArr, $id);
        $response = array(
            "status" => $status
        );
        echo json_encode($response);
    }
}
