<?php
include_once 'libs/Shared/Models/Meal.php';
class restaurant_InfoController extends Vi_Controller_Action
{
	/**
	 * List all meal follow restaurant
	 */
	public function indexAction()
	{
		$order_id = $this->_getParam('order_id', false); 
		$this->view->session_cart = $_SESSION['cart'][$order_id];
	}
	
	
} 

