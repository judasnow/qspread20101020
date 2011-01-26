<?php
include_once 'libs/Shared/Models/Restaurant.php';
include_once 'libs/Shared/Models/Country.php';
class restaurant_ManagerController extends Vi_Controller_Action
{
    public function init() 
    {
        parent::init();
        /**
         * Check logged restaurant
         */
        $user = Vi_Registry::getLoggedInUser();
        if ('1' != $user['is_restaurant']) {
            $this->_redirect('/');
        }
    }
    
    public function mealAction() 
    {
        
        $this->view->headTitle(Vi_Language::translate('Meal manager'));
        
        $rid = Vi_Registry::getRestaurantIdFromLoggedUser();
        
        if (false == $rid) {
            $this->_redirect('/');
        }
        
        /**
         * Load all meals
         */
        $objMeal = new Models_Meal();
        $allMeals = $objMeal->getAllMeals($condition, 'meal_id DESC',
                                                   $numRowPerPage,
                                                   ($currentPage - 1) * $numRowPerPage
                                                  );
        /**
         * Count all meals
         */
        $count = count($objMeal->getAllMeals());
        /**
         * Modify all meals
         */
        foreach ($allMeals as &$meal) {
            if (null != $meal['created_date']) {
                $meal['created_date'] = date($config['dateFormat'], $meal['created_date']);
            }
        }
        unset($meal);
        /**
         * Set values for tempalte
         */
        $this->setPagination($numRowPerPage, $currentPage, $count);
        $this->view->allMeals = $allMeals;
        $this->view->mealMessage = $this->session->mealMessage;
        $this->session->mealMessage = null;
        $this->view->condition = $condition;
        $this->view->displayNum = $numRowPerPage;
        $this->view->rid = $rid;
    }
}