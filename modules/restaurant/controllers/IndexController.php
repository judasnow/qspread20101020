<?php

class restaurant_IndexController extends Vi_Controller_Action
{
	/**
	 * List all restaurant after search
	 */
	public function indexAction()
	{
	    $condition = $this->_getParam('data', array());
	    
	    if (null != @$condition['zip']) {
	    	/**
	    	 * Condition here
	    	 */
	    }
	}
}