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
require_once 'Zend/Controller/Plugin/Abstract.php';
class Vi_Plugin extends Zend_Controller_Plugin_Abstract
{	
    /**
     * Plugin's config. This cofig will autoload from 'config.php'
     * in this plugin directory by Vi_Plugin::__construct()
     * 
     * @var array
     */
    protected $_config = array();
	/*
     * Constructor
     */
	public function __construct($config = array())
	{		
	    $this->_config = $config;
	    
	    $this->init();
	}
	/**
	 * Init plugin
	 * 
	 * @return void
	 */
	public function init()
	{}
}