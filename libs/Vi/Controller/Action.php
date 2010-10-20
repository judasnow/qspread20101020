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
require_once 'Zend/Controller/Action.php';
require_once 'Zend/Session/Namespace.php';
require_once 'Vi/Auth.php';
require_once 'Vi/Auth/Adapter.php';
require_once 'Vi/Auth/Storage.php';
class Vi_Controller_Action extends Zend_Controller_Action {
	/**
	 * Store system configurarion
	 */
	protected $_config = array ();
	/**
	 * store session object
	 */
	protected $session = null;
	/**
	 * authencate object
	 */
	protected $auth = null;
	/**
	 * access control list
	 */
	protected $acl = null;
	/**
	 * access control list for front end
	 */
	protected $aclFront = null;
    /**
     * Store Vi_Language::$currentName before changing it
     * 
     * @var string
     */
	protected $_currentName;
    /**
     * Store Vi_Language::$currentType before changing it
     * 
     * @var int
     */
	protected $_currentType;
	/**
	 * Init configuration
	 */
	public function init()
	{
	    /**
	     * Notify module type to translator
	     */
	    $this->_currentType       = Vi_Language::$currentType;
	    $this->_currentName       = Vi_Language::$currentName;
	    Vi_Language::$currentType = Vi_Language::TYPE_MODULE;
	    Vi_Language::$currentName = $this->_request->getModuleName();
		/**
		 * Add include path for controller
		 */
		set_include_path(get_include_path() . PATH_SEPARATOR . 'modules/' . Vi_Registry::getModuleName());
		/**
		 * start session for system
		 */
		$this->session = new Zend_Session_Namespace(Vi_Constant::SESSION_NAMESPACE . "_" . Vi_Registry::getAppName());
		Vi_Registry::set('session', $this->session);
		/**
		 * Load module config
		 */
		$this->_config = Vi_Registry::get ( 'config' );
		$configFile = 'modules/' . $this->_request->getModuleName () . '/config.php';
		if (is_file ( $configFile )) {
			$moduleConfig = include $configFile;
			/**
			 * Unset config item have values as default system
			 */
			$this->_unsetConfig ( $moduleConfig );
			/**
			 * Merge with system config
			 */
			$this->_config = array_merge ( $this->_config, $moduleConfig );
			Vi_Registry::set ( 'config', $this->_config );
		}
		/**
		 * Load module constant
		 */
		$constantFile = 'modules/' . $this->_request->getModuleName () . '/Constant.php';
		if (is_file ( $constantFile )) {
			include_once $constantFile;
		}
		/**
		 * start up the auth
		 */
		$this->auth = Vi_Auth::getInstance();
		$authStorage = new Vi_Auth_Storage();
		$this->auth->setStorage($authStorage);	
		Vi_Registry::set('auth', $this->auth);
		
		/**
		 * Only ADMIN application need following function
		 * 
		 * Don't remove comment if you need change.
		 * In Vi_Controller_Action_Admin, this function is always loaded
		 */
//		$this->_initAcl();//Don't load permission as default
	}
	
