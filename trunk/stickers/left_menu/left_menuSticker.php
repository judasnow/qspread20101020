<?php
class left_menuSticker extends Vi_Sticker
{
	public function run()
	{
	    $langCode = Vi_Registry::get('langCode');
        $menus = array(
            0 => array(
                    'url' => Vi_Registry::getContentUrl(6),
                    'name' => 'About us',
                    'id' => 6
                    ),
            1 => array(
                    'url' => Vi_Registry::getContentUrl(1),
                    'name' => 'How it works',
                    'id' => 1
                    ),
            2 => array(
                    'url' => Vi_Registry::getContentUrl(7),
                    'name' => 'Meet the team',
                    'id' => 7
                    ),
            3 => array(
                    'url' => Vi_Registry::getContentUrl(8),
                    'name' => 'Careers',
                    'id' => 8
                    ),
            4 => array(
                    'url' => Vi_Registry::getContentUrl(9),
                    'name' => 'News room',
                    'id' => 9
                    ),
        );
        $this->view->menus = $menus;
	}
}