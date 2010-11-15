<?php
class bottom_menuSticker extends Vi_Sticker
{
	public function run()
	{
	    $langCode = Vi_Registry::get('langCode');
	    
        $menus1 = array(
            0 => array(
                    'url' => Vi_Registry::getBaseUrl(),
                    'name' => 'About Us',
                    'id' => 'home'
                    ),
            1 => array(
                    'url' => Vi_Registry::getContentUrl(1),
                    'name' => 'How it Works',
                    'id' => 1
                    ),
            2 => array(
                    'url' => Vi_Registry::getContentUrl(2),
                    'name' => 'Browse Restaurants',
                    'id' => 2
                    ),
            3 => array(
                    'url' => Vi_Registry::getContentUrl(3),
                    'name' => 'Blog',
                    'id' => 3
                    ),
            4 => array(
                    'url' => Vi_Registry::getContentUrl(4),
                    'name' => 'Newsroom',
                    'id' => 4
                    ),
        );
        
        $menus2 = array(
            0 => array(
                    'url' => Vi_Registry::getBaseUrl(),
                    'name' => 'Share the Bounty',
                    'id' => 'home'
                    ),
            1 => array(
                    'url' => Vi_Registry::getContentUrl(1),
                    'name' => 'Fundraising',
                    'id' => 1
                    ),
            2 => array(
                    'url' => Vi_Registry::getContentUrl(2),
                    'name' => 'Refer a Friend',
                    'id' => 2
                    ),
            3 => array(
                    'url' => Vi_Registry::getContentUrl(3),
                    'name' => 'Refer a Restaurant',
                    'id' => 3
                    ),
        );
        
        $menus3 = array(
            0 => array(
                    'url' => Vi_Registry::getBaseUrl(),
                    'name' => 'Corporate Accounts',
                    'id' => 'home'
                    ),
            1 => array(
                    'url' => Vi_Registry::getContentUrl(1),
                    'name' => 'Restaurant Owners',
                    'id' => 1
                    ),
            2 => array(
                    'url' => Vi_Registry::getContentUrl(2),
                    'name' => 'Business Partners',
                    'id' => 2
                    ),
        );
        
        $menus4 = array(
            0 => array(
                    'url' => Vi_Registry::getBaseUrl(),
                    'name' => 'Term of Use',
                    'id' => 'home'
                    ),
            1 => array(
                    'url' => Vi_Registry::getContentUrl(1),
                    'name' => 'Privace Policy',
                    'id' => 1
                    ),
            2 => array(
                    'url' => Vi_Registry::getContentUrl(2),
                    'name' => 'Sitemap',
                    'id' => 2
                    ),
            3 => array(
                    'url' => Vi_Registry::getContentUrl(3),
                    'name' => 'Copyright',
                    'id' => 3
                    ),
        );
        
        $menus5 = array(
            0 => array(
                    'url' => Vi_Registry::getBaseUrl(),
                    'name' => 'FAQs',
                    'id' => 'home'
                    ),
            1 => array(
                    'url' => Vi_Registry::getContentUrl(1),
                    'name' => 'Contact Us',
                    'id' => 1
                    ),
        );
        
        $this->view->menus1 = $menus1;
        $this->view->menus2 = $menus2;
        $this->view->menus3 = $menus3;
        $this->view->menus4 = $menus4;
        $this->view->menus5 = $menus5;
	}
}