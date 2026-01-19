<?php

namespace App\Controllers;

use CodeIgniter\Controller;
use App\Libraries\CategoryLib;

class BaseController extends Controller
{

	//protected $helpers = [];
	public $data = array();
	public $response = array(
		'msg'     => 'Something went wrong,Please try again',
		'status' => false,
	);
	private $categoryLib;

	/**
	 * Constructor.
	 */
	public function initController(\CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger)
	{
		// Do Not Edit This Line
		parent::initController($request, $response, $logger);

		$this->session = \Config\Services::session();
		$this->data['baseUrl'] = base_url();
		$this->data['controllerName'] = $request->getUri()->getSegment(1);
		$this->data['imagePath'] = $this->data['baseUrl'] . "/images";
		$this->data['stylePath'] = $this->data['baseUrl'] . "/styles";
		$this->data['scriptPath'] = $this->data['baseUrl'] . "/script";
		$this->data['pluginPath'] = $this->data['baseUrl'] . "/plugins";
		$this->data['uploadPath'] = $this->data['baseUrl'] . "/uploads/";
		$this->data['seoDetails'] = [];
	}

	public function getIncludes()
	{
		$this->categoryLib =  new CategoryLib();
		$this->data['productCategoriesOnMenu'] = $this->categoryLib->getCategories();
		$this->data['meta'] = view('includes/meta', $this->data);
		$this->data['style'] = view('includes/style', $this->data);
		$this->data['header'] = view('includes/header', $this->data);
		$this->data['extendedFooter'] = view('includes/footer-extended', $this->data);
		$this->data['footer'] = view('includes/footer', $this->data);
		$this->data['script'] = view('includes/script', $this->data);
	}

	public function apiOutput($statusCode, $res)
	{
		header('Access-Control-Allow-Origin: *');
		header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE, OPTIONS");
		header("Access-Control-Allow-Headers: *");
		header('Content-Type: application/json');

		$this->response->setStatusCode($statusCode);
		echo json_encode($res);
	}
}
