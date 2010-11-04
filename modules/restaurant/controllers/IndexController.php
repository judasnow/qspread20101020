<?php

class restaurant_IndexController extends Vi_Controller_Action
{
	/**
	 * List all restaurant after search
	 */
	public function indexAction()
	{
		$config = Vi_Registry::getConfig();
        $numRowPerPage = Vi_Registry::getConfig("defaultNumberRowPerPage");
        $numRowPerPage = 1;
        $currentPage = $this->_getParam("page",1);
        
	    $condition = $this->_getParam('data', array());
	    $find = $this->_getParam('find', false);
	    $mark = $this->_getParam('mark', false);
	   
	    if (null != @$condition['zip']) {
	    	/**
	    	 * Condition here
	    	 */
	    }
		 /**
	     * Set variables for template
	     */	   
	    
	    if (strcmp($mark,'pickup')==0)
	    {
	    	$this->view->mark_pickup = 'checked';
	    	$str_lead_time_title = 'Pick up';
	    }
	    elseif (strcmp($mark,'curbside')==0)
	    {
	    	$this->view->mark_curbside = 'checked';
	    	$str_lead_time_title = 'Curbside';
	    }
	    elseif (strcmp($mark,'catering_pickup_only')==0) 	
	    {
	    	$this->view->mark_catering_pickup_only = 'checked';
	    	$str_lead_time_title = 'Catering Pickup Only';
	    }
	    
	    /**
	     * Get condition for search
	     */
	    $arr_condition = array();
	    if ( false != $mark ){
	    	$arr_condition["{$mark} != ?"] = Zend_DB::NULL_EMPTY_STRING;
	    }
	    if ( false != $find){
	    	$arr_condition["name LIKE ? "] = $find."%";
	    }
	    
//	    echo "<pre>";print_r($arr_condition);die;
	    /**
	     * Get data from database
	     */
	    include_once 'libs/Shared/Models/Restaurant.php';
	    $objRestaurant = new Models_Restaurant();	 
	    $restaurants = $objRestaurant->getByColumnName($arr_condition, 
			    											array('name ASC'), 
			    											$numRowPerPage,
		                                                   ($currentPage - 1) * $numRowPerPage)->toArray(); 
	    $count = count($objRestaurant->getByColumnName($arr_condition));

	    $this->view->lead_time = $str_lead_time_title;
	    $this->view->mark = $mark;
	    $this->view->alphabet = GetAlphabet();
	    
	    foreach ( $restaurants as $key=>$value ){
	    	$arr_services = explode(',',$value['services']);
	    	$restaurants[$key]['arr_service'] = $arr_services;
	    }	      
	    $this->view->restaurants = $restaurants;
	    /**
	     * Begin get country to autocomplete
	     */
	    
	    /**
	     * Pagination
	     */
        $this->setPagination($numRowPerPage, $currentPage, $count);        
	}
	
	function autocompleteCityAction()
	{		
		$query = $this->_getParam('query', false);
		include_once 'libs/Shared/Models/Country.php';
		
		$arr_condition["city LIKE ? "] = $query."%";
		$objCountry = new Models_Country();
		$cities = $objCountry->getByColumnName($arr_condition, 
			    											array('city ASC'))->toArray();
		$counter = 0;	
		$str_jason = "";	
		$str_jason .=  "{";
		$str_jason .= "query:'$query',";
		$str_jason .= "suggestions:[";
	
		
		$tmpArr = array();
		foreach ( $cities as $key=>$value ){
			$name = $value['city'];
			$name = addslashes(trim($name, "\r\n "));
			$tmpArr[] = "'$name'";
		}
		
		if (! empty($tmpArr)) {
			$str_jason .= implode(',', $tmpArr);
		}
		
		$str_jason .= "]}";
		
		echo $str_jason;
		exit;			
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

