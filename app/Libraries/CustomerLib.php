<?php

namespace App\Libraries;

use App\Models\CustomerModel;
use App\Models\CustomerAddressModel;

class CustomerLib
{
    private $customerModel;
    private $customerAddressModel;

    function __construct()
    {
        $this->customerModel = new CustomerModel();
        $this->customerAddressModel = new CustomerAddressModel();
    }

    public function getAllCustomers()
    {
        $cond = " AND `status`!='D' ORDER BY `createdOn` DESC";
        return $this->customerModel->find($cond);
    }

    public function getCustomerDetailsById($customerId = 0)
    {
        $cond = " AND id='$customerId' AND `status`!='D' ";
        $customer = $this->customerModel->find($cond);
        if ($customer) {
            return $customer[0];
        } else {
            return [];
        }
    }

    function getShippingAddressByCustomerId($customerId = 0)
    {
        $cond = " AND id_customer='$customerId' AND address_type='shipping' AND status='A' ";
        return $this->customerAddressModel->find($cond);
    }

    function saveCustomerAddress($record = array(), $id = 0)
    {
        if ($id) {
            $re = $this->customerAddressModel->updateById($record, $id);
        } else {
            $re = $this->customerAddressModel->insert($record);
        }
        return $re;
    }

    function getCustomerAddressById($id = 0)
    {
        $address = $this->customerAddressModel->findById($id);
        if ($address) {
            return  $address[0];
        } else {
            return [];
        }
    }
}
