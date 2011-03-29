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
class Models_Reservation extends Vi_Model
{ 
    /**
     * The primary key column or columns.
     * A compound key should be declared as an array.
     * You may declare a single-column primary key
     * as a string.
     *
     * @var mixed
     */
    protected $_primary = 'reservation_id';
    
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
        $this->_name = $this->_prefix . 'reservation';
        return parent::__construct($config); 
    }
    
    public function searchExistRerservation($startTime, $endTime, $maxTotal)
    {
        $sql = " SELECT time, SUM(quantity) as total_quantity "
             . " FROM ". $this->_name
             . " WHERE " . $this->getAdapter()->quoteInto('time>=?', $startTime)
             . "       AND " . $this->getAdapter()->quoteInto('time<=?', $endTime)
             . " GROUP BY time HAVING " . $this->getAdapter()->quoteInto('total_quantity > ?', $maxTotal);

//        echo $sql;die;
        
        return $this->_db->fetchAll($sql);
    }
}