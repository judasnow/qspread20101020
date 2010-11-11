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
require_once 'Shared/Models/Category.php';
require_once 'Shared/Models/CategoryValue.php';
class category_AdminController extends Vi_Controller_Action_Admin 
{
    
	public function newCategoryAction()
	{
        /**
         * Check permission
         */
        if (false == $this->checkPermission('new_category')) {
            $this->_forwardToNoPermissionPage();
            return;
        }
        
	    $data = $this->_getParam('data', false);
	    $images = $this->_getParam('image', false);
        $imageTypes = $this->_getParam('image_type', false);
        $imageMains = $this->_getParam('image_main', false);
	    $videos = $this->_getParam('video', false);
//	    echo '<pre>';print_r($data);die;
	    $error = false;
        $objCategory = new Models_Category();
        $objCategoryImage = new Models_CategoryImage();
        $objCategoryVideo = new Models_CategoryVideo();
        
	    if (false !== $data) {
	    
	        /**
	         * Insert new category
	         */
            $newCategory = $data;
            $newCategory['created_date'] = time();
            /**
             * Check code
             */
            $check = $objCategory->getByColumnName(array('code=?' => $newCategory['code']))->toArray();
            if (count($check) > 0) {
                $error = 'CODE is used. Please enter another code';
            }
            
            if (false === $error) {
                try {
                    $id = $objCategory->insert($newCategory);
                    /**
                     * Insert images
                     */
                    foreach ($images as $index => $image) {
                        if (null == $image) {
                            continue;
                        }
                        $data = array(
                            'category_id' => $id,
                            'display_value' => $image,
                            'value' => $this->_getImagePath($image),
                            'created_date' => time()
                        );
                        if (null != @$imageTypes[$index]) {
                            $data['image_type'] = $imageTypes[$index];
                        }
                        if ('1' == @$imageMains[$index]) {
                            $data['main_image'] = 1;
                        }
                        $objCategoryImage->insert($data);
                    }
                    /**
                     * Insert videos
                     */
                    foreach ($videos as $video) {
                        if (null == $video) {
                            continue;
                        }
                        $data = array(
                            'category_id' => $id,
                            'display_value' => $video,
                            'value' => $this->_getYoutubeLink($video),
                            'created_date' => time()
                        );
                        $objCategoryVideo->insert($data);
                    }
                    $this->session->categoryMessage = array(
                        'success' => true,
                        'message' => 'New category is created successfully'
                    );
                    $this->_redirect('category/admin/category-manager');
                } catch (Exception $e) {
                    $error = Vi_Language::translate('Can not insert into database now');
                }
            }
	    } else {
	        /**
	         * Generate unique CODE
	         */
	        while (true) {
    	        $code = $objCategory->generateCode(10);
    	        $check = $objCategory->getByColumnName(array('code=?' => $code))->toArray();
    	        if (count($check) == 0) {
    	            break;
    	        }
	        }
	        $data = array(
	           'code' => $code
	        );
	    }
	    /**
	     * Prepare for template
	     */
	    $this->view->error = $error;
	    $this->view->data = $data;
        $this->view->headTitle(Vi_Language::translate('New category'));
        $this->view->menu = array('category', 'newcategory');
	}
	

