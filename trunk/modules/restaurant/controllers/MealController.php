<?php
include_once 'libs/Shared/Models/Meal.php';
include_once 'libs/Shared/Models/Restaurant.php';
class restaurant_MealController extends Vi_Controller_Action
{
	/**
	 * List all meal follow restaurant
	 */
	public function indexAction()
	{
		$order_id = session_id();
		
		$this->view->headTitle('Meal information');
		$restaurant_id 		= $this->_getParam('id', false); 
		$restaurant_id_ses 	= $this->_getParam('res_id_ses', false); //$_SESSION['cart'][$order_id]['restaurant_id'];
			
		/**
		 * Check restaurantID
		 */
		if (false === $restaurant_id) {
		    $this->_redirect('');
		}
		
		if ( false != $restaurant_id_ses ){			
			unset($_SESSION['cart'][$order_id]);
		}
		
		$type = $this->_getParam('type', 0); 
		
		$numRowPerPage = Vi_Registry::getConfig("defaultNumberRowPerPage");
//        $numRowPerPage = 1;
        $currentPage = $this->_getParam("page",1);

		$mark = isset($_SESSION['mark'])?$_SESSION['mark']:false;//$this->_getParam('mark', false); 
		$date = isset($_SESSION['date'])?$_SESSION['date']:false;//$this->_getParam('date', false); 
		$time = isset($_SESSION['time'])?$_SESSION['time']:false;//$this->_getParam('time', false); 
		
		$date_cut = strtolower(substr($date,-3));
		
		//-- begin get meal		 
		$objCountry = new Models_Meal();
		$arrMeal = $objCountry->getAllMealByResId($restaurant_id, $type, $numRowPerPage,($currentPage - 1) * $numRowPerPage);			 
		$this->view->arr_meal = $arrMeal;
		$count = count($objCountry->getAllMealByResId($restaurant_id, $type));	
		//-- end get meal
		
		/**
	     * Pagination
	     */
        $this->setPagination($numRowPerPage, $currentPage, $count);   
		
		//-- begin get restaurant
		$objRestaurant = new Models_Restaurant();
		$arrRestaurant = $objRestaurant->getAllRestaurantById($restaurant_id);	
		$this->view->address_restaurant = $arrRestaurant['street']." ".$arrRestaurant['city']." ".$arrRestaurant['state'];
		$this->view->arr_restaurant 	= $arrRestaurant;
		$this->view->time_start 		= strcmp($date_cut,'sap')==0?'ASAP':$arrRestaurant["date_{$date_cut}_start"];
		$this->view->time_end 			= strcmp($date_cut,'sap')==0?'ASAP':$arrRestaurant["date_{$date_cut}_end"];
		$this->view->date_cut 			= strtoupper($date_cut);
		//-- end get restaurant
		
		$this->view->mark = strtoupper($mark);
		$this->view->date = $date;
		$this->view->time = strtoupper($time);
		
		$this->view->type = $type;
		$this->view->res_id = $restaurant_id;
		//-- begin compare time choose
		if ( strcmp($time,'asap') == 0 ){
			$time_test 	= strtotime(date('H:m'));
			$time_open 	= strtotime($arrRestaurant["date_{$date_cut}_start"]);
			$time_close = strtotime($arrRestaurant["date_{$date_cut}_end"]);
			if ( ($time_test > $time_open) && ($time_test < $time_close) ){
				$test_time_choose = 1;
			}	
			else{
				$test_time_choose = 0;
			}		
		} else{
			$test_time_choose = 0;
		}
		$this->view->test_time_choose 	= $test_time_choose;
		$this->view->res_id				= $restaurant_id;
		//-- end compare time choose
		
		if ( isset($_SESSION['cart'][$order_id]) ){
			$this->view->subtotal 			= $_SESSION['cart'][$order_id]['subtotal'];
			$this->view->tax 				= $_SESSION['cart'][$order_id]['tax'];
			$this->view->shipping 			= $_SESSION['cart'][$order_id]['shipping'];
			$this->view->ordertotal 		= $_SESSION['cart'][$order_id]['ordertotal'];
		}
	}
	public function otherRestaurantAction()
	{
		$order_id = session_id();
		$this->view->headTitle('Restaurant information');
		$restaurant_id = $this->_getParam('id', false); 
		$mark = $_SESSION['mark'];//$this->_getParam('mark', false); 
		$date = $_SESSION['date'];//$this->_getParam('date', false); 
		$time = $_SESSION['time'];//$this->_getParam('time', false); 
		$res_id_ses = $_SESSION['cart'][$order_id]['restaurant_id'];//$this->_getParam('res_id_ses', false);
		
		$objRestaurant = new Models_Restaurant();
		$arr_restaurant = $objRestaurant->getAllRestaurantById($restaurant_id);
					
		$this->view->restaurant_name 	= $arr_restaurant['name'];
		$this->view->restaurant_id		= $restaurant_id;
		$this->view->mark 				= strtoupper($mark);
		$this->view->date 				= $date;
		$this->view->time 				= strtoupper($time);
		$this->view->res_id_ses			= $res_id_ses;
	}
	
