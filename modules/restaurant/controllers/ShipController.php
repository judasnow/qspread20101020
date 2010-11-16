<?php
class restaurant_ShipController extends Vi_Controller_Action
{
	/**
	 * List all meal follow restaurant
	 */
	public function indexAction()
	{
		$order_id = $this->_getParam('order_id', false); 
		$this->view->order_id = $order_id;
	}
	
	
} 

