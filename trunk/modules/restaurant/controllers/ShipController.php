<?php
include_once 'libs/Shared/Models/Country.php';
class restaurant_ShipController extends Vi_Controller_Action
{
	/**
	 * List all meal follow restaurant
	 */
	public function indexAction()
	{
		$this->view->headTitle('Ship information');
		$order_id = session_id();//$this->_getParam('order_id', false); 
		$this->view->order_id = $order_id;
		
		$obj_country = new Models_Country();
		$arr_province = $obj_country->getAllProvincesWithCode();
//		echo '<pre>';print_r($arr_province);die;
		
		$this->view->arr_province = $arr_province;
		
		/**
		 * Get customer's information
		 */
		$data = @$_SESSION['cart_customer'];
		if (null == $data || false == $data) {
		    /**
		     * Get logged user
		     */
		    $user = Vi_Registry::getLoggedInUser();
//		    echo '<pre>';print_r($user);die;
		    if (false != $user) {
		        $data = array(
    		        'full_name' => trim($user['full_name']),
    		        'address' => $user['address'],
                    'address' => $user['address'],
                    'note' => $user['suite_apt_note'],
                    'city' => $user['city'],
                    'state' => $user['state'],
                    'zip_code' => $user['zipcode'],
                    'phone1' => $user['phone1'],
                    'phone2' => $user['phone2'],
                    'phone3' => $user['phone3'],
                    'email' => $user['email']
		        );
		    }
		}
		$this->view->data = $data;
		/**
		 * Expired year
		 */
		$years = array();
		for ($i = date('Y'); $i <= date('Y') + 7; $i++) {
		    $years[] = $i;
		}
		$this->view->years = $years;
		
		$this->view->cartErrorMsg = @$_SESSION['card_error_msg'];
		$_SESSION['card_error_msg'] = null; 
		$this->view->mark = strtoupper($_SESSION['cart'][$order_id]['order_service']);
		$this->view->date = $_SESSION['cart'][$order_id]['date'];
		$this->view->time = $_SESSION['cart'][$order_id]['time'];
		
		
		$order_id = session_id();
		if ( isset($_SESSION['cart'][$order_id]) ){
			$this->view->subtotal 			= $_SESSION['cart'][$order_id]['subtotal'];
			$this->view->tax 				= $_SESSION['cart'][$order_id]['tax'];
			$this->view->shipping 			= $_SESSION['cart'][$order_id]['shipping'];
			$this->view->ordertotal 		= $_SESSION['cart'][$order_id]['ordertotal'];
		}
	}
	
	
} 

