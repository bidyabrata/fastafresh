<?php

namespace App\Libraries;


class StoreLib
{
    public $session;

    function __construct()
    {
        $this->session = \Config\Services::session();
    }

    public function save($sessionKey, $sessionValue)
    {
        if ($sessionValue) {
            $this->session->set($sessionKey, $sessionValue);
            return $this->session->get($sessionKey);
        } else {
            return $this->session->get($sessionKey);
        }
    }

    public function getStoredValue($sessionKey = '')
    {
        if ($this->session->get($sessionKey)) {
            return $this->session->get($sessionKey);
        } else {
            return null;
        }
    }

    public function remove($sessionKey)
    {
        $this->session->remove($sessionKey);
        return true;
    }

    public function getUserInfo()
    {
        $userInfo = $this->getStoredValue('userInfo');
        if ($userInfo) {
            return json_decode($userInfo, true);
        }
        return [];
    }

    public function getMenus()
    {
        $userMenus = $this->getStoredValue('userMenus');
        if ($userMenus) {
            return json_decode($userMenus, true);
        }
        return [];
    }
}
