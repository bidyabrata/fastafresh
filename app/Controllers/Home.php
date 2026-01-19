<?php

namespace App\Controllers;

use App\Libraries\HomePageHelper;
use App\Libraries\SeoLib;

class Home extends BaseController
{
	private $homePageHelper;
	private $seoLib;

	function __construct()
	{
		$this->homePageHelper = new HomePageHelper();
		$this->seoLib = new SeoLib();
	}

	public function index()
	{
		$this->data['sliders'] = $this->homePageHelper->getSliders();
		$this->data['banners'] = $this->homePageHelper->getBanners();
		$this->data['seoDetails'] = $this->seoLib->getSeoByTypeAndId("others", 1);
		$this->getIncludes();
		return view('home', $this->data);
	}
}
