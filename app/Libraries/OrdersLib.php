<?php

namespace App\Libraries;

use App\Models\OrderItemModel;
use App\Models\OrdersModel;

class OrdersLib
{
    private $ordersModel;
    private $orderItemsModel;

    function __construct()
    {
        $this->ordersModel = new OrdersModel();
        $this->orderItemModel = new OrderItemModel();
    }

    public function getAllOrders($custId = 0)
    {
        $select = "id,order_ref,product_amount,shipping_amount,service_charge_amount,discount_amount,discount_name,payable_amount,shipping_zipcode,addresses,status,order_status,createdOn";
        $cond = "";
        if ($custId) {
            $cond .= " AND id_customer='$custId' ";
        }
        $cond .= " AND `status`!='D' ORDER BY `createdOn` DESC";
        return $this->ordersModel->find($cond, $select);
    }

    public function createOrder($orderArr, $orderItems)
    {
        $orderId = $this->ordersModel->insert($orderArr);
        $order_ref = 'FF' . date("y-") . str_pad($orderId, 6, '0', STR_PAD_LEFT);
        $this->ordersModel->updateById(array('order_ref' => $order_ref), $orderId);
        if ($orderId && count($orderItems) > 0) {
            foreach ($orderItems as $key => $item) {
                $orderItems[$key]['id_order'] = $orderId;
            }
            $re = $this->orderItemModel->insert($orderItems, true);
        }
        return $orderId;
    }

    public function getOrderDetailsById($orderId = 0)
    {
        $select = "*";
        $cond = " AND id='$orderId' AND `status`='A'";
        $orderDetails = $this->ordersModel->find($cond, $select);
        if ($orderDetails) {
            $orderDetails = $orderDetails[0];
            $orderDetails['addresses'] = $orderDetails['addresses'] ? json_decode($orderDetails['addresses'], true) : array();
            $orderItemsCond = " AND a.id_order='$orderId' AND a.status='A' ORDER BY a.createdOn";
            $orderItemsSelect = "a.id,a.id_product,a.product_name as name,a.price_unit,a.applicable_price,a.quantity,b.default_image";
            $orderItems = $this->orderItemModel->join_cond($orderItemsCond, $orderItemsSelect);
            $orderDetails['items'] = $orderItems;
        } else {
            $orderDetails = [];
        }
        return $orderDetails;
    }

    public function getOrdersByCustomerId($customerId = 0, $pageNo = 1, $limit = 15,)
    {
        $select = "a.*,COUNT(b.id) as cart_count";
        $cond = " AND a.id_customer='$customerId' AND a.status='A' GROUP BY a.id ORDER BY a.createdOn DESC";
        $orders = $this->ordersModel->join_cond($cond, $select, $limit, ($pageNo - 1) * $limit);
        return $orders;
    }
}
