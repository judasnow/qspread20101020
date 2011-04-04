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
class Models_Meal extends Vi_Model
{ 
    /**
     * The primary key column or columns.
     * A compound key should be declared as an array.
     * You may declare a single-column primary key
     * as a string.
     *
     * @var mixed
     */
    protected $_primary = 'meal_id';
    
    /**
     * Constructor.
     *
     * Supported params for $config are:
     * - db              = user-supplied instance of database connector,
     *                     or key name of registry instance.
     * - name            = table name.
     * - primary         = string or array of primary key(s).
     * - rowClass        = row class name.
     * - rowsetClass     = rowset class name.
     * - referenceMap    = array structure to declare relationship
     *                     to parent tables.
     * - dependentTables = array of child tables.
     * - metadataCache   = cache for information from adapter describeTable().
     *
     * @param  mixed $config Array of user-specified config options, or just the Db Adapter.
     * @return void
     */
    public function __construct($config = array())
    {
        $this->_name = $this->_prefix . 'meal';
        return parent::__construct($config); 
    }
    
    
    public function getAllMealByResId($restaurant_id, $type, $count = null, $offset = null){    	
//        $query = "  SELECT m.*, cv.name as meal_country
//    				FROM ".$this->_prefix."meal m, ".$this->_prefix."category_value cv
//    				WHERE (m.restaurant_id = $restaurant_id) AND (m.category_value_id = cv.category_value_id) 
//    						AND (type = $type)  AND enabled = 1  					     				
//    	";     
        
        $restaurant_id = $this->getAdapter()->quote($restaurant_id);
        $query = "  SELECT m.*
                    FROM ".$this->_prefix."meal m
                    WHERE (m.restaurant_id = $restaurant_id)  AND enabled = 1                                         
        ";   
        if ( null != $count )
        	$query .= " LIMIT $offset,$count";
        
    	return $this->_db->fetchAll($query);
    }
    
	public function getDataById($meal_id){    	
        $meal_id = $this->getAdapter()->quote($meal_id);
        $query = "  SELECT m.*
    				FROM ".$this->_prefix."meal m
    				WHERE m.meal_id = $meal_id    				
    	";
    	return $this->_db->fetchRow($query);
    }  
    

    public function getAllMeals($condition = array(), $order = null, $count = null, $offset = null)
    {
        $select = $this->select()
                ->setIntegrityCheck(false)
                ->from(array('m' => $this->_name))
                ->joinLeft(array ('cl' => $this->_prefix . 'category_value'), 'cl.category_value_id = m.category_value_id', array('cuisine' => 'name'))
                ->order($order)
                ->limit($count, $offset);
        /**
         * Conditions
         */
        if (null != @$condition['name']) {
            $select->where($this->getAdapter()->quoteInto('m.name LIKE ?', "%{$condition['name']}%"));
        }
        if (null != @$condition['restaurant_id']) {
            $select->where('m.restaurant_id=?',  $condition['restaurant_id']);
        }
        
        return $this->fetchAll($select)->toArray();
    }
}