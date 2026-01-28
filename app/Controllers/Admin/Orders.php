<?php

namespace App\Controllers\Admin;

use App\Libraries\OrdersLib;
use App\Libraries\CustomerLib;

class Orders extends AdminBaseController
{
    private $ordersLib;
    private $customerLib;
    private $pageHeading;
    function __construct()
    {
        $this->ordersLib = new OrdersLib();
        $this->customerLib = new CustomerLib();
        $this->pageHeading = "Orders";
    }

    public function index($custId = 0)
    {
        if ($this->data['userInfo']) {
            $this->data["allOrders"] = $this->ordersLib->getAllOrders($custId);
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

    public function details($id = 0)
    {
        if ($this->data['userInfo']) {
            $this->data['order'] = $this->ordersLib->getOrderDetailsById($id);
            $this->data['customerDetails'] = $this->customerLib->getCustomerDetailsById($this->data['order']['id_customer']);
            #t($this->data, 1);
            $this->getIncludes($this->pageHeading);
            return view('admin/orders/details', $this->data);
        } else {
            $url = $this->data['adminBaseUrl'] . '/login';
            return redirect()->to($url);
        }
    }
}
