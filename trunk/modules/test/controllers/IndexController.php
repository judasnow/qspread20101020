<?php
class test_IndexController extends Vi_Controller_Action
{
	public function indexAction()
	{
		/**
		 * Display tempalte
		 */
	    $this->view->headTitle('Test module');
	    /**
	     * Get POST params
	     */	    
	    $params = $this->_getAllParams();	    
	}
}