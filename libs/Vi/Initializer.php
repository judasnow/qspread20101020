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
 */
require_once 'Vi/Controller/Front.php';
require_once 'Vi/Controller/Action.php';
require_once 'Vi/Controller/Action/Admin.php';
require_once 'Vi/View.php';
require_once 'Vi/Sticker.php';
require_once 'Vi/Holder.php';
require_once 'Vi/Layout/Controller/Plugin/Layout.php';
require_once 'Vi/Layout/Controller/Action/Helper/Layout.php';
require_once 'Vi/Folder.php';
require_once 'Vi/View/Register/Translation.php';
require_once 'Vi/View/Register/Sticker.php';
require_once 'Vi/View/Register/Holder.php';
require_once 'Vi/View/Register/Permission.php';
require_once 'Vi/Controller/Action/Helper/ViewRenderer.php';
require_once 'Vi/Language.php';
require_once 'Zend/Controller/Router/Route/Regex.php';
require_once 'Zend/Cache/Backend/File.php';
require_once 'Zend/Locale.php';

/**
 * 
 * Initializes configuration depndeing on the type of environment 
 * (test, development, production)
 *  
 * This can be used to configure environment variables, databases, 
 * layouts, routers, helpers and more
 *   
 */
class Vi_Initializer
{
    /**
     * @var array
     */
    protected static $_config;
    /**
     * @var string Current environment
     */
    protected $_env;
    /**
     * @var Vi_Controller_Front
     */
    protected $_front;
    /**
     * @var string Path to application root
     */
    protected $_root;
    /**
     * Constructor
     *
     * Initialize environment, root path, and configuration.
     * 
     * @param  string $env 
     * @param  string|null $root 
     * @return void
     */
    public function __construct ($root = null)
    {
        if (null === $root) {
            $root = realpath(dirname(__FILE__) . '/../../') . '/';
        }
        $this->_root = $root;
        Vi_Registry::set('BASE_DIR', $root);
        $this->_front = Vi_Controller_Front::getInstance();
        
        $config = $this->loadConfig();
        $env = $config['currentMode'];
        $this->_setEnv($env);
        $this->initPhpConfig();
        // set the test environment parameters
        if ($env != Vi_Constant::PRODUCT_MODE) {
            // Enable all errors so we'll know when something goes wrong. 
            error_reporting(E_ALL | E_STRICT);
            ini_set('display_startup_errors', 1);
            ini_set('display_errors', 1);
            /**
             * Throw exceptions without error handler
             */
            $this->_front->throwExceptions(true);
        }
    }
    /**
     * Load general config and modified by current application config and set it to Vi_Registry
     * 
     * @return array 
     */
    private function loadConfig ()
    {
        /**
         * Get BASE_URL, APP_BASE_URL, APP_NAME
         */
        $appName = '';
        $baseUrl = dirname($_SERVER['SCRIPT_NAME']);
        /**
         * Fix error in Window if we use direct domain like domain.com
         * and point that domain to this source. It return "\" instead of "/"
         */
        if ('\\' == $baseUrl) {
            $baseUrl = '/'; 
        }
        /**
         * End fix
         */
        $uri = $_SERVER['REQUEST_URI'];
        $param = substr(rtrim($uri, '/'), strlen(rtrim($baseUrl, '/')) + 1);
        
        $arr = explode('/', $param);
        foreach ($arr as $item) {
            if ($item == '') {
                continue;
            }
            $appName = $item;
            break;
        }
//        echo '<pre>';print_r($arr);die;
//        echo $appName;die;
       
//        echo '<pre>';print_r($_SERVER);die;
        /**
         * Get config from general config 
         */
        if (is_file('config.php')) {
            $generalConfig = include_once 'config.php';
        } else {
            throw new Exception("Config.php is missing!");
        }
        
        /**
         * Load special configuration for Smarty
         */
        $generalConfig['viewConfig']['left_delimiter']  = Vi_Constant::SMARTY_LEFT_DELIMITER;
        $generalConfig['viewConfig']['right_delimiter'] = Vi_Constant::SMARTY_RIGHT_DELIMITER;
        
        /**
         * Get config from current application
         */
        if ($appName == '') {
            $appName = $generalConfig['defaultApp'];
        }
        
        /**
         *  Will throw new exception or using default application if application name is not correct.
         *  When using default application. All params (as module/controller/action/param1/value1...)
         *  will recaculate: the incorrect application name will be module name, the old module name will
         *  be action... This solution is useful for default application when users are brownsing without
         *  application name, example: http://yourdomain/controller/action
         */
        $withoutAppName = false;
        if (! is_dir($this->_root . 'applications/' . $appName)) {
            if ($generalConfig['forwardToDefaultAppWhenNotFoundAppName']) {
                /**
                 * Application name will be used to load appliaction's config
                 */
                $appName = $generalConfig['defaultApp'];
                $withoutAppName = true;
            } else {
                throw new Exception('Application name is not correct');
            }
        }
        $appConfigFile = 'applications/' . $appName . '/config.php';
        if (is_file($appConfigFile)) {
            $appConfig = include_once $appConfigFile;
        } else {
            $appConfig = array();
        }
        
        /**
         * Read config from general configuration and special application configuration.
         * The application configuration will have higher priority than general configuration,
         * and it can be skipped.
         */
        $config = array_merge($generalConfig, $appConfig);
        /**
         * In config file, compile and cache dir must have been started with 'tmp/'
         */
        $viewConfig = $config['viewConfig'];
//        if ('tmp/' !== substr($viewConfig['compile_dir'], 0, 4) || 'tmp/' !== substr($viewConfig['compile_dir'], 0, 4)) {
//            throw new Exception("In config file, compile and cache dir must have been started with 'tmp/'");
//        }
        $BASE_URL = $baseUrl;
        if($baseUrl != "/") {
            $BASE_URL .= "/";
        }
        Vi_Registry::set('APP_NAME', $appName);
        Vi_Registry::set('BASE_URL', $BASE_URL);
        
        /**
         * When using default application, the application name can be missed in URL
         */
        if (true == $withoutAppName) {
            Vi_Registry::set('APP_BASE_URL', $BASE_URL);
        } else {
            Vi_Registry::set('APP_BASE_URL', $BASE_URL . $appName . '/');
        }
        Vi_Registry::set('config', $config);
        Vi_Initializer::$_config = $config;
        
        
        /**
         * @TODO Read $langCode from COOKIE
         */
        if (null == ($langCode = $config['defaultLangCode'])) {
            throw new Exception('Missing default language code in config file');
        }
        Vi_Registry::set('langCode', $langCode);
        
        return $config;
    }
    /**
     * Initialize environment
     * 
     * @param  string $env 
     * @return void
     */
    protected function _setEnv ($env)
    {
        $this->_env = $env;
    }
    /**
     * Initialize Data bases
     * 
     * @return void
     */
    public function initPhpConfig ()
    {
        Zend_Locale::disableCache(true);
//        Zend_Cache_Backend_File::setCacheDir('tmp');        
    }
    /**
     * Initializer run
     * 
     * @return void
     */
    public function run()
    {
        $this->initDb();
        $this->initHelpers();
        $this->initView();
        $this->initPlugins();
        $this->initRoutes();
        $this->initControllers();
        $this->changeAliasToModuleName();
    }
    /**
     * Initialize data bases
     * 
     * @return void
     */
    public function initDb ()
    {
        $db = Vi_Db::factory(Vi_Initializer::$_config['database']['adapter'], Vi_Initializer::$_config['database']['params']);
        Vi_Registry::set('db', $db);
        include_once 'Zend/Db/Table/Abstract.php';
        Zend_Db_Table_Abstract::setDefaultAdapter($db);
    }
    /**
     * Initialize action helpers
     * 
     * @return void
     */
    public function initHelpers ()
    {}
    /**
     * Initialize view 
     * 
     * @return void
     */
    public function initView ()
    {        
        /**
         * Bootstrap views
         */
        $view = new Vi_View('modules/', Vi_Initializer::$_config['viewConfig']);
        /**
         * Register traslation register to translate language in template and layout
         */
        $view->helper->register(new Vi_View_Register_Translation());
        /**
         * Register sticker function to display sticker
         */
        $view->helper->register(new Vi_View_Register_Sticker());
        /**
         * Register holder function to display holder
         */
        $view->helper->register(new Vi_View_Register_Holder());
        /**
         * Register check permission function
         */
        $view->helper->register(new Vi_View_Register_Permission());
        /**
         * Register ViewRender helper
         */
//        $viewRenderer = Zend_Controller_Action_HelperBroker::getStaticHelper('ViewRenderer');
        $viewRenderer = new Vi_Controller_Action_Helper_ViewRenderer();
        $viewRenderer->setView($view)
                     ->setViewBasePathSpec($view->smarty->template_dir)
                     ->setViewScriptPathSpec(':module/views/:controller.:action.:suffix')
                     ->setViewScriptPathNoControllerSpec(':action.:suffix')
                     ->setViewSuffix(Vi_Constant::VIEW_SUFFIX);  
        Zend_Controller_Action_HelperBroker::addHelper($viewRenderer);                             
        /**
         * Bootstrap layouts 
         */          
        $layout = Vi_Layout::startMvc(array(
        						'layoutPath'  => $this->_root . 'layouts/' . Vi_Initializer::$_config['layoutCollection'] , 
        						'layout'      => Vi_Initializer::$_config['defaultLayout'],
                                'view'        => $view,                    
								'contentKey'  => Vi_Constant::VIEW_CONTENT_KEY,
                                'helperClass' => 'Vi_Layout_Controller_Action_Helper_Layout',
                                'pluginClass' => 'Vi_Layout_Controller_Plugin_Layout',
                                'viewSuffix'  => Vi_Constant::VIEW_SUFFIX
                            ));                                    
    }
    /**
     * Initialize plugins 
     * 
     * @return void
     */
    public function initPlugins ()
    {
        if (isset (self::$_config['plugins']) && is_array(self::$_config['plugins'])) {
            foreach (self::$_config['plugins'] as $pluginName => $pluginConfig) {
                if (is_string($pluginName)) {
                    require_once 'plugins/' . $pluginName . '/' . $pluginName . '.php';
                    $objPlugin = new $pluginName($pluginConfig);
                } else {
                    require_once 'plugins/' . $pluginConfig . '/' . $pluginConfig . '.php';
                    $objPlugin = new $pluginConfig();
                }
                $this->_front->registerPlugin($objPlugin);
            }
        }
    }
    /**
     * Initialize routes
     * 
     * @return void
     */
    public function initRoutes ()
    {
        /**
         * @TODO Auto load setup routes from module directorys
         */
        
        /**
         * Setup routes for content module.
         * Skip for admin application.
         */
        if (Vi_Registry::get('APP_NAME') == 'admin') {
            return;
        }
        $router = Vi_Controller_Front::getInstance()->getRouter();
        if (true == Vi_Initializer::$_config['usingOneLanguage']) {
            $route  = new Zend_Controller_Router_Route_Regex(
                                                     'page/(.*)',
                                                     array(
                                                        'module'     => 'scontent',
                                                        'controller' => 'index',
                                                        'action'     => 'index'
                                                     ),
                                                     array(1 =>'url')
                                                );
                                                
            $route2  = new Zend_Controller_Router_Route_Regex(
                                                     'contact-us.html',
                                                     array(
                                                        'module'     => 'contact',
                                                        'controller' => 'index',
                                                        'action'     => 'index'
                                                     ),
                                                     array()
                                                );
                                                
            $route3  = new Zend_Controller_Router_Route_Regex(
                                                     'register.html',
                                                     array(
                                                        'module'     => 'user',
                                                        'controller' => 'index',
                                                        'action'     => 'register'
                                                     ),
                                                     array()
                                                );
                                                
            $route4  = new Zend_Controller_Router_Route_Regex(
                                                     'restaurant-owner-register.html',
                                                     array(
                                                        'module'     => 'user',
                                                        'controller' => 'index',
                                                        'action'     => 'restaurant-register'
                                                     ),
                                                     array()
                                                );
            $route5  = new Zend_Controller_Router_Route_Regex(
                                                     'restaurant/([0-9]*)/(.*)',
                                                     array(
                                                        'module'     => 'restaurant',
                                                        'controller' => 'meal',
                                                        'action'     => 'index'
                                                     ),
                                                     array(1 =>'id', 2 => 'friendlyPart')
                                                );
            $route6  = new Zend_Controller_Router_Route_Regex(
                                                     'other-restaurant/([0-9]*)/(.*)',
                                                     array(
                                                        'module'     => 'restaurant',
                                                        'controller' => 'meal',
                                                        'action'     => 'other-restaurant'
                                                     ),
                                                     array(1 =>'id', 2 => 'friendlyPart')
                                                );
            $route7  = new Zend_Controller_Router_Route_Regex(
                                                     'cart/([0-9]*)/([0-9]*)',
                                                     array(
                                                        'module'     => 'restaurant',
                                                        'controller' => 'cart',
                                                        'action'     => 'index'
                                                     ),
                                                     array(1 =>'res_id', 2 =>'meal_id')
                                                );
           $route8  = new Zend_Controller_Router_Route_Regex(
                                                     'cancel_res/([0-9]*)/([0-9]*)',
                                                     array(
                                                        'module'     => 'restaurant',
                                                        'controller' => 'meal',
                                                        'action'     => 'index'
                                                     ),
                                                     array(1 =>'id', 2 =>'res_id_ses')
                                                );
           $route9  = new Zend_Controller_Router_Route_Regex(
                                                      'mark_restaurant/(.*)',
                                                     array(
                                                        'module'     => 'restaurant',
                                                        'controller' => 'index',
                                                        'action'     => 'index'
                                                     ),
                                                     array(1 =>'mark')
                                                );
           $route10  = new Zend_Controller_Router_Route_Regex(
                                                      'find_restaurant/(.*)',
                                                     array(
                                                        'module'     => 'restaurant',
                                                        'controller' => 'index',
                                                        'action'     => 'index'
                                                     ),
                                                     array(1 =>'find')
                                                );
        } else {
//            $route  = new Zend_Controller_Router_Route_Regex(
//                                                     'content/([\w_-]*)(.*)',
//                                                     array(
//                                                        'module'     => 'content',
//                                                        'controller' => 'index',
//                                                        'action'     => 'index'
//                                                     ),
//                                                     array(1=>'langCode', 2 =>'friendlyUrl')
//                                                );
        }
        $router->addRoute('content', $route);
        $router->addRoute('contact', $route2);
        $router->addRoute('register', $route3);
        $router->addRoute('restaurant-register', $route4);
        $router->addRoute('restaurant', $route5);
        $router->addRoute('other-restaurant', $route6);
        $router->addRoute('cart', $route7);
        $router->addRoute('cancel_res', $route8);
        $router->addRoute('mark_restaurant', $route9);
        $router->addRoute('find_restaurant', $route10);
    }
    /**
     * Initialize Controller paths 
     * 
     * @return void
     */
    public function initControllers ()
    {
        /**
         * Controller directory will be:
         * 
         *     'aliasName'  => 'moduleName'
         *     'moduleName' => 'moduleName'	
         * 
         * Alias-name will have higher priority than module-name	
         */
        $arrayModule    = Vi_Initializer::$_config['module'];
        $arrayModule    = array_merge(Vi_Initializer::$_config['requiredModule'], $arrayModule);
        $moduleAlisases = $arrayModule;
        foreach ($arrayModule as $key => $item) {
            $arrayModule[$key]  = 'modules/' . $item . '/controllers/';
            if (array_key_exists($item, $arrayModule)) {
                continue;
            }
            $arrayModule[$item]    = 'modules/' . $item . '/controllers/';
            $moduleAlisases[$item] = $item;
        }
//        echo Vi_Registry::get('APP_BASE_URL');die;
        Vi_Registry::set('moduleAliases', $moduleAlisases);
        $this->_front->setDefaultModule(Vi_Initializer::$_config['defaultModule']);
        $this->_front->setDefaultControllerName(Vi_Initializer::$_config['defaultController']);
        $this->_front->setDefaultAction(Vi_Initializer::$_config['defaultAction']);
        $this->_front->setControllerDirectory($arrayModule);
        $this->_front->setBaseUrl(Vi_Registry::get('APP_BASE_URL'));
        $this->_front->setParam('prefixDefaultModule', true);
        
    }
    
