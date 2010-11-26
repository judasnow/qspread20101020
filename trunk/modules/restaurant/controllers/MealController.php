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
		//-- begin get meal		 
		$objCountry = new Models_Meal();
		$arrMeal = $objCountry->getAllMealByResId($restaurant_id);			 
		$this->view->arr_meal = $arrMeal;
		//-- end get meal
		//-- begin get restaurant
		$objRestaurant = new Models_Restaurant();
		$arrRestaurant = $objRestaurant->getAllRestaurantById($restaurant_id);	
		$this->view->address_restaurant = $arrRestaurant['street']." ".$arrRestaurant['city']." ".$arrRestaurant['state'];
		$this->view->arr_restaurant = $arrRestaurant;
		//-- end get restaurant
	}
} 

