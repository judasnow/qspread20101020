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
require_once 'Zend/Auth/Adapter/DbTable.php';
class Vi_Auth_Adapter extends Zend_Auth_Adapter_DbTable 
{
	/**
	 * initialize all config for vi system
	 * @return unknown_type
	 */
	public function __construct()
	{
		//MD5(?) AND active = "TRUE"
		$config = Vi_Registry::getConfig();
		$db = Vi_Registry::getDB();
		parent::__construct($db, $config['database']['params']['prefix'] . "user", 'username', 'password', 'MD5(?) AND enabled = 1' );
		
	}
	/**
	 * set username
	 * @param $username String username 
	 * @return void
	 */
	public function setUsername($username = "")
	{
		$this->setIdentity($username);
	}
	/**
	 * set user password
	 * @param $password
	 * @return void
	 */
	public function setPassword($password = "")
	{
		$this->setCredential($password);
	}
	/**
	 * set user information for check auth
	 * @param $username String
	 * @param $password String
	 * @return void
	 */
	public function setUserInfo($username = "", $password = "")
	{
		$this->setIdentity($username);
		$this->setCredential($password);
	}
}