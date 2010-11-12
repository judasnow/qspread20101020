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
class Models_Scontent extends Vi_Model
{ 
    /**
     * The primary key column or columns.
     * A compound key should be declared as an array.
     * You may declare a single-column primary key
     * as a string.
     *
     * @var mixed
     */
    protected $_primary = 'scontent_id';
    
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
        $this->_name = $this->_prefix . 'scontent';
        return parent::__construct($config); 
    }

    /**
     * Get all content with conditions
     * 
     * @param $condition
     * @param $order
     * @param $count
     * @param $offset
     */
    public function getAllContentsWithDefaultLang($condition = array(), $order = null, $count = null, $offset = null)
    {
        $select = $this->select()
                ->setIntegrityCheck(false)
                ->from(array('s' => $this->_name), array('scontent_id', 'senabled' => 'enabled', 'publish_up_date' => 'publish_up_date', 'publish_down_date' => 'publish_down_date' , 'ssorting' => 'sorting', 'created_date' => 'created_date'))
                ->join(array('sl' => $this->_prefix . 'scontent_lang'), 's.scontent_id = sl.scontent_id')
                ->join(array('sc' => $this->_prefix . 'scontent_category'), 's.scontent_category_id = sc.scontent_category_id', array('cname' => 'name'))
                ->order($order)
                ->limit($count, $offset);
        /**
         * Conditions
         */
        if (null != @$condition['keyword']) {
            $select->where($this->getAdapter()->quoteInto('sl.title LIKE ?', "%{$condition['keyword']}%"));
        }
        if (null != @$condition['scontent_category_id']) {
            $select->where("s.scontent_category_id = ?", $condition['scontent_category_id']);
        }
        if (null != @$condition['lang_id']) {
            $select->where("sl.lang_id = ?", $condition['lang_id']);
        }
        
        return $this->fetchAll($select)->toArray();
    }

    /**
     * Get all content with conditions
     * 
     * @param $condition
     * @param $order
     * @param $count
     * @param $offset
     */
    public function getAllContents($condition = array(), $order = null, $count = null, $offset = null)
    {
        $select = $this->select()
                ->setIntegrityCheck(false)
                ->from(array('s' => $this->_name))
                ->join(array('sc' => $this->_prefix . 'scontent_category'), 's.scontent_category_id = sc.scontent_category_id', array('cname' => 'name'))
                ->order($order)
                ->limit($count, $offset);
        /**
         * Conditions
         */
        if (null != @$condition['keyword']) {
            $select->join(array('sl' => $this->_prefix . 'scontent_lang'), 's.scontent_id = sl.scontent_id', array('title'))
                    ->where($this->getAdapter()->quoteInto('sl.title LIKE ?', "%{$condition['keyword']}%"))
                    ->group('s.scontent_id');
        }
        if (null != @$condition['scontent_category_id']) {
            $select->where("s.scontent_category_id = ?", $condition['scontent_category_id']);
        }
        
        return $this->fetchAll($select)->toArray();
    }
    
    public function increaseSorting($startPos = 1, $num = 1)
    {
        $sql = "UPDATE {$this->_name} SET sorting = sorting + " . intval($num) . " WHERE sorting >= " . intval($startPos);
        
        $this->_db->query($sql);
    }

    public function getContentByUrl($url, $langId)
    {
        $url = $this->getAdapter()->quote($url);
        $langId = intval($langId);
        $time = time();
        
        $query = "
                 SELECT *
                 FROM ( SELECT * 
                        FROM {$this->_prefix}scontent_lang 
                        WHERE lang_id = {$langId} AND enabled = 1 AND url = {$url} 
                       ) AS sl
                 JOIN ( SELECT scontent_id, scontent_category_id, enabled AS senabled, publish_up_date, publish_down_date, sorting AS ssorting, created_date
                        FROM {$this->_prefix}scontent 
                        WHERE enabled = 1 AND publish_up_date <= {$time} AND (publish_down_date = 0 OR publish_down_date > {$time} )
                       ) AS s
                 ON s.scontent_id = sl.scontent_id
                 LIMIT 0,1
        ";
//        echo $query;die;
        
        return $this->_db->fetchRow($query);
    }
}