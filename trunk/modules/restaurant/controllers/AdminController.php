<?php
/**
 * Author: Nguyen Hoai Tan (nguoiao007@gmail.com)
 * 
 * @category   default 
 * @copyright  Copyright (c) 2009 visualidea.org
 * @license    http://license.visualidea.org
 * @version    v 1.0 2009-04-15
 * 
 */
require_once 'Shared/Models/Restaurant.php';
require_once 'Shared/Models/Country.php';
require_once 'Shared/Models/Category.php';
class restaurant_AdminController extends Vi_Controller_Action_Admin 
{

    public function managerAction()
    {
        $this->view->headTitle(Vi_Language::translate('Restaurant manager'));
        $this->view->menu = array('restaurant', 'manager');
        
        $config = Vi_Registry::getConfig();
        $numRowPerPage = Vi_Registry::getConfig("defaultNumberRowPerPage");
        $currentPage = $this->_getParam("page",1);
        $displayNum = $this->_getParam('displayNum', false);
        
        /**
         * Get number of restaurant per page
         */
        if (false === $displayNum) {
            $displayNum = $this->session->restaurantDisplayNum;
        } else {
            $this->session->restaurantDisplayNum = $displayNum;
        }
        if (null != $displayNum) {
            $numRowPerPage = $displayNum;
        }
        /**
         * Get condition
         */
        $condition = $this->_getParam('condition', false);
        if (false === $condition) {
            $condition = $this->session->restaurantCondition;
        } else {
            $this->session->restaurantCondition = $condition;
            $currentPage = 1;
        }
        if (false == $condition) {
            $condition = array();
        }
        /**
         * Load all restaurants
         */
        $objRestaurant = new Models_Restaurant();
        $allRestaurants = $objRestaurant->getAllApprovedRestaurants($condition, 'restaurant_id DESC',
                                                   $numRowPerPage,
                                                   ($currentPage - 1) * $numRowPerPage
                                                  );
        /**
         * Count all restaurants
         */
        $count = count($objRestaurant->getAllApprovedRestaurants());
        /**
         * Modify all restaurants
         */
        foreach ($allRestaurants as &$restaurant) {
            if (null != $restaurant['created_date']) {
                $restaurant['created_date'] = date($config['dateFormat'], $restaurant['created_date']);
            }
        }
        unset($restaurant);
        /**
         * Set values for tempalte
         */
        $this->setPagination($numRowPerPage, $currentPage, $count);
        $this->view->allRestaurants = $allRestaurants;
        $this->view->restaurantMessage = $this->session->restaurantMessage;
        $this->session->restaurantMessage = null;
        $this->view->condition = $condition;
        $this->view->displayNum = $numRowPerPage;
    }
    

    public function deleteAction()
    {
        
        $id = $this->_getParam('id', false);
        
        if (false == $id) {
            $this->_redirect('restaurant/admin/manager');
        }
        
        $ids = explode('_', trim($id, '_'));
        
        $objRestaurant = new Models_Restaurant();
        try {
            foreach ($ids as $id) {
               $objRestaurant->delete( array('restaurant_id=?' => $id));
            }
            $this->session->restaurantMessage = array(
                                               'success' => true,
                                               'message' => Vi_Language::translate('Delete restaurant successfully')
                                           );
        } catch (Exception $e) {
            $this->session->restaurantMessage = array(
                                               'success' => false,
                                               'message' => Vi_Language::translate('Can NOT delete this restaurant. Please try again')
                                           );
        }
        $this->_redirect('restaurant/admin/manager#listofrestaurant');
    }

    
    public function enableAction()
    {
        $id = $this->_getParam('id', false);
        
        if (false == $id) {
            $this->_redirect('restaurant/admin/manager');
        }
        
        $ids = explode('_', trim($id, '_'));
        
        $objRestaurant = new Models_Restaurant();
        try {
            foreach ($ids as $id) {
               $objRestaurant->update(array('enabled' => 1), array('restaurant_id=?' => $id));
            }
            $this->session->restaurantMessage = array(
                                               'success' => true,
                                               'message' => Vi_Language::translate('Enable restaurant successfully')
                                           );
        } catch (Exception $e) {
            $this->session->restaurantMessage = array(
                                               'success' => false,
                                               'message' => Vi_Language::translate('Can NOT enable this restaurant. Please try again')
                                           );
        }
        $this->_redirect('restaurant/admin/manager#listofrestaurant');
    }

    
    
