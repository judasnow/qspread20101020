<?php
include_once 'libs/Shared/Models/Meal.php';
include_once 'libs/Shared/Models/Restaurant.php';
include_once 'libs/Shared/Models/Reservation.php';
include_once 'libs/Shared/Models/Country.php';
include_once 'libs/Shared/Models/ScontentLang.php';
include_once 'libs/Shared/Models/User.php';
include_once 'libs/Shared/Models/Mail.php';
class restaurant_ReservationController extends Vi_Controller_Action
{
    public $reserCheckPeriod = 4;
	/**
	 * List all meal follow restaurant
	 */
	public function indexAction()
	{
		$order_id = session_id();
		
		$this->view->headTitle('Reservation');
		$objReser = new Models_Reservation();
		
		$resId = $this->_getParam('rid', false);
		if (false === $resId) {
		    $this->_redirect('');
		}
		
       /**
        * Get restaurant
        */
        $objRes = new Models_Restaurant();
        $res = $objRes->find($resId)->toArray();
        $res = current($res);
        if (false == $res || '0' == $res['reser_onoff']) {
            $this->_redirect('');
        }
        /**
         * Check active restaurant
         */
        $this->_checkReservationOfRestaurant($res);
//        echo '<pre>';print_r($res);die;
        /**
         * All time in a day
         */
        $defaultTimeZone = date_default_timezone_get();
        date_default_timezone_set('UTC');
        $allTimes = array();
        for ($i = 0; $i < 48; $i++) {
            $time = 1800 * $i;
            $allTimes[] = array(
                'time' => $time,
                'text' => date('g:i A', $time)
            );
        }
        date_default_timezone_set($defaultTimeZone);
//        echo date('g:i A', 0);die;
//        echo '<pre>';print_r($allTimes);die;
        
        /**
         * Get search condition
         */
        $search = $this->_getParam('search', array(
            'date' => date('m/d/Y'),
            'time' => (date('G') * 3600 + (ceil(date('i')/30)) * 1800),
            'quantity' => 2
        ));
        $search['quantity'] = intval($search['quantity']);
        
        
        $pointerDate = explode('/', $search['date']);
        $pointerDate = mktime(0, 0, 0, $pointerDate[0], $pointerDate[1], $pointerDate[2]) + $search['time'];
        $search['unixTime'] = $pointerDate;
        
        $this->session->reserSearch = $search;
//        echo '<pre>';print_r($search);die;

        /**
         * Get next 7 day often
         */
        $searchDateArr = array();
        $count = 0;
        $pointerDate = $search['unixTime'];
        $dateArr = array('date_mon', 'date_tue', 'date_wed', 'date_thu', 'date_fri', 'date_sat', 'date_sun');

        while (true) {
            $field = 'date_' . strtolower(date('D', $pointerDate));
            if ('1' == $res[$field]) {
                $searchDateArr[] = array(
                    'time' => $pointerDate,
                    'field' => $field,
                    'date' => date('D, m/d/Y g:i A', $pointerDate)
                );
                $count++;
            }
            if( 8 <= $count) {
                break;
            }
            $pointerDate += 3600 * 24;
        }
        /**
         * Get available hour for each date
         */
        foreach ($searchDateArr as &$date) {
            $date['startTime'] = $date['time'] - 1800 * 3;
            $date['endTime']   = $date['time'] + 1800 * 3;
            $maxTotal  = $res['reser_quantity'] - $search['quantity'];
            
            $date['exitResers'] = $objReser->searchExistRerservation($date['startTime'], $date['endTime'], $maxTotal);
            $date['available']  = array();
            
            for ($i = $date['startTime']; $i <= $date['endTime']; $i = $i + 1800) {
                $flag = true;
                foreach ($date['exitResers'] as $exist) {
                    if ($i == $exist['time']) {
                        $flag = false;
                        break;
                    }
                }
                
                $date['available'][$i] = $flag;
            }
        }
        unset($date);
        
//        echo '<pre>';print_r($searchDateArr);die;
//        $searchDateArr[1]['available']['1301472000'] = false;
//        $searchDateArr[1]['available']['1301477400'] = false;
//        $searchDateArr[1]['available']['1301482800'] = false;
        /**
         * Data for view
         */
        $this->view->res = $res;
        $this->view->arr_restaurant = $res;
        $this->view->resId = $resId;
        $this->view->allTimes = $allTimes;
        $this->view->search = $search;
        $this->view->searchDateArr = $searchDateArr;
        $this->view->currentTime = time();
        $this->view->address_restaurant = $res['street']." ".$res['city']." ".$res['state'];
	}
	
