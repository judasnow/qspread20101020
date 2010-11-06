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
class Models_Category extends Vi_Model
{ 
    protected $_primary = 'category_id';
    public function __construct($config = array())
    {
        $this->_name = $this->_prefix . 'category';
        return parent::__construct($config); 
    }    

    public function getAllCategories($condition = array(), $order = null, $count = null, $offset = null)
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
        
        return $this->fetchAll($select)->toArray();
    }
    
    public function getAllValues($catName)
    {
    	$catName = $this->getAdapter()->quote($catName);
    	$query = "  SELECT cv.*, cv.category_value_id AS value 
    				FROM (SELECT category_id FROM {$this->_name} WHERE name = {$catName}) AS c
    				JOIN {$this->_prefix}category_value AS cv
    				ON c.category_id = cv.category_id
    				ORDER BY sorting ASC, name ASC
    	";
    	
    	return $this->_db->fetchAll($query);
    }
}