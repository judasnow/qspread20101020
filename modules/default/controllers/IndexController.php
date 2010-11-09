<?php

include_once 'Shared/Models/Category.php';
class default_IndexController extends Vi_Controller_Action
{
	public function indexAction()
	{
		/**
		 * Display tempalte
		 */
	    $this->view->headTitle('Find a restaurant');
	    /**
	     * Get data
	     */
	    include_once 'libs/Shared/Models/User.php';
	    $objUser = new Models_User();
	    $objCat  = new Models_Category();
	    
	    $cuisines = $objCat->getAllValues('cuisine');
//	    $cuisines = $objUser->getAll()->toArray();
//	    $cuisines = $objUser->getByColumnName(array(
//	    	"username LIKE ?" => '%admin%',
//	    	'group_id=?' => 1
//	    ))->toArray();
//	    echo "<pre>";print_r($cuisines);die;
	    
	    $arr_time = array();
	    $arr_time[] = "5:30 AM";
	    $arr_time[] = "5:45 AM";
	    for( $i=6; $i<12; $i++){
	    	for( $j=1;$j<5;$j++ ){
				if ( $j==1 )
					$format = '00';
				else if ( $j==2 )
					$format = '15';
				else if ( $j==3 )
					$format = '30';
				else if ( $j==4 )
					$format = '45';
				$arr_time[] = $i.":".$format." AM";
			}				    	
	    }
	    
		for( $i=1; $i<12; $i++){
	    	for( $j=1;$j<5;$j++ ){
				if ( $j==1 )
					$format = '00';
				else if ( $j==2 )
					$format = '15';
				else if ( $j==3 )
					$format = '30';
				else if ( $j==4 )
					$format = '45';
				$arr_time[] = $i.":".$format." PM";
			}				    	
	    }
	    
	    /**
	     * Begin get date and month
	     */	    
		$date_month[] = date("M jS - D");
		for( $i=1; $i<14; $i++ ){			
			$date_month[] = date("M jS - D", time() + ($i * 24 * 60 * 60));
		}
		$this->view->date_month = $date_month;
	    
	    /**
	     * Set variables for template
	     */
	    $this->view->cuisines = $cuisines;
	    $this->view->arr_time = $arr_time;
	    
	    
	}
}