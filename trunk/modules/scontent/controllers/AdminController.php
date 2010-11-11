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
require_once 'Shared/Models/Scontent.php';
require_once 'Shared/Models/ScontentLang.php';
require_once 'Shared/Models/ScontentCategory.php';
require_once 'Shared/Models/Lang.php';
class scontent_AdminController extends Vi_Controller_Action_Admin 
{
    
	
    public function managerAction()
    {
        /**
         * Check permission
         */
        if (false == $this->checkPermission('see_scontent', null, '?')) {
            $this->_forwardToNoPermissionPage();
            return;
        }
        
        $this->view->headTitle(Vi_Language::translate('Content Manager'));
        $this->view->menu = array('scontent', 'manager');
        
        
        $config = Vi_Registry::getConfig();
        $numRowPerPage = Vi_Registry::getConfig("defaultNumberRowPerPage");
        $currentPage = $this->_getParam("page",1);
        $displayNum = $this->_getParam('displayNum', false);
        
        $objScontent     = new Models_Scontent();
        $objScontentLang = new Models_ScontentLang();
        $objLang         = new Models_Lang();
        $objCat          = new Models_ScontentCategory();
        
        /**
         * Update sorting
         */
        $data = $this->_getParam('data', array());
        foreach ($data as $id=>$value) {
            $value = intval($value);
            if (1 > $value) {
                continue;
            }
            $objScontent->update(array('sorting' => $value), array('scontent_id=?' => $id));
            $this->session->scontentMessage = array(
                                       'success' => true,
                                       'message' => Vi_Language::translate("Edit sort numbers successfully")
                                   );
        }
        
        /**
         * Get number of items per page
         */
        if (false === $displayNum) {
            $displayNum = $this->session->contentDisplayNum;
        } else {
            $this->session->contentDisplayNum = $displayNum;
        }
        if (null != $displayNum) {
            $numRowPerPage = $displayNum;
        }
        /**
         * Get condition
         */
        $condition = $this->_getParam('condition', false);
        if (false === $condition) {
            $condition = $this->session->contentCondition;
        } else {
            $this->session->contentCondition = $condition;
            $currentPage = 1;
        }
        if (false == $condition) {
            $condition = array();
        }
        
        /**
         * Get all categories
         */
        $this->view->allCats = $objCat->getAll(array('sorting ASC'))->toArray();
        /**
         * Get all display languages
         */
        $allLangs = $objLang->getAll(array('sorting ASC'))->toArray();
        $this->view->allLangs = $allLangs;
        /**
         * Check permisison for each language
         */
        foreach ($allLangs as $index => $lang) {
            if (false == $this->checkPermission('see_scontent', null, $lang['lang_id'])) {
                /**
                 * Disappaer this language
                 */
                unset($allLangs[$index]);
            }
        }
        
        /**
         * Get all contents
         */
        
        $allScontents = $objScontent->getAllContents($condition, array('sorting ASC', 's.scontent_id DESC'),
                                                   $numRowPerPage,
                                                   ($currentPage - 1) * $numRowPerPage
                                                  );
//        echo '<pre>';print_r($allScontents);die;
        /**
         * Count all contents
         */
        $count = count($objScontent->getAllContents($condition));
        /**
         * Get content detail
         */
        foreach ($allScontents as $index=>$scontent) {
            $allDetails = $objScontentLang->getByColumnName(array(
                                                            'scontent_id=?' => $scontent['scontent_id']
                                                            ))->toArray();
            
            foreach ($allLangs as $lang) {
                $tmp = array(
                                'lang_id' => $lang['lang_id']
                            );
                foreach ($allDetails as $scontentLang) {
                    if ($lang['lang_id'] == $scontentLang['lang_id']) {
                        $tmp = $scontentLang;
                        break;
                    }
                }
                $tmp['lang_image'] = $lang['lang_image'];
                $allScontents[$index]['details'][] = $tmp;
            }
            /**
             * Change date
             */
            if (0 != $scontent['created_date']) {
                 $allScontents[$index]['created_date'] = date($config['dateFormat'], $scontent['created_date']);
            } else {
                $allScontents[$index]['created_date'] = '';
            }
            if (0 != $scontent['publish_up_date']) {
                 $allScontents[$index]['publish_up_date'] = date($config['dateFormat'], $scontent['publish_up_date']);
            } else {
                $allScontents[$index]['publish_up_date'] = '';
            }
            if (0 != $scontent['publish_down_date']) {
                 $allScontents[$index]['publish_down_date'] = date($config['dateFormat'], $scontent['publish_down_date']);
            } else {
                $allScontents[$index]['publish_down_date'] = '';
            }
        }
//        echo '<pre>';print_r($allScontents);die;
        /**
         * Set values for tempalte
         */
        $this->setPagination($numRowPerPage, $currentPage, $count);
        $this->view->allScontents = $allScontents;
        $this->view->scontentMessage = $this->session->scontentMessage;
        $this->session->scontentMessage = null;
        $this->view->condition = $condition;
        $this->view->displayNum = $numRowPerPage;
        $this->view->fullPermisison = $this->checkPermission('see_scontent');
    }
    
