<?php
class main_menuSticker extends Vi_Sticker
{
	public function run()
	{
	    $langCode = Vi_Registry::get('langCode');
//	    if ($langCode) {
//		    $this->view->baseContentUrl = Vi_Registry::get('APP_BASE_URL') . "content/$langCode/";
//		    $this->view->baseProductUrl = Vi_Registry::get('APP_BASE_URL') . "mit/product/index/lang/$langCode/";
//	    } else {
//	        $this->view->baseContentUrl = Vi_Registry::get('APP_BASE_URL') . 'content/';
//	        $this->view->baseProductUrl = Vi_Registry::get('APP_BASE_URL') . 'mit/product/index/';
//	    }
        $menus = array(
            0 => array(
                    'url' => Vi_Registry::getBaseUrl(),
                    'name' => 'Find a restaurant',
                    'id' => 'home'
                    ),
            1 => array(
                    'url' => Vi_Registry::getContentUrl(1),
                    'name' => 'How it works',
                    'id' => 1
                    ),
            2 => array(
                    'url' => Vi_Registry::getContentUrl(2),
                    'name' => 'Coropporate Accounts',
                    'id' => 2
                    ),
            4 => array(
                    'url' => Vi_Registry::getContentUrl(4),
                    'name' => 'Refer a Restaurant',
                    'id' => 4
                    ),
            5 => array(
                    'url' => Vi_Registry::getContentUrl(5),
                    'name' => 'Refer a friend',
                    'id' => 5
                    ),
            6 => array(
                    'url' => Vi_Registry::getContentUrl(6),
                    'name' => 'About us',
                    'id' => 6
                    ),
            7 => array(
                    'url' => Vi_Registry::getBaseUrl() . 'contact-us.html',
                    'name' => 'Contact us',
                    'id' => 'contactus'
                    ),
        );
        $this->view->menus = $menus;
	}
}