	/**
	 * Set layout for action
	 * 
	 * @var string $layoutName name of layout
	 * @var string $layoutCollection name of layout collection
	 * @example $this->setLayout('layoutName', 'collectionName');
	 */
	public function setLayout($layoutName, $layoutCollection = false) {
		$layout = Vi_Layout::getMvcInstance ();
		$layout->setLayout ( $layoutName );
		if ($layoutCollection) {
			$layout->setLayoutPath ( Vi_Registry::get ( 'BASE_DIR' ) . 'layouts/' . $layoutCollection );
		}
	}
	/**
	 * Modify preDispatch() function of Zend_Controller_Action.
	 * This function will set variable for the View after Action executed
	 */
	public function preDispatch()
	{
		$this->view->BASE_URL     = Vi_Registry::get ( 'BASE_URL' );
		$this->view->APP_NAME     = Vi_Registry::get ( 'APP_NAME' );
		$this->view->APP_BASE_URL = Vi_Registry::get ( 'APP_BASE_URL' );
		$this->view->HELPER_URL   = $this->view->BASE_URL . 'modules/' . $this->getRequest ()->getModuleName () . '/views/helpers/';
		$this->view->LAYOUT_NAME  = Vi_Layout::getMvcInstance ()->getLayout ();
		
		$layoutCollectionDir = Vi_Layout::getMvcInstance ()->getLayoutPath ();
		$layoutCollectionUrl = substr ( $layoutCollectionDir, strlen ( Vi_Registry::get ( 'BASE_DIR' ) ) );
		$this->view->LAYOUT_URL = $this->view->BASE_URL . $layoutCollectionUrl . '/';
		$this->view->LAYOUT_HELPER_URL = $this->view->LAYOUT_URL . 'helpers/';
		if (Vi_Constant::PRODUCT_MODE != $this->_config ['currentMode']) {
			$this->view->isProductMode = false;
		} else {
			$this->view->isProductMode = true;
		}
	}
	/**
	 * Modify postDispatch() function of Zend_Controller_Action.
	 * This function will set variable for the View after Action executed
	 */
	public function postDispatch()
	{
		
		$this->view->BASE_URL     = Vi_Registry::get ( 'BASE_URL' );
		$this->view->APP_NAME     = Vi_Registry::get ( 'APP_NAME' );
		$this->view->APP_BASE_URL = Vi_Registry::get ( 'APP_BASE_URL' );
		$this->view->HELPER_URL   = $this->view->BASE_URL . 'modules/' . $this->getRequest ()->getModuleName () . '/views/helpers/';
		$this->view->LAYOUT_NAME  = Vi_Layout::getMvcInstance ()->getLayout ();
		
		$layoutCollectionDir = Vi_Layout::getMvcInstance ()->getLayoutPath ();
		$layoutCollectionUrl = substr ( $layoutCollectionDir, strlen ( Vi_Registry::get ( 'BASE_DIR' ) ) );
		$this->view->LAYOUT_URL = $this->view->BASE_URL . $layoutCollectionUrl . '/';
		$this->view->LAYOUT_HELPER_URL = $this->view->LAYOUT_URL . 'helpers/';
		if (Vi_Constant::PRODUCT_MODE != $this->_config ['currentMode']) {
			$this->view->isProductMode = false;
		} else {
			$this->view->isProductMode = true;
		}
		$this->view->synchronize();
		/**
		 * Registry two variables for using in Vi_Controller_Action_Helper_ViewRenderer::postDispatch()
		 */
        Vi_Registry::set('controllerCurrentType', $this->_currentType);
        Vi_Registry::set('controllerCurrentName', $this->_currentName);
	}
	/**
	 * Add backslash (\) for quote ('), double quote ("), backslash (\) when using in javascript
	 * 
	 * @param mixed $data Can be string, array, or object
	 * @param array $keys Default is empty array. With default, all element of $data will be added backslash.
	 *                    If $keys is array, all elements (or public properties if $data is object) of $data
	 *                    which $keys has will be added backslash.
	 * @return mixed      Return type of $data
	 * 
	 * @example Using as:
	 *                     $this->addSlashesForJs("O'Reilly");
	 *                     $this->addSlashesForJs(array('name' =>"O'Reilly", 'street'=> "O'Reilly Town, 123 New York"),
	 *                                            array('name')); //only 'name' will be added backslashes
	 */
	public function addSlashesForJs($data, $keys = array()) {
		if (is_array ( $data )) {
			if (empty ( $keys )) {
				/**
				 * Add slashes for all keys
				 */
				foreach ( $data as &$item ) {
					$item = $this->addSlashesForJs ( $item );
				}
				
				return $data;
			} else {
				/**
				 * Add slashes for the keys specified
				 */
				foreach ( $keys as $key ) {
					if (array_key_exists ( $key, $data )) {
						$data [$key] = $this->addSlashesForJs ( $data [$key] );
					}
				}
				
				return $data;
			}
		} else if (is_object ( $data )) {
			$newData = clone $data;
			$properties = get_object_vars ( $data );
			if (! empty ( $keys )) {
				foreach ( $properties as $property => $value ) {
					if (! array_key_exists ( $property, $keys )) {
						unset ( $properties [$property] );
					}
				}
			}
			foreach ( $properties as $property => $value ) {
				$newData->{$property} = $this->addSlashesForJs ( $value );
			}
			
			return $newData;
		} else {
			/**
			 * Is string or others
			 */
			return str_replace ( array ('\\', "'", '"' ), array ('\\\\', "\\'", '\\"' ), $data );
//			return str_replace("'", "\\'", json_encode($data));
		}
	}
	/**
	 * Unset default config item for merging configs
	 * 
	 * @param $array Array config
	 * @return void
	 */
	private function _unsetConfig($array) {
		if (! is_array ( $array )) {
			return;
		}
		foreach ( $array as $key => $item ) {
			if (is_array ( $item )) {
				$this->_unsetConfig ( $item );
			} else {
				if (Vi_Constant::CONFIG_AS_DEFAULT == $item) {
					unset ( $array [$key] );
				}
			}
		}
	}
	/**
	 * init access control list
	 * @return void
	 */
	protected function _initAcl()
	{
        require_once 'Vi/Acl.php';
        
		if ($this->auth->hasIdentity()) {
			$username       = $this->auth->getUsername();			
			$this->acl      = new Vi_Acl($username);
			Vi_Registry::set('acl', $this->acl);
			
			return true;
		}
		
		return false;
	}
	
