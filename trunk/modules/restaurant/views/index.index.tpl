<div id="main">
        <div class="w201 float_left">
        	<div class="top1 m20t"></div>
            <div class="cen1">
            	<div class="cen_1">
                	<div class="p10">
						<img src="{{$LAYOUT_HELPER_URL}}front/img/tt_yourorder.jpg" alt="" />
						<div class="p10t">
							<div class="float_left"><b>Location</b></div>
							<div class="float_right color_2"><a href="#">Add New Address</a></div><br class="clear" />
						</div>
						<div class="input_form bd1b p10b">
							<label>Select a saved address</label><br class="clear_left" />
							<select class="w165">
								<option></option>
							</select><br />
							<p class="fs11"><i>La Habra, CA</i></p>
							<div class="center p5t">OR</div>
						</div>
						<div class="input_form bd1b p20b">
							<label class="w30">City</label>
							<input type="text" value="" class="w130" /><br />
							<label class="w30">Zip</label>
							<input type="text" value="" class="w50" /><br />
							<a href="#"><img src="{{$LAYOUT_HELPER_URL}}front/img/bt_go.jpg" alt="" /></a>
						</div>
						<div class="input_form p20b">
							<p class="p10b"><b>Date and time</b></p>
							<label class="w30">Date</label>
							<select class="w130">
								<option></option>
							</select><br />
							<label class="w30">Time</label>
							<select class="w130">
								<option></option>
							</select><br />
							<div class="center"><a href="#"><img src="{{$LAYOUT_HELPER_URL}}front/img/bt_checkout.png" alt="" /></a></div>
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
							<img src="{{$LAYOUT_HELPER_URL}}front/img/tt_selectarestaurant.jpg" alt="" class="float_left p10t" />
							<div class="float_left m20l fs11">
								<input type="radio" class="mid" />
								<span class="mid">Pick up</span>
								<div class="p5t">
									<input type="radio" class="mid" />
									<span class="mid">Delevery</span>
								</div>
							</div>
							<div class="float_left m20l fs11">
								<input type="radio" class="mid" />
								<span class="mid">Curbside</span>
								<div class="p5t">
									<input type="radio" class="mid" />
									<span class="mid">Catering Pickup Only</span>
								</div>
							</div>
							<div class="float_left m20l fs11">
								<input type="radio" class="mid" />
								<span class="mid">Catering Delivery Only</span>
							</div>
							<div class="float_right p20t">
								<ul class="list_3">
									<li><a href="#"><img src="{{$LAYOUT_HELPER_URL}}front/img/back2.png" alt="" /></a></li>
									<li><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#"><img src="{{$LAYOUT_HELPER_URL}}front/img/next2.png" alt="" /></a></li>
								</ul>
							</div>
							<div class="clear"></div>
						</div>
						<table cellpadding="0" cellspacing="0" border="0" style="width:100%;">
						  <tr>
							<td width="16%" class="color_1 p5t p5b bd1b"><b>Restaurant name</b></td>
							<td width="25%" class="color_1 p5t p5b bd1b">&nbsp;</td>
							<td width="11%" class="color_1 p5t p5b bd1b center"><b>Mileage</b></td>
							<td width="14%" class="color_1 p5t p5b bd1b center"><b>Lead time</b></td>
							<td width="11%" class="color_1 p5t p5b bd1b"><b>Minimum delivery</b></td>
							<td width="11%" class="color_1 p5t p5b bd1b"><b>Delivery charge</b></td>
							<td width="12%" class="color_1 p5t p5b bd1b"><b>Service</b></td>
						  </tr>
						  {{foreach from=$restaurants item=item}}						  
						  <tr>
							<td class="bd1b p10t p5b"><img src="{{$LAYOUT_HELPER_URL}}front/img/img.jpg" alt="" /></td>
							<td class="bd1b p10t p5b">
								<b>{{$item.name}}</b>
								<p class="fs11">
									({{$item.address}}
									<span class="color_1"><a href="#">Map</a> </span>
								</p>
							</td>
							<td class="bd1b p10t p5b center top">{{$item.mileage}}</td>
							<td class="bd1b p10t p5b center top">Pickup<br />~ {{$item.lead_time}} min</td>
							<td class="bd1b p10t p5b top">${{$item.minimum_delivery}}</td>
							<td class="bd1b p10t p5b top">${{$item.delivery_charge}}</td>
							<td class="bd1b p10t p5b top">
								<img src="img/icon_4.png" alt="" class="mid" />&nbsp; <span class="mid">Curbside </span>
								<p class="p5t"><img src="{{$LAYOUT_HELPER_URL}}front/img/icon_4.png" alt="" class="mid" />&nbsp; <span class="mid">Curbside </span></p>
								<p class="p5t"><img src="{{$LAYOUT_HELPER_URL}}front/img/icon_4.png" alt="" class="mid" />&nbsp; <span class="mid">Curbside </span></p>
								
							</td>
						  </tr>
						  {{/foreach}}						  
						</table>
						<a href="#"><img src="{{$LAYOUT_HELPER_URL}}front/img/bt_all.jpg" alt="" class="float_left p7t m5r" /></a>
						<ul class="list_4 float_left p5t">
							<li></li>
							<li><a href="#">a</a></li>
							<li><a href="#">b</a></li>
							<li><a href="#">c</a></li>
							<li><a href="#">d</a></li>
							<li><a href="#">e</a></li>
							<li><a href="#">f</a></li>
							<li><a href="#">g</a></li>
							<li><a href="#">h</a></li>
							<li><a href="#">i</a></li>
							<li><a href="#">j</a></li>
							<li><a href="#">k</a></li>
							<li><a href="#">l</a></li>
							<li><a href="#">m</a></li>
							<li><a href="#">n</a></li>
							<li><a href="#">o</a></li>
							<li><a href="#">p</a></li>
							<li><a href="#">q</a></li>
							<li><a href="#">r</a></li>
							<li><a href="#">s</a></li>
							<li><a href="#">t</a></li>
							<li><a href="#">u</a></li>
							<li><a href="#">v</a></li>
							<li><a href="#">w</a></li>
							<li><a href="#">v</a></li>
							<li><a href="#">y</a></li>
							<li><a href="#">z</a></li>
						</ul>
						<div class="float_right">
							<ul class="list_3">
								<li><a href="#"><img src="{{$LAYOUT_HELPER_URL}}front/img/back2.png" alt="" /></a></li>
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#"><img src="{{$LAYOUT_HELPER_URL}}front/img/next2.png" alt="" /></a></li>
							</ul>
						</div>
						<div class="clear"></div>
					</div>
                </div>
            </div>
            <div class="bot2"></div>
        </div>
        <div class="clear"></div>
    </div>