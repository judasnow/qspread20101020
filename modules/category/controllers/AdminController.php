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
        $this->view->menu = array('others', 'categorymanager');
        
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

    public function deleteValueAction()
    {
        
        $id = $this->_getParam('id', false);
        $cid = $this->_getParam('cid', false);
        
        if (false == $id || false == $cid) {
            $this->_redirect('category/admin/category-manager');
        }
        
        $ids = explode('_', trim($id, '_'));
        
        $objCatValue = new Models_CategoryValue();
        try {
            foreach ($ids as $id) {
               $objCatValue->delete( array('category_value_id=?' => $id));
            }
            $this->session->categoryValueMessage = array(
                                               'success' => true,
                                               'message' => Vi_Language::translate('Delete value successfully')
                                           );
        } catch (Exception $e) {
            $this->session->categoryValueMessage = array(
                                               'success' => false,
                                               'message' => Vi_Language::translate('Can NOT delete this value. Please try again')
                                           );
        }
        $this->_redirect('category/admin/category-value-manager/id/' . $cid);
    }
    
    public function newValueAction()
    {
        
        $data = $this->_getParam('data', false);
        $cid = $this->_getParam('cid', false);
        
        if (false == $cid) {
            $this->_redirect('category/admin/category-manager');
        }
        
        if (false !== $data) {
        
            /**
             * Insert new user
             */
            $objCatValue = new Models_CategoryValue();
            $newValue = array(
                            'category_id'        => $cid,
                            'name'        => $data['name'],
                            'sorting'           => $data['sorting'],
                        );
            try {
                $objCatValue->insert($newValue);
                $this->session->categoryValueMessage = array(
                                               'success' => true,
                                               'message' => Vi_Language::translate('Add new value successfully')
                                           );
                $this->_redirect('category/admin/category-value-manager/id/' . $cid);
            } catch (Exception $e) {
                $errors = array('main' => Vi_Language::translate('Can not insert into database now'));
            }
        } else {
            $data['sorting'] = 1;
        }
        /**
         * Get current category
         */
        $objCat = new Models_Category();
        $category = $objCat->find($cid)->toArray();
        $category = current($category);
        /**
         * Prepare for template
         */
        $this->view->data = $data;
        $this->view->category = $category;
        $this->view->headTitle(Vi_Language::translate('New value'));
        $this->view->menu = array('others', 'categorymanager');
    }


    
    public function editValueAction()
    {
        
        $data = $this->_getParam('data', false);
        $cid = $this->_getParam('cid', false);
        $id = $this->_getParam('id', false);
        
        if (false == $cid || false == $id) {
            $this->_redirect('category/admin/category-manager');
        }
        
        if (false !== $data) {
        
            /**
             * Insert new user
             */
            $objCatValue = new Models_CategoryValue();
            $newValue = array(
                            'category_id'        => $cid,
                            'name'        => $data['name'],
                            'sorting'           => $data['sorting'],
                        );
            try {
                $objCatValue->update($newValue, array('category_value_id=?' => $id));
                $this->session->categoryValueMessage = array(
                                               'success' => true,
                                               'message' => Vi_Language::translate('Update new value successfully')
                                           );
                $this->_redirect('category/admin/category-value-manager/id/' . $cid);
            } catch (Exception $e) {
                $errors = array('main' => Vi_Language::translate('Can not insert into database now'));
            }
        } else {
            /**
             * Load value
             */
            $objCatValue = new Models_CategoryValue();
            
            $data = $objCatValue->find($id)->toArray();
            $data = current($data);
            
            if (false == $data) {
                $this->_redirect('category/admin/category-manager');
            }
        }
        /**
         * Get current category
         */
        $objCat = new Models_Category();
        $category = $objCat->find($cid)->toArray();
        $category = current($category);
        /**
         * Prepare for template
         */
        $this->view->data = $data;
        $this->view->category = $category;
        $this->view->headTitle(Vi_Language::translate('Edit value'));
        $this->view->menu = array('others', 'categorymanager');
    }
}