    public function newAction()
    {
        /**
         * Check permission
         */
        if (false == $this->checkPermission('new_scontent', null, '?')) {
            $this->_forwardToNoPermissionPage();
            return;
        }
        
        $data = $this->_getParam('data', false);
        /**
         * Get all categories
         */
        $objCat = new Models_ScontentCategory();
        $allCats = $objCat->getAll(array('sorting ASC'))->toArray();
        /**
         * Get all display languages
         */
        $objLang = new Models_Lang();
        $allLangs = $objLang->getAll(array('sorting ASC'))->toArray();
        /**
         * Check permisison for each language
         */
        foreach ($allLangs as $index => $lang) {
            if (false == $this->checkPermission('new_scontent', null, $lang['lang_id'])) {
                /**
                 * Disappaer this language
                 */
                unset($allLangs[$index]);
            }
        }
        
        $errors = array();
        if (false !== $data) {
        
            /**
             * Insert new content
             */
            $objScontent = new Models_Scontent();
            $objScontentLang = new Models_ScontentLang();
            if (true == $this->checkPermission('new_scontent', null, '*')) {
                $newScontent = array(
                                'scontent_category_id' => $data['scontent_category_id'],
                                'enabled'              => $data['enabled'],
                                'publish_up_date'      => $data['publish_up_date'],
                                'publish_down_date'    => $data['publish_down_date'],
                                'sorting'              => $data['sorting'],
                                'created_date'         => time()
                            );
            } else {
                $defaultCat = current($allCats);
                $newScontent = array(
                                'scontent_category_id' => $defaultCat['scontent_category_id'],
                                'enabled'              => 0,
                                'publish_up_date'      => null,
                                'publish_down_date'    => null,
                                'sorting'              => 1,
                                'created_date'         => time()
                            );
            }
            /**
             * Change format date
             */
            if (null == $newScontent['publish_up_date']) {
                unset($newScontent['publish_up_date']);
            } else {
                $tmp = explode('/', $newScontent['publish_up_date']);
                $newScontent['publish_up_date'] = mktime(0, 0, 0, $tmp[0], $tmp[1], $tmp[2]);
            }
            if (null == $newScontent['publish_down_date']) {
                unset($newScontent['publish_down_date']);
            } else {
                $tmp = explode('/', $newScontent['publish_down_date']);
                $newScontent['publish_down_date'] = mktime(0, 0, 0, $tmp[0], $tmp[1], $tmp[2]);
            }
            /**
             * Sorting
             */
            if (null == $newScontent['sorting']) {
                unset($newScontent['sorting']);
            }
            /**
             * Check URL for all language contents
             */
            $errors = true;
            $isDefaultLang = true;
            foreach ($allLangs as $lang) {
                if (true == $isDefaultLang) {
                    $isDefaultLang = false;
                    if (null == @$data[$lang['lang_id']]['title']) {
                        $errors[] = "You don't enter any content";
                    }
                }
                /**
                 * Check to ensure no same URL exists
                 */
                $existUrl = $objScontentLang->getByColumnName(array(
                                                    'lang_id' => $lang['lang_id'],
                                                    'category_alias' => @$data[$lang['lang_id']]['category_alias'],
                                                    'alias' => @$data[$lang['lang_id']]['alias']
                                                    ));
                if (count($existUrl) > 0) {
                    /**
                     * Alias exist
                     */
                    $errors[] = "URL you enter exist";
                }
            }
            
            if (true === $errors) {
                try {
                    /**
                     * Increase all current sortings
                     */
                    if (1 > $newScontent['sorting']) {
                        $newScontent['sorting'] = 1;
                    }
                    $objScontent->increaseSorting($newScontent['sorting'], 1);
                    
                    $id = $objScontent->insert($newScontent);
                    foreach ($allLangs as $lang) {
                        if (null == @$data[$lang['lang_id']]['title']) {
                            continue;
                        }
                        
                        $newScontentLang = array(
                                'scontent_id'    => $id,
                                'lang_id'        => $lang['lang_id'],
                                'enabled'        => @$data[$lang['lang_id']]['enabled'],
                                'title'          => @$data[$lang['lang_id']]['title'],
                                'category_alias' => @$data[$lang['lang_id']]['category_alias'],
                                'alias'          => @$data[$lang['lang_id']]['alias'],
                                'url'            => trim(@$data[$lang['lang_id']]['category_alias'] . '/' . @$data[$lang['lang_id']]['alias'], '/'),
                                'intro_text'     => @$data[$lang['lang_id']]['intro_text'],
                                'full_text'      => @$data[$lang['lang_id']]['full_text'],
                                'param'          => @$data[$lang['lang_id']]['param'],
                                'meta_data'      => @$data[$lang['lang_id']]['meta_data']
                                
                                );
                                
                       $objScontentLang->insert($newScontentLang);
                    }
                    $this->_redirect('scontent/admin/manager');
                } catch (Exception $e) {
                    $errors = array('main' => Vi_Language::translate('Can not insert into database now'));
                }
            }
        } else {
            $data = array('sorting' => 1);
        }
        /**
         * Prepare for template
         */
        $this->view->allCats = $allCats;
        $this->view->allLangs = $allLangs;
        $this->view->errors = $errors;
        $this->view->data = $data;
        $this->view->headTitle(Vi_Language::translate('New article'));
        $this->view->menu = array('scontent', 'new');
        $this->view->fullPermisison = $this->checkPermission('new_scontent', null, '*'); 
    }
    

    
    public function editAction()
    {
        /**
         * Check permission
         */
        if (false == $this->checkPermission('edit_scontent', null, '?')) {
            $this->_forwardToNoPermissionPage();
            return;
        }
        $id     = $this->_getParam('id', false);
        $lid    = $this->_getParam('lid', false); 
        if (false == $id) {
            $this->_redirect('scontent/admin/manager');
        }
        /**
         * Check permission
         */
        if ((false == $lid && false == $this->checkPermission('edit_scontent', null, '*'))
        ||  (false != $lid && false == $this->checkPermission('edit_scontent', null, $lid))) {
            $this->_forwardToNoPermissionPage();
            return;
        }
        
        $data   = $this->_getParam('data', false);
//        echo '<pre>';print_r($data);die;
        
        $objScontent = new Models_Scontent();
        $objScontentLang = new Models_ScontentLang();
        /**
         * Get all categories
         */
        $objCat = new Models_ScontentCategory();
        $allCats = $objCat->getAll(array('sorting ASC'))->toArray();
        /**
         * Get all display languages
         */
        $objLang = new Models_Lang();
        $allLangs = $objLang->getAll(array('sorting ASC'))->toArray();
        /**
         * Check permisison for each language
         */
        foreach ($allLangs as $index => $lang) {
            if (false == $this->checkPermission('edit_scontent', null, $lang['lang_id'])) {
                /**
                 * Disappaer this language
                 */
                unset($allLangs[$index]);
            }
        }
//        echo '<pre>';print_r($allLangs);die;
        
        $errors = array();
        if (false !== $data) {
        
            /**
             * Insert new content
             */
            $newScontent = array(
                            'scontent_category_id' => $data['scontent_category_id'],
                            'enabled'              => $data['enabled'],
                            'publish_up_date'      => $data['publish_up_date'],
                            'publish_down_date'    => $data['publish_down_date'],
                            'sorting'              => $data['sorting']
                        );
            /**
             * Change format date
             */
            if (null == $newScontent['publish_up_date']) {
                unset($newScontent['publish_up_date']);
            } else {
                $tmp = explode('/', $newScontent['publish_up_date']);
                $newScontent['publish_up_date'] = mktime(0, 0, 0, $tmp[0], $tmp[1], $tmp[2]);
            }
            if (null == $newScontent['publish_down_date']) {
                unset($newScontent['publish_down_date']);
            } else {
                $tmp = explode('/', $newScontent['publish_down_date']);
                $newScontent['publish_down_date'] = mktime(0, 0, 0, $tmp[0], $tmp[1], $tmp[2]);
            }
            /**
             * Sorting
             */
            if (null == $newScontent['sorting']) {
                unset($newScontent['sorting']);
            }
            /**
             * Check URL for all language contents
             */
            $errors = true;
            $isDefaultLang = true;
            foreach ($allLangs as $lang) {
                if (true == $isDefaultLang) {
                    $isDefaultLang = false;
                    if (null == @$data[$lang['lang_id']]['title']) {
                        $errors[] = "You don't enter any content";
                    }
                }
                /**
                 * Check to ensure no same URL exists
                 */
                $existUrl = $objScontentLang->getByColumnName(array(
                                                    'lang_id' => $lang['lang_id'],
                                                    'category_alias' => @$data[$lang['lang_id']]['category_alias'],
                                                    'alias' => @$data[$lang['lang_id']]['alias'],
                                                    'scontent_id !=?' => $id
                                                    ));
                if (count($existUrl) > 0) {
                    /**
                     * Alias exist
                     */
                    $errors[] = "URL you enter exist";
                }
            }
            
            if (true === $errors) {
                try {
                    /**
                     * Full permisison?
                     */
                    if (true == $this->checkPermission('edit_scontent', null, '*')) {
                        $objScontent->update($newScontent, array('scontent_id=?' => $id));
                    }
                    
                    foreach ($allLangs as $lang) {
                        if (null == @$data[$lang['lang_id']]['title']) {
                            continue;
                        }
                        /**
                         * Check to update or insert
                         */
                        $existScontentLang = $objScontentLang->getByColumnName(array('scontent_id=?' => $id, 'lang_id=?' => $lang['lang_id']));
                        $existScontentLang = $existScontentLang->current();
                        if (false == $existScontentLang) {
                            /**
                             * Insert
                             */
                            $newScontentLang = array(
                                    'scontent_id'    => $id,
                                    'lang_id'        => $lang['lang_id'],
                                    'enabled'        => @$data[$lang['lang_id']]['enabled'],
                                    'title'          => @$data[$lang['lang_id']]['title'],
                                    'category_alias' => @$data[$lang['lang_id']]['category_alias'],
                                    'alias'          => @$data[$lang['lang_id']]['alias'],
                                    'url'            => trim(@$data[$lang['lang_id']]['category_alias'] . '/' . @$data[$lang['lang_id']]['alias'], '/'),
                                    'intro_text'     => @$data[$lang['lang_id']]['intro_text'],
                                    'full_text'      => @$data[$lang['lang_id']]['full_text'],
                                    'param'          => @$data[$lang['lang_id']]['param'],
                                    'meta_data'      => @$data[$lang['lang_id']]['meta_data']
                                    
                                    );
                                    
                           $objScontentLang->insert($newScontentLang);
                        } else {
                            /**
                             * Update
                             */
                            $newScontentLang = array(
                                    'enabled'        => @$data[$lang['lang_id']]['enabled'],
                                    'title'          => @$data[$lang['lang_id']]['title'],
                                    'category_alias' => @$data[$lang['lang_id']]['category_alias'],
                                    'alias'          => @$data[$lang['lang_id']]['alias'],
                                    'url'            => trim(@$data[$lang['lang_id']]['category_alias'] . '/' . @$data[$lang['lang_id']]['alias'], '/'),
                                    'intro_text'     => @$data[$lang['lang_id']]['intro_text'],
                                    'full_text'      => @$data[$lang['lang_id']]['full_text'],
                                    'param'          => @$data[$lang['lang_id']]['param'],
                                    'meta_data'      => @$data[$lang['lang_id']]['meta_data']
                                    );
                                    
                           $objScontentLang->update($newScontentLang, array('scontent_id=?' => $id, 'lang_id=?' => $lang['lang_id']));
                        }
                    }
                    /**
                     * Redirect with message
                     */
                    $this->session->scontentMessage = array(
                                               'success' => true,
                                               'message' => Vi_Language::translate("Edit content successfully")
                                           );
                    $this->_redirect('scontent/admin/manager');
                } catch (Exception $e) {
                    $errors = array('main' => Vi_Language::translate('Can not insert into database now'));
                }
            }
        } else {
            /**
             * Get old data
             */
            $data = $objScontent->find($id)->toArray();
            $data = current($data);
            if (false == $data) {
                $this->session->scontentMessage = array(
                                               'success' => false,
                                               'message' => Vi_Language::translate("Content doesn't exist.")
                                           );
                $this->_redirect('scontent/admin/manager');
            }
            /**
             * Change date
             */
            if (0 != $data['publish_up_date']) {
                 $data['publish_up_date'] = date('m/d/Y', $data['publish_up_date']);
            } else {
                $data['publish_up_date'] = '';
            }
            if (0 != $data['publish_down_date']) {
                 $data['publish_down_date'] = date('m/d/Y', $data['publish_down_date']);
            } else {
                $data['publish_down_date'] = '';
            }
            /**
             * Get all lang contents
             */
            $allLangContents = $objScontentLang->getByColumnName(array('scontent_id=?' => $id))->toArray();
            foreach ($allLangs as $lang) {
                $data[$lang['lang_id']] = array();
                foreach ($allLangContents as $lcontent) {
                    if ($lcontent['lang_id'] == $lang['lang_id']) {
                        $data[$lang['lang_id']] = $lcontent;
                        break;
                    }
                }
            }
        }
//        echo '<pre>';print_r($data);die;
        /**
         * Prepare for template
         */
        $this->view->allCats = $allCats;
        $this->view->allLangs = $allLangs;
        $this->view->lid = $lid;
        $this->view->errors = $errors;
        $this->view->data = $data;
        $this->view->headTitle(Vi_Language::translate('Edit Article'));
        $this->view->menu = array('scontent','');
        $this->view->fullPermisison = $this->checkPermission('edit_scontent', null, '*');
    }

