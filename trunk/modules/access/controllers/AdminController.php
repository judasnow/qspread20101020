<?php
require_once 'Vi/Controller/Action.php';
//require_once 'Zend/Validate.php';
//require_once 'Zend/Validate/Identical.php';
require_once 'Shared/Models/User.php';

class access_AdminController extends Vi_Controller_Action {
	/**
	 * The default action - show the access page
	 */
	public function indexAction() {
	    $this->_redirect("access/admin/login");
	}
	
	/**
	 * The default action - show the home page
	 */
	public function loginAction()
	{
		$this->setLayout ( 'front' );
		$this->view->headTitle(Vi_Language::translate("Login to Visual Idea Control Panel"));
		$this->setLayout('default', 'default');
		
		$loginError = false;
		$submitHandler = Vi_Registry::getAppBaseUrl() . "access/admin/login";
		
		$params = $this->_request->getParams ();
		if ($this->_request->isPost () && isset($params ['username']) && $params ['username'] != "") {			
			$authAdapter = new Vi_Auth_Adapter ( );
			$authAdapter->setUserInfo ( $params ['username'], $params ['password'] );
			$result = $this->auth->authenticate ( $authAdapter );
			if ($result->isValid ()) {
			    //TODO: update last login time
			    $objUser = new Models_User();
			    $objUser->updateLastLogin($params ['username']);
			    /**
			     * Remember this user
			     */
			    $this->session->backendUser =  $objUser->getByUserName($params ['username'])->toArray();
				if ($this->_getCallBackUrl ()) {
                    $this->_redirect ($this->_getCallBackUrl ());
				} else {
					$this->_redirect ("");
				}
			} else {
				$loginError = true;
			}
		}
		$this->view->submitHandler = $submitHandler;
		$this->view->loginError = $loginError;
//		echo $this->session->accessMessage;die;
		$this->view->accessMessage = $this->session->accessMessage;
		$this->session->accessMessage = null;
	}
	/**
	 * get and run with submited data
	 */
	public function logoutAction() {
		$this->auth->clearAuthInfo ();
		$this->session->backendUser = null;
		$state = $this->_request->getParam ( 'state', false );
		
		$this->_redirect ("");
	}
}