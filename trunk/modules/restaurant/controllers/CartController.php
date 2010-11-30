<?php
include_once 'libs/Shared/Models/Meal.php';
include_once 'libs/Shared/Models/Restaurant.php';
class restaurant_CartController extends Vi_Controller_Action
{
	/**
	 * List all meal follow restaurant
	 */
	public function indexAction()
	{		  
		 $this->view->headTitle('Cart information');
		 //-- begin add information into cart
		 $meal_id 	= $this->_getParam('meal_id', false); 
		 $quantity 	= $this->_getParam('quantity', false);
		 $mark 		= $this->_getParam('mark', false);
		 $state		= $this->_getParam('state', 0); //-- state=0: delete meal in session cart
		
		 $order_id = session_id();	
		 	 
		 //-- begin delete meal in session cart
		 if ( 0 != $state ){		 			 	
		 	foreach ( $_SESSION['cart'][$order_id] as $key=>$value ){
		 		if ( $key <> $meal_id ){		 				 			
		 			$_SESSION['cart_delete'][$order_id][$key] = $value;
		 		}
		 	}
		 	unset($_SESSION['cart'][$order_id]);
		 	$_SESSION['cart'][$order_id] = $_SESSION['cart_delete'][$order_id];
		 	unset($_SESSION['cart_delete'][$order_id]);
		 	$this->view->session_cart = $_SESSION['cart'][$order_id];
		 }else{		 
			 //-- end delete meal in session cart
			
			 if ( false != $meal_id ){
			 	 if ( false != $quantity ){
			 	 	$_SESSION['cart'][$order_id][$meal_id]['quantity'] = $quantity;
			 	 }
			 	 else if ( isset($_SESSION['cart'][$order_id][$meal_id]['meal_id']) && $_SESSION['cart'][$order_id][$meal_id]['meal_id']==$meal_id ){
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
			 	 
			 	 $_SESSION['cart'][$order_id]['tax'] 		= $_SESSION['cart'][$order_id]['subtotal']*Vi_Registry::getConfig('taxFee');
			 	 //-- begin get shipping fee for catering delivery and catering
			 	 if ( strcmp($mark,'catering_delivery')==0 || strcmp($mark,'delivery')==0 ){
			 	 	$objRestaurant = new Models_Restaurant();
			 	 	$arrRestaurant = $objRestaurant->getShipFeeFromMealId($meal_id);
			 	 	if ( strcmp($mark,'delivery_charge')==0 )
			 	 		$shippingFee = $arrRestaurant['delivery_charge'];
			 	 	else
			 	 		$shippingFee = $arrRestaurant['catering_delivery_charge'];
			 	 	$_SESSION['cart'][$order_id]['shipping'] 	= $shippingFee;
			 	 }
			 	 else{
			 	 	$_SESSION['cart'][$order_id]['shipping'] 	= 0;
			 	 }
			 	 //-- end get shipping fee for catering delivery and catering
			 	 $_SESSION['cart'][$order_id]['ordertotal'] = $_SESSION['cart'][$order_id]['subtotal']+$_SESSION['cart'][$order_id]['tax']+$_SESSION['cart'][$order_id]['shipping'];
			 	 
				 $this->view->session_cart 		= $_SESSION['cart'][$order_id];
			 }
			 else
			 	$this->view->session_cart = '';	
		 }		 
		 $this->view->subtotal 			= $_SESSION['cart'][$order_id]['subtotal'];
		 $this->view->tax 				= $_SESSION['cart'][$order_id]['tax'];
		 $this->view->shipping 			= $_SESSION['cart'][$order_id]['shipping'];
		 $this->view->ordertotal 		= $_SESSION['cart'][$order_id]['ordertotal'];
		 //-- end add information into cart	
		 $this->view->order_id = $order_id;	
		 $this->view->meal_id = $meal_id;	
		 $this->view->mark = $mark;
		 $this->view->date = $this->_getParam('date', false);
		 $this->view->time = $this->_getParam('time', false);		 
	}	
} 

