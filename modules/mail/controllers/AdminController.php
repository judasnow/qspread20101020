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
require_once 'Shared/Models/Mail.php';
require_once 'Shared/Models/MailLang.php';
require_once 'Shared/Models/Lang.php';
class mail_AdminController extends Vi_Controller_Action_Admin 
{
    
    public function systemMailManagerAction()
    {
        /**
         * Check permission
         */
        if (false == $this->checkPermission('see_system_mail')) {
            $this->_forwardToNoPermissionPage();
            return;
        }
        
        $this->view->headTitle(Vi_Language::translate('System Mail Manager'));
        $this->view->menu = array('mail', 'systemmailmanager');
        
        
        $config = Vi_Registry::getConfig();
        $numRowPerPage = Vi_Registry::getConfig("defaultNumberRowPerPage");
        $currentPage = $this->_getParam("page",1);
        $displayNum = $this->_getParam('displayNum', false);
        
        $objMail     = new Models_Mail();
        $objMailLang = new Models_MailLang();
        $objLang     = new Models_Lang();
        
        /**
         * Get number of items per page
         */
        if (false === $displayNum) {
            $displayNum = $this->session->mailDisplayNum;
        } else {
            $this->session->mailDisplayNum = $displayNum;
        }
        if (null != $displayNum) {
            $numRowPerPage = $displayNum;
        }
        /**
         * Get condition
         */
        $condition = $this->_getParam('condition', false);
        if (false === $condition) {
            $condition = $this->session->mailCondition;
        } else {
            $this->session->mailCondition = $condition;
            $currentPage = 1;
        }
        if (false == $condition) {
            $condition = array();
        }
        /**
         * Get all display languages
         */
        $allLangs = $objLang->getAll(array('sorting ASC'))->toArray();
        $this->view->allLangs = $allLangs;
        /**
         * Get all mails
         */
        $allMails = $objMail->getAllSystemMails($condition, array('m.mail_id ASC'),
                                                   $numRowPerPage,
                                                   ($currentPage - 1) * $numRowPerPage
                                                  );
//        echo '<pre>';print_r($allMails);die;
        /**
         * Count all contents
         */
        $count = count($objMail->getAllSystemMails($condition));
        /**
         * Get content detail
         */
        foreach ($allMails as $index=>$mail) {
            $allDetails = $objMailLang->getByColumnName(array(
                                                            'mail_id=?' => $mail['mail_id']
                                                            ))->toArray();
            
            foreach ($allLangs as $lang) {
                $tmp = array(
                                'lang_id' => $lang['lang_id']
                            );
                foreach ($allDetails as $mailLang) {
                    if ($lang['lang_id'] == $mailLang['lang_id']) {
                        $tmp = $mailLang;
                        break;
                    }
                }
                $tmp['lang_image'] = $lang['lang_image'];
                $allMails[$index]['details'][] = $tmp;
            }
        }
//        echo '<pre>';print_r($allMails);die;
        /**
         * Set values for tempalte
         */
        $this->setPagination($numRowPerPage, $currentPage, $count);
        $this->view->allMails = $allMails;
        $this->view->mailMessage = $this->session->mailMessage;
        $this->session->mailMessage = null;
        $this->view->condition = $condition;
        $this->view->displayNum = $numRowPerPage;
    }
    
    public function enableGeneralSystemMailAction()
    {
        /**
         * Check permission
         */
        if (false == $this->checkPermission('edit_system_mail')) {
            $this->_forwardToNoPermissionPage();
            return;
        }
        $id = $this->_getParam('id', false);
        
        if (false == $id) {
            $this->_redirect('mail/admin/system-mail-manager');
        }
        
        $ids = explode('_', trim($id, '_'));
        
        $objMail = new Models_Mail();
        try {
            foreach ($ids as $id) {
               $objMail->update(array('enabled' => 1), array('mail_id=?' => $id));
            }
            $this->session->mailMessage = array(
                                               'success' => true,
                                               'message' => Vi_Language::translate('Enable mail successfully')
                                           );
        } catch (Exception $e) {
            $this->session->mailMessage = array(
                                               'success' => false,
                                               'message' => Vi_Language::translate('Can NOT enable this mail. Please try again')
                                           );
        }
        $this->_redirect('mail/admin/system-mail-manager');
    }
    
    public function disableGeneralSystemMailAction()
    {
        /**
         * Check permission
         */
        if (false == $this->checkPermission('edit_system_mail')) {
            $this->_forwardToNoPermissionPage();
            return;
        }
        $id = $this->_getParam('id', false);
        
        if (false == $id) {
            $this->_redirect('mail/admin/system-mail-manager');
        }
        
        $ids = explode('_', trim($id, '_'));
        
        $objMail = new Models_Mail();
        try {
            foreach ($ids as $id) {
               $objMail->update(array('enabled' => 0), array('mail_id=?' => $id));
            }
            $this->session->mailMessage = array(
                                               'success' => true,
                                               'message' => Vi_Language::translate('Disable mail successfully')
                                           );
        } catch (Exception $e) {
            $this->session->mailMessage = array(
                                               'success' => false,
                                               'message' => Vi_Language::translate('Can NOT disable this mail. Please try again')
                                           );
        }
        $this->_redirect('mail/admin/system-mail-manager');
    }
    