    public function enableGeneralContentAction()
    {
        /**
         * Check permission
         */
        if (false == $this->checkPermission('edit_scontent', null, '*')) {
            $this->_forwardToNoPermissionPage();
            return;
        }
        $id = $this->_getParam('id', false);
        
        if (false == $id) {
            $this->_redirect('scontent/admin/manager');
        }
        
        $ids = explode('_', trim($id, '_'));
        
        $objScontent = new Models_Scontent();
        try {
            foreach ($ids as $id) {
               $objScontent->update(array('enabled' => 1), array('scontent_id=?' => $id));
            }
            $this->session->scontentMessage = array(
                                               'success' => true,
                                               'message' => Vi_Language::translate('Enable content successfully')
                                           );
        } catch (Exception $e) {
            $this->session->scontentMessage = array(
                                               'success' => false,
                                               'message' => Vi_Language::translate('Can NOT enable this content. Please try again')
                                           );
        }
        $this->_redirect('scontent/admin/manager');
    }

    public function enableLangContentAction()
    {
        $id = $this->_getParam('id', false);
        
        if (false == $id) {
            $this->_redirect('scontent/admin/manager');
        }
        
        $ids = explode('_', trim($id, '_'));
        
        $objScontentLang = new Models_ScontentLang();
        try {
            foreach ($ids as $id) {
                /**
                 * Check permission
                 */
                $scontentLang = $objScontentLang->find($id)->toArray();
                $scontentLang = current($scontentLang);
                
                if (false == $this->checkPermission('edit_scontent', null, $scontentLang['lang_id'])) {
                    continue;
                }
                /**
                 * Update data
                 */
               $objScontentLang->update(array('enabled' => 1), array('scontent_lang_id=?' => $id));
            }
            $this->session->scontentMessage = array(
                                               'success' => true,
                                               'message' => Vi_Language::translate('Enable content successfully')
                                           );
        } catch (Exception $e) {
            $this->session->scontentMessage = array(
                                               'success' => false,
                                               'message' => Vi_Language::translate('Can NOT enable this content. Please try again')
                                           );
        }
        $this->_redirect('scontent/admin/manager');
    }
    
