<?php
/**
 * LICENSE
 * 
 * [license information]
 * 
 * @category   Vi
 * @copyright  Copyright (c) 2009 visualidea.org
 * @license    http://license.visualidea.org
 * @version    v 1.0 2009-04-15
 */
require_once 'Vi/Model.php';
class Models_CategoryValue extends Vi_Model
{ 
    protected $_primary = 'category_value_id';
    public function __construct($config = array())
    {
        $this->_name = $this->_prefix . 'category_value';
        return parent::__construct($config); 
    }    

    public function getAllCategoryValues($condition = array(), $order = null, $count = null, $offset = null)
    {
        $select = $this->select()
                ->setIntegrityCheck(false)
                ->from(array('c' => $this->_name))
                ->order($order)
                ->limit($count, $offset);
        /**
         * Conditions
         */
        if (null != @$condition['name']) {
            $select->where($this->getAdapter()->quoteInto('c.name LIKE ?', "%{$condition['name']}%"));
        }
        if (null != @$condition['category_id']) {
            $select->where('c.category_id=?', $condition['category_id']);
        }
        
        return $this->fetchAll($select)->toArray();
    }
}