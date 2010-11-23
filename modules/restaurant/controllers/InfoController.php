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
	 		$arr_order = array(
	 			'order_id'		=>	$order_id,
	 			'sub_total'		=>	$_SESSION['cart'][$order_id]['subtotal'],
	 			'sales_tax'		=>	$_SESSION['cart'][$order_id]['tax'],
	 			'shipping_fee'	=>	$_SESSION['cart'][$order_id]['shipping'],
	 			'order_total'	=>	$_SESSION['cart'][$order_id]['ordertotal'],
	 			'full_name'		=>	$data_info['full_name'],
	 			'address'		=>	$data_info['address'],
	 			'suite'			=>	$data_info['note'],
	 			'city'			=>	$data_info['city'],
	 			'state'			=> 	$data_info['state'],
	 			'zip_code'		=> 	$data_info['zip_code'],
	 			'phone'			=> 	$data_info['phone1'].".".$data_info['phone2'].".".$data_info['phone3'],
	 			'email'			=> 	$data_info['email']
	 		);
	 		foreach ( $_SESSION['cart'][$order_id] as $key=>$value ){	 			
		 		$arr_order_detail = array(
		 			'order_id'		=> $order_id,
		 			'meal_id'		=> $value['meal_id'],
		 			'name'			=> $value['name'],
		 			'description'	=> $value['description'],
		 			'price'			=> $value['price'],
		 			'quantity'		=> $value['quantity'],
		 			'total'			=> $value['total_money'],
		 		);
	 		}
	 		//-- end save into db: vi_order and vi_order_detail
	 	}
	}	
} 

