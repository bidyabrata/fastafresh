<?php

namespace App\Controllers\Admin;

use App\Libraries\OrdersLib;

class Orders extends AdminBaseController
{
    private $ordersLib;
    private $pageHeading;
    function __construct()
    {
        $this->ordersLib = new OrdersLib();
        $this->pageHeading = "Orders";
    }

    public function index()
    {
        if ($this->data['userInfo']) {
            $this->data["allOrders"] = $this->ordersLib->getAllOrders();
            if ($this->request->isAJAX()) {
                return view('admin/orders/landing-content', $this->data);
            }
            $this->getIncludes($this->pageHeading);
            return view('admin/orders/landing', $this->data);
        } else {
            $url = $this->data['adminBaseUrl'] . '/login';
            return redirect()->to($url);
        }
    }
}
