<?php

namespace App\Libraries;

use App\Models\UserModel;

class LoginLib
{
    private $userModel;

    function __construct()
    {
        $this->userModel = new UserModel();
    }

    public function checkValid($email, $password)
    {
        $cond = " AND `status`='A' AND email = '$email' AND password = '$password'";
        $count = $this->userModel->countAllCond($cond);
        if ($count > 0) {
            return 1;
        } else {
            return false;
        }
    }
}
