<?php

namespace App\Controllers;

class Cart extends BaseController
{
    public function index()
    {
        $this->getIncludes();
		return view('product/cart', $this->data);
    }
}