    public function editCategoryAction()
    {
        /**
         * Check permission
         */
        if (false == $this->checkPermission('edit_category')) {
            $this->_forwardToNoPermissionPage();
            return;
        }
        
        $id   = $this->_getParam('id', false);
        $data = $this->_getParam('data', false);
        $images = $this->_getParam('image', false);
        $imageTypes = $this->_getParam('image_type', false);
        $imageMains = $this->_getParam('image_main', false);
        $videos = $this->_getParam('video', false);
    
        if (false == $id) {
            $this->_redirect('category/admin/category-manager');
        }
        
        $objCategory = new Models_Category();
        $objCategoryImage = new Models_CategoryImage();
        $objCategoryVideo = new Models_CategoryVideo();
        $error = false;
        /**
         * Get old category
         */
        $oldCategory = $objCategory->find($id)->toArray();
        $oldCategory = current($oldCategory);
    
        if (empty($oldCategory)) {
            /**
             * Category doesn't exsit
             */
            
            $this->session->categoryMessage = array(
                                           'success' => false,
                                           'message' => Vi_Language::translate('Category does NOT exist')
                                       );
            $this->_redirect('category/admin/category-manager#listofcategory');
        }
        
        if (false !== $data) {
            /**
             * Update new category
             */
            $newCategory = $data;
                        
            if (false === $error) {
                try {
                    $objCategory->update($newCategory, array('category_id=?' => $id));
                    /**
                     * Clear all images and videos
                     */
                    $objCategoryImage->delete(array('category_id=?' => $id));
                    $objCategoryVideo->delete(array('category_id=?' => $id));
                    /**
                     * Add new images and videos
                     */
                    /**
                     * Insert images
                     */
                    foreach ($images as $index => $image) {
                        if (null == $image) {
                            continue;
                        }
                        $data = array(
                            'category_id' => $id,
                            'display_value' => $image,
                            'value' => $this->_getImagePath($image),
                            'created_date' => time()
                        );
                    
                        if (null != @$imageTypes[$index]) {
                            $data['image_type'] = $imageTypes[$index];
                        }
                        if ('1' == @$imageMains[$index]) {
                            $data['main_image'] = 1;
                        }
                        $objCategoryImage->insert($data);
                    }
                    /**
                     * Insert videos
                     */
                    foreach ($videos as $video) {
                        if (null == $video) {
                            continue;
                        }
                        $data = array(
                            'category_id' => $id,
                            'display_value' => $video,
                            'value' => $this->_getYoutubeLink($video),
                            'created_date' => time()
                        );
                        $objCategoryVideo->insert($data);
                    }
                    $this->session->categoryMessage = array(
                        'success' => true,
                        'message' => 'Category is edited successfully'
                    );
                    /**
                     * Reload current login category
                     */
                    $this->_redirect('category/admin/category-manager');
                } catch (Exception $e) {
                    $error = array('main' => Vi_Language::translate('Can not update category now'));
                }
            }
        } else {
            /**
             * Get current category
             */
            $data = $oldCategory;
        }
        /**
         * Prepare for template
         */
        $this->view->images = $objCategoryImage->getByColumnName(array('category_id=?' => $id))->toArray();
        $this->view->videos = $objCategoryVideo->getByColumnName(array('category_id=?' => $id))->toArray();
        $this->view->error = $error;
        $this->view->data = $data;
        $this->view->headTitle(Vi_Language::translate('Edit category'));
        $this->view->menu = array('category', 'editcategory');
    }
	
    public function categoryManagerAction()
    {
        /**
         * Check permission
         */
        if (false == $this->checkPermission('see_category')) {
            $this->_forwardToNoPermissionPage();
            return;
        }
        
        $this->view->headTitle(Vi_Language::translate('Category manager'));
        $this->view->menu = array('others', 'categorymanager');
        
        $config = Vi_Registry::getConfig();
        $numRowPerPage = Vi_Registry::getConfig("defaultNumberRowPerPage");
        $currentPage = $this->_getParam("page",1);
        $displayNum = $this->_getParam('displayNum', false);
        
        /**
         * Get number of categorys per page
         */
        if (false === $displayNum) {
            $displayNum = $this->session->categoryDisplayNum;
        } else {
            $this->session->categoryDisplayNum = $displayNum;
        }
        if (null != $displayNum) {
            $numRowPerPage = $displayNum;
        }
        /**
         * Get condition
         */
        $condition = $this->_getParam('condition', false);
        if (false === $condition) {
            $condition = $this->session->categoryCondition;
        } else {
            $this->session->categoryCondition = $condition;
            $currentPage = 1;
        }
        if (false == $condition) {
            $condition = array();
        }
        /**
         * Load all categorys
         */
        $objCategory = new Models_Category();
        $allCategories = $objCategory->getAllCategories($condition, 'name ASC',
                                                   $numRowPerPage,
                                                   ($currentPage - 1) * $numRowPerPage
                                                  );
        /**
         * Count all categorys
         */
        $count = count($objCategory->getAllCategories());
        /**
         * Set values for tempalte
         */
        $this->setPagination($numRowPerPage, $currentPage, $count);
        $this->view->allCategories = $allCategories;
        $this->view->categoryMessage = $this->session->categoryMessage;
        $this->session->categoryMessage = null;
        $this->view->condition = $condition;
        $this->view->displayNum = $numRowPerPage;
    }

    
    public function categoryValueManagerAction()
    {
        /**
         * Check permission
         */
        if (false == $this->checkPermission('see_value')) {
            $this->_forwardToNoPermissionPage();
            return;
        }
        
        $this->view->headTitle(Vi_Language::translate('Value manager'));
        $this->view->menu = array('category', 'categorymanager');
        
        $config = Vi_Registry::getConfig();
        $numRowPerPage = Vi_Registry::getConfig("defaultNumberRowPerPage");
        $currentPage = $this->_getParam("page",1);
        $displayNum = $this->_getParam('displayNum', false);
        $id = $this->_getParam('id', false);
        if (false == $id) {
            $this->_redirect('category/admin/category-manager');
        }
        
        /**
         * Update sort
         */
        $data = $this->_getParam('data', false);
        if (false != $data) {
            $objCatVal = new Models_CategoryValue();
            foreach ($data as $index=>$value) {
                $objCatVal->update(array('sorting' => $value), array('category_value_id=?' => $index));
            }
            $this->session->categoryValueMessage = array(
                                               'success' => true,
                                               'message' => Vi_Language::translate('Sorting values are updated successfully')
                                           );
        }
        
        /**
         * Get number of category values per page
         */
        if (false === $displayNum) {
            $displayNum = $this->session->categoryValueDisplayNum;
        } else {
            $this->session->categoryValueDisplayNum = $displayNum;
        }
        if (null != $displayNum) {
            $numRowPerPage = $displayNum;
        }
        /**
         * Get condition
         */
        $condition = $this->_getParam('condition', false);
        if (false === $condition) {
            $condition = $this->session->categoryValueCondition;
        } else {
            $this->session->categoryValueCondition = $condition;
            $currentPage = 1;
        }
        if (false == $condition) {
            $condition = array();
        }
        $condition['category_id'] = $id;
        /**
         * Load all categoryValues
         */
        $objCategoryValue = new Models_CategoryValue();
        $allCategoryValues = $objCategoryValue->getAllCategoryValues($condition, array('sorting ASC', 'name ASC'),
                                                   $numRowPerPage,
                                                   ($currentPage - 1) * $numRowPerPage
                                                  );
        /**
         * Count all categoryValues
         */
        $count = count($objCategoryValue->getAllCategoryValues());
        /**
         * Load category
         */
        $objCategory = new Models_Category();
        $category = $objCategory->find($id)->toArray();
        $category = current($category);
        /**
         * Set values for tempalte
         */
        $this->setPagination($numRowPerPage, $currentPage, $count);
        $this->view->allCategoryValues = $allCategoryValues;
        $this->view->categoryValueMessage = $this->session->categoryValueMessage;
        $this->session->categoryValueMessage = null;
        $this->view->condition = $condition;
        $this->view->displayNum = $numRowPerPage;
        $this->view->category = $category;
        
    }

