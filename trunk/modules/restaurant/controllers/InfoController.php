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
		$this->view->session_cart 		= $_SESSION['cart'][$order_id];
		$this->view->subtotal 			= $_SESSION['cart'][$order_id]['subtotal'];
	 	$this->view->tax 				= $_SESSION['cart'][$order_id]['tax'];
	 	$this->view->shipping 			= $_SESSION['cart'][$order_id]['shipping'];
	 	$this->view->ordertotal 		= $_SESSION['cart'][$order_id]['ordertotal'];
	 	
	 	$data_info = $this->_getParam('data', false);
	 	$this->view->full_name 	= $data_info['full_name'];
	 	$this->view->address 	= $data_info['address'];
	 	$this->view->zip_code	= $data_info['zip_code'];
	 	$this->view->phone		= $data_info['phone1'].".".$data_info['phone2'].".".$data_info['phone3'];
	 	if ( false != $data_info ){ 
	 		//-- begin save into db: vi_order and vi_order_detail
	 		
	 		//-- end save into db: vi_order and vi_order_detail
	 	}
	}	
} 