    /**
     * Check permisison
     * 
     * @param string $permission
     * @param string $module
     * @param string|integer $expandId  Note: $expandId == '*": Check to have all expandable permisisnon
     *                                        $expandId == '?': Check to have one or more permisison
     *                                        $expandId is interger: Check for special expand value
     */
	public function checkPermission($permission, $module = null, $expandId = '*')
	{
	    if (null === $module) {
	        $module = Vi_Registry::getModuleName();
	    }
	    
	    if (null == $this->acl && (false === $this->_initAcl())) {
	        return false;
	    }

	    return $this->acl->checkPermission($permission, $module, $expandId);
	}
	
	protected function _forwardToNoPermissionPage()
	{
	    $this->_forward('no-permission', $this->_request->getControllerName(), 'error');
	}
	/**
	 * set return url after login
	 * @return void
	 */
	protected function _setCallBackUrl($url)
	{
		$this->session->callBackUrl = $url;	
	}
	
	protected function _getCallBackUrl()
	{
		return $this->session->callBackUrl;
	}
	
	public function setPagination($numPerPage, $currentPage, $count)
	{
	    
        $countAllPage = ceil(@($count/$numPerPage));
        $numPrevPages = 5;
        $numNextPages = 5;
        $prevPagesArr = array();
        for ($i = $currentPage - $numPrevPages; $i < $currentPage; $i++) {
            if ($i >= 1) {
                $prevPagesArr[] = $i;
            }
        }
        $nextPagesArr = array();
        for ($i = $currentPage + 1; $i < $currentPage + $numNextPages; $i++) {
            if ($i <= $countAllPage) {
                $nextPagesArr[] = $i;
            }
        }

        /**
         * Register values for pagination
         */
        $this->view->currentPage   = $currentPage;
        $this->view->countAllPages = $countAllPage;
        $this->view->first         = (false === array_search(1, $prevPagesArr) && 1 != $currentPage)? 1:'';
        $this->view->prevPage      = (count($prevPagesArr))?current($prevPagesArr):'';
        $this->view->prevPages     = $prevPagesArr;
        $this->view->nextPages     = $nextPagesArr;
        $this->view->nextPage      = ($nextPagesArr)?end($nextPagesArr):'';
        $this->view->last          = (false === array_search($countAllPage, $nextPagesArr)
                                      && $countAllPage != $currentPage)? $countAllPage:'';
        $this->view->countAllPages = $countAllPage;                                      
	}
}