    public function managerAction()
    {
        
        $this->view->headTitle('Meal Manager');
        $resId      = Vi_Registry::getRestaurantIdFromLoggedUser();
        if (false == $resId) {
            $this->_redirect('access/index/login');
        }
        $objRes = new Models_Restaurant();
        $res = $objRes->find($resId)->toArray();
        $res = current($res);
        if (false == $res) {
            $this->_redirect('');
        }
            
        $type = $this->_getParam('type', 0); 
        
        $numRowPerPage = Vi_Registry::getConfig("defaultNumberRowPerPage");
        $currentPage = $this->_getParam("page",1);
        $objMeal = new Models_Meal();
        /**
         * Get all meals
         */
        $allMeals = $objMeal->getByColumnName(array('restaurant_id=?' => $resId, 'type=?' => $type))->toArray();
        
        $this->view->allMeals = $allMeals;
        $this->view->res = $res;
        $this->view->mealMessage = $this->session->mealMessage;
        $this->session->mealMessage = '';
        $this->view->type = $type;
    }
    
    public function enableMealAction()
    {
        $id = $this->_getParam('id', false);
        $rid = Vi_Registry::getRestaurantIdFromLoggedUser();
        
        if (false == $rid || false == $id) {
            $this->_redirect('restaurant/meal/manager');
        }
        
        $ids = explode('_', trim($id, '_'));
        
        $objMeal = new Models_Meal();
        try {
            foreach ($ids as $id) {
               $objMeal->update(array('enabled' => 1), array('meal_id=?' => $id, 'restaurant_id=?' => $rid));
            }
            $this->session->mealMessage = 'The meal is updated successfully';
        } catch (Exception $e) {
            $this->session->mealMessage = false;
        }
        $this->_redirect('restaurant/meal/manager');
    }

    
    
    public function disableMealAction()
    {
        $id = $this->_getParam('id', false);
        $rid = Vi_Registry::getRestaurantIdFromLoggedUser();
        
        if (false == $rid || false == $id) {
            $this->_redirect('restaurant/meal/manager');
        }
        
        $ids = explode('_', trim($id, '_'));
        
        $objMeal = new Models_Meal();
        try {
            foreach ($ids as $id) {
               $objMeal->update(array('enabled' => 0), array('meal_id=?' => $id, 'restaurant_id=?' => $rid));
            }
            $this->session->mealMessage = 'The meal is updated successfully';
        } catch (Exception $e) {
            $this->session->mealMessage = false;
        }
        $this->_redirect('restaurant/meal/manager');
    }
    

