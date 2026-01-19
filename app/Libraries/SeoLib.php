<?php

namespace App\Libraries;

use App\Models\SeoModal;

class SeoLib
{
    private $seoModal;

    function __construct()
    {
        $this->seoModal = new SeoModal();
    }

    // for backend
    public function getAllSeo()
    {
        $select = "id,type,title,keywords,description";
        $cond = "";
        return $this->seoModal->find($cond, $select);
    }

    //admin seo add/edit
    public function saveSeo($record = array(), $id = 0)
    {
        if ($id) {
            $re = $this->seoModal->updateById($record, $id);
        } else {
            $re = $this->seoModal->insert($record);
        }
        return $re;
    }

    //admin find seo as per id
    public function getSeoById($id = 0)
    {
        $select = "*";
        $cond = "  AND `id`='$id'";
        $res =  $this->seoModal->find($cond, $select);
        if ($res) {
            return $res[0];
        } else {
            return [];
        }
    }

    //for backend only
    public function removeSeoByTypeAndId($refType = "", $refId = "")
    {
        $cond = "AND `type`='$refType' AND `ref_id`='$refId'";
        return $this->seoModal->deleteOnCond($cond);
    }

    // for frontend and backend
    public function getSeoByTypeAndId($refType = "", $refId = "")
    {
        $select = "id,title,keywords,description";
        $cond = " AND `type`='$refType' AND `ref_id`='$refId'";
        $res =  $this->seoModal->find($cond, $select);
        if ($res) {
            return $res[0];
        } else {
            return [];
        }
    }
}
