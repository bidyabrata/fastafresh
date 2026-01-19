<?php

namespace App\Controllers\Admin;

class Dashboard extends AdminBaseController
{
    private $pageHeading;
    function __construct()
    {
        $this->pageHeading = "Dashboard";
    }

    public function index()
    {
        if($this->data['userInfo']) {
            $this->getIncludes($this->pageHeading);
            return view('admin/dashboard/landing', $this->data);
        } else {
            $url = $this->data['adminBaseUrl'] . '/login';
            return redirect()->to($url);
        }
        
    }
}
