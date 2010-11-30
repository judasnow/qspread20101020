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
require_once 'Shared/Models/Restaurant.php';
require_once 'Shared/Models/Mail.php';

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
    

    public function editAction()
    {
        $this->view->headTitle('Edit account');
    
        if (false == Vi_Registry::getLoggedInUserId()) {
            $this->_redirect('register.html');
        }
        
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
                            'full_name'       => $data['full_name'],
                            'password'        => $data['password'],
                            'repeat_password' => $data['retype_password'],
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
//            $errors = $objUser->validate($newUser);
            $errors = array();
//            echo '<pre>';print_r($_SESSION);die;
            if (empty($errors)) {
                if (null != $newUser['password']) {
                    $newUser['password'] = md5($newUser['password']);
                    /**
                     * TODO Read date format from language table
                     */
                    unset($newUser['repeat_password']);
                } else {
                    /**
                     * Don't change password
                     */
                    unset($newUser['password']);
                    unset($newUser['repeat_password']);
                }
                unset($newUser['email']);
                unset($newUser['username']);
                try {
                    $id = $objUser->update($newUser, array('user_id=?' => Vi_Registry::getLoggedInUserId()));
                    $this->view->updateSuccess = true;
                } catch (Exception $e) {
                    $errors = array('main' => Vi_Language::translate('Can not insert into database now'));
                }
            }
        }
        
        $data = Vi_Registry::getLoggedInUser()->toArray();
        
        $this->view->data = $data;
        $this->view->errors = $errors;
    }
    
    public function forgotPasswordAction()
    {
        $this->view->headTitle('Forgot password');
        $email = $this->_getParam('email', false);
        
        $error = false;
        if (false != $email) {
            $objUser = new Models_User();
            $user = $objUser->getByColumnName(array('email=?'=>$email))->toArray();
            $user = current($user);
            
            if (false == $user) {
                $error = true;
            } else {
                /**
                 * Create random code
                 */
                $randomCode = $objUser->generateActiveCode(20);
                $link = Vi_Registry::getConfig('liveSite') . '/user/index/id/' . $user['user_id'] . '/newPasswordAction/code/' . $randomCode;
                /**
                 * Update user
                 */
                $data = array(
                    'forgot_password_code' => $randomCode,
                    'forgot_password_expired_date' => time() + 24 * 3600
                );
                $objUserExp = new Models_UserExpand();
                $objUserExp->update($data, array('user_id=?'=> $user['user_id']));
                /**
                 * Send mail
                 */
                $data = array(
                        'email' => $email,
                        'get_password_link' => $link
                );
                $objMail = new Models_Mail();
                $objMail->sendHtmlMail('forgot_password', $data, $email);
                /**
                 * Redirect to page
                 */
                $objContent = new Models_ScontentLang();
                $this->_redirect($objContent->getUrlWithoutAppBaseUrl(20));
            }
        }
        $this->view->error = $error;
        $this->view->email = $email;
    }
    
    public function newPasswordAction()
    {
        $this->view->headTitle('New password');
        $code = $this->_getParam('code', false);
        $id = $this->_getParam('id', false);
        
        if (false == $code || false == 'id') {
            $this->_redirect('');
        }
        
        $error = false;
        /**
         * Check code
         */
        $objUserExp = new Models_UserExpand();
        $objUser    = new Models_User();
        $user = $objUserExp->getByColumnName(array(
            'forgot_password_code=?' => $code,
            'forgot_password_expired_date>?' => time(),
            'user_id=?' => $id
        ))->toArray();
        if (empty($user)) {
            $error = true;
        } else {
            /**
             * Clear all active code
             */
            $data = array(
                'forgot_password_code' => '',
                'forgot_password_expired_date' => 0
            );
            $objUserExp->update($data, array('user_id=?'=> $id));
            /**
             * Create new password
             */
            $newPassword = $objUser->generateActiveCode(8);
            $objUser->update(array('password'=> md5($newPassword)), array('user_id=?' => $id));
            /**
             * Send email
             */
            $user = $objUser->find($id)->toArray();
            $user = current($user);
            
            $data = array(
                'new_password' => $newPassword,
                'username' => $user['username'],
                'email' => $user['email'],
                'full_name' => $user['full_name']
            );
            
            $objMail = new Models_Mail();
            $objMail->sendHtmlMail('new_password', $data, $user['email']);
            /**
             * Redirect to page
             */
            $objContent = new Models_ScontentLang();
            $this->_redirect($objContent->getUrlWithoutAppBaseUrl(20));
        }
        
        $this->view->error = $error;
        $this->view->email = $email;
    }

    public function restaurantRegisterAction()
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
        $condition = $this->_getParam('condition', false);
        $error = '';
        
        /**
         * Insert restaurant
         */
        if ('1' == $condition && null != $this->session->newRes && is_array($this->session->newRes)) {
            $objRes->insert($this->session->newRes);
            /**
             * Send email
             */
            $objUser = new Models_User();
            $objMail = new Models_Mail();
            $data = $this->session->newRes;
            unset($data['created_date']);
            
            $admin = $objUser->getByUserName('admin');
            $objMail->sendHtmlMail('restaurant_register', $data, array($admin['email'], $data['owner_email']));
            /**
             * Clear data
             */
            $this->session->newRes = null;
            /**
             * Redirect to thankyou page
             */
            $objContent = new Models_ScontentLang();
            $this->_redirect($objContent->getUrlWithoutAppBaseUrl(20));
        }
        
        
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
            $newRes['enabled'] = 0;
            $newRes['created_date'] = time();
//            echo '<pre>';print_r($newRes);die;

            $this->session->newRes = $newRes;
            $this->_forward('restaurant-register2', 'index', 'user');
            return;
        }
        $this->view->data = $data;
        $this->view->error = $error;
        
        $this->view->headTitle('Restaurant Owner Register');
        $this->setLayout('front2');
    }
    
    public function restaurantRegister2Action()
    {
        $this->view->headTitle('Restaurant Owner Register');
        $this->setLayout('front2');
        
        
        /**
         * Article - Term of Use of Restaurant
         */
        $objContent = new Models_ScontentLang();
        $this->view->article = $objContent->getContent(19);
    }
}