<?php
/**
 * LICENSE
 * 
 * [license information]
 * 
 * @category   Vi
 * @package    Vi
 * @copyright  Copyright (c) 2009 visualidea.org
 * @license    http://license.visualidea.org
 * @version    v 1.0 2009-04-15
 * 
 */
//try {

    date_default_timezone_set('Asia/Krasnoyarsk');
    set_include_path('.' . 
    				 PATH_SEPARATOR . 'libs' . 
    				 PATH_SEPARATOR . get_include_path());			 
    require_once 'Vi/Constant.php';				 
    require_once 'Zend/Loader.php'; 
    require_once 'Vi/Registry.php';
    require_once 'Vi/Db.php';
    require_once 'Vi/Layout.php';
    require_once 'Vi/Initializer.php';
    
    // Set up autoload.
    //Zend_Loader::registerAutoload(); 
    /**  
     * TODO TEST LINUX FILE
     */
    umask(0);
    //ini_set('magic_quotes_gpc', 'Off');
    // Change 'currentMode' in config.php to Vi_Constant::PRODUCT_MODE under production environment
    $initializer = new Vi_Initializer();    
    $initializer->run();
    
    // Prepare the front controller. 
    $frontController = Vi_Controller_Front::getInstance();
    
    // Dispatch the request using the front controller. 
    $frontController->dispatch();
    
//} catch (Exception $e) {
//    /**
//     * TODO Redirect to error page
//     */
//    include_once 'error.php';
//}