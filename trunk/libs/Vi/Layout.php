<?php
/**
 * LICENSE
 * 
 * [license information]
 * 
 * @category   Vi
 * @copyright  Copyright (c) 2009 visualidea.org
 * @license    http://license.visualidea.org
 * @version    v 1.0 2009-04-15
 * 
 */
require_once 'Zend/Layout.php';
class Vi_Layout extends Zend_Layout
{
    /**
     * Modify parent constructor
     * 
     */
     public function __construct($options = null, $initMvc = false) 
     {
         Vi_Language::$currentType = Vi_Language::TYPE_LAYOUT;
//         Vi_Language::$currentName = &$this->_layout;
         return parent::__construct($options, $initMvc);
     }
    /**
     * Assign value for view
     * 
     * @param string $spec     Variable which is used in view
     * @param string $value    Value of variable
     * 
     * @return Vi_Layout
     */
    public function assign($spec, $value = null)
    {
        $this->_view->assign($spec, $value);
        parent::assign($spec, $value);		
		return $this;
    }
    /**
     * Init layout and create a layout 's ins
     */
    public static function startMvc($options = null)
    {
        if (null === self::$_mvcInstance) {
            self::$_mvcInstance = new self($options, true);
        } elseif (is_string($options)) {
            self::$_mvcInstance->setLayoutPath($options);
        } else {
            self::$_mvcInstance->setOptions($options);
        }

        return self::$_mvcInstance;
    }
}