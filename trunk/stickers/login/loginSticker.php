<?php
class loginSticker extends Vi_Sticker
{
	public function run()
	{
	    $langCode = Vi_Registry::get('langCode');
	    
	    $this->view->loginError = $this->session->loginError;
	    $this->session->loginError = false;
	}
}