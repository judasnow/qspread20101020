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

require_once 'Zend/Auth.php';
class Vi_Auth extends Zend_Auth
{
    /**
     * Returns an instance of Vi_Auth
     *
     * Singleton pattern implementation
     *
     * @return Vi_Auth Provides a fluent interface
     */
    public static function getInstance()
    {
        if (null === self::$_instance) {
            self::$_instance = new self();
        }

        return self::$_instance;
    }
	/**
     * Returns the identity from storage or null if no identity is available
     *
     * @return mixed|null
     */
    public function getUsername()
    {
        return $this->getIdentity();
    }
    /**
     * check for login or not
     * @return boolean
     */
    public function isLogin()
    {
    	return $this->hasIdentity(); 
    }
    public function clearAuthInfo()
    {
    	$this->clearIdentity();
    }
}