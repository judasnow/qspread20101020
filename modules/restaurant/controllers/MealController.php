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
		$this->view->headTitle('Meal information');
		$restaurant_id = $this->_getParam('id', false); 
		
		$type = $this->_getParam('type', 0); 
		
		$numRowPerPage = Vi_Registry::getConfig("defaultNumberRowPerPage");
//        $numRowPerPage = 1;
        $currentPage = $this->_getParam("page",1);

		$mark = $this->_getParam('mark', false); 
		$date = $this->_getParam('date', false); 
		$time = $this->_getParam('time', false); 
		
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
		$this->view->arr_restaurant = $arrRestaurant;
		$this->view->time_start 	= $arrRestaurant["date_{$date_cut}_start"];
		$this->view->time_end 		= $arrRestaurant["date_{$date_cut}_end"];
		$this->view->date_cut 		= strtoupper($date_cut);
		//-- end get restaurant
		
		$this->view->mark = strtoupper($mark);
		$this->view->date = $date;
		$this->view->time = $time;
		
		$this->view->type = $type;
		$this->view->res_id = $restaurant_id;
		
		$order_id = session_id();
		if ( isset($_SESSION['cart'][$order_id]) ){
			$this->view->subtotal 			= $_SESSION['cart'][$order_id]['subtotal'];
			$this->view->tax 				= $_SESSION['cart'][$order_id]['tax'];
			$this->view->shipping 			= $_SESSION['cart'][$order_id]['shipping'];
			$this->view->ordertotal 		= $_SESSION['cart'][$order_id]['ordertotal'];
		}
	}
} 

