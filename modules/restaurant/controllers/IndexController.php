<?php
include_once 'libs/Shared/Models/Restaurant.php';
include_once 'libs/Shared/Models/Country.php';
class restaurant_IndexController extends Vi_Controller_Action
{
	/**
	 * List all restaurant after search
	 */
	public function indexAction()
	{
		$this->view->headTitle('Restaurant');
		$config = Vi_Registry::getConfig();
        $numRowPerPage = Vi_Registry::getConfig("defaultNumberRowPerPage");
        $numRowPerPage = 1;
        $currentPage = $this->_getParam("page",1);
        
	    $condition = $this->_getParam('data', array());
	    $find = $this->_getParam('find', false);
	    $mark = $this->_getParam('mark', false);
	    $searchword = $this->_getParam('searchword', false);
	    $conditions = $this->_getParam('condition', array());
	    
	    
		 /**
	     * Set variables for template
	     */	   
	    $str_lead_time_title = "";
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
	    elseif (strcmp($mark,'catering_pickup')==0) 	
	    {
	    	$this->view->mark_catering_pickup = 'checked';
	    	$str_lead_time_title = 'Catering Pickup';
	    }
		elseif (strcmp($mark,'delivery')==0) 	
	    {
	    	$this->view->mark_delivery = 'checked';
	    	$str_lead_time_title = 'Delivery';
	    }
		elseif (strcmp($mark,'catering_delivery')==0) 	
	    {
	    	$this->view->mark_catering_delivery = 'checked';
	    	$str_lead_time_title = 'Catering Delivery';
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
		if (null != @$condition['zip']) {
	    	/**
	    	 * Condition here
	    	 */
	    	$objCountry = new Models_Country();
	    	$city_from_code = $objCountry->getCityByCode($condition['zip']);
	    	$arr_condition["address LIKE ? "] = "%".$city_from_code[0]['city']."%";
	    	$arr_con['city'] = $city_from_code[0]['city'];
	    	$arr_con['zip'] = $condition['zip'];
	    }
		else if ( false != $searchword){//-- searchword: city
	    	$arr_condition["address LIKE ? "] = "%".$searchword."%";
	    }
	    
		if ((null != @$conditions['cuisine']) && ($conditions['cuisine'] > 0)) {
	    	/**
	    	 * Condition here
	    	 */			
			$arr_con['cuisine_id'] = $conditions['cuisine'];		
	    	$objRestaurant = new Models_Restaurant();
	    	$restaurants = $objRestaurant->getRestaurantByData($arr_con,$numRowPerPage,($currentPage - 1) * $numRowPerPage);	    
	    	$count = count($restaurants);	
	    }
	    else{
	    
//	    echo "<pre>";print_r($arr_condition);die;
	    /**
	     * Get data from database
	     */
	    $arr_condition["enabled = ? "] = 1;
	    $objRestaurant = new Models_Restaurant();	 
	    $restaurants = $objRestaurant->getByColumnName($arr_condition, 
			    											array('name ASC'), 
			    											$numRowPerPage,
		                                                   ($currentPage - 1) * $numRowPerPage)->toArray(); 
	    $count = count($objRestaurant->getByColumnName($arr_condition));
	    }
	    
	    $this->view->lead_time = $str_lead_time_title;
	    $this->view->mark = $mark;
	    $this->view->alphabet = GetAlphabet();
	    
	    foreach ( $restaurants as $key=>$value ){
	    	$arr_services = explode(',',$value['services']);
	    	$restaurants[$key]['arr_service'] = $arr_services;
	    	$restaurants[$key]['address'] = $value['street']." ".$value['city']." ".$value['state'];
	    }	      
	    $this->view->restaurants = $restaurants;
	    /**
	     * Begin get date and month
	     */	    
		$date_month[] = date("M jS - D");
		for( $i=1; $i<14; $i++ ){			
			$date_month[] = date("M jS - D", time() + ($i * 24 * 60 * 60));
		}
		$this->view->date_month = $date_month;
		/**
		 * Begin get time
		 */		
//		$arr_time[]= '12:15 AM';
//		$arr_time[]= '12:30 AM';
//		$arr_time[]= '12:45 AM';
				
//		for( $i = 1; $i<12; $i++ ){
		for( $i = 5; $i<24; $i++ ){
			for( $j=1;$j<5;$j++ ){
				if ( $j==1 )
					$format = '00';
				else if ( $j==2 )
					$format = '15';
				else if ( $j==3 )
					$format = '30';
				else if ( $j==4 )
					$format = '45';
//				$arr_time[] = $i.":".$format." AM";
				$arr_time[] = $i.":".$format;
			}			
		}
		
//		$arr_time[] = '12:00 PM';
//		$arr_time[] = '12:15 PM';
//		$arr_time[] = '12:30 PM';
//		$arr_time[] = '12:45 PM';
					
//		for( $i = 1; $i<13; $i++ ){
//			for( $j=1;$j<5;$j++ ){
//				if ( $j==1 )
//					$format = '00';
//				else if ( $j==2 )
//					$format = '15';
//				else if ( $j==3 )
//					$format = '30';
//				else if ( $j==4 )
//					$format = '45';
//				$arr_time[] = $i.":".$format." PM";
//			}			
//		}
		
		$this->view->arr_time = $arr_time;
		$this->view->zip = null != @$condition['zip']?$condition['zip']:'';
		$this->view->city = $searchword;
		$this->view->time = null != @$conditions['time']?$conditions['time']:'';
		$this->view->date = null != @$conditions['date']?$conditions['date']:'';		
		
	    /**
	     * Pagination
	     */
        $this->setPagination($numRowPerPage, $currentPage, $count);        
	}
	
	function autocompleteCityAction()
	{		
		$query = $this->_getParam('query', false);
		
		$objCountry = new Models_Country();
		$cities = $objCountry->getAllCountry($query);
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