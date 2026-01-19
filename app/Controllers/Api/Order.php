<?php

namespace App\Controllers\Api;

use App\Controllers\BaseController;
use App\Libraries\OrdersLib;
use App\Libraries\ProductLib;

class Order extends BaseController
{
    private $ordersLib;
    private $productsLib;
    function __construct()
    {
        $this->ordersLib = new OrdersLib();
        $this->productsLib = new ProductLib();
    }

    public function calShippingCharges()
    {
        $data = $this->request->getJSON(true);
        $products = $this->productsLib->getProductsCurrentPriceByIds($data['productsId']);
        $cartedProducts = $data['cartedProducts'];
        $total = 0;
        foreach ($cartedProducts as $key => $prod) {
            $applicablePrice = 0;
            $currentProd = array_filter($products, function ($p) use ($prod) {
                return $p['id'] == $prod['id'];
            });
            if ($currentProd) {
                $currentProd = array_values($currentProd)[0];
                $applicablePrice = $currentProd['offer_price'] > 0 ? $currentProd['offer_price'] : $currentProd['price'];
            }
            $cartedProducts[$key]['applicable_price'] = $applicablePrice;
            $total += $applicablePrice * $prod['quantity'];
        }
        $shippingCharge = $this->productsLib->calculateShippingCharges($total, $data['zipcode']);
        $res = array(
            'status' => "success",
            'data'   => array(
                'products' => $products,
                'cartedProducts' => $cartedProducts,
                'shippingCharge' => $shippingCharge,
                'productsTotal' => $total,
                'payableAmount' => $total + $shippingCharge,
            ),
        );
        $this->apiOutput(200, $res);
    }

    public function createOrder()
    {
        $data = $this->request->getJSON(true);
        $products = $this->productsLib->getProductsCurrentPriceByIds($data['productsId']);
        $cartedProducts = $data['carted_items'];
        $total = 0;
        $orderItems = [];
        foreach ($cartedProducts as $key => $prod) {
            $orderItem = [];
            $orderItem["id_customer"] = $data['id_customer'];
            $orderItem["id_product"] = $prod['id'];
            $orderItem["product_name"] = $prod['name'];
            $orderItem["price_unit"] = $prod['price_unit'];
            $orderItem["quantity"] = $prod['quantity'];
            $applicablePrice = 0;
            $currentProd = array_filter($products, function ($p) use ($prod) {
                return $p['id'] == $prod['id'];
            });
            if ($currentProd) {
                $currentProd = array_values($currentProd)[0];
                $applicablePrice = $currentProd['offer_price'] > 0 ? $currentProd['offer_price'] : $currentProd['price'];
            }
            $orderItem["applicable_price"] = $applicablePrice;
            $orderItem["status"] = "A";
            $total += $applicablePrice * $prod['quantity'];
            array_push($orderItems, $orderItem);
        }
        $shippingCharge = $this->productsLib->calculateShippingCharges($total, $data['address']['zip_code']);
        $address = array(
            'shipping' => $data['address'],
            'billing' => isset($data['billing_address']) ? $data['billing_address'] : $data['address'],
        );
        $orderArr = array(
            'id_customer' => $data['id_customer'],
            'product_amount' => $total,
            'shipping_amount' => $shippingCharge,
            'service_charge_amount' => 0,
            'discount_amount' => 0,
            'payable_amount' => $total + $shippingCharge,
            'payment_method' => $data['payment_method'],
            'shipping_zipcode' => $data['address']['zip_code'],
            'addresses' => json_encode($address),
            'order_status' => 'pending',
            'status' => 'A'
        );
        $response = $this->ordersLib->createOrder($orderArr, $orderItems);
        $res = array(
            'status' => "success",
            'data'   => $response
        );
        $this->apiOutput(200, $res);
    }

    public function getOrderByCustomerId($customerId = 0)
    {
        $limit = $this->request->getGet('limit');
        $pageNo = $this->request->getGet('page_no');
        $orders = $this->ordersLib->getOrdersByCustomerId($customerId, $pageNo, $limit);
        $res = array(
            'status' => "success",
            'data'   => $orders
        );
        $this->apiOutput(200, $res);
    }

    public function getOrderDetailsById($orderId = 0)
    {
        $orderDetails = $this->ordersLib->getOrderDetailsById($orderId);
        $res = array(
            'status' => "success",
            'data'   => $orderDetails
        );
        $this->apiOutput(200, $res);
    }
}
