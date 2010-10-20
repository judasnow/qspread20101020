<?php
/**
 * LICENSE
 * 
 * [license information]
 * 
 * @category   Vi
 * @package    Vi_View
 * @copyright  Copyright (c) 2009 visualidea.org
 * @license    http://license.visualidea.org
 * @version    v 1.0 2009-04-15
 * 
 */
require_once 'Vi/View/Register/Abstract.php';
class Vi_View_Register_Translation extends Vi_View_Register_Abstract 
{
    /**
     * Override Vi_View_Register_Abstract::register
     * This function will be called automatically when Vi_View_RegisterBroker registers it
     */
    public function register()
    {
        $this->registerBlock('l', array('Vi_View_Register_Translation', 'translate'));
    }
    
    /**
     * Override Vi_View_Register_Abstract::unregister
     * This function will be called automatically when Vi_View_RegisterBroker unregisters it
     */
    public function unregister()
    {
        $this->unregisterBlock('l');
    }
    
    /**
     * Translatation function
     * 
     * @example {{l langCode='en'}}These words will be translated...{{/l}}
     */
    public static function translate($params, $content, &$smarty, &$repeat)
    {
//        echo "<pre>";print_r($params);//die;

        /**
         * Skip the first, will translate in second running
         */
        if (null == $content) {
            return '';
        }
        $langCode = null;
        if (array_key_exists('langCode', $params)) {
            $langCode = $params['langCode'];
        }
        return Vi_Language::translate($content, $params, $langCode); 
    }
}