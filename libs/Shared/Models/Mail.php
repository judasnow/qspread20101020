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
    

    /**
     * Send HTML mail from DB mail template
     * 
     * @param string $mailTemplateName
     * @param array $data
     * @param string|array $to 
     * @param string $subject If null, subject from DB will be chosen
     */
    public function sendHtmlMail($mailTemplateName, $data = array(), $to = array(), $subject = null, $langId = null)
    {
        if (!is_array($to)) {
            $to = array($to);
        }
        if (null == $langId) {
            $langId = 1;
        }
        /**
         * Get mail template
         */
        $select = $this->select()
                ->setIntegrityCheck(false)
                ->from(array('m' => $this->_name))
                ->joinLeft(array('ml' => $this->_prefix . 'mail_lang'), 'm.mail_id = ml.mail_id', array('lang_id', 'subject', 'content'))
                ->where('m.name=?', $mailTemplateName)
                ->where('ml.lang_id=?', $langId);
        
        $mail = @$this->fetchRow($select)->toArray(); 
        if (null == $mail) {
            return true;
        }
        /**
         * Change key
         */
        $newKey = array();
        foreach ($data as $index => $item) {
            $newKey['['. strtoupper($index) . ']'] = $item;
        }
        $data = $newKey;
        /**
         * Insert data file for the first time call
         */
        if (null == $mail['data'] && ! empty($data)) {
            $this->update(array('data' => implode('<br/>', array_keys($data))), array('name=?' => $mailTemplateName));
        }
        /**
         * Replace subject
         */
        if (null == $subject) {
            /**
             * Replace subject with DATA
             */
            $mail['subject'] = str_replace(array_keys($data), $data, $mail['subject']);
        } else {
            $mail['subject'] = $subject;
        }
        
        /**
         * Replace content
         */
        $mail['content'] = str_replace(array_keys($data), $data, $mail['content']);
//        echo '<pre>';print_r($mail);die;
        
        
        $fromMail = Vi_Registry::getConfig('fromMail');
        // To send HTML mail, the Content-type header must be set
        $headers  = 'MIME-Version: 1.0' . "\r\n";
        $headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
        if (null != $fromMail) {
            $headers .= "From: {$fromMail}" . "\r\n" .
                "Reply-To: {$fromMail}" . "\r\n" .
                'X-Mailer: PHP/' . phpversion();
        }
        
        /**
         * Send mail
         */
        foreach ($to as $email) {
            @mail($email, $mail['subject'], $mail['content'], $headers);
        }
    }
}