    public function disableGeneralContentAction()
    {
        /**
         * Check permission
         */
        if (false == $this->checkPermission('edit_scontent', null, '*')) {
            $this->_forwardToNoPermissionPage();
            return;
        }
        $id = $this->_getParam('id', false);
        
        if (false == $id) {
            $this->_redirect('scontent/admin/manager');
        }
        
        $ids = explode('_', trim($id, '_'));
        
        $objScontent = new Models_Scontent();
        try {
            foreach ($ids as $id) {
               $objScontent->update(array('enabled' => 0), array('scontent_id=?' => $id));
            }
            $this->session->scontentMessage = array(
                                               'success' => true,
                                               'message' => Vi_Language::translate('Disable content successfully')
                                           );
        } catch (Exception $e) {
            $this->session->scontentMessage = array(
                                               'success' => false,
                                               'message' => Vi_Language::translate('Can NOT disable this content. Please try again')
                                           );
        }
        $this->_redirect('scontent/admin/manager');
    }

    public function disableLangContentAction()
    {
        $id = $this->_getParam('id', false);
        
        if (false == $id) {
            $this->_redirect('scontent/admin/manager');
        }
        
        $ids = explode('_', trim($id, '_'));
        
        $objScontentLang = new Models_ScontentLang();
        try {
            foreach ($ids as $id) {
                /**
                 * Check permission
                 */
                $scontentLang = $objScontentLang->find($id)->toArray();
                $scontentLang = current($scontentLang);
                
                if (false == $this->checkPermission('edit_scontent', null, $scontentLang['lang_id'])) {
                    continue;
                }
                /**
                 * Update data
                 */
               $objScontentLang->update(array('enabled' => 0), array('scontent_lang_id=?' => $id));
            }
            $this->session->scontentMessage = array(
                                               'success' => true,
                                               'message' => Vi_Language::translate('Disable content successfully')
                                           );
        } catch (Exception $e) {
            $this->session->scontentMessage = array(
                                               'success' => false,
                                               'message' => Vi_Language::translate('Can NOT disable this content. Please try again')
                                           );
        }
        $this->_redirect('scontent/admin/manager');
    }
    
    public function deleteGeneralContentAction()
    {
        /**
         * Check permission
         */
        if (false == $this->checkPermission('delete_scontent')) {
            $this->_forwardToNoPermissionPage();
            return;
        }
        $id = $this->_getParam('id', false);
        
        if (false == $id) {
            $this->_redirect('scontent/admin/manager');
        }
        
        $ids = explode('_', trim($id, '_'));
        
        $objScontent = new Models_Scontent();
        try {
            foreach ($ids as $id) {
               $objScontent->delete(array('scontent_id=?' => $id));
            }
            $this->session->scontentMessage = array(
                                               'success' => true,
                                               'message' => Vi_Language::translate('Delete content successfully')
                                           );
        } catch (Exception $e) {
            $this->session->scontentMessage = array(
                                               'success' => false,
                                               'message' => Vi_Language::translate('Can NOT delete this content. Please try again')
                                           );
        }
        $this->_redirect('scontent/admin/manager');
    }
}