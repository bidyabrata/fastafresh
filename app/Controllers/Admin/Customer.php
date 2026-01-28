<?php

namespace App\Controllers\Admin;

use App\Libraries\CustomerLib;

class Customer extends AdminBaseController
{
    private $customerLib;
    private $pageHeading;

    function __construct()
    {
        $this->pageHeading = "Customers";
        $this->customerLib = new CustomerLib();
    }

    public function index()
    {
        if ($this->data['userInfo']) {
            $this->data["allCustomers"] = $this->customerLib->getAllCustomers();
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
