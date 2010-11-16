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
			<div class="c50l">
                <p class="color_2 uper"><b>Shipping Address</b></p>
                <div class="input_form">
                    <label class="w130 m10r right">First Name:</label>
                    <span class="color_2">Nguyen</span>
                    <br class="clear"/>
                    <label class="w130 m10r right">Last Name:</label>
                    <span class="color_2">Dang</span>
                    <br class="clear" />
                    <label class="w130 m10r right">Address:</label>
                    <span class="color_2">1045 Hong Bang</span><br class="clear" />                    
                    <label class="w130 m10r right">Zip/Postal Code:</label>
                    <span class="color_2">548</span><br class="clear" />
                    <label class="w130 m10r right">Phone:</label>
                    <span class="color_2">0903038899</span><br class="clear" />
                    <label class="w130 m10r right">Mobile Phone:</label>
                    <span class="color_2">0903038899</span><br class="clear" />                    
					<label class="w130 m10r right">&nbsp;</label>
                    <img src="{{$LAYOUT_HELPER_URL}}front/img/bt_conti.jpg" /><br />
				</div> 
				<br class="clear" />
            </div>
			<div class="c50l">
                <p class="color_2 uper"><b>Payment method</b></p>
                <div class="input_form">
                    <label class="w130 m10r right">American Express:</label>
                    <span class="color_2">31231321321313</span>
                    <br class="clear"/>
				</div> 
				<br class="clear" />
            </div>
			<br class="clear" />
               	  <table cellpadding="0" cellspacing="0" border="0" style="width:100%;">
                    <tr>
                      <td width="8%" class="color_1 p5t p5b bd1b"><b>Dish</b></td>
                      <td width="37%" class="color_1 p5t p5b bd1b">&nbsp;</td>
                      <td width="11%" class="color_1 p5t p5b bd1b center"><b>Quanlity</b></td>
                      <td width="17%" class="color_1 p5t p5b bd1b center"><b>Price</b></td>
                      <td width="14%" class="color_1 p5t p5b bd1b"><b>Total</b></td>
                    </tr>
                    {{foreach from=$session_cart item=item key=key}}
                    <tr>
                      <td class="bd1b p10t p5b"><img src="{{$LAYOUT_HELPER_URL}}front/img/img_restaurant_menu.jpg" alt="" width="58" height="57" /></td>
                      <td class="bd1b p10t p5b"><b>{{$item.name}}</b>
                          <p class="fs11"> {{$item.description}}<br />
                        </p></td>
                      <td class="bd1b p10t p5b center top">{{$item.quantity}} <br /></td>
                      <td class="bd1b p10t p5b center top">${{$item.price}}</td>
                      <td class="bd1b p10t p5b top">${{$item.total_money}}</td>
                    </tr>
                    {{/foreach}} 
                    <tr>
                      <td class=" ">&nbsp;</td>
                      <td class="  "><p class="fs11"><br />
                      </p></td>
                      <td class="top"><br /></td>
                      <td class="center top">Subtotal</td>
                      <td class="top">$40.5</td>
                     
                    </tr>
                    <tr>
                      <td class=" ">&nbsp;</td>
                      <td class="  "><p class="fs11"><br />
                      </p></td>
                      <td class="center top"><br /></td>
                      <td class="center top">GST</td>
                      <td class="top">$40.5</td>
                      
                    </tr>
                    <tr>
                      <td class="">&nbsp;</td>
                      <td class=" "><p class="fs11"><br />
                      </p></td>
                      <td class="center top"><br /></td>
                      <td class="center top">Shipping fee</td>
                      <td class="top">$40.5</td>
                      </tr>
                    <tr>
                      <td class="">&nbsp;</td>
                      <td class=""><p class="fs11"><br />
                      </p></td>
                      <td class="center top"><br /></td>
                      <td class="center top">Subtotal</td>
                      <td class="top color_1 fs14"><b>$180.5</b></td>
                     
                    </tr>
                    <tr>
                      <td class="">&nbsp;</td>
                      <td class=""><p class="fs11"><br />
                      </p></td>
                      <td class="center top"><br /></td>
                      <td class="center top"></td>
                      <td class="p10t" color_1 fs14"><img src="{{$LAYOUT_HELPER_URL}}front/img/bt_conti.jpg" /></td>
                      
                    </tr>
                  </table>
               	  </div>
            	</div>
            </div>
            <div class="bot2"></div>
        </div>
        <div class="clear"></div>
    </div>