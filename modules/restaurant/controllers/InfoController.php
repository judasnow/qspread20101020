<?php
include_once 'libs/Shared/Models/Meal.php';
include_once 'libs/Shared/Models/Order.php';
include_once 'libs/Shared/Models/OrderDetail.php';
include_once 'libs/Shared/Models/ScontentLang.php';
class restaurant_InfoController extends Vi_Controller_Action
{
	/**
	 * List all meal follow restaurant
	 */
	public function indexAction()
	{
		$this->view->headTitle('Cart information');
		$order_id = session_id(); 
		$this->view->session_cart 		= $_SESSION['cart'][$order_id];
		$this->view->subtotal 			= $_SESSION['cart'][$order_id]['subtotal'];
	 	$this->view->tax 				= $_SESSION['cart'][$order_id]['tax'];
	 	$this->view->shipping 			= $_SESSION['cart'][$order_id]['shipping'];
	 	$this->view->ordertotal 		= $_SESSION['cart'][$order_id]['ordertotal'];
	 	
	 	$data_info = $this->_getParam('data', false);
	 	$confirm   = $this->_getParam('confirm', false) ;
	 	/**
	 	 * Remember customer's infomation
	 	 */
	 	if (false !== $data_info) {
	 	   $_SESSION['cart_customer'] = $data_info;
	 	}
	 	$data_info = $_SESSION['cart_customer'];
	 	
	 	$this->view->full_name 	= $data_info['full_name'];
	 	$this->view->address 	= $data_info['address'];
	 	$this->view->zip_code	= $data_info['zip_code'];
	 	$this->view->phone		= $data_info['phone1'].".".$data_info['phone2'].".".$data_info['phone3'];
	 	if ( false != $confirm ){ 
	 		//-- begin save into db: vi_order and vi_order_detail
	 		
	 		$arr_order = array(
//	 			'order_id'		=>	$order_id,
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
	 		
	 		$objOrder = new Models_Order();
	 		$bResultOrder = $objOrder->insert($arr_order);
	 		
	 		foreach ( $_SESSION['cart'][$order_id] as $key=>$value ){	 			
		 		$arr_order_detail = array(
		 			'order_id'		=> $bResultOrder,
		 			'meal_id'		=> $value['meal_id'],
		 			'name'			=> $value['name'],
		 			'description'	=> $value['description'],
		 			'price'			=> $value['price'],
		 			'quantity'		=> $value['quantity'],
		 			'total'			=> $value['total_money']
		 		);
		 		if ( !empty($value['name']) ){
			 		$objOrderDetail = new Models_OrderDetail();
			 		$objOrderDetail->insert($arr_order_detail);
		 		}
	 		}
	 		//-- end save into db: vi_order and vi_order_detail
	 		
	 		/**
	 		 * Send email to admin and user
	 		 */
	 		/**
	 		 * Clear session
	 		 */
	 		$_SESSION['card'] = '';
	 		$_SESSION['cart_customer'] = '';
	 		/**
	 		 * Redirec to success page
	 		 */
            $objContent = new Models_ScontentLang();
            $this->_redirect($objContent->getUrlWithoutAppBaseUrl(20));
	 		
	 	}
	 	
	 	$this->view->cardType = $_SESSION['cart_customer']['card_type'];
	 	$cardNumber = $_SESSION['cart_customer']['card_number'];
	 	$cardNumber{4} = 'X';
        $cardNumber{5} = 'X';
        $cardNumber{6} = 'X';
        $cardNumber{7} = 'X';
        $cardNumber{8} = 'X';
        $cardNumber{9} = 'X';
        $cardNumber{10} = 'X';
        $cardNumber{11} = 'X';
        $this->view->cardNumber = $cardNumber;
	}	
} 

