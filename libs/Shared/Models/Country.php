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
class Models_Country extends Vi_Model
{ 
    protected $_primary = 'postal_code_id';
    public function __construct($config = array())
    {
        $this->_name = $this->_prefix . 'country';
        return parent::__construct($config); 
    }    
	/**
     * Get all country's data
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
    public function getAllCountry($order = null, $count = null, $offset = null)
    {
        $select = $this->select()
                ->setIntegrityCheck(false)
                ->from(array('u' => $this->_name))                
                ->order($order)
                ->limit($count, $offset);
                
        return $this->fetchAll($select)->toArray();
    }
}