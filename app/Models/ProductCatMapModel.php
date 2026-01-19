<?php

namespace App\Models;

class ProductCatMapModel extends BaseMySqlModel
{
    public $tabName = "product_category_map";
    public $primaryKey = "id_product";
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
        $this->builder->join('products as b', 'a.id_product = b.id', 'LEFT');
        $row = $this->builder->get()->getResultArray();
        return $row;
    }

    public function join_cond_with_inventory($cond = "", $select = '*', $limit = NULL, $offset = NULL)
    {
        $this->builder->select($select);
        if ($cond) {
            $where = ' 1 ' . $cond;
            $this->builder->where($where);
        }
        if ($limit != NULL) {
            $this->builder->limit($limit, $offset);
        }
        $currentDateTime = date("Y-m-d H:i:s");
        $this->builder->from($this->tabName . " as a", true);
        $this->builder->join('products as b', 'a.id_product = b.id', 'LEFT');
        $this->builder->join('product_brands as pb', 'b.id_brand = pb.id', 'LEFT');
        $this->builder->join('product_inventory as pi', 'a.id_product = pi.id_product', 'LEFT');
        $row = $this->builder->get()->getResultArray();
        return $row;
    }

    public function join_cond_with_inventory_variations($cond = "", $select = '*', $limit = NULL, $offset = NULL)
    {
        $this->builder->select($select);
        if ($cond) {
            $where = ' 1 ' . $cond;
            $this->builder->where($where);
        }

        $this->builder->from($this->tabName . " as a", true);
        $this->builder->join('products as b', 'a.id_product = b.id', 'LEFT');
        $this->builder->join('product_brands as pb', 'b.id_brand = pb.id', 'LEFT');
        $this->builder->join('product_inventory as pi', 'a.id_product = pi.id_product', 'LEFT');
        // LEFT JOIN to get variation products based on combinations field
        $this->builder->join('products as vp', 'FIND_IN_SET(vp.id, b.combinations) > 0', 'LEFT');

        $this->builder->groupBy('b.id');
        $this->builder->orderBy('b.position', 'ASC');

        if ($limit != NULL) {
            $this->builder->limit($limit, $offset);
        }

        $row = $this->builder->get()->getResultArray();
        return $row;
    }
}
