<?php
include_once 'libs/Shared/Models/Meal.php';
include_once 'libs/Shared/Models/Restaurant.php';
class restaurant_ReservationController extends Vi_Controller_Action
{
	/**
	 * List all meal follow restaurant
	 */
	public function indexAction()
	{
		$order_id = session_id();
		
		$this->view->headTitle('Reservation');
		
		$resId = $this->_getParam('rid', false);
		if (false === $resId) {
		    $this->_redirect('');
		}
		
       /**
        * Get restaurant
        */
        $objRes = new Models_Restaurant();
        $res = $objRes->find($resId)->toArray();
        $res = current($res);
        if (false == $res || '0' == $res['reser_onoff']) {
            $this->_redirect('');
        }
        /**
         * All time in a day
         */
        $defaultTimeZone = date_default_timezone_get();
        date_default_timezone_set('UTC');
        $allTimes = array();
        for ($i = 0; $i < 48; $i++) {
            $time = 1800 * $i;
            $allTimes[] = array(
                'time' => $time,
                'text' => date('g:i A', $time)
            );
        }
        date_default_timezone_set($defaultTimeZone);
//        echo date('g:i A', 0);die;
//        echo '<pre>';print_r($allTimes);die;
        
        
        /**
         * Data for view
         */
        $this->view->res = $res;
        $this->view->arr_restaurant = $res;
        $this->view->resId = $resId;
        $this->view->allTimes = $allTimes;
	}
    
} 

