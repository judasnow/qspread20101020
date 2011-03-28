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
require_once 'Shared/Models/Order.php';
require_once 'Shared/Models/OrderDetail.php';
require_once 'Shared/Models/Meal.php';
require_once 'Shared/Models/Restaurant.php';
class order_IndexController extends Vi_Controller_Action
{

    public function managerAction()
    {
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
            
        $this->view->headTitle(Vi_Language::translate('Order manager'));
        $this->view->menu = array('order-manager');
        
        $config = Vi_Registry::getConfig();
        $numRowPerPage = Vi_Registry::getConfig("defaultNumberRowPerPage");
        $currentPage = $this->_getParam("page",1);
        $displayNum = $this->_getParam('displayNum', false);
        
        /**
         * Get number of order per page
         */
        if (false === $displayNum) {
            $displayNum = $this->session->orderDisplayNum;
        } else {
            $this->session->orderDisplayNum = $displayNum;
        }
        if (null != $displayNum) {
            $numRowPerPage = $displayNum;
        }
        /**
         * Get condition
         */
        $condition = $this->_getParam('condition', false);
        if (false === $condition) {
            $condition = $this->session->orderCondition;
        } else {
            $this->session->orderCondition = $condition;
            $currentPage = 1;
        }
        if (false == $condition) {
            $condition = array();
        }
        $condition['restaurant_id'] = $resId;
        /**
         * Load all orders
         */
        $objOrder = new Models_Order();
        $allOrders = $objOrder->getAllOrders($condition, 'order_id DESC',
                                                   $numRowPerPage,
                                                   ($currentPage - 1) * $numRowPerPage
                                                  );
        /**
         * Count all orders
         */
        $count = count($objOrder->getAllOrders($condition));
        /**
         * Modify all orders
         */
        foreach ($allOrders as &$order) {
            if (null != $order['created_date']) {
                $order['created_date'] = date($config['dateFormat'], $order['created_date']);
            }
        }
        unset($order);
        /**
         * Set values for tempalte
         */
        $this->setPagination($numRowPerPage, $currentPage, $count);
        $this->view->allOrders = $allOrders;
        $this->view->orderMessage = $this->session->orderMessage;
        $this->session->orderMessage = null;
        $this->view->condition = $condition;
        $this->view->displayNum = $numRowPerPage;
    }
    

    public function deleteAction()
    {
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
            
        
        $id = $this->_getParam('id', false);
        
        if (false == $id) {
            $this->_redirect('order/index/manager');
        }
        
        $ids = explode('_', trim($id, '_'));
        
        $objOrder = new Models_Order();
        try {
            foreach ($ids as $id) {
               $objOrder->delete( array('order_id=?' => $id, 'restaurant_id=?' => $resId));
            }
            $this->session->orderMessage = array(
                                               'success' => true,
                                               'message' => 'Order is deleted successfully'
                                           );
        } catch (Exception $e) {
            $this->session->orderMessage = array(
                                               'success' => false,
                                               'message' => Vi_Language::translate('Can NOT delete this order. Please try again')
                                           );
        }
        $this->_redirect('order/index/manager#listoforder');
    }

    public function changeStatusAction()
    {
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
            
        
        $id = $this->_getParam('id', false);
        
        if (false == $id) {
            $this->_redirect('order/index/manager');
        }
        
        $ids = explode('_', trim($id, '_'));
        
        $objOrder = new Models_Order();
        try {
            foreach ($ids as $id) {
               $order = $objOrder->find($id)->current();
               if ($resId != $order['restaurant_id']) {
                   continue;
               }
               $order->status = ($order->status == 1)?2:1;
               $order->save();
            }
            $this->session->orderMessage = array(
                                               'success' => true,
                                               'message' => 'Order status is updated successfully'
                                           );
        } catch (Exception $e) {
            $this->session->orderMessage = array(
                                               'success' => false,
                                               'message' => Vi_Language::translate('Can NOT update status now. Please try again')
                                           );
        }
        $this->_redirect('order/index/manager#listoforder');
    }
    
    public function detailAction()
    {
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
            
        $this->view->headTitle(Vi_Language::translate('Detail Order'));
        $this->view->menu = array('order');
        
        $config = Vi_Registry::getConfig();
        $numRowPerPage = Vi_Registry::getConfig("defaultNumberRowPerPage");
        $currentPage = $this->_getParam("page",1);
        $displayNum = $this->_getParam('displayNum', false);
        $id = $this->_getParam('id', false);
        
        if (false == $id) {
            $this->_redirect('order/index/manager');
        }
        
        /**
         * Load all details
         */
        $objDetail = new Models_OrderDetail();
        $allDetails = $objDetail->getByColumnName(array('order_id=?' => $id))->toArray();
        /**
         * Get order
         */
        $objOrder = new Models_Order();
        $order = $objOrder->find($id)->toArray();
        $order = current($order);
        $this->view->order = $order;
        
        /**
         * Check order access permission
         */
        if ($order['restaurant_id'] != $resId) {
            $this->_redirect('order/index/manager');
        }
        
        $this->view->res = $res;
        /**
         * Set values for tempalte
         */
        $this->view->allMeals = $allDetails;
    }

    
}