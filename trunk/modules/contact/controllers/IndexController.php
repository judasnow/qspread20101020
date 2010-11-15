<?php

include_once 'Shared/Models/Mail.php';
include_once 'Shared/Models/User.php';
class contact_IndexController extends Vi_Controller_Action
{
	public function indexAction()
	{
		/**
		 * Display tempalte
		 */
	    $this->view->headTitle('Contact Us');
	    $this->view->menuId = 'contactus';
	    
	    /**
	     * Get post data
	     */
	    $data = $this->_getParam('data', false);
	    
	    if (false != $data) {
	        /**
	         * Get admin
	         */
	        $objUser = new Models_User();
	        $admin = $objUser->getByUserName('admin');
	        /**
	         * Send message
	         */
	        $objMail = new Models_Mail();
	        $objMail->sendHtmlMail('contact', $data, $admin['email']);
	    }
	    
	    $this->view->data = $data;
	}
}