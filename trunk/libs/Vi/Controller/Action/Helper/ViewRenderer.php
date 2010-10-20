<?php
/**
 * LICENSE
 * 
 * [license information]
 * 
 * @category   Vi
 * @package    Vi_Controller
 * @copyright  Copyright (c) 2009 visualidea.org
 * @license    http://license.visualidea.org
 * @version    v 1.0 2009-04-15
 */
require_once 'Zend/Controller/Action/Helper/ViewRenderer.php';

class Vi_Controller_Action_Helper_ViewRenderer extends Zend_Controller_Action_Helper_ViewRenderer
{

    /**
     * postDispatch - auto render a view
     *
     * Override Zend_Controller_Action_Helper_ViewRenderer::postDispatch()
     * @return void
     */
    public function postDispatch()
    {
        /**
         * Get module name, controller name, action name
         */
        $request = $this->getRequest();
        $module  = $request->getModuleName();
        if (null === $module) {
            $module = $this->getFrontController()->getDispatcher()->getDefaultModule();
        }
        $controller = $request->getControllerName();
        if (null === $controller) {
            $controller = $this->getFrontController()->getDispatcher()->getDefaultControllerName();
        }
        $action  = $request->getActionName();
        if (null == $action) {
            $action = $this->getFrontController()->getDispatcher()->getDefaultAction();
        }
        /**
         * Set cacheId for Smarty's caching
         */
        $langCode = Vi_Registry::get('langCode');
        $this->view->cacheId = Vi_Registry::getAppName() . '|' . $langCode . '|module|'
                             . $module . '_' . $controller . '_' . $action
                             . (($this->view->cacheId)?('_' . $this->view->cacheId):'');
        /**
         * Call parent's postDispatch() function
         */
        $result = parent::postDispatch();
        /**
         * Revive Vi_Language::$currentType and Vi_Language::$currentName
         */
        Vi_Language::$currentType = Vi_Registry::get('controllerCurrentType');
        Vi_Language::$currentName = Vi_Registry::get('controllerCurrentName');
        
        return $result;
    }
}