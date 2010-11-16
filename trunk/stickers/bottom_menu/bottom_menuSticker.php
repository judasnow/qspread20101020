<?php
class bottom_menuSticker extends Vi_Sticker
{
	public function run()
	{
	    $langCode = Vi_Registry::get('langCode');
	    
        $menus1 = array(
            0 => array(
                    'url' => Vi_Registry::getContentUrl(6),
                    'name' => 'About Us',
                    'id' => 6
                    ),
            1 => array(
                    'url' => Vi_Registry::getContentUrl(1),
                    'name' => 'How it Works',
                    'id' => 1
                    ),
            2 => array(
                    'url' => Vi_Registry::getBaseUrl(),
                    'name' => 'Browse Restaurants',
                    'id' => 'home'
                    ),
            3 => array(
                    'url' => Vi_Registry::getContentUrl(9),
                    'name' => 'Newsroom',
                    'id' => 9
                    ),
        );
        
        $menus2 = array(
            0 => array(
                    'url' => Vi_Registry::getContentUrl(3),
                    'name' => 'Share the Bounty',
                    'id' => 3
                    ),
            1 => array(
                    'url' => Vi_Registry::getContentUrl(13),
                    'name' => 'Fundraising',
                    'id' => 13
                    ),
            2 => array(
                    'url' => Vi_Registry::getContentUrl(5),
                    'name' => 'Refer a Friend',
                    'id' => 5
                    ),
            3 => array(
                    'url' => Vi_Registry::getContentUrl(4),
                    'name' => 'Refer a Restaurant',
                    'id' => 4
                    ),
        );
        
        $menus3 = array(
            0 => array(
                    'url' => Vi_Registry::getContentUrl(2),
                    'name' => 'Corporate Accounts',
                    'id' => 2
                    ),
            1 => array(
                    'url' => Vi_Registry::getBaseUrl(),
                    'name' => 'Restaurant Owners',
                    'id' => 'restaurant_owners'
                    ),
            2 => array(
                    'url' => Vi_Registry::getBaseUrl(),
                    'name' => 'Business Partners',
                    'id' => 'business_partners'
                    ),
        );
        
        $menus4 = array(
            0 => array(
                    'url' => Vi_Registry::getContentUrl(10),
                    'name' => 'Term of Use',
                    'id' => 10
                    ),
            1 => array(
                    'url' => Vi_Registry::getContentUrl(14),
                    'name' => 'Privacy Policy',
                    'id' => 14
                    ),
            2 => array(
                    'url' => Vi_Registry::getContentUrl(16),
                    'name' => 'Copyright',
                    'id' => 16
                    ),
        );
        
        $menus5 = array(
            0 => array(
                    'url' => Vi_Registry::getContentUrl(15),
                    'name' => 'FAQs',
                    'id' => 15
                    ),
            1 => array(
                    'url' => Vi_Registry::getBaseUrl() . 'contact-us.html',
                    'name' => 'Contact Us',
                    'id' => 'contactus'
                    ),
        );
        
        $this->view->menus1 = $menus1;
        $this->view->menus2 = $menus2;
        $this->view->menus3 = $menus3;
        $this->view->menus4 = $menus4;
        $this->view->menus5 = $menus5;
	}
}