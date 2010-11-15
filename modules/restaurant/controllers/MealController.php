<?php
include_once 'libs/Shared/Models/Meal.php';
class restaurant_MealController extends Vi_Controller_Action
{
	/**
	 * List all meal follow restaurant
	 */
	public function indexAction()
	{
		//-- begin get meal
		 $restaurant_id = $this->_getParam('id', false);  
		 $objCountry = new Models_Meal();
		 $arrMeal = $objCountry->getAllMealByResId($restaurant_id);		
		 $this->view->arr_meal = $arrMeal;
		//-- end get meal
	}
	
	
} 