    /**
     * Change alias name to module name in URI
     * 
     * @return void
     * @throws Exception if module's alias point to empty module's name
     */
    public function changeAliasToModuleName ()
    {
        $appBaseUrl = Vi_Registry::get('APP_BASE_URL');
        $params = substr($_SERVER['REQUEST_URI'], strlen($appBaseUrl));
        $params = explode('/', trim($params, '/'));
        $alias = $params[0];
        if (null == $alias) {
            return null;
        } else {
            if (Vi_Registry::isRegistered('moduleAliases')) {
                $moduleAliases = @Vi_Registry::get('moduleAliases');
                if (! array_key_exists($alias, $moduleAliases)) {
                    return null;
                }
                $module = $moduleAliases[$alias];
                if (null == $module) {
                    throw new Exception("Module's alias ($alias) point to empty module's name");
                }
                $params[0] = $module;
                $params = implode('/', $params);
                $_SERVER['REDIRECT_URL'] = $appBaseUrl . $params;
                $_SERVER['REQUEST_URI']  = $appBaseUrl . $params;
            }
        }
//        /**
//         * Reset server params
//         */
//        echo '<pre>';print_r($_SERVER);
//        $params = implode('/', $params);
//        $_SERVER['REDIRECT_URL'] = $appBaseUrl . $params;
//        $_SERVER['REQUEST_URI']  = $appBaseUrl . $params;
//        echo '<pre>';print_r($_SERVER);die;
    }
}
