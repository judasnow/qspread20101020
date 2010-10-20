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
class Models_Mail extends Vi_Model
{ 
    /**
     * The primary key column or columns.
     * A compound key should be declared as an array.
     * You may declare a single-column primary key
     * as a string.
     *
     * @var mixed
     */
    protected $_primary = 'mail_id';
    
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
        $this->_name = $this->_prefix . 'mail';
        return parent::__construct($config); 
    }

    /**
     * Get all mails with conditions
     * 
     * @param $condition
     * @param $order
     * @param $count
     * @param $offset
     */
    public function getAllSystemMails($condition = array(), $order = null, $count = null, $offset = null)
    {
        $select = $this->select()
                ->setIntegrityCheck(false)
                ->from(array('m' => $this->_name))
                ->order($order)
                ->limit($count, $offset)
                ->where('m.type=?', Vi_Constant::MAIL_SYSTEM);
        /**
         * Conditions
         */
        if (null != @$condition['keyword']) {
            $select->join(array('ml' => $this->_prefix . 'mail_lang'), 'm.mail_id = ml.mail_id', array('subject'))
                    ->where($this->getAdapter()->quoteInto('ml.subject LIKE ?', "%{$condition['keyword']}%"))
                    ->group('m.mail_id');
        }
        
        return $this->fetchAll($select)->toArray();
    }
}