    public function disableAction()
    {
        
        $id = $this->_getParam('id', false);
        
        if (false == $id) {
            $this->_redirect('restaurant/admin/manager');
        }
        
        $ids = explode('_', trim($id, '_'));
        
        $objRestaurant = new Models_Restaurant();
        try {
            foreach ($ids as $id) {
               $objRestaurant->update(array('enabled' => 0), array('restaurant_id=?' => $id));
            }
            $this->session->restaurantMessage = array(
                                               'success' => true,
                                               'message' => Vi_Language::translate('Disable restaurant successfully')
                                           );
        } catch (Exception $e) {
            $this->session->restaurantMessage = array(
                                               'success' => false,
                                               'message' => Vi_Language::translate('Can NOT disable this restaurant. Please try again')
                                           );
        }
        $this->_redirect('restaurant/admin/manager#listofrestaurant');
    }
    

    public function editAction()
    {
        /**
         * Get all provice CODE
         */
        $objCountry = new Models_Country();
        $this->view->allProvinces = $objCountry->getAllProvinces();
        /**
         * Get some list
         */
        $objCat = new Models_Category();
        $this->view->leadTimeNormal = $objCat->getAllValues('lead_time_normal');
        $this->view->leadTimeCatering = $objCat->getAllValues('lead_time_catering');
//        echo '<pre>';print_r($this->view->allProvinces);die;
        
        /**
         * Get data
         */
        $objRes = new Models_Restaurant();
        $data = $this->_getParam('data', false);
        $id = $this->_getParam('id', false);
        $error = '';
        
        if (false != $data) {
            /**
             * Insert new restaurant
             */
            $newRes = $data;
            /**
             * Modify date
             */
            $dateArr = array('mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'); 
            foreach ($dateArr as $item) {
                if ('1' != @$newRes["date_{$item}"]) {
                    unset($newRes["date_{$item}_start"]);
                    unset($newRes["date_{$item}_end"]);
                } else {
                    /**
                     * Change correct time
                     */
                    if (null == @$newRes["date_{$item}_start"]) {
                        $newRes["date_{$item}_start"] = '00:00';//0 hours
                    } else {
                        $tmp = explode(':', $newRes["date_{$item}_start"]);
                        /**
                         * Hour
                         */
                        if (null == @$tmp[0]) {
                            $tmp[0] = 0;
                        }
                        $tmp[0] = '00' . abs(intval($tmp[0]));
                        $tmp[0] = substr($tmp[0], -2, 2);
                        if (23 < intval($tmp[0])) {
                            $tmp[0] = '00';
                        }
                        /**
                         * Minute
                         */
                        if (null == @$tmp[1]) {
                            $tmp[1] = 0;
                        }
                        $tmp[1] = '00' . abs(intval($tmp[1]));
                        $tmp[1] = substr($tmp[1], -2, 2);
                        if (59 < intval($tmp[1])) {
                            $tmp[1] = '00';
                        }
                        
                        $newRes["date_{$item}_start"] = $tmp[0] . ':' . $tmp[1];
                    }
                    
                    if (null == @$newRes["date_{$item}_end"]) {
                        $newRes["date_{$item}_end"] = 24*3600 - 60;//23:59:59 hours
                    } else {
                        $tmp = explode(':', $newRes["date_{$item}_end"]);
                        /**
                         * Hour
                         */
                        if (null == @$tmp[0]) {
                            $tmp[0] = 23;
                        }
                        $tmp[0] = '00' . abs(intval($tmp[0]));
                        $tmp[0] = substr($tmp[0], -2, 2);
                        if (23 < intval($tmp[0])) {
                            $tmp[0] = '23';
                        }
                        /**
                         * Minute
                         */
                        if (null == @$tmp[1]) {
                            $tmp[1] = 59;
                        }
                        $tmp[1] = '00' . abs(intval($tmp[1]));
                        $tmp[1] = substr($tmp[1], -2, 2);
                        if (59 < intval($tmp[1])) {
                            $tmp[1] = '59';
                        }
                        $newRes["date_{$item}_end"] = $tmp[0] . ':' . $tmp[1];
                    }
                }
            }
            
            /**
             * Modify data
             */
            if ('1' != @$newRes['check']['pickup']) {
                unset($newRes['pickup']);
            }
            if ('1' != @$newRes['check']['curbside']) {
                unset($newRes['curbside']);
            }
            if ('1' != @$newRes['check']['delivery']) {
                unset($newRes['delivery']);
                unset($newRes['delivery_limit_hour']);
                unset($newRes['delivery_charge']);
                unset($newRes['delivery_minimum']);
            }
            if ('1' != @$newRes['check']['catering_pickup']) {
                unset($newRes['catering_pickup']);
            }
            if ('1' != @$newRes['check']['catering_delivery']) {
                unset($newRes['catering_delivery']);
                unset($newRes['catering_delivery_limit_hour']);
                unset($newRes['catering_delivery_charge']);
                unset($newRes['catering_delivery_minimum']);
            }
            /**
             * Remove tempory data
             */
            unset($newRes['check']);
            if (null != $newRes['image']) {
                $newRes['image'] = $this->_getImagePath($newRes['image']);
            }
//            echo '<pre>';print_r($newRes);die;

            $objRes->update($newRes, array('restaurant_id=?' => $id));
            $this->session->restaurantMessage = array(
                                               'success' => true,
                                               'message' => Vi_Language::translate('Edit restaurant successfully')
                                           );
            $this->_redirect('restaurant/admin/manager#listofrestaurant');

        } else {
            /**
             * Loading data
             */
            $data = $objRes->find($id)->toArray();
            $data = current($data);
            
            if (false == $data) {
                $this->_redirect('restaurant/admin/manager');
            }
        }
        $this->view->isNumberCuisine = is_numeric($data['cuisine']);
        
        $cuisines = $objCat->getAllValues('cuisine');
        $this->view->cuisines = $cuisines;
        
        $this->view->data = $data;
        $this->view->error = $error;
        
        $this->view->headTitle('Edit Restaurant');
    }
    
