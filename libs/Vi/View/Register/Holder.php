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
class Vi_View_Register_Holder extends Vi_View_Register_Abstract {
	/**
	 * Override Vi_View_Register_Abstract::register
	 * This function will be called automatically when Vi_View_RegisterBroker registers it
	 */
	public function register() {
		//        $this->registerBlock('l', array('Vi_View_Register_Translation', 'translate'));
		$this->registerFunction ( 'holder', array ('Vi_View_Register_Holder', 'executeHolder' ) );
	}
	
	/**
	 * Override Vi_View_Register_Abstract::unregister
	 * This function will be called automatically when Vi_View_RegisterBroker unregisters it
	 */
	public function unregister() {
		$this->unregisterFunction ( 'holder' );
	}
	
	/**
	 * Translatation function
	 * 
	 * @example {{holder name='header' param="option"}}
	 * 
	 */
	public static function executeHolder($params, &$smarty) {
		if (! isset ( $params ['name'] )) {
			throw new Exception ( Vi_Language::translate ( "Holder must has param <b>name</b>" ) );
		}
		$data = "No data from Holder <b>" . $params ['name'] . "</b>";		
		$holder = new Vi_Holder($params);			
		$dataHolder = $holder->getData ();
		if (!($dataHolder == "")){
			$data = $dataHolder;
		}
		return $data;
	}
}