<?php

include_once 'Shared/Models/Mail.php';
class contact_IndexController extends Vi_Controller_Action
{
	public function indexAction()
	{
		/**
		 * Display tempalte
		 */
	    $this->view->headTitle('Contact Us');
	    $this->view->menuId = 'contactus';
	}
}