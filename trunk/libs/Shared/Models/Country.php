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
    protected $_primary = 'country_id';
    public function __construct($config = array())
    {
        $this->_name = $this->_prefix . 'country';
        return parent::__construct($config); 
    }    
}