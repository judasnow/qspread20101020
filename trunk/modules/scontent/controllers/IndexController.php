<?php

require_once 'Shared/Models/Scontent.php';
require_once 'Shared/Models/ScontentLang.php';
require_once 'Shared/Models/ScontentCategory.php';

class scontent_IndexController extends Vi_Controller_Action
{
    public $url = '';
    public $content = array();
    public $langId = 1;
    
	public function indexAction()
	{
		/**
		 * Display article or category
		 */
	    $objContent     = new Models_Scontent();
	    $objContentLang = new Models_ScontentLang();
	    $objCategory    = new Models_ScontentCategory();
	    /**
	     * Get param
	     */
	    $this->url = $this->_getParam('url', '');
	    $this->url =  trim ($this->url, '/');
	    $this->url = substr($this->url, 0, -5);//Remove .html
//	    echo $this->url;die;
	    if ('' == $this->url) {
	        $this->_redirect('');
	    }
	    /**
	     * Load content
	     */
	    $this->content = $objContent->getContentByUrl($this->url, $this->langId);
//	    echo '<pre>';print_r($this->content);die;
	    /**
	     * Not found?
	     */
	    if (null == @$this->content['scontent_lang_id']) {
	        $this->_redirectToNotFoundPage();
	    }
	    /**
	     * Set params
	     */
	    $this->view->headTitle($this->content['title']);
	    $this->view->menuId = $this->content['scontent_id'];
	    if (null != @$this->content['layout']) {
            $this->setLayout($this->content['layout']);
	    }
	    /**
	     * Prepare for view
	     */
	    $this->view->content = $this->content;
	    $this->view->layout = @$this->content['layout'];
	}
	
	private function _redirectToNotFoundPage()
	{
	    
	}
}