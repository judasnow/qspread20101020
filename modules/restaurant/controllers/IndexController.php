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
	    $mark = $this->_getParam('mark');
	    if (strcmp($mark,'pickup')==0)
	    {
	    	$this->view->mark_pickup = 'checked';
	    	$str_lead_time_title = 'Pick up';
	    }
	    elseif (strcmp($mark,'curbsida')==0)
	    {
	    	$this->view->mark_curbside = 'checked';
	    	$str_lead_time_title = 'Curbside';
	    }
	    elseif (strcmp($mark,'catering_pickup_only')==0) 	
	    {
	    	$this->view->mark_catering_pickup_only = 'checked';
	    	$str_lead_time_title = 'Catering Pickup Only';
	    }
	    $this->view->lead_time = $str_lead_time_title;
	    $this->view->mark = $mark;
	    $this->view->alphabet = GetAlphabet();	    
	}
} 

function GetAlphabet($type='array',$lower=true){
    $r = ($type == 'string') ? '' : array();
    // chr 65 => A, chr 90 => Z
    for ($c=65; $c <= 90; $c++){    
        $ch = ($lower) ? strtolower(chr($c)) : chr($c);
        if ($type == 'string'){ $r .= $ch; }
        else { $r[] = $ch; }
    }
    return $r;
}

