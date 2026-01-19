<?php

namespace App\Controllers\Admin;

use App\Libraries\LoginLib;
use App\Libraries\MenuLib;
use App\Libraries\StoreLib;

class Login extends AdminBaseController
{
    private $loginLib;
    private $storeLib;
    private $menuLib;

    function __construct()
    {
        $this->loginLib = new LoginLib();
        $this->storeLib = new StoreLib();
        $this->menuLib =  new MenuLib();
    }

    public function index()
    {
        return view('admin/login/login', $this->data);
    }

    public function login()
    {
        if ($this->request->getPost()) {
            $email = $this->request->getPost('email');
            $password = $this->request->getPost('password');
            $validUser = $this->loginLib->checkValid($email, $password);
            if ($validUser) {
                $arr = [
                    'email' => $email,
                    'password' => $password
                ];
                $storeUser = $this->saveAuthData(json_encode($arr));
                $this->storeLib->save("userMenus", json_encode($this->menuLib->getMenuTree()));
                if ($storeUser) {
                    $retUrl = $this->data['adminBaseUrl'];
                    $response = array(
                        "status" => 1,
                        "resp" => $retUrl
                    );
                } else {
                    $response = array(
                        "status" => 0,
                    );
                }
            } else {
                $response = array(
                    "status" => 0,
                );
            }
            echo json_encode($response);
        }
    }

    private function saveAuthData($encodedUserInfo)
    {
        $res = $this->storeLib->save("userInfo", $encodedUserInfo);
        if ($res) {
            return $res;
        } else {
            return false;
        }
    }

    public function logout()
    {
        $logout = $this->storeLib->remove('userInfo');
        $logout = $this->storeLib->remove('userMenus');
        if ($logout) {
            //  $this->getIncludes();
            return view('admin/login/login', $this->data);
        }
    }
}
