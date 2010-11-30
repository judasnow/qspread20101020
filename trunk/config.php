<?php
return array (
  'database' => array(
            'adapter' => 'Pdo_Mysql',
            'params'  => array (
                        'host' => 'localhost',
                        'username' => 'root',
                        'password' => '',
                        'dbname' => 'quickspread',
                        'prefix' => 'vi_',
                        'profiler' => false //if false, system is quick
                      )
        ),
  'viewConfig'  => array(
					'compile_check' => true,
					'debugging' => false,
					'template_dir' => 'modules/',
					'compile_dir' => 'tmp/compile/',
					'cache_dir' => 'tmp/cache/',
					'plugins_dir' => 'libs/Smarty/plugins/',
					'cache_modified_check' => true,
					'caching' => false,
					'cache_lifetime' => 50//120					
			),
  'layoutConfig' => array(
			        
			),		
  'adminMail' => array(
          			'auth' => 'login',
                    'username' => 'emailtest.mwc@gmail.com',
                    'password' => 'mwc123456',
                    'ssl' => 'ssl',
                    'port' => 465,
                    'mailServer' => 'smtp.gmail.com'
            ),
  'fromMail' => 'info@quickspread.com',
            
  'requiredModule' => array(
            'default' => 'default',
            'user'    => 'user',
            'access'    => 'access',
            'error' => 'error',
			'restaurant' => 'restaurant',
			'category' => 'category',
            'scontent' => 'scontent',
            'contact' => 'contact'
        ),
        
  'log' => array(
            'active' => false
        ),
        
  'defaultLangCode' => 'en',
        
  'defaultApp' => 'front',
        
  'layoutCollection' => 'default',
        
  'defaultLayout' => 'default',
        
  'defaultModule' => 'default',
        
  'defaultController' => 'index',
        
  'defaultAction' => 'index',
        
  'currentMode' => Vi_Constant::DEVELOP_MODE,
        
  'forwardToDefaultAppWhenNotFoundAppName' => true, //or NULL when change to NOT FOUND page.
                                                    //If true, default application name can be missed

  'defaultNumberRowPerPage' => 10,
   
  'usingOneLanguage' => true,
        
  'dateFormat' => 'd-M-Y',
        
  'useAdminFullControlSystem' => true,
  
  'forgotPasswordExpiredTime' => 86400,
        
  'websiteName' => 'QuickSpread',
  'taxFee' => '0.1',
  'liveSite' => 'http://hoaitan.com/quickspread/'
);
