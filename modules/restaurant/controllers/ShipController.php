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
	}
	
	
} 

