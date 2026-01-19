<?php

namespace App\Libraries;

use App\Models\HomeBannerModel;

class HomePageHelper
{
    private $banner;
    function __construct()
    {
        $this->banner = new HomeBannerModel();
    }

    public function getSliders()
    {
        $select = "banner,attached_link";
        $cond = " AND `status`='A' AND `banner_type`='slider' ORDER by position";
        return $this->banner->find($cond, $select);
    }

    public function getBanners()
    {
        $select = "banner,attached_link";
        $cond = " AND `status`='A' AND `banner_type`='banner' ORDER by position";
        return $this->banner->find($cond, $select);
    }
}
