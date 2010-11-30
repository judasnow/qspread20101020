<?php
include_once 'libs/Shared/Models/Meal.php';
include_once 'libs/Shared/Models/Order.php';
include_once 'libs/Shared/Models/OrderDetail.php';
include_once 'libs/Shared/Models/ScontentLang.php';
include_once 'libs/Shared/Models/User.php';
include_once 'libs/Shared/Models/Mail.php';
class restaurant_InfoController extends Vi_Controller_Action
{
	/**
	 * List all meal follow restaurant
	 */
	public function indexAction()
	{
		$this->view->headTitle('Cart information');
		
		if ( !isset($_SESSION['cart'][$order_id]) )
			header('Location: /quickspread/');
		$order_id = session_id(); 
		$this->view->session_cart 		= $_SESSION['cart'][$order_id];
		$this->view->subtotal 			= $_SESSION['cart'][$order_id]['subtotal'];
	 	$this->view->tax 				= $_SESSION['cart'][$order_id]['tax'];
	 	$this->view->shipping 			= $_SESSION['cart'][$order_id]['shipping'];
	 	$this->view->ordertotal 		= $_SESSION['cart'][$order_id]['ordertotal'];
	 	
	 	$data_info = $this->_getParam('data', false);
	 	$confirm   = $this->_getParam('confirm', false) ;
	 	/**
	 	 * Remember customer's infomation
	 	 */
	 	if (false !== $data_info) {
	 	   $_SESSION['cart_customer'] = $data_info;
	 	}
	 	$data_info = $_SESSION['cart_customer'];
	 	
	 	$this->view->full_name 	= $data_info['full_name'];
	 	$this->view->address 	= $data_info['address'];
	 	$this->view->zip_code	= $data_info['zip_code'];
	 	$this->view->phone		= $data_info['phone1'].".".$data_info['phone2'].".".$data_info['phone3'];
        
        $this->view->cardType = $_SESSION['cart_customer']['card_type'];
        $cardNumber = $_SESSION['cart_customer']['card_number'];
        $cardNumber{4} = 'X';
        $cardNumber{5} = 'X';
        $cardNumber{6} = 'X';
        $cardNumber{7} = 'X';
        $cardNumber{8} = 'X';
        $cardNumber{9} = 'X';
        $cardNumber{10} = 'X';
        $cardNumber{11} = 'X';
        $this->view->cardNumber = $cardNumber;
	 	
	 	$error = '';
	 	/**
	 	 * Store to DB and redirect
	 	 */
	 	if ( false != $confirm ){ 
            /**************************************************************************
             * Make payment
             */
            require_once 'libs/paypal/CallerService.php';
            /**
             * Fist name, last name
             */
            $firstName = trim(substr($data_info['full_name'], 0, strpos($data_info['full_name'] . ' ', ' ') + 1));
            $lastName = trim (substr($data_info['full_name'], strlen($firstName)));
            /**
             * Get required parameters from the web form for the request
             */
            $paymentType =urlencode( 'Sale');
            $firstName =urlencode( $firstName);
            $lastName =urlencode($lastName);
            $creditCardType =urlencode( $data_info['card_type']);
            $creditCardNumber = urlencode($data_info['card_number']);
            $expDateMonth =urlencode( $data_info['card_month']);
            
            // Month must be padded with leading zero
            $padDateMonth = str_pad($expDateMonth, 2, '0', STR_PAD_LEFT);
            
            $expDateYear =urlencode( $data_info['card_year']);
            $cvv2Number = urlencode($data_info['card_cvv']);
            $address1 = urlencode($data_info['address']);
            $address2 = urlencode('');
            $city = urlencode($data_info['city']);
            $state =urlencode( $data_info['state']);
            $zip = urlencode($data_info['zip_code']);
            $amount = urlencode(number_format($_SESSION['cart'][$order_id]['ordertotal'], 2, '.', ''));

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
            if($ack!="SUCCESS")  {
                $_SESSION['card_error_msg']=@$resArray['L_LONGMESSAGE0'];
                $this->_redirect('restaurant/ship');
            }
            	 	    
	 	    
	 	    /**
	 	     * End payment
	 	     **************************************************************************/
	 		//-- begin save into db: vi_order and vi_order_detail
	 		
	 		$arr_order = array(
//	 			'order_id'		=>	$order_id,
	 			'sub_total'		=>	$_SESSION['cart'][$order_id]['subtotal'],
	 			'sales_tax'		=>	$_SESSION['cart'][$order_id]['tax'],
	 			'shipping_fee'	=>	$_SESSION['cart'][$order_id]['shipping'],
	 			'order_total'	=>	$_SESSION['cart'][$order_id]['ordertotal'],
	 			'full_name'		=>	$data_info['full_name'],
	 			'address'		=>	$data_info['address'],
	 			'suite'			=>	$data_info['note'],
	 			'city'			=>	$data_info['city'],
	 			'state'			=> 	$data_info['state'],
	 			'zip_code'		=> 	$data_info['zip_code'],
	 			'phone'			=> 	$data_info['phone1'].".".$data_info['phone2'].".".$data_info['phone3'],
	 			'email'			=> 	$data_info['email']
	 		);
	 		
	 		$objOrder = new Models_Order();
	 		$bResultOrder = $objOrder->insert($arr_order);
	 		
	 		foreach ( $_SESSION['cart'][$order_id] as $key=>$value ){	 			
		 		$arr_order_detail = array(
		 			'order_id'		=> $bResultOrder,
		 			'meal_id'		=> $value['meal_id'],
		 			'name'			=> $value['name'],
		 			'description'	=> $value['description'],
		 			'price'			=> $value['price'],
		 			'quantity'		=> $value['quantity'],
		 			'total'			=> $value['total_money']
		 		);
		 		if ( !empty($value['name']) ){
			 		$objOrderDetail = new Models_OrderDetail();
			 		$objOrderDetail->insert($arr_order_detail);
		 		}
	 		}
	 		//-- end save into db: vi_order and vi_order_detail
	 		
	 		/**
	 		 * Send email to admin and user
	 		 */
            $objUser = new Models_User();
            $objMail = new Models_Mail();
            $data = $arr_order;
            $data['card_type'] = $this->view->cardType;
            $data['card_number'] = $this->view->cardNumber;
//            echo '<pre>';print_r($data);die;

            $cartDetail = "
            <table>
                <tr>
                    <td>SHIPPING ADDRESS</td>
                    <td>PAYMENT METHOD</td>
                </tr> 
                <tr>
                   <td>
                       <table>
                           <tr>
                               <td align='right'>Full Name:</td>
                               <td>{$data['full_name']}</td>
                           </tr>
                           <tr>
                               <td align='right'>Address:</td>
                               <td>{$data['address']}</td>
                           </tr>
                           <tr>
                               <td align='right'>Zip/Postal Code:</td>
                               <td>{$data['zip_code']}</td>
                           </tr>
                           <tr>
                               <td align='right'>Phone:</td>
                               <td>{$data['phone']}</td>
                           </tr>
                       </table>
                   </td>
                   <td>
                       <br/>
                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       {$data['card_type']}: {$data['card_number']} 
                   </td>
                </tr>
            </table>
            
            <table border='0'>
                <tr>
                    <td>Dish</td>
                    <td></td>
                    <td>Quanlity</td>
                    <td>Price</td>
                    <td>Total</td>
                </tr> ";
                       
             foreach ($_SESSION['cart'][$order_id] as $meal) {   
                 if (null == $meal['meal_id']) {
                     continue;
                 }
                 $cartDetail .= "
                 <tr>
                    <td>
                        <img src='#'>
                    </td>
                    <td>
                        <b>{$meal['name']}</b>
                        <br/>
                        <p>{$meal['description']}</p>
                    </td>
                    <td>{$meal['quantity']}</td>
                    <td>$ " . number_format($meal['price'], 2)."</td>
                    <td>$ " . number_format($meal['total_money'], 2)."</td>
                </tr>"; 
             }
             $cartDetail .= "   
                <tr>
                    <td colspan='4' align='right'> Subtotal </td>
                    <td>$ " . number_format($data['sub_total'], 2)."</td>
                </tr>
                <tr>
                    <td colspan='4' align='right'> Tax </td>
                    <td>$ " . number_format($data['sales_tax'], 2)."</td>
                </tr>
                <tr>
                    <td colspan='4' align='right'> Shipping fee </td>
                    <td><b>$ " . number_format($data['shipping_fee'], 2)."</b></td>
                </tr>
                <tr>
                    <td colspan='4' align='right'> Order total </td>
                    <td>$ " . number_format($data['order_total'], 2)."</td>
                </tr>
            </table>
            ";
             
            $data['card_detail'] = $cartDetail;
//            echo '<pre>';print_r($data);die;
            
            $admin = $objUser->getByUserName('admin');
            $objMail->sendHtmlMail('meal_order', $data, array($admin['email'], $data_info['email']));
	 		/**
	 		 * Clear session
	 		 */
	 		unset($_SESSION['cart']);
            unset($_SESSION['cart_customer']);
	 		/**
	 		 * Redirec to success page
	 		 */
            $objContent = new Models_ScontentLang();
            $this->_redirect($objContent->getUrlWithoutAppBaseUrl(21));
            return;
	 		
	 	}
        
        $this->view->mark = $this->_getParam('mark', false);
		$this->view->date = $this->_getParam('date', false);
		$this->view->time = $this->_getParam('time', false);
	}	
} 

