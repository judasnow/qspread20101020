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
class Models_Restaurant extends Vi_Model
{ 
    /**
     * The primary key column or columns.
     * A compound key should be declared as an array.
     * You may declare a single-column primary key
     * as a string.
     *
     * @var mixed
     */
    protected $_primary = 'restaurant_id';
    
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
        $this->_name = $this->_prefix . 'restaurant';
        return parent::__construct($config); 
    }
    /**
     * Get all restaurant's data
     *
     * Honors the Zend_Db_Adapter fetch mode.
     *
     * @param string|array                      $order    OPTIONAL An SQL ORDER clause.
     * @param int                               $count    OPTIONAL An SQL LIMIT count.
     * @param int                               $offset   OPTIONAL An SQL LIMIT offset.
     * @return array The row results per the Zend_Db_Adapter fetch mode.
     * 
     * @example $this->getAllRestaurant('restaurant_id ASC', 10, 0);
     */
    public function getAllRestaurant($order = null, $count = null, $offset = null)
    {
        $select = $this->select()
                ->setIntegrityCheck(false)
                ->from(array('r' => $this->_name))
                ->where('enabled=1')                
                ->order($order)
                ->limit($count, $offset);
          
        return $this->fetchAll($select)->toArray();
    }
    
	public function getAllRestaurantById($id)
    {
        $select = $this->select()
                ->setIntegrityCheck(false)
                ->from(array('r' => $this->_name))
                ->where('restaurant_id='.$id);               
                               
        return $this->fetchRow($select)->toArray();
    }	
    
    public function getRestaurantByData($arrData, $count = null, $offset = null){      
    	$zip = isset($arrData['zip'])?$this->getAdapter()->quote($arrData['zip']):'';	
    	$city = isset($arrData['city'])?$this->getAdapter()->quote('%'.$arrData['city'].'%'):'';	
    	$mark = isset($arrData['mark'])?$this->getAdapter()->quote($arrData['mark']):'';	
    	$name = isset($arrData['name'])?$this->getAdapter()->quote($arrData['name'].'%'):'';    		
    	$time = isset($arrData['time'])?$this->getAdapter()->quote($arrData['time']):'';	    	
    	$cuisine_id = isset($arrData['cuisine_id'])?$this->getAdapter()->quote($arrData['cuisine_id']):'';
    	
        $query = "  SELECT r.*, m.name as cuisine_name
    				FROM vi_restaurant r   
    				JOIN vi_category_value m ON (r.cuisine 	 = m.category_value_id)  				    				    				
    	";
        if ( isset($arrData['zip']) )
        	$query .= " JOIN vi_country c ON (c.postal_code = ".$zip.") AND (r.city LIKE '%c.city%')";
//        if ( isset($arrData['cuisine_id']) )
//        	$query .= " JOIN vi_meal m ON (r.restaurant_id = m.restaurant_id) AND (m.meal_id =	".$arrData['cuisine_id'].")";
        else
        	$query .= " WHERE true ";       
        if ( isset($arrData['city']) )
        	$query .= " AND (r.city LIKE ".$city.")";
        if ( isset($arrData['mark']) )
        	$query .= " AND (r.{$arrData['mark']} != ".Zend_DB::NULL_EMPTY_STRING.")";
        if ( isset($arrData['name']) )
        	$query .= " AND (r.name LIKE ".$name.")";
//        if ( isset($arrData['address']) )
//        	$query .= " AND (r.address LIKE '%".$arrData['address']."%')";
        if ( isset($arrData['date']) && isset($arrData['time']) && (strcmp($arrData['time'],'asap') != 0 ) )
        	$query .= " AND (r.date_".$arrData['date']."_start <= ".$time.") AND (r.date_".$arrData['date']."_end >= ".$time.")";
        
        $query .= " AND r.enabled=1 ";

        if ( isset($arrData['cuisine_id']) && $arrData['cuisine_id'] > 0)
        	$query .= " AND m.category_value_id =  ".$cuisine_id;
        
       	if ( null != $count )
        	$query .= " LIMIT $offset,$count";
    
//        print $query;die;
    	return $this->_db->fetchAll($query);
    }
    
    /**
     * Get all restaurants (admin)
     */
    public function getAllApprovedRestaurants($condition = array(), $order = null, $count = null, $offset = null)
    {
        $select = $this->select()
                ->setIntegrityCheck(false)
                ->from(array('r' => $this->_name))
                ->where('approved=1')
                ->order($order)
                ->limit($count, $offset);
        /**
         * Conditions
         */
        if (null != @$condition['name']) {
            $select->where($this->getAdapter()->quoteInto('r.name LIKE ?', "%{$condition['name']}%"));
        }
        
        return $this->fetchAll($select)->toArray();
    }
    

    public function getAllPendingRestaurants($condition = array(), $order = null, $count = null, $offset = null)
    {
        $select = $this->select()
                ->setIntegrityCheck(false)
                ->from(array('r' => $this->_name))
                ->where('approved=0')
                ->order($order)
                ->limit($count, $offset);
        /**
         * Conditions
         */
        if (null != @$condition['name']) {
            $select->where($this->getAdapter()->quoteInto('r.name LIKE ?', "%{$condition['name']}%"));
        }
        
        return $this->fetchAll($select)->toArray();
    }
  
	public function getShipFeeFromMealId($meal_id){     
		$meal_id = $this->getAdapter()->quote($meal_id);	 	
        $query = "  SELECT r.delivery_charge, r.catering_delivery_charge
    				FROM vi_meal m, vi_restaurant r
    				WHERE (m.meal_id = $meal_id) AND (m.restaurant_id = r.restaurant_id)  				    				
    	";       
    	return $this->_db->fetchRow($query);
    }

    
}