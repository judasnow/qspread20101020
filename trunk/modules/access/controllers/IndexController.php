<?php
require_once 'Vi/Controller/Action.php';
require_once 'Shared/Models/User.php';

class access_IndexController extends Vi_Controller_Action {
	/**
	 * The default action - show the access page
	 */
	public function indexAction() {
	    $this->_redirect("access/index/login");
	}
	
	/**
	 * The default action - show the home page
	 */
	public function loginAction()
	{
		$this->view->headTitle('Login');
		
		$loginError = false;
		$submitHandler = Vi_Registry::getAppBaseUrl() . "access/index/login";
		
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
			    $this->session->frontUser =  $objUser->getByUserName($params ['username'])->toArray();
				if ($this->_getCallBackUrl ()) {
                    $this->_redirect ($this->_getCallBackUrl ());
				} else {
					$this->_redirect ("");
				}
			} else {
				$loginError = true;
//				$this->session->loginError = true;
//			    if ($this->_getCallBackUrl ()) {
//                    $this->_redirect ($this->_getCallBackUrl ());
//                } else {
//                    $this->_redirect ("");
//                }
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
		$this->session->frontUser = null;
		$state = $this->_request->getParam ( 'state', false );
		
		$this->_redirect ("");
	}
}