<?php

namespace App\Controllers\Admin;

use CodeIgniter\Controller;
use App\Libraries\StoreLib;

class AdminBaseController extends Controller
{
	public $data = array();
	private $storeLib;

	/**
	 * Constructor.
	 */
	public function initController(\CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger)
	{
		parent::initController($request, $response, $logger);
		$this->data['baseUrl']        = base_url();
		$this->data['adminBaseUrl']        = base_url() . '/admin';
		$this->data['controllerName'] = $request->getUri()->getSegment(2);
		$uri2 = '';
		if ($request->getUri()->getTotalSegments() >= 3 && $request->getUri()->getSegment(3)) {
			$uri2 = $request->getUri()->getSegment(3);
		}
		$this->data['methodName'] = $uri2;
		$this->data['assetPath'] = $this->data['baseUrl'] . "/backend/dist/";
		$this->data['pluginPath'] = $this->data['baseUrl'] . "/backend/plugins/";
		$this->data['scriptPath'] = $this->data['baseUrl'] . "/assets/scripts/";
		$this->storeLib = new StoreLib();
		$this->data['userInfo'] = $this->storeLib->getUserInfo();
		$this->data['uploadPath'] = $this->data['baseUrl'] . '/uploads/';
	}

	protected function getIncludes($pageHeading = "")
	{
		$this->data['userMenus'] = $this->storeLib->getMenus();
		$this->data['pageHeading'] = $pageHeading;
		$this->data['meta'] = view('admin/includes/meta', $this->data);
		$this->data['header'] = view('admin/includes/header', $this->data);
		$this->data['navigation'] = view('admin/includes/navigation', $this->data);
		$this->data['footer'] = view('admin/includes/footer', $this->data);
		$this->data['script'] = view('admin/includes/script', $this->data);
		$this->data['config'] = view('admin/includes/config', $this->data);
	}
}
