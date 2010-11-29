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
		$order_id = $this->_getParam('order_id', false); 
		$this->view->order_id = $order_id;
		
		$obj_country = new Models_Country();
		$arr_province = $obj_country->getAllProvinces();
		
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
	}
	
	
} 

