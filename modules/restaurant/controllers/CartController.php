<?php
include_once 'libs/Shared/Models/Meal.php';
class restaurant_CartController extends Vi_Controller_Action
{
	/**
	 * List all meal follow restaurant
	 */
	public function indexAction()
	{
		 //-- begin add information into cart
		 $meal_id = $this->_getParam('meal_id', false); 
		 $order_id = 1;		 
		 if ( false != $meal_id ){
			 $objMeal = new Models_Meal();
			 $arr_meal = $objMeal->getDataById($meal_id); 
			 
			 $_SESSION['cart'][$order_id][$meal_id]['meal_id'] = $arr_meal['meal_id'];
			 $_SESSION['cart'][$order_id][$meal_id]['name'] = $arr_meal['name'];
			 $_SESSION['cart'][$order_id][$meal_id]['description'] = $arr_meal['description'];
			 $_SESSION['cart'][$order_id][$meal_id]['price'] = $arr_meal['price'];
			 $_SESSION['cart'][$order_id][$meal_id]['quantity'] = 1;
			 $_SESSION['cart'][$order_id][$meal_id]['total_money'] = $_SESSION['cart'][$order_id][$meal_id]['price']*$_SESSION['cart'][$order_id][$meal_id]['quantity'];
			 
			 $this->view->session_cart = $_SESSION['cart'][$order_id];
		 }
		 else
		 	$this->view->session_cart = '';	
		 //-- end add information into cart	
		 $this->view->order_id = $order_id;	
	}	
} 

