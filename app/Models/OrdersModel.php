<?php

namespace App\Models;

class OrdersModel extends BaseMySqlModel
{
    public $tabName = "orders";
    public $primaryKey = "id";
    function __construct()
    {
        parent::__construct($this->tabName, $this->primaryKey);
    }

    public function join_cond($cond = "", $select = '*', $limit = NULL, $offset = NULL)
    {
        $this->builder->select($select);
        if ($cond) {
            $where = ' 1 ' . $cond;
            $this->builder->where($where);
        }
        if ($limit != NULL) {
            $this->builder->limit($limit, $offset);
        }
        $this->builder->from($this->tabName . " as a", true);
        $this->builder->join('order_items as b', 'a.id = b.id_order', 'LEFT');
        $row = $this->builder->get()->getResultArray();
        return $row;
    }
}
