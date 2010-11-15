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
require_once 'Shared/Models/Country.php';
require_once 'Shared/Models/Category.php';
require_once 'Shared/Models/Group.php';
require_once 'Shared/Models/User.php';
require_once 'Shared/Models/UserExpand.php';
class user_IndexController extends Vi_Controller_Action
{
    public function registerAction()
    {
        $this->view->headTitle('Register');
        
        /**
         * Get all provice CODE
         */
        $objCountry = new Models_Country();
        $this->view->allProvinces = $objCountry->getAllProvinces();
        /**
         * Get security question
         */
        $objCat = new Models_Category();
        $this->view->allQuestions = $objCat->getAllValues('security_question');
//        echo '<pre>';print_r($this->view->allProvinces);die;
        
        
    }
}