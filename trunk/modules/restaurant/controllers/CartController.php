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
		
		 $order_id = session_id();		 
		 if ( false != $meal_id ){
		 	 if ( isset($_SESSION['cart'][$order_id][$meal_id]['meal_id']) && $_SESSION['cart'][$order_id][$meal_id]['meal_id']==$meal_id ){
		 	 	$_SESSION['cart'][$order_id][$meal_id]['quantity'] = $_SESSION['cart'][$order_id][$meal_id]['quantity']+1;		 	 	
		 	 }
		 	 else{
				 $objMeal = new Models_Meal();
				 $arr_meal = $objMeal->getDataById($meal_id); 
				 
				 $_SESSION['cart'][$order_id][$meal_id]['meal_id'] 		= $arr_meal['meal_id'];
				 $_SESSION['cart'][$order_id][$meal_id]['name'] 		= $arr_meal['name'];
				 $_SESSION['cart'][$order_id][$meal_id]['description'] 	= $arr_meal['description'];
				 $_SESSION['cart'][$order_id][$meal_id]['price'] 		= $arr_meal['price'];
				 $_SESSION['cart'][$order_id][$meal_id]['quantity'] 	= 1;			 
		 	 }
		 	 $_SESSION['cart'][$order_id][$meal_id]['total_money'] 	= $_SESSION['cart'][$order_id][$meal_id]['price']*$_SESSION['cart'][$order_id][$meal_id]['quantity'];
		 	 $_SESSION['cart'][$order_id]['subtotal']				= 0;
		 	 //-- begin calculate sum
		 	 foreach($_SESSION['cart'][$order_id] as $key=>$value){			 	 	
		 	 	if ( $value['total_money'] > 0 )	 	 	
		 	 		$_SESSION['cart'][$order_id]['subtotal'] += $value['total_money'];		 	 			 	 	
		 	 }		 	
		 	 //-- end calculate sum
		 	 
		 	 $_SESSION['cart'][$order_id]['tax'] 		= $_SESSION['cart'][$order_id]['subtotal']*0.01;
		 	 $_SESSION['cart'][$order_id]['shipping'] 	= 10;
		 	 $_SESSION['cart'][$order_id]['ordertotal'] = $_SESSION['cart'][$order_id]['subtotal']+$_SESSION['cart'][$order_id]['tax']+$_SESSION['cart'][$order_id]['shipping'];
		 	 
			 $this->view->session_cart 		= $_SESSION['cart'][$order_id];
			 $this->view->subtotal 			= $_SESSION['cart'][$order_id]['subtotal'];
			 $this->view->tax 				= $_SESSION['cart'][$order_id]['tax'];
			 $this->view->shipping 			= $_SESSION['cart'][$order_id]['shipping'];
			 $this->view->ordertotal 		= $_SESSION['cart'][$order_id]['ordertotal'];
		 }
		 else
		 	$this->view->session_cart = '';	
		 //-- end add information into cart	
		 $this->view->order_id = $order_id;	
	}	
} 

