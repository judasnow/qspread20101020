<script type="text/javascript">
function update_cart_temp(meal_id){
//	alert(meal_id);
	var frm = document.form_cart;
	var txt_quantity = "quantity_"+meal_id;
	quantity = document.getElementById (txt_quantity).value;
//	quantity = frm.txt_quantity.value;
//	alert(quantity);
	url = "&quantity="+quantity+"&meal_id="+meal_id;
	frm.action += url;
	frm.submit();
}
</script>
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
		<!--                 
		                  <input type="radio" class="mid float_left m5r" />
		-->                  
		                  <span class="mid">{{$mark}}</span> <br class="clear_left"/>
		                </div>
		<!--                
		                <div>
		                  <input type="radio" class="mid float_left m5r" />
		                  <span class="mid">Delivery - $50 min</span> <br class="clear_left"/>
		                </div>
		                <div>
		                  <input type="radio" class="mid float_left m5r" />
		                  <span class="mid">Catering  Delivery $130min</span> <br class="clear_left"/>
		                </div>
		                <div>
		                  <input type="radio" class="mid float_left m5r" />
		                  <span class="mid">Catering Pick up</span> <br class="clear_left"/>
		                </div>
		-->                 
		              </div>
		              <div class="input_form p20b">
		                <p class="p10b"><b>Date and time</b></p>
		                <label class="w30">Date: </label>
		                <label class="w130">&nbsp;{{$date}}</label>                
		<!--                
		                <select class="w130">
		                  <option></option>
		                </select>
		-->                
		                <br />
		                <label class="w30">Time: </label>
		                <label class="w130">&nbsp;{{$time}}</label>                
		<!--                 
		                <select class="w130">
		                  <option></option>
		                </select>
		-->                
		                <br />
		<!--                 
		                <div class="center color_2 uper p10t"> <a href="#"><b>Select a menu item<br />
		                  to add it to your order</b></a> </div>
		-->                  
		              </div>
		            </div>
<!--             	
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
-->				  
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
						<form name="form_cart" method="post" action="{{$APP_BASE_URL}}restaurant/cart">
				        <table cellpadding="0" cellspacing="0" border="0" style="width:100%;">
                          <tr>
                            <td width="8%" class="color_1 p5t p5b bd1b"><b>Dish</b></td>
                            <td width="37%" class="color_1 p5t p5b bd1b">&nbsp;</td>
                            <td width="11%" class="color_1 p5t p5b bd1b center"><b>Quanlity</b></td>
                            <td width="14%" class="color_1 p5t p5b bd1b center"><b>Price</b></td>
                            <td width="11%" class="color_1 p5t p5b bd1b"><b>Total</b></td>
                            <td width="6%" class="color_1 p5t p5b bd1b"><b>Edit</b></td>
                          </tr>                                                   
                          {{foreach from=$session_cart item=item key=key}} 
                          {{if isset($item.name) }}                                                
                          <tr>
                            <td class="bd1b p10t p5b"><img src="{{$LAYOUT_HELPER_URL}}front/img/img_restaurant_menu.jpg" alt="" width="58" height="57" /></td>
                            <td class="bd1b p10t p5b"><b>{{$item.name}}</b>
                                <p class="fs11"> {{$item.description}}<br />
                              </p></td>
                            <td class="bd1b p10t p5b center top"><input type="text" class="w50 center" value="{{$item.quantity}}" name="quantity_{{$item.meal_id}}" id="quantity_{{$item.meal_id}}" />
                                <br /></td>
                            <td class="bd1b p10t p5b center top">${{$item.price}}</td>
                            <td class="bd1b p10t p5b top">${{$item.total_money}}</td>
                            <td class="bd1b p10t p5b top">
                            	<a class="color_2" href="#" onclick="update_cart_temp({{$item.meal_id}});">update</a>
                            	<a class="color_2" href="{{$APP_BASE_URL}}restaurant/cart?meal_id={{$item.meal_id}}&state=1">remove</a>
                            </td>
                          </tr> 
                          {{/if}}
                          {{/foreach}}   
                          <tr>
                            <td colspan="2" rowspan="3" class=" ">&nbsp;
<!--                             
                            	<strong>Available Discounts</strong> - only one can be use per order  <br />        
                            	<input type="radio" class="mid float_left m5r" /><b class="float_left m5r">Promo/Coupon Code:</b><input type="input" class="input_tr float_left"/>  <a href="#"><img src="{{$LAYOUT_HELPER_URL}}front/img/btn_apply.png" alt="" /></a>
-->                            	
                                               </td>
                            <td class="top"><br /></td>
                            <td class="center top">Subtotal</td>
                            <td class="top">${{$subtotal}}</td>
                            <td class="top"><a class="color_2" href="#"></a></td>
                          </tr>
                          <tr>
                            <td class="center top"><br /></td>
                            <td class="center top">Sales tax</td>
                            <td class="top">${{$tax}}</td>
                            <td class="top"><a class="color_2" href="#"></a></td>
                          </tr>
                          <tr>
                            <td class="center top"><br /></td>
                            <td class="center top">Shipping fee</td>
                            <td class="top">${{$shipping}}</td>
                            <td class="top"><a class="color_2" href="#"></a></td>
                          </tr>
                          <tr>
                            <td class="">&nbsp;</td>
                            <td class=""><p class="fs11"><br />
                            </p></td>
                            <td class="center top"><br /></td>
                            <td class="center top">Order total</td>
                            <td class="top color_1 fs14"><b>${{$ordertotal}}</b></td>
                            <td class="top"><a class="color_2" href="#"></a></td>
                          </tr>
                          <tr>
                            <td class="">&nbsp;</td>
                            <td class=""><p class="fs11"><br />
                            </p></td>
                            <td class="center top"><br /></td>
                            <td class="center top"></td>
                            <td class="p10t" color_1 fs14">
                            <a href="{{$APP_BASE_URL}}restaurant/ship">
                            	<img src="{{$LAYOUT_HELPER_URL}}front/img/bt_conti.jpg" />
                            </a>
                            </td>
                            <td class="top"><a class="color_2" href="#"></a></td>
                          </tr>
                        </table>
                        </form>
               	  </div>
            	</div>
            </div>
            <div class="bot2"></div>
        </div>
        <div class="clear"></div>
    </div>