    public function enableLangSystemMailAction()
    {
        /**
         * Check permission
         */
        if (false == $this->checkPermission('edit_system_mail')) {
            $this->_forwardToNoPermissionPage();
            return;
        }
        
        $id = $this->_getParam('id', false);
        
        if (false == $id) {
            $this->_redirect('mail/admin/system-mail-manager');
        }
        
        $ids = explode('_', trim($id, '_'));
        
        $objMailLang = new Models_MailLang();
        try {
            foreach ($ids as $id) {
                /**
                 * Update data
                 */
               $objMailLang->update(array('enabled' => 1), array('mail_lang_id=?' => $id));
            }
            $this->session->mailMessage = array(
                                               'success' => true,
                                               'message' => Vi_Language::translate('Enable mail successfully')
                                           );
        } catch (Exception $e) {
            $this->session->mailMessage = array(
                                               'success' => false,
                                               'message' => Vi_Language::translate('Can NOT enable this mail. Please try again')
                                           );
        }
        $this->_redirect('mail/admin/system-mail-manager');
    }
    
    public function disableLangSystemMailAction()
    {
        /**
         * Check permission
         */
        if (false == $this->checkPermission('edit_system_mail')) {
            $this->_forwardToNoPermissionPage();
            return;
        }
        
        $id = $this->_getParam('id', false);
        
        if (false == $id) {
            $this->_redirect('mail/admin/system-mail-manager');
        }
        
        $ids = explode('_', trim($id, '_'));
        
        $objMailLang = new Models_MailLang();
        try {
            foreach ($ids as $id) {
                /**
                 * Update data
                 */
               $objMailLang->update(array('enabled' => 0), array('mail_lang_id=?' => $id));
            }
            $this->session->mailMessage = array(
                                               'success' => true,
                                               'message' => Vi_Language::translate('Disable mail successfully')
                                           );
        } catch (Exception $e) {
            $this->session->mailMessage = array(
                                               'success' => false,
                                               'message' => Vi_Language::translate('Can NOT disable this mail. Please try again')
                                           );
        }
        $this->_redirect('mail/admin/system-mail-manager');
    }
    
    
    public function editSystemMailAction()
    {
        /**
         * Check permission
         */
        if (false == $this->checkPermission('edit_system_mail')) {
            $this->_forwardToNoPermissionPage();
            return;
        }
        $id     = $this->_getParam('id', false);
        $lid    = $this->_getParam('lid', false); 
        if (false == $id) {
            $this->_redirect('mail/admin/system-mail-manager');
        }
        
        $data   = $this->_getParam('data', false);
//        echo '<pre>';print_r($data);die;
        
        $objMail = new Models_Mail();
        $objMailLang = new Models_MailLang();
        /**
         * Get all display languages
         */
        $objLang = new Models_Lang();
        $allLangs = $objLang->getAll(array('sorting ASC'))->toArray();
//        echo '<pre>';print_r($allLangs);die;
        
        $errors = array();
        if (false !== $data) {
        
            /**
             * Update mail
             */
            $newMail = array(
                            'enabled' => $data['enabled']
                        );
            try {
                $objMail->update($newMail, array('mail_id=?' => $id));
                
                foreach ($allLangs as $lang) {
                    if (null == @$data[$lang['lang_id']]['subject']) {
                        continue;
                    }
                    /**
                     * Check to update or insert
                     */
                    $existMailLang = $objMailLang->getByColumnName(array('mail_id=?' => $id, 'lang_id=?' => $lang['lang_id']));
                    $existMailLang = $existMailLang->current();
                    if (false == $existMailLang) {
                        /**
                         * Insert
                         */
                        $newMailLang = array(
                                'mail_id'        => $id,
                                'lang_id'        => $lang['lang_id'],
                                'enabled'        => @$data[$lang['lang_id']]['enabled'],
                                'subject'        => @$data[$lang['lang_id']]['subject'],
                                'content'        => @$data[$lang['lang_id']]['content']
                                );
                                
                       $objMailLang->insert($newMailLang);
                    } else {
                        /**
                         * Update
                         */
                        $newMailLang = array(
                                'enabled'        => @$data[$lang['lang_id']]['enabled'],
                                'subject'        => @$data[$lang['lang_id']]['subject'],
                                'content'        => @$data[$lang['lang_id']]['content']
                                );
                                
                       $objMailLang->update($newMailLang, array('mail_id=?' => $id, 'lang_id=?' => $lang['lang_id']));
                    }
                }
                /**
                 * Redirect with message
                 */
                $this->session->mailMessage = array(
                                           'success' => true,
                                           'message' => Vi_Language::translate("Edit mail successfully")
                                       );
                $this->_redirect('mail/admin/system-mail-manager');
            } catch (Exception $e) {
                $errors = array('main' => Vi_Language::translate('Can not insert into database now'));
            }
        } else {
            /**
             * Get old data
             */
            $data = $objMail->find($id)->toArray();
            $data = current($data);
            if (false == $data) {
                $this->session->mailMessage = array(
                                               'success' => false,
                                               'message' => Vi_Language::translate("Mail doesn't exist.")
                                           );
                $this->_redirect('mail/admin/system-mail-manager');
            }
            /**
             * Change format data
             */
            $data['data'] = str_replace(array("\r\n", "\n", "\r"), '<br/>', $data['data']);
            /**
             * Get all lang mails
             */
            $allLangMails = $objMailLang->getByColumnName(array('mail_id=?' => $id))->toArray();
            foreach ($allLangs as $lang) {
                $data[$lang['lang_id']] = array();
                foreach ($allLangMails as $lmail) {
                    if ($lmail['lang_id'] == $lang['lang_id']) {
                        $data[$lang['lang_id']] = $lmail;
                        break;
                    }
                }
            }
        }
//        echo '<pre>';print_r($data);die;
        /**
         * Prepare for template
         */
        $this->view->allLangs = $allLangs;
        $this->view->lid = $lid;
        $this->view->errors = $errors;
        $this->view->data = $data;
        $this->view->headTitle(Vi_Language::translate('Edit Mail System'));
        $this->view->menu = array('mail','');
    }
    
}