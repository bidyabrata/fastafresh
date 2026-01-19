<?php

namespace App\Controllers\Admin;

use App\Libraries\UserLib;

class Customer extends AdminBaseController
{
    private $userLib;
    private $pageHeading;
    
    function __construct()
    {
        $this->pageHeading = "Customers";
        $this->userLib = new UserLib();
    }

    public function index()
    {
        if ($this->data['userInfo']) {
            $this->data["allUsers"] = $this->userLib->getAllUser();
            if ($this->request->isAJAX()) {
                return view('admin/coustomer/landing-content', $this->data);
            }
            $this->getIncludes($this->pageHeading);
            return view('admin/coustomer/landing', $this->data);
        } else {
            $url = $this->data['adminBaseUrl'] . '/login';
            return redirect()->to($url);
        }
    }
}
