<?php

class default_IndexController extends Vi_Controller_Action
{
	public function indexAction()
	{
		/**
		 * Display tempalte
		 */
	    $this->view->headTitle('Find a restaurant');
	    /**
	     * Get data
	     */
	    include_once 'libs/Shared/Models/User.php';
	    $objUser = new Models_User();
	    
	    $cuisines = array(
		    'AAAAAAAAAA',
		    'BBBBBBBBBBB',
		    'CCCCCCCCCCCC'
	    );
//	    $cuisines = $objUser->getAll()->toArray();
//	    $cuisines = $objUser->getByColumnName(array(
//	    	"username LIKE ?" => '%admin%',
//	    	'group_id=?' => 1
//	    ))->toArray();
//	    echo "<pre>";print_r($cuisines);die;
	    
	    /**
	     * Set variables for template
	     */
	    $this->view->cuisines = $cuisines;
	    
	}
}