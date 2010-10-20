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
class Vi_View_RegisterBroker
{
    /**
     * Instance of Smarty
     * @var Smarty
     */
    protected $_smarty;
    
    /**
     * Constructor
     * 
     * Instantiate the smarty
     * 
     * @param Smarty $engine Default null
     * @return void
     */
    public function __construct(Smarty $engine = null)
    {
        if (null !== $engine) {
            $this->_smarty = $engine;
        }
    }
    
    /**
     * Set the engine of RegisterBroker.
     * 
     * @param Smarty $engine The instance of Smarty
     * @return void
     */
    public function setEngine(Smarty $engine)
    {
        $this->_smarty = $engine;
    }
    
    /**
     * Get the engine of RegisterBroker
     * 
     * @return Smarty
     */
    public function getEngine()
    {
        return $this->_smarty;
    }
    
    /**
     * Register new register
     * 
     * @param Vi_View_Register_Abstract $register
     * @return Vi_View_RegisterBroker
     * @throws Exception if register is not instance of Vi_View_Register_Abstract
     */
    public function register(Vi_View_Register_Abstract $register)
    {
        if ($register instanceof Vi_View_Register_Abstract) {
            $register->registerToEngine($this->_smarty);
        } else {
            throw new Exception('Register is not instance of Vi_View_Register_Abstract');
        }
        
        return $this;
    }    
    
    /**
     * Unregister the register
     * 
     * @param Vi_View_Register_Abstract $register
     * @return Vi_View_RegisterBroker
     * @throws Exception if register is not instance of Vi_View_Register_Abstract
     */
    public function unregister(Vi_View_Register_Abstract $register)
    {
        if ($register instanceof Vi_View_Register_Abstract) {
            $register->unregisterToEngine($this->_smarty);
        } else {
            throw new Exception('Register is not instance of Vi_View_Register_Abstract');
        }
        
        return $this;
    }
}