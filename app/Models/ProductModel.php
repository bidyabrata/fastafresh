<?php

namespace App\Models;

class ProductModel extends BaseMySqlModel
{
    public $tabName = "products";
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
        $this->builder->join('product_category as b', 'a.id_default_category = b.id', 'LEFT');
        $row = $this->builder->get()->getResultArray();
        return $row;
    }

    public function join_cond_details($cond = "", $select = '*', $limit = NULL, $offset = NULL)
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
        $this->builder->join('product_offer_map as c', 'a.id = c.id_product', 'LEFT');
        $this->builder->join('catelog_offer as d', "c.id_offer = d.id AND (`ofr_start_date`<'$currentDateTime' AND `ofr_end_date`>'$currentDateTime')", 'LEFT');
        $row = $this->builder->get()->getResultArray();
        return $row;
    }

    public function join_cond_with_variations($cond = "", $select = '*', $limit = NULL, $offset = NULL)
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
        $this->builder->join('product_brands as b', 'a.id_brand = b.id', 'LEFT');
        $this->builder->join('products as vp', "FIND_IN_SET(vp.id, a.combinations) > 0", 'LEFT');
        $this->builder->groupBy('a.id');
        $row = $this->builder->get()->getResultArray();
        return $row;
    }
}