    /*****************************************************************************
     * PENDING MANAGER
     */

    public function pendingAction()
    {
        $this->view->headTitle(Vi_Language::translate('Pending Restaurant'));
        $this->view->menu = array('restaurant', 'pending');
        
        $config = Vi_Registry::getConfig();
        $numRowPerPage = Vi_Registry::getConfig("defaultNumberRowPerPage");
        $currentPage = $this->_getParam("page",1);
        $displayNum = $this->_getParam('displayNum', false);
        
        /**
         * Get number of restaurant per page
         */
        if (false === $displayNum) {
            $displayNum = $this->session->pendingRestaurantDisplayNum;
        } else {
            $this->session->pendingRestaurantDisplayNum = $displayNum;
        }
        if (null != $displayNum) {
            $numRowPerPage = $displayNum;
        }
        /**
         * Get condition
         */
        $condition = $this->_getParam('condition', false);
        if (false === $condition) {
            $condition = $this->session->pendingRestaurantCondition;
        } else {
            $this->session->pendingRestaurantCondition = $condition;
            $currentPage = 1;
        }
        if (false == $condition) {
            $condition = array();
        }
        /**
         * Load all restaurants
         */
        $objRestaurant = new Models_Restaurant();
        $allRestaurants = $objRestaurant->getAllPendingRestaurants($condition, 'restaurant_id DESC',
                                                   $numRowPerPage,
                                                   ($currentPage - 1) * $numRowPerPage
                                                  );
        /**
         * Count all restaurants
         */
        $count = count($objRestaurant->getAllPendingRestaurants());
        /**
         * Modify all restaurants
         */
        foreach ($allRestaurants as &$restaurant) {
            if (null != $restaurant['created_date']) {
                $restaurant['created_date'] = date($config['dateFormat'], $restaurant['created_date']);
            }
        }
        unset($restaurant);
        /**
         * Set values for tempalte
         */
        $this->setPagination($numRowPerPage, $currentPage, $count);
        $this->view->allRestaurants = $allRestaurants;
        $this->view->restaurantMessage = $this->session->restaurantMessage;
        $this->session->restaurantMessage = null;
        $this->view->condition = $condition;
        $this->view->displayNum = $numRowPerPage;
    }
    

    public function deletePendingAction()
    {
        
        $id = $this->_getParam('id', false);
        
        if (false == $id) {
            $this->_redirect('restaurant/admin/pending');
        }
        
        $ids = explode('_', trim($id, '_'));
        
        $objRestaurant = new Models_Restaurant();
        try {
            foreach ($ids as $id) {
               $objRestaurant->delete( array('restaurant_id=?' => $id));
            }
            $this->session->restaurantMessage = array(
                                               'success' => true,
                                               'message' => Vi_Language::translate('Delete restaurant successfully')
                                           );
        } catch (Exception $e) {
            $this->session->restaurantMessage = array(
                                               'success' => false,
                                               'message' => Vi_Language::translate('Can NOT delete this restaurant. Please try again')
                                           );
        }
        $this->_redirect('restaurant/admin/pending#listofrestaurant');
    }
    

    
    private function _getImagePath($path)
    {
        return substr($path, strlen(Vi_Registry::getBaseUrl()));
    }
    
}