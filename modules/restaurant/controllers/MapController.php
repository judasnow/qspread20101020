<?php
class restaurant_MapController extends Vi_Controller_Action
{
	/**
	 * List all meal follow restaurant
	 */
	public function indexAction()
	{
		$this->view->headTitle('Map');
		$address = $this->_getParam('address', false); 
		$this->view->address 		= $address;	
		$this->setLayout('default');	
	}	
} 