	public function finishAction()
	{
	    
        $order_id = session_id();
        
        $this->view->headTitle('Reservation');
        $objReser = new Models_Reservation();
        
        $resId = $this->_getParam('rid', false);
        if (false === $resId) {
            $this->_redirect('');
        }
        
       /**
        * Get restaurant
        */
        $objRes = new Models_Restaurant();
        $res = $objRes->find($resId)->toArray();
        $res = current($res);
        if (false == $res || '0' == $res['reser_onoff']) {
            $this->_redirect('');
        }
        /**
         * Check active restaurant
         */
        $this->_checkReservationOfRestaurant($res);
        
        /**
         * Get search condition
         */
        $t = $this->_getParam('t', false);
        $search = $this->session->reserSearch;
        if (null == $search || false == $t || 0 >= $search['quantity']) {
            $this->_redirect('restaurant/reservation/index/rid/' . $resId);
        }
        $t = base64_decode($t);
        /**
         * Update search
         */
        $search['date'] = date('m/d/Y', $t);
        $search['time'] = (date('G', $t) * 3600 + (ceil(date('i', $t)/30)) * 1800);
        $search['unixTime'] = $t;
        $this->session->reserSearch = $search;
//        echo '<pre>';print_r($search);die;
        
        /**
         * Check availabe at current time
         */
        $exitResers = $objReser->searchExistRerservation($t, $t, $res['reser_quantity'] - $search['quantity']);
        if (0 < count($exitResers)) {
            /**
             * Some users are faster :)
             */
            $this->_redirect('restaurant/reservation/index/rid/' . $resId);
        }
        
        /**
         * Submit?
         */
        $error = '';
        $data = $this->_getParam('data', false);
//        echo '<pre>';print_r($data);die;
        if (false != $data) {
//            echo '<pre>';print_r($data);die;
            /**
             * Insert reservation
             */
            $newData = array(
                'restaurant_id' => $resId,
                'time' => $search['unixTime'],
                'quantity' => $search['quantity'],
                'created_date' => time(),
                'deposit' => ('1' == $res['reser_deposit_onoff']) ? $res['reser_deposit']:0,
                'full_name' => $data['full_name'],
                'address' => $data['address'],
                'note' => $data['note'],
                'city' => $data['city'],
                'state' => $data['state'],
                'zip_code' => $data['zip_code'],
                'phone' => $data['phone1'].".".$data['phone2'].".".$data['phone3'],
                'email' => $data['email'],
                'special_request' => $data['special_request']
            );
            $newReserId = $objReser->insert($newData);
            
            if ('1' == $res['reser_deposit_onoff']) {
                /**************************************************************************
                 * Make payment
                 */
                require_once 'libs/paypal/CallerService.php';
                /**
                 * Fist name, last name
                 */
                $firstName = trim(substr($data['full_name'], 0, strpos($data['full_name'] . ' ', ' ') + 1));
                $lastName = trim (substr($data['full_name'], strlen($firstName)));
                /**
                 * Get required parameters from the web form for the request
                 */
                $paymentType =urlencode( 'Sale');
                $firstName =urlencode( $firstName);
                $lastName =urlencode($lastName);
                $creditCardType =urlencode( $data['card_type']);
                $creditCardNumber = urlencode($data['card_number']);
                $expDateMonth =urlencode( $data['card_month']);
                
                // Month must be padded with leading zero
                $padDateMonth = str_pad($expDateMonth, 2, '0', STR_PAD_LEFT);
                
                $expDateYear =urlencode( $data['card_year']);
                $cvv2Number = urlencode($data['card_cvv']);
                $address1 = urlencode($data['address']);
                $address2 = urlencode('');
                $city = urlencode($data['city']);
                $state =urlencode( $data['state']);
                $zip = urlencode($data['zip_code']);
                $amount = urlencode(number_format($res['reser_deposit'], 2, '.', ''));
    
                $currencyCode="CAD";
    //            $state = 'NL';
                $country = 'CA';
                
                /* Construct the request string that will be sent to PayPal.
                   The variable $nvpstr contains all the variables and is a
                   name value pair string with & as a delimiter */
                $nvpstr="&PAYMENTACTION=$paymentType&AMT=$amount&CREDITCARDTYPE=$creditCardType&ACCT=$creditCardNumber&EXPDATE=".         $padDateMonth.$expDateYear."&CVV2=$cvv2Number&FIRSTNAME=$firstName&LASTNAME=$lastName&STREET=$address1&CITY=$city&STATE=$state".
                "&ZIP=$zip&COUNTRYCODE=$country&CURRENCYCODE=$currencyCode";
    //            echo $nvpstr;die;
                
                
                /* Make the API call to PayPal, using API signature.
                   The API response is stored in an associative array called $resArray */
                $resArray=hash_call("doDirectPayment",$nvpstr);
    //            echo '<pre>';print_r($resArray);die;
                
                /* Display the API response back to the browser.
                   If the response from PayPal was a success, display the response parameters'
                   If the response was an error, display the errors received using APIError.php.
                   */
                $ack = strtoupper($resArray["ACK"]);
                
                /**
                 * End payment
                 **************************************************************************/
            }
            
            if('1' == $res['reser_deposit_onoff'] && $ack!="SUCCESS")  {
                $error = @$resArray['L_LONGMESSAGE0'];
                /**
                 * Delete reservation
                 */
                $objReser->delete(array('reservation_id=?' => $newReserId));
            } else {
                /**
                 * Success
                 */
                
                /**
                 * Send email to admin and user
                 */
                $objUser = new Models_User();
                $objMail = new Models_Mail();
                
                $config = Vi_Registry::getConfig();
                
                $cardNumber = @$data['card_number'];
                $cardNumber{4} = 'X';
                $cardNumber{5} = 'X';
                $cardNumber{6} = 'X';
                $cardNumber{7} = 'X';
                $cardNumber{8} = 'X';
                $cardNumber{9} = 'X';
                $cardNumber{10} = 'X';
                $cardNumber{11} = 'X';
                $data['card_number'] = $cardNumber;
    
                $cartDetail = "
                     <table width='90%'>
                            <tr>
                                <td width='55%'></td>
                                <td width='15%'></td>
                                <td width='15%'></td>
                                <td width='15%'></td>
                            </tr>
                            <tr>
                                <td style='color: #442006; font-weight: bold;'>SHIPPING ADDRESS</td>
                                <td colspan='3'  style='color: #442006; font-weight: bold;'>RESTAURANT</td>
                            </tr> 
                            <tr>
                               <td valign='top'>
                                   <br/>
                                   <table width='400px;'>
            
                                       <tr>
                                           <td width='30%' align='right' style='background-color: #EEEEEE;'>Full Name:</td>
                                           <td width='70%' style='color: #442006;'>{$data['full_name']}</td>
                                       </tr>
                                       <tr>
                                           <td align='right' style='background-color: #EEEEEE;'>Address:</td>
                                           <td style='color: #442006;'>{$data['address']}</td>
            
                                       </tr>
                                       <tr>
                                           <td align='right' style='background-color: #EEEEEE;'>Postal Code:</td>
                                           <td style='color: #442006;'>{$data['zip_code']}</td>
                                       </tr>
                                       <tr>
                                           <td align='right' style='background-color: #EEEEEE;'>Phone:</td>
            
                                           <td style='color: #442006;'>{$data['phone']}</td>
                                       </tr>
                                       <tr>
                                           <td align='right' style='background-color: #EEEEEE;'>Special Requests:</td>
            
                                           <td style='color: #442006;'>{$data['special_request']}</td>
                                       </tr>
                                   </table>
                                   <br/>
                                   
                               </td>
                               <td valign='top'>
                                   <br/>
                                   <table width='400px;'>
            
                                       <tr>
                                           <td width='30%' align='right' style='background-color: #EEEEEE;'>Name:</td>
                                           <td width='70%' style='color: #442006;'>{$res['name']}</td>
                                       </tr>
                                       <tr>
                                           <td align='right' style='background-color: #EEEEEE;'>Address:</td>
                                           <td style='color: #442006;'>{$res['street']}, {$res['city']}, {$res['state']}</td>
                                       </tr>
                                       <tr>
                                           <td width='30%' align='right' style='background-color: #EEEEEE;'>Phone:</td>
                                           <td width='70%' style='color: #442006;'>{$res['phone']}</td>
                                       </tr>"
                                        
                
                                        . (('1' == $res['reser_deposit_onoff']) ?"
                                       <tr>
                                           <td colspan='2' style='color: #442006; font-weight: bold;'><br/>PAYMENT METHOD</td>
                                       </tr>
                                       <tr>
                                           <td  align='right' colspan='2'>{$data['card_type']}: {$data['card_number']}</td>
                                       </tr>":"")
                                        
                                        
                                        
                                     . "
                                   </table>
                                   <br/>
                               </td>
            
                            </tr>
                         </table>   
                         
                         <table width='90%'>   
                            <tr style='background-color: #DDDDDD;'>
                                <td width='25%' style='color: #AD5B21; font-weight: bold;'> Date</td>
                                <td width='25%' style='color: #AD5B21; font-weight: bold;'> Time</td>
                                <td width='25%' style='color: #AD5B21; font-weight: bold;'> Party Size</td>
                                <td width='25%' style='color: #AD5B21; font-weight: bold;'> Deposit</td>
                            </tr>
                             <tr>
                                <td style='border-bottom: 1px solid #DDDDDD;'> " . date('m/d/Y', $t) . " </td>
                                <td style='border-bottom: 1px solid #DDDDDD;'>  " . date('g:i A', $t) . "</td>
                                <td style='border-bottom: 1px solid #DDDDDD;'> {$search['quantity']} " . ((1 == $search['quantity'])?'person':'people') . " </td>
                                <td style='border-bottom: 1px solid #DDDDDD;'>$ " . (('1' == $res['reser_deposit_onoff']) ? (number_format($res['reser_deposit'] *1.0, 2)) :0) ."</td>
                            </tr>
                            
                        </table>
                ";
                 
                $data['card_detail'] = $cartDetail;
    //            echo '<pre>';print_r($data);die;
    
                
                $admin = $objUser->getByUserName('admin');
                $objMail->sendHtmlMail('reservation_order', $data, array($admin['email'], $data['email'], $res['owner_email']));
                /**
                 * Redirec to success page
                 */
                $objContent = new Models_ScontentLang();
                $this->_redirect($objContent->getUrlWithoutAppBaseUrl(22));
                return;
                
            }
                        
            
        }
        
        /**
         * Data for view
         */
        $this->view->res = $res;
        $this->view->arr_restaurant = $res;
        $this->view->resId = $resId;
        $this->view->search = $search;
        $this->view->data = $data;
        $this->view->error = $error;
        $this->view->address_restaurant = $res['street']." ".$res['city']." ".$res['state'];
        
        /**
         * Expired year
         */
        $years = array();
        for ($i = date('Y'); $i <= date('Y') + 7; $i++) {
            $years[] = $i;
        }
        $this->view->years = $years;
        /**
         * All province
         */
        
        $obj_country = new Models_Country();
        $arr_province = $obj_country->getAllProvincesWithCode();
        
        $this->view->arr_province = $arr_province;
	} 
	
	private function _checkReservationOfRestaurant($res)
	{
	    if (
	       '0' == $res['date_mon']
	    && '0' == $res['date_tue']
        && '0' == $res['date_wed']
        && '0' == $res['date_thu']
        && '0' == $res['date_fri']
        && '0' == $res['date_sat']
        && '0' == $res['date_sun']
	    ) {
	        /**
	         * This restaurant closes all days
	         */
	        $this->_redirect('');
	    }
	}
	

    public function managerAction()
    {
        $resId      = Vi_Registry::getRestaurantIdFromLoggedUser();
        if (false == $resId) {
            $this->_redirect('access/index/login');
        }
        $objRes = new Models_Restaurant();
        $res = $objRes->find($resId)->toArray();
        $res = current($res);
        if (false == $res) {
            $this->_redirect('');
        }
        
        $this->view->headTitle(Vi_Language::translate('Reservation manager'));
        $this->view->menu = array('reservation');
        
        $config = Vi_Registry::getConfig();
        $numRowPerPage = Vi_Registry::getConfig("defaultNumberRowPerPage");
        $currentPage = $this->_getParam("page",1);
        $displayNum = $this->_getParam('displayNum', false);
        
        /**
         * Get number of reser per page
         */
        if (false === $displayNum) {
            $displayNum = $this->session->reserDisplayNum;
        } else {
            $this->session->reserDisplayNum = $displayNum;
        }
        if (null != $displayNum) {
            $numRowPerPage = $displayNum;
        }
        /**
         * Get condition
         */
        $condition = $this->_getParam('condition', false);
        if (false === $condition) {
            $condition = $this->session->reserCondition;
        } else {
            $this->session->reserCondition = $condition;
            $currentPage = 1;
        }
        if (false == $condition) {
            $condition = array();
        }
        $condition['restaurant_id'] = $resId;
        /**
         * Load all resers
         */
        $objReser = new Models_Reservation();
        $allResers = $objReser->getAllResers($condition, 'reservation_id DESC',
                                                   $numRowPerPage,
                                                   ($currentPage - 1) * $numRowPerPage
                                                  );
        /**
         * Count all resers
         */
        $count = count($objReser->getAllResers($condition));
        /**
         * Modify all resers
         */
        foreach ($allResers as &$reser) {
            if (null != $reser['created_date']) {
//                $reser['created_date'] = date($config['dateFormat'], $reser['created_date']);
            }
        }
        unset($reser);
//        echo '<pre>';print_r($allResers);die;
        /**
         * Set values for tempalte
         */
        $this->setPagination($numRowPerPage, $currentPage, $count);
        $this->view->allResers = $allResers;
        $this->view->reserMessage = $this->session->reserMessage;
        $this->session->reserMessage = null;
        $this->view->condition = $condition;
        $this->view->displayNum = $numRowPerPage;
    }
    

    public function deleteReservationAction()
    {
    
        $resId      = Vi_Registry::getRestaurantIdFromLoggedUser();
        if (false == $resId) {
            $this->_redirect('access/index/login');
        }
        $objRes = new Models_Restaurant();
        $res = $objRes->find($resId)->toArray();
        $res = current($res);
        if (false == $res) {
            $this->_redirect('');
        }
        
        
        $id = $this->_getParam('id', false);
        
        if (false == $id) {
            $this->_redirect('restaurant/admin/reservation');
        }
        
        $ids = explode('_', trim($id, '_'));
        
        $objReser = new Models_Reservation();
        try {
            foreach ($ids as $id) {
               $objReser->delete( array('reservation_id=?' => $id, 'restaurant_id=?' => $resId));
            }
            $this->session->reserMessage = array(
                                               'success' => true,
                                               'message' => 'Reservation is deleted successfully'
                                           );
        } catch (Exception $e) {
            $this->session->reserMessage = array(
                                               'success' => false,
                                               'message' => 'Can NOT delete this reservation. Please try again'
                                           );
        }
        $this->_redirect('restaurant/reservation/manager');
    }
    
} 

