<?php
class test_IndexController extends Vi_Controller_Action
{
	public function indexAction()
	{
		/**
		 * Display tempalte
		 */
	    $this->view->headTitle('Test module');

	    $str = 'restaurant/This is title///111----221412';
	    
	    echo $this->makeURLSafeString($str);die;
	}
}