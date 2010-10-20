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

/*
 * Display a area in layout and in holder
 * {{sticker name="header" params=""}}
 */
abstract class Vi_Sticker
{	
	private $_name = "";	
	private $_autoRender = true;
	private $_templateDir = "stickers/";
	private $_data = "";
	private $_compileDir = "";
	private $_cacheDir = "";
	private $_langCode = "en";
	private $_params = array ();
	private $_tmpData = array();
	private $_saveInfo = array();
    protected $db = null;
    protected $view = null;
    protected $session = null;
    protected $acl = null;
    protected $aclAdmin = null;
    protected $aclFront = null;
    protected $auth = null;
    private $_title = "";
    private $_holderId = "";
    private $_sampleMode = false;
	/*
     * Constructor set some some data for sticker
     */
	public function __construct($params) {		
	    if (Vi_Registry::isRegistered('EDIT_LAYOUT_MODE')) {
	        $this->_sampleMode = Vi_Registry::get('EDIT_LAYOUT_MODE');
	    }
	    	    
		$this->_name   = $params['name'];
		if (isset($params['title'])) {
		    $this->_title = $params['title'];
		    $this->_holderId = $params['holder_id'];
		}
		$this->_params = $params;
		$view          = Vi_Layout::getMvcInstance()->getView();
		$this->view    = clone($view);
        $this->db      = Vi_Registry::get('db');
        $this->session = Vi_Registry::getSession();
        $this->auth    = Vi_Registry::getAuth();
        $this->aclFront = Vi_Registry::getAclFront();
        $this->aclAdmin = Vi_Registry::getAclAdmin();        
        
		$this->view->setEngine(clone($view->getEngine()));
				
		$this->_langCode = Vi_Language::getCurrentLangCode();
		$config          = Vi_Registry::getConfig();
		
		$this->_compileDir = $config['viewConfig']['compile_dir'];
		$this->_cacheDir   = $config['viewConfig']['cache_dir'];
		/*
		 * set up dir for smarty
		 * 'template_dir' => 'stickers/$stickerName',
			'compile_dir' => 'tmp/compile/stickers/$stickerName/$langCode',
			'cache_dir' => 'tmp/cache/stickers/$stickerName/$langCode',
		 */
        $this->view->setScriptPath('./');
		$this->view->setCompilePath($config['viewConfig']['compile_dir']);
		$this->view->setCachePath($config['viewConfig']['cache_dir']);
		/*
		 * call main funtion
		 */
		$this->_saveInfo['currentType'] = Vi_Language::$currentType;
		$this->_saveInfo['currentName'] = Vi_Language::$currentName; 
		Vi_Language::$currentType = Vi_Language::TYPE_STICKER;
		Vi_Language::$currentName = $this->_name;
		
		$this->view->STICKER_URL = Vi_Registry::getBaseUrl() . "stickers/{$this->_name}/";
		$this->view->HELPER_URL  = $this->view->STICKER_URL . 'helpers/';
		$this->init ();
		$this->run ();		
	}
	
	public function checkPermission($username, $module)
	{
	    if (null == $this->acl && (false == Vi_Registry::getAcl())) {
	        /**
	         * Load permission
	         */
            require_once 'Vi/Acl.php';
            
            if ($this->auth->hasIdentity()) {
                $username       = $this->auth->getUsername();           
                $this->acl      = new Vi_Acl($username);
                Vi_Registry::set('acl', $this->acl);
            } else {
                return false;
            }
	    } 
	    
	    return $this->acl->checkPermission($username, $module);
	}
	/*
	 * Set and get for auto render or no
	 */
	public function setAutoRender($val)
	{
		$this->_autoRender = $val;
	}
	/* get information about autorender
	 * @return boolean
	 */
	public function isAutoRender()
	{
		return $this->_autoRender;
	}
	/*
	 * User custom init for overide by user
	 */
	public function init() {
	}
	/*
     * Content function for sticker, recommanded to overide 
     */
	public function run() {
	}
	/*
	 * Set params from template to sticker
	 */
	public function setParams($params)
	{
		$this->_params = $params;
	}
	/*
	 * return params from template
	 */
	public function getParams()
	{
		return $this->_params;
	}
	/*
	 * Assign data to template
	 */
	public function assign($key, $val) {
		return $this->view->assign($key, $val);
	}
	/*
	 * Add template to data 
	 */
	public function addTemplate($name)
	{
		$this->_data .= $this->view->render($name);
	}
	
	public function setSampleMode($mode = true)
	{
	    $this->_sampleMode = $mode;
	}
	
	/**
	 * Processes a template and returns the output.
	 *
	 * @param string $name The template to process.
	 * @return string.
	 */
	public function render($name = '') {	      
		
		if($name == '') {
			$name = $this->_templateDir . $this->_name . '/' . $this->_name . '.tpl';
    		if ($this->_sampleMode) {
    		    $name = $this->_templateDir . $this->_name . '/' . $this->_name . '-sample.tpl';
    		}
		}
		
		$this->_data .= $this->view->render ($name, Vi_Registry::getAppName() . '|'
		             .  $this->_langCode . '|sticker|' . $this->_name);		
	}
	/*
	 * get template data
	 */
	public function getData()
	{
		return $this->_data;
	}
	
	public function __destruct()
	{
		 Vi_Language::$currentType = $this->_saveInfo['currentType'];
		 Vi_Language::$currentName = $this->_saveInfo['currentName']; 	
	}
}