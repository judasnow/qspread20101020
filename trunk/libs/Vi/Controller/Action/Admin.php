<?php
/**
 * LICENSE
 * 
 * [license information]
 * 
 * @category   Vi
 * @package    Vi_Controller
 * @copyright  Copyright (c) 2009 visualidea.org
 * @license    http://license.visualidea.org
 * @version    v 1.0 2009-04-15
 */
 
require_once 'Vi/Controller/Action.php';
class Vi_Controller_Action_Admin extends Vi_Controller_Action 
{
    /**
     * access control list for back end
     */
    protected $aclAdmin = null;
    /**
     * (non-PHPdoc)
     * @see libs/Vi/Controller/Vi_Controller_Action#init()
     */
    public function init()
    {
        parent::init();
        if(!$this->auth->isLogin()){
             $this->_redirect("access/admin/login");
             $this->_setCallBackUrl("default/admin/index");
        }
        /**
         * Check permission to access this application
         */
        $this->_initAcl();
    }
    /**
     * Json encode & backslash before quote (')
     * 
     * Using when send json-encode response to client with javascript execution
     * 
     * @param mixed $data
     * @return string
     */
    public function jsonEncode($data)
    {
        return str_replace("'", "\\'", json_encode($data));
    }
    
	protected function _initAcl(){		
	    $isRedirect = false;
		if (!parent::_initAcl()) {
			$isRedirect = true;
		} else {
		    $username = $this->auth->getUsername();	
		    $this->aclAdmin = new Vi_Acl($username);
		    Vi_Registry::set('aclAdmin', $this->aclAdmin);
//		    echo '<pre>';print_r($this->aclAdmin);die;

		    $isRedirect = !$this->aclAdmin->checkPermission('access', 'application::' . Vi_Registry::getAppName());		   
		}
		if ($isRedirect  && Vi_Registry::getModuleName() != 'access') {
		    $url = "";
			$module = Vi_Registry::getModuleName();
			$controller = Vi_Registry::getControllerName();
			$action = Vi_Registry::getActionName();
			$params = $this->_request->getParams();
			
			$url .= $module . '/' . $controller . '/' . $action . '/';
			unset($params[Vi_Registry::getModuleKey()]);
			unset($params[Vi_Registry::getControllerKey()]);
			unset($params[Vi_Registry::getActionKey()]);
			
//			echo "<pre>";print_r($params);die;
			
			foreach($params as $key => $param) {
				$url .= @urlencode($key) . '/' . @urlencode($param);
			}
			$this->_setCallBackUrl($url);    
			if (null != $this->auth->getUsername()) {
			    $this->session->accessMessage = Vi_Language::translate("You don't have permission to access this application");
			}
				
			$this->_redirect("access/admin/login");
		}
		
		return true;
	}
}