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
require_once 'Zend/Registry.php';
class Vi_Registry extends Zend_Registry 
{
	/*
	 * get database instance
	 * @return instance of Vi_Db
	 */
	public static function getDB()
	{
		return Vi_Registry::get('db');
	}
	/*
	 * get instance of Vi_Layout
	 * @return layout instance
	 */
	public static function getLayout()
	{
		return Vi_Layout::getMvcInstance();
	}
	/*
	 * get view instance
	 * @return instance of view
	 */
	public static function getView()
	{
		return Vi_Layout::getMvcInstance()->getView();
	}
	
	/*
	 * get template engine of view 
	 * @return a template engine, the default is smarty 
	 */
	public static function getTemplateEngine()
	{
		return Vi_Registry::getView()->getEngine();
	}
	/*
	 * get base url 
	 * @return string of base url
	 */
	public static function getBaseUrl()
	{
		return Vi_Registry::get('BASE_URL');
	}
	/*
	 * get application name
	 * @return string of application
	 */
	public static function getAppName()
	{
		return Vi_Registry::get('APP_NAME');
	}
	/*
	 * get application url
	 * @return string of application url
	 */
	public static function getAppBaseUrl()
	{
		return Vi_Registry::get('APP_BASE_URL');
	}
	
	public static function getHelperUrl()
	{
	    $moduleName = Vi_Registry::getModuleName();
	    return Vi_Registry::get('BASE_URL') . "modules/{$moduleName}/views/helpers/";
	}
	/*
	 * get config
	 * 
	 * $name string
	 * @return array config
	 */
	public static function getConfig($name = false)
	{
	    if (false === $name) {
		  return Vi_Registry::get('config');
	    } else {
	        $config = Vi_Registry::get('config');
	        return $config[$name];
	    }
	}
	/*
	 * get request object
	 * @return Zend_Controller_Request_Abstract
	 */
	public static function getRequest()
	{
		return Vi_Controller_Front::getInstance()->getRequest();
		
	}
	/**
	 * get response object
	 * @return Zend_Controller_Response_Abstract
	 */
	public static function getResponse()
	{
		return Vi_Controller_Front::getInstance()->getResponse();
	}
	/**
	 * get router object
	 * @return Zend_Controller_Router_Abstract
	 */
	public static function getRouter()
	{
		return Vi_Controller_Front::getInstance()->getRouter();
	}
	/**
	 * get module name
	 * @return string current module name
	 */
	public static function getModuleName()
	{
		return Zend_Controller_Front::getInstance()->getRequest()->getModuleName();
	}
	public static function getModuleKey()
	{
		return Zend_Controller_Front::getInstance()->getRequest()->getModuleKey();
	}
	
	public static function getControllerName()
	{
		return Zend_Controller_Front::getInstance()->getRequest()->getControllerName();
	}
	
	public static function getControllerKey()
	{
		return Zend_Controller_Front::getInstance()->getRequest()->getControllerKey();
	}
	
	public static function getActionName()
	{
		return Zend_Controller_Front::getInstance()->getRequest()->getActionName();
	}
	
	public static function getActionKey()
	{
		return Zend_Controller_Front::getInstance()->getRequest()->getActionKey();
	}
	/**
	 * get database prefix
	 * @return string prefix for database
	 */
	public static function getDBPrefix()
	{
		$config = Vi_Registry::getConfig();
		return $config['database']['params']['prefix'];
	}
	
	public static function getLangCode()
	{
		return Vi_Registry::get('langCode');
	}
	
	public static function getSession()
	{
	    return Vi_Registry::get('session');
	}
	
	public static function getAcl()
	{
	    if (Vi_Registry::isRegistered('acl')) {
	        return Vi_Registry::get('acl');    
	    } else {
	        return null;
	    }	
	}
	
	public static function getAclFront()
	{
	    if (Vi_Registry::isRegistered('aclFront')) {
	        return Vi_Registry::get('aclFront');    
	    } else {
	        return null;
	    }	
	}
	
	public static function getAclAdmin()
	{
	    if (Vi_Registry::isRegistered('aclAdmin')) {
	        return Vi_Registry::get('aclAdmin');    
	    } else {
	        return null;
	    }	    
	}
	
	public static function getAuth()
	{	    
	    return Vi_Registry::get('auth');
	}
	
	public static function getStatistic()
	{
	    return Vi_Registry::get('statistic');
	}
	
	/**
	 * Get logged in user
	 * 
	 * @return Zend_Db_Table_Row| false
	 */
	public static function getLoggedInUser()
	{
	    require_once 'Shared/Models/User.php';
	    $objUser = new Models_User();
	    return $objUser->getByUserName(self::getAuth()->getUsername());
	}

    /**
     * Get logged in user id
     * 
     * @return integer | null
     */
    public static function getLoggedInUserId()
    {
        return @self::getLoggedInUser()->user_id;
    }
}