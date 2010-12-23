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
//        $numRowPerPage = 1;
        $currentPage = $this->_getParam("page",1);
        
	    $condition = $this->_getParam('data', array());
	    $find = $this->_getParam('find', false);
	    $mark = $_SESSION['mark'] = $this->_getParam('mark', 'pickup');//isset($_SESSION['mark'])? $_SESSION['mark']: $this->_getParam('mark', false);
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
//	    	$arr_condition["{$mark} != ?"] = Zend_DB::NULL_EMPTY_STRING;
	    	$arr_con["mark"] = $mark;	    	
	    }
	    if ( false != $find){
//	    	$arr_condition["name LIKE ? "] = $find."%";
	    	$arr_con["name"] = $find;	
	    }
		if (null != @$condition['zip']) {
	    	/**
	    	 * Condition here
	    	 */
	    	$objCountry = new Models_Country();
	    	$city_from_code = $objCountry->getCityByCode($condition['zip']);
//	    	$arr_condition["address LIKE ? "] = "%".$city_from_code[0]['city']."%";
	    	$arr_con['city'] = $city_from_code[0]['city'];
	    	$arr_con['zip'] = $condition['zip'];
//	    	$arr_con['address'] = $city_from_code[0]['city'];
	    }
		else if ( false != $searchword){//-- searchword: city
//	    	$arr_condition["address LIKE ? "] = "%".$searchword."%";
//	    	$arr_con["address"] = $searchword;	
	    	$arr_con["city"] = $searchword;
	    }
	    
		if ((null != @$conditions['cuisine']) && ($conditions['cuisine'] > 0)) {
	    	/**
	    	 * Condition here
	    	 */			
			$arr_con['cuisine_id'] 	= $conditions['cuisine'];
			if ( null != @$conditions['time'] )
				$arr_con['time'] 		= $conditions['time'];	
			if ( null != @$conditions['date'] )	
				$arr_con['date'] 		= strtolower(substr($conditions['date'],-3));	    	
	    }
	    $objRestaurant 	= new Models_Restaurant();
    	$restaurants 	= $objRestaurant->getRestaurantByData($arr_con,$numRowPerPage,($currentPage - 1) * $numRowPerPage);	    
    	$count 			= count($objRestaurant->getRestaurantByData($arr_con));
    	
//	    else{  
//
//	    $arr_condition["enabled = ? "] = 1;
//	    $objRestaurant = new Models_Restaurant();	 
//	    $restaurants = $objRestaurant->getByColumnName($arr_condition, 
//			    											array('name ASC'), 
//			    											$numRowPerPage,
//		                                                   ($currentPage - 1) * $numRowPerPage)->toArray(); 
//	    $count = count($objRestaurant->getByColumnName($arr_condition));
//	    }
	    
	    $this->view->lead_time = $str_lead_time_title;
	    $this->view->mark = $mark;
	    $this->view->alphabet = GetAlphabet();
	    $strServices = "";
	    
	    foreach ( $restaurants as $key=>$value ){
//	    	if ( !empty($value['services']) ){
//		    	$arr_services = explode(',',$value['services']);
//		    	$restaurants[$key]['arr_service'] = $arr_services;
//	    	}
			$strServices = "";
	    	if ( !empty($value['pickup']) ){
	    		if ( !empty($strServices) )
		    		$strServices .= ',Pickup';	
		    	else
		    		$strServices .= 'Pickup';		    	
	    	}
	    	if ( !empty($value['curbside']) ){
	    		if ( !empty($strServices) )
		    		$strServices .= ',Curbside';	
		    	else
		    		$strServices .= 'Curbside';		    	
	    	}
	    	if ( !empty($value['delivery']) ){
	    		if ( !empty($strServices) )
		    		$strServices .= ',Delivery';	
		    	else
		    		$strServices .= 'Delivery';		    	
	    	}
	    	if ( !empty($value['catering_pickup']) ){
	    		if ( !empty($strServices) )
		    		$strServices .= ',Catering Pickup';	
		    	else
		    		$strServices .= 'Catering Pickup';		    	
	    	}
	    	if ( !empty($value['catering_delivery']) ){
		    	if ( !empty($strServices) )
		    		$strServices .= ',Catering Delivery';	
		    	else
		    		$strServices .= 'Catering Delivery';		    	
	    	}
	    	$arr_services = explode(',',$strServices);
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
		
		$date = isset($_SESSION['date'])?$_SESSION['date']:$this->_getParam('date', false); 
		$time = isset($_SESSION['time'])?$_SESSION['time']:$this->_getParam('time', false); 
		
		$_SESSION['date'] = null != @$conditions['date']?$conditions['date']:((false !=$time)?$time:'');
		$_SESSION['time'] = null != @$conditions['time']?$conditions['time']:((false !=$date)?$date:'');
		
		$this->view->time = $_SESSION['date'];
		$this->view->date = $_SESSION['time'];		
		
	    /**
	     * Pagination
	     */
        $this->setPagination($numRowPerPage, $currentPage, $count);     

		$order_id = session_id();
		if ( isset($_SESSION['cart'][$order_id]) ){					
			$this->view->subtotal 			= $_SESSION['cart'][$order_id]['subtotal'];
			$this->view->tax 				= $_SESSION['cart'][$order_id]['tax'];
			$this->view->shipping 			= $_SESSION['cart'][$order_id]['shipping'];
			$this->view->ordertotal 		= $_SESSION['cart'][$order_id]['ordertotal'];
			$this->view->res_id_ses 		= $_SESSION['cart'][$order_id]['restaurant_id'];						
		}
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