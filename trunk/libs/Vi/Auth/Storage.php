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
 * 
 */
require_once 'Zend/Auth/Storage/Session.php';

class Vi_Auth_Storage extends Zend_Auth_Storage_Session
{
	public function __construct()
	{
		parent::__construct(Vi_Constant::SESSION_NAMESPACE . "_" . Vi_Registry::getAppName(), 'user');
	}
}