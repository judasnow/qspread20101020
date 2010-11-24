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
require_once 'Shared/Models/ScontentLang.php';

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
        /**
         * Article - Term of Use
         */
        $objContent = new Models_ScontentLang();
        $this->view->articleUrl = $objContent->getUrl(10);
        
        /**
         * Get data
         */
        $data = $this->_getParam('data', false);
        $errors = array();
        if (false != $data) {
        
            /**
             * Insert new user
             */
            $objUser = new Models_User();
            $objUserExp = new Models_UserExpand();
            $newUser = array(
                            'group_id'        => 3,
                            'username'        => $data['username'],
                            'email'           => $data['email'],
                            'full_name'       => $data['full_name'],
                            'password'        => $data['password'],
                            'repeat_password' => $data['retype_password'],
                            'created_date'    => time(),
                            'enabled'         => 1,
                            'company' => $data['company'],
                            'address' => $data['address'],
                            'suite_apt_note' => $data['suite_apt_note'],
                            'city' => $data['city'],
                            'state' => $data['state'],
                            'zipcode' => $data['zipcode'],
                            'phone1' => $data['phone1'],
                            'phone2' => $data['phone2'],
                            'phone3' => $data['phone3'],
                            'birthday_date' => $data['birthday_date'],
                            'birthday_month' => $data['birthday_month'],
                            'birthday_year' => $data['birthday_year'],
                            'gender' => $data['gender'],
                            'security_question' => $data['security_question'],
                            'security_answer' => $data['security_answer'],
                            'send_discount_code' => ('1' == @$data['send_discount_code'])?1:0,
                        );
            $errors = $objUser->validate($newUser);
            if ($_SESSION['captcha'] != strtoupper($data['captcha'])) {
                /**
                 * Incorrect captcha
                 */
                if (! is_array($errors)) {
                    $errors = array();
                }
                $errors[] = 'Captcha is incorrect';
            }
//            echo '<pre>';print_r($_SESSION);die;
            if (true === $errors) {
                $newUser['password'] = md5($newUser['password']);
                /**
                 * TODO Read date format from language table
                 */
                unset($newUser['repeat_password']);
                try {
                    $id = $objUser->insert($newUser);
                    $newUserExp = array(
                                        'user_id'    => $id,
                                    );
                    $objUserExp->insert($newUserExp);
                    $this->_redirect($objContent->getUrlWithoutAppBaseUrl(11));
                } catch (Exception $e) {
                    $errors = array('main' => Vi_Language::translate('Can not insert into database now'));
                }
            }
        }
        $this->view->data = $data;
        $this->view->errors = $errors;
    }
    

    public function restaurantRegisterAction()
    {
        $this->view->headTitle('Restaurant Owner Register');
        $this->setLayout('front2');
        
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
        /**
         * Article - Term of Use
         */
        $objContent = new Models_ScontentLang();
        $this->view->articleUrl = $objContent->getUrl(10);
        
        /**
         * Get data
         */
        $data = $this->_getParam('data', false);
        $errors = array();
        if (false != $data) {
        
            /**
             * Insert new user
             */
            $objUser = new Models_User();
            $objUserExp = new Models_UserExpand();
            $newUser = array(
                            'group_id'        => 3,
                            'username'        => $data['username'],
                            'email'           => $data['email'],
                            'full_name'       => $data['full_name'],
                            'password'        => $data['password'],
                            'repeat_password' => $data['retype_password'],
                            'created_date'    => time(),
                            'enabled'         => 1,
                            'company' => $data['company'],
                            'address' => $data['address'],
                            'suite_apt_note' => $data['suite_apt_note'],
                            'city' => $data['city'],
                            'state' => $data['state'],
                            'zipcode' => $data['zipcode'],
                            'phone1' => $data['phone1'],
                            'phone2' => $data['phone2'],
                            'phone3' => $data['phone3'],
                            'birthday_date' => $data['birthday_date'],
                            'birthday_month' => $data['birthday_month'],
                            'birthday_year' => $data['birthday_year'],
                            'gender' => $data['gender'],
                            'security_question' => $data['security_question'],
                            'security_answer' => $data['security_answer'],
                            'send_discount_code' => ('1' == @$data['send_discount_code'])?1:0,
                        );
            $errors = $objUser->validate($newUser);
            if ($_SESSION['captcha'] != strtoupper($data['captcha'])) {
                /**
                 * Incorrect captcha
                 */
                if (! is_array($errors)) {
                    $errors = array();
                }
                $errors[] = 'Captcha is incorrect';
            }
//            echo '<pre>';print_r($_SESSION);die;
            if (true === $errors) {
                $newUser['password'] = md5($newUser['password']);
                /**
                 * TODO Read date format from language table
                 */
                unset($newUser['repeat_password']);
                try {
                    $id = $objUser->insert($newUser);
                    $newUserExp = array(
                                        'user_id'    => $id,
                                    );
                    $objUserExp->insert($newUserExp);
                    $this->_redirect($objContent->getUrlWithoutAppBaseUrl(11));
                } catch (Exception $e) {
                    $errors = array('main' => Vi_Language::translate('Can not insert into database now'));
                }
            }
        }
        $this->view->data = $data;
        $this->view->errors = $errors;
    }
}