    public function deleteMealAction()
    {
        $id = $this->_getParam('id', false);
        $rid = Vi_Registry::getRestaurantIdFromLoggedUser();
        
        if (false == $rid || false == $id) {
            $this->_redirect('restaurant/meal/manager');
        }
        
        $ids = explode('_', trim($id, '_'));
        
        $objMeal = new Models_Meal();
        try {
            foreach ($ids as $id) {
               $objMeal->delete( array('meal_id=?' => $id, 'restaurant_id=?' => $rid));
            }
        } catch (Exception $e) {
        }
        $this->session->mealMessage = 'The meal is deleted successfully';
        $this->_redirect('restaurant/meal/manager');
    }
    
    
    public function editMealAction()
    {
        $rid = Vi_Registry::getRestaurantIdFromLoggedUser();
        
        if (false == $rid) {
            $this->_redirect('restaurant/meal/manager');
        }
        
        $objRes = new Models_Restaurant();
        $res = $objRes->find($rid)->toArray();
        $res = current($res);
        if (false == $res) {
            $this->_redirect('');
        }
        
        /**
         * Get data
         */
        $objMeal = new Models_Meal();
        $data = $this->_getParam('data', false);
        $id = $this->_getParam('id', false);
        $error = '';
        
        if (false != $data) {
            /**
             * Insert new meal
             */
            $newMeal = $data;
            
            $newMeal['price'] = number_format($newMeal['price'], 2, '.', '');
            
            if (null != $newMeal['image']) {
                $newMeal['image'] = $this->getImagePath($newMeal['image']);
                $newMeal['image_thumb'] = $this->getThumbnailImagePath($newMeal['image']);
            }
//            echo '<pre>';print_r($newMeal);die;

            $objMeal->update($newMeal, array('meal_id=?' => $id, 'restaurant_id=?' => $rid));
            $this->session->mealMessage = 'The meal is updated successfully';
            
            
            $this->_redirect('restaurant/meal/manager/type/'. $data['type']);

        } else {
            /**
             * Loading data
             */
            $data = $objMeal->getByColumnName(array('meal_id=?' => $id, 'restaurant_id=?' => $rid))->toArray();
            $data = current($data);
            
            if (false == $data) {
                $this->_redirect('restaurant/meal/manager');
            }
        }
        
        
        $this->view->data = $data;
        $this->view->error = $error;
        $this->view->res = $res;
        
        $this->view->headTitle('Edit Meal');
        $this->view->menu = array('meal-manager');
    }
    
    
    public function newMealAction()
    {
        $rid = Vi_Registry::getRestaurantIdFromLoggedUser();
        
        if (false == $rid) {
            $this->_redirect('restaurant/meal/manager');
        }
        
        $objRes = new Models_Restaurant();
        $res = $objRes->find($rid)->toArray();
        $res = current($res);
        if (false == $res) {
            $this->_redirect('');
        }
        
        /**
         * Get data
         */
        $objMeal = new Models_Meal();
        $data = $this->_getParam('data', false);
        $error = '';
        
        if (false != $data) {
            /**
             * Insert new meal
             */
            $newMeal = $data;
            
            $newMeal['price'] = number_format($newMeal['price'], 2, '.', '');
            
            if (null != $newMeal['image']) {
                $newMeal['image'] = $this->getImagePath($newMeal['image']);
                $newMeal['image_thumb'] = $this->getThumbnailImagePath($newMeal['image']);
            }
            $newMeal['created_date'] = time();
            $newMeal['restaurant_id'] = $rid;
//            echo '<pre>';print_r($newMeal);die;

            $objMeal->insert($newMeal);
            $this->session->mealMessage = 'New meal is created successfully';
            
            
            $this->_redirect('restaurant/meal/manager/type/'. $data['type']);

        } 
        
        
        $this->view->data = $data;
        $this->view->error = $error;
        $this->view->res = $res;
        
        $this->view->headTitle('New Meal');
        $this->view->menu = array('meal-manager');
    }
    

    
    private function _getImagePath($path)
    {
        return substr($path, strlen(Vi_Registry::getBaseUrl()));
    }
    
} 

