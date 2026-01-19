<?php

namespace App\Controllers\Api;

use App\Controllers\BaseController;
use App\Models\CustomerModel;
use App\Libraries\AuthorizationLib;
use App\Libraries\CustomerLib;

class User extends BaseController
{
    private $customermodel;
    private $authorizeLib;
    private $customerLib;
    private $select = "id, id_group, fname, lname, email_address,phone,address_line_1,address_line_2,zip_code,city,id_default_shipping,status ";

    function __construct()
    {
        $this->customermodel = new CustomerModel();
        $this->authorizeLib = new AuthorizationLib();
        $this->customerLib = new CustomerLib();
    }

    public function signUp()
    {
        $email = $this->request->getPost('email');
        $cond = " AND `email_address`='$email'";
        $count = $this->customermodel->countAllCond($cond);

        if ($count == 0) {
            $recordArr = array(
                'fname' => $this->request->getPost('fname') ? $this->request->getPost('fname') : null,
                'lname' => $this->request->getPost('lname') ? $this->request->getPost('lname') : null,
                'email_address' =>  $this->request->getPost('email') ? $this->request->getPost('email') : null,
                'phone' => $this->request->getPost('phone') ? $this->request->getPost('phone') : null,
                'password' => $this->request->getPost('password') ? $this->request->getPost('password') : null,
            );

            $this->customermodel->insert($recordArr);

            $userDetails = $this->customermodel->find($cond);
            $token = $this->authorizeLib->genToken($userDetails);

            $res = array(
                'message' => 'Sign up success',
                'status' => 'success',
                'data' => [
                    'token' => $token,
                    'name' => $userDetails[0]['fname'] . ' ' . $userDetails[0]['lname'],
                    'email' => $userDetails[0]['email_address']
                ]
            );

            return $this->response->setStatusCode(200)->setJSON($res);
        } else {
            $res = array(
                'message' => 'Email exists!',
                'status' => 'error'
            );

            return $this->response->setStatusCode(422)->setJSON($res);
        }
    }

    public function login()
    {
        $data = $this->request->getJSON(true);
        $email = $data["email_address"];
        $social = $data["social"];
        if ($social == 'Y') {
            $cond = " AND `email_address`='$email'";
        } else {
            $password = $data["password"];
            $cond = " AND `email_address`='$email' AND `password`='$password' AND `status`='A'";
        }
        $userDetails = $this->customermodel->find($cond, $this->select);
        if ($userDetails) {
            if ($social == 'Y' && $userDetails[0]['status'] != 'A') {
                $res = array(
                    'message' => 'Your account is not active. Please contact admin.',
                    'status' => 'error'
                );
                $this->apiOutput(200, $res);
                return;
            }
            $userDetails[0]['default_shipping_add'] = $userDetails[0]['id_default_shipping'] != '0' ? $this->customerLib->getCustomerAddressById($userDetails[0]['id_default_shipping']) : "";
            // $userDetails[0]['default_billing_add'] = $userDetails[0]['id_default_billing'] != '0' ? $this->customerLib->getCustomerAddressById($userDetails[0]['id_default_billing']) : "";
            $res = array(
                'message' => 'Login success',
                'status' => 'success',
                'data' => $userDetails[0]
            );
        } else {
            if ($social == 'Y') {
                $fname = $data["fname"];
                $lname = $data["lname"];
                $recordArr = array(
                    'fname' => $fname ? $fname : null,
                    'lname' => $lname ? $lname : null,
                    'email_address' =>  $email ? $email : null,
                );
                $re = $this->customermodel->insert($recordArr);
                if (!$re) {
                    $res = array(
                        'message' => 'Something went wrong. Please try again later.',
                        'status' => 'error'
                    );
                    $this->apiOutput(200, $res);
                    return;
                }
                $userDetails = $this->customermodel->find($cond, $this->select);
                $userDetails[0]['default_shipping_add'] = $userDetails[0]['id_default_shipping'] != '0' ? $this->customerLib->getCustomerAddressById($userDetails[0]['id_default_shipping']) : [];
                //  $userDetails[0]['default_billing_add'] = $userDetails[0]['id_default_billing'] != '0' ? $this->customerLib->getCustomerAddressById($userDetails[0]['id_default_billing']) : [];
                $res = array(
                    'message' => 'Login success',
                    'status' => 'success',
                    'data' => $userDetails[0]
                );
            } else {
                $res = array(
                    'message' => 'Wrong credential',
                    'status' => 'error'
                );
            }
        }
        $this->apiOutput(200, $res);
    }

    public function profileUpdate($userId = 0)
    {
        $data = json_decode(file_get_contents("php://input"), true);
        $this->customermodel->updateById($data, $userId);
        $userDetails = $this->customermodel->findById($userId, $this->select);
        $userDetails[0]['default_shipping_add'] = $userDetails[0]['id_default_shipping'] != '0' ? $this->customerLib->getCustomerAddressById($userDetails[0]['id_default_shipping']) : [];
        $res = array(
            'message' => 'Profile updated successfully',
            'status' => 'success',
            'data' => $userDetails
        );
        $this->apiOutput(200, $res);
    }

    public function getShippingAddress($userId = 0)
    {
        $addressDetails = $this->customerLib->getShippingAddressByCustomerId($userId);
        $res = array(
            'status' => 'success',
            'data' => $addressDetails
        );
        $this->apiOutput(200, $res);
    }

    public function saveShippingAddress($userId = 0)
    {
        $data = json_decode(file_get_contents("php://input"), true);
        $id = $data['id'] ?? 0;
        $data['id'] = date("Y-m-d H:i:s");
        unset($data['id']);
        if (isset($id) && $id > 0) {
            $this->customerLib->saveCustomerAddress($data, $id);
        } else {
            $this->customerLib->saveCustomerAddress($data);
        }

        $res = array(
            'status' => 'success',
            'message' => 'Address saved successfully'
        );
        $this->apiOutput(200, $res);
    }
}
