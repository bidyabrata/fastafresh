<?php

namespace App\Libraries;

use App\Models\UserModel;

class UserLib
{
    private $userModel;
    function __construct()
    {
        $this->userModel = new UserModel();
    }

    public function save($record = array(), $id = 0)
    {
        if ($id) {
            $re = $this->userModel->updateById($record, $id);
        } else {
            $re = $this->userModel->insert($record);
        }
        return $re;
    }

    public function getUserDetailsByEmailPassword($email, $password)
    {
        $cond = " AND `status`='A' AND `email` = '$email' AND `password` = '$password'";
        $count = $this->userModel->countAllCond($cond);
        if ($count > 0) {
            return 1;
        } else {
            return false;
        }
    }
}
