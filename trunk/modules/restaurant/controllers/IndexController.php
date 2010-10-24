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
	    /**
	     * Get data from database
	     */
	    include_once 'libs/Shared/Models/Restaurant.php';
	    $objRestaurant = new Models_Restaurant();	 
	    $restaurants = $objRestaurant->getAllRestaurant();   
	    /**
	     * Set variables for template
	     */	   
	    $this->view->restaurants = $restaurants;	    
	}
}