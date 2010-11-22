<div id="main">
        <div class="w201 float_left">
        	<div class="top1 m20t"></div>
            <div class="cen1">
            	<div class="cen_1">
                	<div class="p10">
						<img src="{{$LAYOUT_HELPER_URL}}front/img/tt_cart.jpg" alt="" width="83" height="11" />
						<div class="p10t">
							<div class="float_left"><b>Location</b></div>
							<div class="float_right color_2"><a href="#">Add New Address</a></div><br class="clear" />
						</div>
						<div class="input_form bd1b p20b">							
							<p class="color_1"><i>1045 Hong Bang, ward 12, District 6 Hochiminh City</i></p>
						</div>
						
						<div class="input_form ">
							<div class="float_left"><b>Date & Time</b></div>
							<div class="float_right color_2"><a href="#">Edit</a></div><br class="clear" />
							<label class="w30">Date</label>
							<label class="w130 color_1"><i>12 Nov 2010</i></label><br class="clear" />
							<label class="w30">Time</label>
							<label class="w130 color_1"><i>08:00 pm</i></label><br class="clear" /><br />
						</div>
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
						<div class="">
                <p class="color_2 uper"><b>Shipping Address</b></p>
                <div class="input_form">   
                	<form id="register" name="register" action="{{$APP_BASE_URL}}restaurant/info?order_id={{$order_id}}" method="post">                 
	                    <label class="w130 m10r right">Full Name:<span class="red">*</span></label>
	                    <input type="text" value="" class="w230" id="data[full_name]" name="data[full_name]" /><br />
	                    <label class="w130 m10r right">Address:<span class="red">*</span></label>
	                    <input type="text" value="" class="w230" id="data[address]" name="data[address]" /><br />
	                    <label class="w130 m10r right">Suite#/Apt.#/Note:</label>
	                    <input type="text" value="" class="w230" id="data[note]" name="data[note]" /><br />
	                    <label class="w130 m10r right">City:<span class="red">*</span></label>
	                    <input type="text" value="" class="w230" id="data[city]" name="data[city]" /><br />
	                    <label class="w130 m10r right">State:<span class="red">*</span></label>
	                    <select class="w235" id="data[state]" name="data[state]">
	                    	<option></option>
	                    </select><br />
	                    <label class="w130 m10r right">Zip/Postal Code:<span class="red">*</span></label>
	                    <input type="text" value="" class="w230" id="data[zip_code]" name="data[zip_code]" /><br />
	                    <label class="w130 m10r right">Phone:(XXX-XXX-XXXX)<span class="red">*</span></label>
	                    <input type="text" value="000" class="w70" id="data[phone1]" name="data[phone1]" />
	                    <input type="text" value="000" class="w70" id="data[phone2]" name="data[phone2]" />
	                    <input type="text" value="0000" class="w70" id="data[phone3]" name="data[phone3]" /><br />
<!-- 	                    
	                    <label class="w130 m10r right">Mobile Phone:</label>
	                    <input type="text" value="000" class="w70" />
	                    <input type="text" value="000" class="w70" />
	                    <input type="text" value="0000" class="w70" /><br />
	                    <label class="w130 m10r right">Mobile Phone Carrier:</label>
	                    <input type="text" value="" class="w230" /><br />
-->	                    
	                    <label class="w130 m10r right">Email:<span class="red">*</span></label>
	                    <input type="text" value="" class="w230" id="data[email]" name="data[email]" /><br />
						<label class="w130 m10r right">&nbsp;</label>
<!-- 						
						<a href="{{$APP_BASE_URL}}restaurant/info?order_id={{$order_id}}">
	                    	<img src="{{$LAYOUT_HELPER_URL}}front/img/bt_conti.jpg" />
	                    </a>
-->	                    
	                    <input type="submit" style="background:url({{$LAYOUT_HELPER_URL}}front/img/bt_conti.jpg);width:67px;height:26px;border:0px;cursor: pointer;" value="" />
	                    <br />
                    </form>
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
            }           
        },
        messages: {
            'data[full_name]': "",
            'data[address]': "",
            'data[city]': "",
            'data[zip_code]': "",
            'data[phone1]': "",
            'data[phone2]': "",
            'data[phone3]':  "",
            'data[email]': ""            
        }
    }); 
});

</script>
