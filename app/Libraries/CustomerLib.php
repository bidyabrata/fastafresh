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
