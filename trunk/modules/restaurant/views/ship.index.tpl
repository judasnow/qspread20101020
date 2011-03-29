<form id="register" name="register" action="{{$APP_BASE_URL}}restaurant/info" method="post"> 
<div id="main">
        <div class="w201 float_left">
        	<div class="top1 m20t"></div>
            <div class="cen1">
            	<div class="cen_1">
	            	<div class="p10"> <img src="{{$LAYOUT_HELPER_URL}}front/img/tt_yourorder.jpg" alt="" />
			              <div class="p10t">
			                <div class="bd1b p5b"><b>Order type</b></div>
			              </div>
			              <div class="input_form bd1b p10b">
			                <div>

			                  <span class="mid color_1">{{$mark}}</span> <br class="clear_left"/>
			                </div>

			              </div>
			              <div class="input_form p20b">
			                <p class="p10b"><b>Date and time</b></p>
			                <label class="w30">Date: </label>
			                <label class="w130 color_1">&nbsp;{{$date}}</label>                

			                <br />
			                <label class="w30">Time: </label>
			                <label class="w130 color_1">&nbsp;{{$time}}</label>                

			                <br />

			              </div>
			              {{ if isset($subtotal) }}
			              <div class="p10t">
				                <div class="bd1b p5b"><b>Order information</b></div>
				              </div>
				              <div class="input_form bd1b p10b">
				                <div>		   
				                  Subtotal:              
				                  <span class="mid color_1">${{$subtotal}}</span> <br class="clear_left"/>			                 
				                  Sales tax:
				                  <span class="mid color_1">${{$tax}}</span> <br class="clear_left"/>			                 
				                  Shipping fee:
				                  <span class="mid color_1">${{$shipping}}</span> <br class="clear_left"/>			                 
				                  Order total:
				                  <span class="mid color_1">${{$ordertotal}}</span> <br class="clear_left"/>
				                  <br/>	
				                  <a href="{{$APP_BASE_URL}}restaurant/ship"><img src="{{$LAYOUT_HELPER_URL}}front/img/bt_checkout.png"></img></a>		                 
				                </div>			        
				              </div>
				          {{ /if }}	
			            </div>


                </div>
            </div>
            <div class="bot1"></div>
        </div>
        <div class="w692 float_right">
            <div class="top2 m20t"></div>
            <div class="cen2">
            	<div class="cen_2">
               	  <div class="p10">
						<div class="bd1b">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In viverra pretium ultrices. Morbi eget quam nisl. Integer fringilla nibh quis nisl interdum eu facilisis mauris interdum. Aenean eu nibh enim. Donec placerat bibendum elementum. Quisque congue sapien in sem imperdiet blandit. Aliquam erat volutpat.  </p><br />							
						</div>
						<br/>
						<div class="">
						
						<!-- ERROR -->
						{{if $cartErrorMsg}}
						<p class="red"><b>Error</b>: {{$cartErrorMsg}}</p>
						<br/>
						{{/if}}
						<!-- END ERROR -->
						
						
                <p class="color_2 uper"><b>Shipping Address</b></p>
                <div class="input_form bd1b">   
                	                
	                    <label class="w130 m10r right">Full Name:<span class="red">*</span></label>
	                    <input type="text" value="{{$data.full_name}}" class="w230" id="data[full_name]" name="data[full_name]"/><br />
	                    
	                    <label class="w130 m10r right">Address:<span class="red">*</span></label>
	                    <input type="text" value="{{$data.address}}" class="w230" id="data[address]" name="data[address]"/><br />
	                    
	                    <label class="w130 m10r right">Suite#/Apt.#/Note:</label>
	                    <input type="text" value="{{$data.note}}" class="w230" id="data[note]" name="data[note]"/><br />
	                    
	                    <label class="w130 m10r right">City:<span class="red">*</span></label>
	                    <input type="text" value="{{$data.city}}" class="w230" id="data[city]" name="data[city]" /><br />
	                    
	                    <label class="w130 m10r right">State:<span class="red">*</span></label>
	                    <select class="w235" id="data[state]" name="data[state]">
	                    	{{foreach from=$arr_province item=item}}	
	                    	<option {{if $data.state == $item.province}} selected="selected" {{/if}} value="{{$item.province_code}}">{{$item.province}}</option>
	                    	{{/foreach}}
	                    </select><br />
	                    
	                    <label class="w130 m10r right">Postal Code:<span class="red">*</span></label>
	                    <input type="text" value="{{$data.zip_code}}" class="w230" id="data[zip_code]" name="data[zip_code]" /><br />
	                    
	                    <label class="w130 m10r right">Phone:(XXX-XXX-XXXX)<span class="red">*</span></label>
	                    <input type="text" value="{{if $data.phone1}}{{$data.phone1}}{{else}}000{{/if}}" class="w70" id="data[phone1]" name="data[phone1]" />
	                    <input type="text" value="{{if $data.phone2}}{{$data.phone2}}{{else}}000{{/if}}" class="w70" id="data[phone2]" name="data[phone2]" />
	                    <input type="text" value="{{if $data.phone3}}{{$data.phone3}}{{else}}0000{{/if}}" class="w70" id="data[phone3]" name="data[phone3]" /><br />

              
	                    <label class="w130 m10r right">Email:<span class="red">*</span></label>
	                    <input type="text" value="{{$data.email}}" class="w230" id="data[email]" name="data[email]" /><br />
						<label class="w130 m10r right">&nbsp;</label>

           
	                    <br />
				</div> 
				<br class="clear" />
				
				<p class="color_2 uper"><b>Debit/Credit Card Information</b></p>
                <div class="input_form">   
                        <label class="w130 m10r right">Card Type:<span class="red">*</span></label>
                        <select class="w235" name="data[card_type]">
                            <option value="Visa" selected="selected">Visa</option>
                            <option value="MasterCard">MasterCard</option>
                            <option value="Amex">American Express</option>
                            <option value="Discover">Discover</option>
                        </select><br />
                        
                        <label class="w130 m10r right">Card Number:<span class="red">*</span></label>
                        <input type="text" value="" class="w230" name="data[card_number]"/>
                        
                        
                        <img src="{{$LAYOUT_HELPER_URL}}front/img/card_visa.gif" style="vertical-align: top;">
                        <img src="{{$LAYOUT_HELPER_URL}}front/img/card_master.gif" style="vertical-align: top;">
                        <img src="{{$LAYOUT_HELPER_URL}}front/img/card_amex.gif" style="vertical-align: top;">
                        <img src="{{$LAYOUT_HELPER_URL}}front/img/card_dis.gif" style="vertical-align: top;">
                        <br />
                        
                        
                        
                        <label class="w130 m10r right">Expiration Date:<span class="red">*</span></label>
                        <select class="" name="data[card_month]" style="width: 100px;">
                            <option value="1">01</option>
                            <option value="2">02</option>
                            <option value="3">03</option>
                            <option value="4">04</option>
                            <option value="5">05</option>
                            <option value="6">06</option>
                            <option value="7">07</option>
                            <option value="8">08</option>
                            <option value="9">09</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                        </select>
                        <select class="" name="data[card_year]"  style="width: 131px;">
                            {{foreach from=$years item=item}}
                            <option value="{{$item}}">{{$item}}</option>
                            {{/foreach}}
                        </select>
                        <br />
                        
                        <label class="w130 m10r right">Card Verification Number:<span class="red">*</span></label>
                        <input type="text" value="" class="w230" name="data[card_cvv]" /><br />
                        <br/>
                        
                        <label class="w130 m10r right">&nbsp;</label>
                        <input type="submit" style="background:url({{$LAYOUT_HELPER_URL}}front/img/bt_conti.jpg);width:69px;height:21px;border:0px;cursor: pointer;" value="" />
                        <br />
                </div> 
				<br class="clear" />
            </div>
				        
               	  </div>
            	</div>
            </div>
            <div class="bot2"></div>
        </div>
        <div class="clear"></div>
    </div>
</form>    
    
<script type="text/javascript">
$().ready(function() {
    // validate signup form on keyup and submit
    $("#register").validate({
        rules: {
            'data[full_name]': "required",
            'data[address]': "required",
            'data[city]': "required",
            'data[zip_code]': "required",
            'data[phone1]':  {
                required: true,
                rangelength: [3, 3]
            },
            'data[phone2]':  {
                required: true,
                rangelength: [3, 3]
            },
            'data[phone3]':  {
                required: true,
                rangelength: [4, 4]
            },
            'data[email]': {
                required: true,
                email: true
            },
            'data[card_number]':  {
                required: true,
                rangelength: [15, 16]
            },
            'data[card_cvv]': "required"          
        },
        messages: {
            'data[full_name]': "",
            'data[address]': "",
            'data[city]': "",
            'data[zip_code]': "",
            'data[phone1]': "",
            'data[phone2]': "",
            'data[phone3]':  "",
            'data[email]': "",
            'data[card_number]': "",
            'data[card_cvv]': ""         
        }
    }); 
});

</script>
