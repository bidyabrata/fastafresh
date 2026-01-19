<?php

namespace App\Models;

use CodeIgniter\Model;

class BaseMySqlModel extends Model
{
    public $tabName = "";
    public $primaryKey = "";
    public $builder = "";

    function __construct($tabName, $primaryKey)
    {
        $this->tabName = $tabName;
        $this->primaryKey = $primaryKey;
        $this->builder = $this->builder($this->tabName);
    }

    function find($cond = "", $select = '*', $limit = NULL, $offset = NULL)
    {
        $this->builder->select($select);
        if ($cond) {
            $where = ' 1 ' . $cond;
            $this->builder->where($where);
        }
        if ($limit != NULL) {
            $this->builder->limit($limit, $offset);
        }
        $row = $this->builder->get()->getResultArray();
        $eventData = $this->trigger('afterFind', ['data' => $row, 'limit' => $limit, 'offset' => $offset]);
        return $eventData['data'];
    }

    function findById($id = '', $select = '*')
    {
        $this->builder->select($select);
        $this->builder->where($this->primaryKey, $id);
        return $this->builder->get()->getResultArray();
    }

    /**
     * @return insertedId for single insert, no of inserted row for batch insert
     */
    function insert($recordArr = [], bool $isMany = false)
    {
        if ($isMany) {
            $re = $this->builder->insertBatch($recordArr);
        } else {
            $re = $this->builder->insert($recordArr);
            if ($re) {
                $re = $this->db->insertID();
            }
        }
        return $re;
    }

    function updateById($record = [], $id = 0)
    {
        $this->builder->where($this->primaryKey, $id);
        $bool = $this->builder->update($record);
        return $bool;
    }

    function updateOnCond($cond, $record = [])
    {
        $where = ' 1 ' . $cond;
        $this->builder->where($where);
        $bool = $this->builder->update($record);
        return $bool;
    }

    function deleteById($id)
    {
        $this->builder->where($this->primaryKey, $id);
        $bool = $this->builder->delete();
        return $bool;
    }

    function deleteOnCond($cond)
    {
        $where = ' 1 ' . $cond;
        $this->builder->where($where);
        $bool = $this->builder->delete();
        return $bool;
    }


    function countAllCond($cond = "")
    {
        $this->builder->select('COUNT(*) AS cnt');
        if ($cond) {
            $where = ' 1 ' . $cond;
            $this->builder->where($where);
        }

        $row = $this->builder->get()->getResultArray();
        $eventData = $this->trigger('afterFind', ['data' => $row[0]['cnt']]);
        return $eventData['data'];
    }

    function lastQuery()
    {
        return $this->db->showLastQuery();
    }
}
