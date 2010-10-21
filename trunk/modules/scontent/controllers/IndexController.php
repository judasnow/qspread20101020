<?php

require_once 'Shared/Models/Scontent.php';
require_once 'Shared/Models/ScontentLang.php';
require_once 'Shared/Models/ScontentCategory.php';

class scontent_IndexController extends Vi_Controller_Action
{
	public function indexAction()
	{
		/**
		 * Display article or category
		 */
	    $objContent     = new Models_Scontent();
	    $objContentLang = new Models_ScontentLang();
	    $objCategory    = new Models_ScontentCategory();
	    /**
	     * Get param
	     */
	    $url = $this->_getParam('url', false);
	    if (false == $url) {
	        $this->_redirect('');
	    }
	    
	}
}