    public function deleteCategoryAction()
    {
        /**
         * Check permission
         */
        if (false == $this->checkPermission('delete_category')) {
            $this->_forwardToNoPermissionPage();
            return;
        }
        
        $id = $this->_getParam('id', false);
        
        if (false == $id) {
            $this->_redirect('category/admin/category-manager');
        }
        
        $ids = explode('_', trim($id, '_'));
        
        $objCategory = new Models_Category();
        try {
            foreach ($ids as $id) {
               $objCategory->delete( array('category_id=?' => $id));
            }
            $this->session->categoryMessage = array(
                                               'success' => true,
                                               'message' => Vi_Language::translate('Delete category successfully')
                                           );
        } catch (Exception $e) {
            $this->session->categoryMessage = array(
                                               'success' => false,
                                               'message' => Vi_Language::translate('Can NOT delete this category. Please try again')
                                           );
        }
        $this->_redirect('category/admin/category-manager#listofcategory');
    }
    
    public function newUserAction()
    {
        /**
         * Check permission
         */
        if (false == $this->checkPermission('new_user')) {
            $this->_forwardToNoPermissionPage();
            return;
        }
        
        $data = $this->_getParam('data', false);
        $errors = array();
        if (false !== $data) {
        
            /**
             * Insert new user
             */
            $objUser = new Models_User();
            $objUserExp = new Models_UserExpand();
            $newUser = array(
                            'group_id'        => $data['group_id'],
                            'username'        => $data['username'],
                            'email'           => $data['email'],
                            'full_name'       => $data['full_name'],
                            'password'        => $data['password'],
                            'repeat_password' => $data['repeat_password'],
                            'created_date'    => time(),
                            'enabled'         => $data['enabled']
                        );
            $errors = $objUser->validate($newUser);
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
                                        'admin_note' => $data['admin_note']
                                    );
                    $objUserExp->insert($newUserExp);
                    $this->_redirect('user/admin/user-manager');
                } catch (Exception $e) {
                    $errors = array('main' => Vi_Language::translate('Can not insert into database now'));
                }
            }
        }
        /**
         * Prepare for template
         */
        $this->view->errors = $errors;
        $this->view->data = $data;
        $this->view->headTitle(Vi_Language::translate('New user'));
        $this->view->menu = array('usergroup', 'newuser');
        /**
        * Get all groups
        */
        $objGroup = new Models_Group();
        $this->view->allGroups = $objGroup->getAll(array('sorting ASC', 'group_id ASC'))->toArray();
//        /**
//        * Get all countries
//        */
//        $objCountry = new Models_Country();
//        $this->view->allCountries = $objCountry->getAll(array('sorting ASC', 'country_id ASC'))->toArray();
    }

    
}