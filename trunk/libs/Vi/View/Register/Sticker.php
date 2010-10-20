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
class Vi_View_Register_Sticker extends Vi_View_Register_Abstract {
	/**
	 * Override Vi_View_Register_Abstract::register
	 * This function will be called automatically when Vi_View_RegisterBroker registers it
	 */
	public function register() {
		//        $this->registerBlock('l', array('Vi_View_Register_Translation', 'translate'));
		$this->registerFunction ( 'sticker', array ('Vi_View_Register_Sticker', 'executeSticker' ) );
	}
	
	/**
	 * Override Vi_View_Register_Abstract::unregister
	 * This function will be called automatically when Vi_View_RegisterBroker unregisters it
	 */
	public function unregister() {
		$this->unregisterFunction ( 'sticker' );
	}
	
	/**
	 * Translatation function
	 * 
	 * @example {{sticker name='header' param="option"}}
	 * 
	 */
	public static function executeSticker($params, &$smarty) {
		if (! isset ( $params ['name'] )) {
			throw new Exception ( Vi_Language::translate ( "Sticker must has param <b>name</b>" ) );
		}
		$data = "No data from sticker <b>" . $params ['name'] . "</b>";
		$className = $params ['name'] . "Sticker";
		$fileName = $className . ".php";
		$filePath = "stickers/" . $params ['name'] . "/" . $fileName;
		
		if (is_file ( $filePath )) {
			require_once $filePath;
		} else {
			throw new Exception ( "Sticker <b>" . $params ['name'] . "</b> " . Vi_Language::translate ( 'not found' ) );
		}
		if (! class_exists ( $className )) {
			throw new Exception ( "Class <b>" . $className . "</b>" . Vi_Language::translate ( 'not found' ) );
		}
		$sticker = new $className ( $params );
		if ($sticker->isAutoRender ()) {
			$sticker->render ();
		}
		$stickerData = $sticker->getData ();
		if (!($stickerData == "")){
			$data = $stickerData;
		}
		 return $data;
	}
}