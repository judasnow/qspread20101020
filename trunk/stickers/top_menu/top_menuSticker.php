<?php
class top_menuSticker extends Vi_Sticker
{
	public function run()
	{
	    $langCode = Vi_Registry::get('langCode');
	    
	    $loggedUser = Vi_Registry::getLoggedInUser();
	    $isLoggedIn = true;
	    if (false == $loggedUser) {
	        $isLoggedIn = false;
	    }
	    
	    $this->view->loggedUser = $loggedUser;
	    $this->view->isLoggedIn = $isLoggedIn;
	    
	    $this->view->fqaUrl = Vi_Registry::getContentUrl(15);
	}
}