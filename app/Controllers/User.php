<?php

namespace App\Controllers;

use App\Libraries\UserLib;

class User extends BaseController
{

    public $userLib; 

    function __construct()
    {
        $this->userLib = new UserLib();
    }

    public function index()
    {
        $this->getIncludes();
        return view('user/account', $this->data);
    }
    
    public function loginBfrOtp()
    {   
        $phone = '9804053550';
        $otp = rand(100000, 999999);
        $checkNumbrIsExists =  $this->userLib->isUserExists($phone, $otp); 
        if($checkNumbrIsExists) {
            echo 1; die;
        }else {
            echo 2; die;
        }
    }

    public function loginAftrOtp()
    {
        $phone = '9804053550';
        $otp = '614352';
        $checkOtp = $this->userLib->validOtp($phone, $otp); 
        if($checkOtp) {
            echo 1; die;
        } else {
            echo 0; die;
        }
    }

    public function registerBfrOtp()
    {
        $fname = 'subhadeep';
        $lname = 'bose';
        $email = 'subhadeep.412@gmail.com';
        $phone = '9804053550';
        $regOtp = rand(100000, 999999);
        $storeTheUser = $this->userLib->saveUserTemporary($fname, $lname, $email, $phone, $regOtp); 
        if($storeTheUser) {
            echo 1; die;
        }else {
            echo 2; die;
        }
    }

    public function registerAftrOtp()
    {
        $email = 'subhadeep.412@gmail.com';
        $phone = '9804053550';
        $otp = '545716';
        $storeTheUser = $this->userLib->saveUser($email, $phone, $otp); 
        if($storeTheUser) {
            echo 1; die;
        }else {
            echo 2; die;
        }
    }

    public function forgetPassword()
    {
        # code...
    }

    public function changePassword()
    {
        # code...
    }
}
