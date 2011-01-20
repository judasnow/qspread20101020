<?php
include_once 'libs/Shared/Models/Meal.php';
include_once 'libs/Shared/Models/Restaurant.php';
class restaurant_MealController extends Vi_Controller_Action
{
	/**
	 * List all meal follow restaurant
	 */
	public function indexAction()
	{
		$order_id = session_id();
		
		$this->view->headTitle('Meal information');
		$restaurant_id 		= $this->_getParam('id', false); 
		$restaurant_id_ses 	= $this->_getParam('res_id_ses', false); //$_SESSION['cart'][$order_id]['restaurant_id'];
			
		
		if ( false != $restaurant_id_ses ){			
			unset($_SESSION['cart'][$order_id]);
		}
		
		$type = $this->_getParam('type', 0); 
		
		$numRowPerPage = Vi_Registry::getConfig("defaultNumberRowPerPage");
//        $numRowPerPage = 1;
        $currentPage = $this->_getParam("page",1);

		$mark = isset($_SESSION['mark'])?$_SESSION['mark']:false;//$this->_getParam('mark', false); 
		$date = isset($_SESSION['date'])?$_SESSION['date']:false;//$this->_getParam('date', false); 
		$time = isset($_SESSION['time'])?$_SESSION['time']:false;//$this->_getParam('time', false); 
		
		$date_cut = strtolower(substr($date,-3));
		
		//-- begin get meal		 
		$objCountry = new Models_Meal();
		$arrMeal = $objCountry->getAllMealByResId($restaurant_id, $type, $numRowPerPage,($currentPage - 1) * $numRowPerPage);			 
		$this->view->arr_meal = $arrMeal;
		$count = count($objCountry->getAllMealByResId($restaurant_id, $type));	
		//-- end get meal
		
		/**
	     * Pagination
	     */
        $this->setPagination($numRowPerPage, $currentPage, $count);   
		
		//-- begin get restaurant
		$objRestaurant = new Models_Restaurant();
		$arrRestaurant = $objRestaurant->getAllRestaurantById($restaurant_id);	
		$this->view->address_restaurant = $arrRestaurant['street']." ".$arrRestaurant['city']." ".$arrRestaurant['state'];
		$this->view->arr_restaurant 	= $arrRestaurant;
		$this->view->time_start 		= strcmp($date_cut,'sap')==0?'ASAP':$arrRestaurant["date_{$date_cut}_start"];
		$this->view->time_end 			= strcmp($date_cut,'sap')==0?'ASAP':$arrRestaurant["date_{$date_cut}_end"];
		$this->view->date_cut 			= strtoupper($date_cut);
		//-- end get restaurant
		
		$this->view->mark = strtoupper($mark);
		$this->view->date = $date;
		$this->view->time = strtoupper($time);
		
		$this->view->type = $type;
		$this->view->res_id = $restaurant_id;
		//-- begin compare time choose
		if ( strcmp($time,'asap') == 0 ){
			$time_test 	= strtotime(date('H:m'));
			$time_open 	= strtotime($arrRestaurant["date_{$date_cut}_start"]);
			$time_close = strtotime($arrRestaurant["date_{$date_cut}_end"]);
			if ( ($time_test > $time_open) && ($time_test < $time_close) ){
				$test_time_choose = 1;
			}	
			else{
				$test_time_choose = 0;
			}		
		}
		else{
			$test_time_choose = 0;
		}
		$this->view->test_time_choose 	= $test_time_choose;
		$this->view->res_id				= $restaurant_id;
		//-- end compare time choose
		
		if ( isset($_SESSION['cart'][$order_id]) ){
			$this->view->subtotal 			= $_SESSION['cart'][$order_id]['subtotal'];
			$this->view->tax 				= $_SESSION['cart'][$order_id]['tax'];
			$this->view->shipping 			= $_SESSION['cart'][$order_id]['shipping'];
			$this->view->ordertotal 		= $_SESSION['cart'][$order_id]['ordertotal'];
		}
	}
	public function otherRestaurantAction()
	{
		$order_id = session_id();
		$this->view->headTitle('Restaurant information');
		$restaurant_id = $this->_getParam('id', false); 
		$mark = $_SESSION['mark'];//$this->_getParam('mark', false); 
		$date = $_SESSION['date'];//$this->_getParam('date', false); 
		$time = $_SESSION['time'];//$this->_getParam('time', false); 
		$res_id_ses = $_SESSION['cart'][$order_id]['restaurant_id'];//$this->_getParam('res_id_ses', false);
		
		$objRestaurant = new Models_Restaurant();
		$arr_restaurant = $objRestaurant->getAllRestaurantById($restaurant_id);
					
		$this->view->restaurant_name 	= $arr_restaurant['name'];
		$this->view->restaurant_id		= $restaurant_id;
		$this->view->mark 				= strtoupper($mark);
		$this->view->date 				= $date;
		$this->view->time 				= strtoupper($time);
		$this->view->res_id_ses			= $res_id_ses;
	}
} 

