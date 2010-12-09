<script type="text/javascript">
function load_data(value){
	var frm = document.form_filter;
	frm.action = "{{$APP_BASE_URL}}restaurant?mark="+value+"&date={{$date}}&time={{$time}}";
	frm.submit();
}
</script>
<!-- begin autocomplete --> 
<script src="{{$LAYOUT_HELPER_URL}}front/autocomplete/jquery.autocomplete.js" type="text/javascript"></script>
<link rel="stylesheet" href="{{$LAYOUT_HELPER_URL}}front/autocomplete/styles.css" type="text/css" media="screen" />
<script type="text/javascript">
  //<![CDATA[

  var a1;
  
  jQuery(function() {  

    var options = {
      serviceUrl: '{{$APP_BASE_URL}}restaurant/index/autocomplete-city',
      width: 300,
      delimiter: /(,|;)\s*/,
      deferRequestBy: 0, //miliseconds
      noCache: false //set to true, to disable caching
    };
	
    a1 = $('#searchword').autocomplete(options);

  });
  
//]]>
function submit_search(){
	var frm = document.searchForm;
	frm.submit();
}

function fbs_click(address){	
    u = 'http://nyhederne.tv2.dk/article.php/id-35170936:clinton-er-f%C3%A6rdig-som-stemmej%C3%A6ger.html';
    t = document.title;
    o = 'toolbar=0,status=0,width=626,height=436';
    window.open('{{$APP_BASE_URL}}restaurant/map?address='+address, 'sharer', o);
    
    return false;
}  
</script>
<!-- end autocomplete -->
<!-- <script src="http://maps.google.com/maps?file=api&amp;v=2.x&amp;key=ABQIAAAAfC0VI1TK8TYdshSdnHDNSxRj8XIJxol65Pr1PoVJbiw1L5MubxQzaLoL5T5ECViyoO6PVtMdT4Wlog" type="text/javascript"></script>-->
<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAfC0VI1TK8TYdshSdnHDNSxSeGj8z-4c3Gkvm2sCURIKgXVhMtBRfYmT9EDfSCVyiP26LwRJpOXAiBg" type="text/javascript"></script>

<div id="main">
        <div class="w201 float_left">
        	<div class="top1 m20t"></div>
            <div class="cen1">
            	<div class="cen_1">
                	<div class="p10">
                		<form onsubmit="return sub_search();" id="searchForm" action="{{$APP_BASE_URL}}restaurant?mark=pickup&date={{$date}}&time={{$time}}" method="post" name="searchForm">
						<img src="{{$LAYOUT_HELPER_URL}}front/img/tt_yourorder.jpg" alt="" />
						<div class="p10t">
							<div class="float_left"><b>Location</b></div>
<!-- 							
							<div class="float_right color_2"><a href="#">Add New Address</a></div>
-->							
							<br class="clear" />
						</div>
<!-- 						
						<div class="input_form bd1b p10b">
							<label>Select a saved address</label><br class="clear_left" />
							<select class="w165">
								<option></option>
							</select><br />
							<p class="fs11"><i>La Habra, CA</i></p>
							<div class="center p5t">OR</div>
						</div>
-->						
						<div class="input_form bd1b p20b">
							<label class="w30">Zip</label>
							<input type="text" value="{{$zip}}" class="w50" name="data[zip]" id="data[zip]" /><span class="color_1"><b> OR</b></span>	<br />								
							<label class="w30">City</label>
							<input type="text" value="{{$city}}" class="w130" name="searchword" id="searchword" /><br />						
							<a href="#" onclick="submit_search();"><img src="{{$LAYOUT_HELPER_URL}}front/img/bt_go.jpg" alt="" /></a>
						</div>
						<div class="input_form p20b">
							<p class="p10b"><b>Date and time</b></p>
							<label class="w30">Date</label>
							<select class="w130">
								{{foreach from=$date_month item=item}}	
								<option value="{{$item}}" {{if $date eq $item }} selected {{/if}} >{{$item}}</option>
								{{/foreach}}
							</select><br />
							<label class="w30">Time</label>
							<select class="form_text3" id="ctl00_cBody_Backet_datetimeuc_ddlTime" onchange="javascript:setTimeout('__doPostBack(\'ctl00$cBody$Backet$datetimeuc$ddlTime\',\'\')', 0)" name="ctl00$cBody$Backet$datetimeuc$ddlTime">
								<option value="ASAP">ASAP</option>
								{{foreach from=$arr_time item=item}}	
								<option value="{{$item}}" {{if $time eq $item }} selected {{/if}} >{{$item}}</option>
								{{/foreach}}							
							</select>	
<!-- 													
							<div class="center"><a href="#"><img src="{{$LAYOUT_HELPER_URL}}front/img/bt_checkout.png" alt="" /></a></div>
-->							
						</div>
						</form>
						
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
						<form method="POST" action="{{$APP_BASE_URL}}restaurant" name="form_filter">					
							<img src="{{$LAYOUT_HELPER_URL}}front/img/tt_selectarestaurant.jpg" alt="" class="float_left p10t" />
							<div class="float_left m20l fs11">
								<input type="radio" class="mid" value="pickup" onclick="load_data(this.value);" {{$mark_pickup}} />
								<span class="mid">Pick up</span>
								<div class="p5t">
									<input type="radio" class="mid" value="delivery" onclick="load_data(this.value);" {{$mark_delivery}} />
									<span class="mid">Delivery</span>
								</div>
							</div>
							<div class="float_left m20l fs11">
								<input type="radio" class="mid"  value="curbside" onclick="load_data(this.value);" {{$mark_curbside}}/>
								<span class="mid">Curbside</span>
								<div class="p5t">
									<input type="radio" class="mid"  value="catering_pickup" onclick="load_data(this.value);" {{$mark_catering_pickup}}/>
									<span class="mid">Catering Pickup</span>
								</div>
							</div>
							<div class="float_left m20l fs11">
								<input type="radio" class="mid" value="catering_delivery" onclick="load_data(this.value);" {{$mark_catering_delivery}} />
								<span class="mid">Catering Delivery</span>
							</div>							
							<!-- PAGINATION -->
							{{if $countAllPages > 1}}
							<div class="float_right p20t">
								<ul class="list_3">
		                            {{if $prevPage}}
		                            <li><a href="?page={{$prevPage}}&mark={{$mark}}&date={{$date}}&time={{$time}}" title="Previous"><img src="{{$LAYOUT_HELPER_URL}}front/img/back2.png" alt="Previous" /></a></li>
		                            {{/if}}
		                            
		                            {{foreach from=$prevPages item=item}}
		                            <li><a href="?page={{$item}}&mark={{$mark}}&date={{$date}}&time={{$time}}"  title="{{$item}}">{{$item}}</a></li>
		                            {{/foreach}}
		                            
		                            <li><a href="#" class="current" title="{{$currentPage}}">{{$currentPage}}</a></li>
		                            
		                            {{foreach from=$nextPages item=item}}
									<li><a href="?page={{$item}}&mark={{$mark}}&date={{$date}}&time={{$time}}"  title="{{$item}}">{{$item}}</a></li>
		                            {{/foreach}}
		                            
		                            {{if $nextPage}}
									<li><a href="?page={{$nextPage}}&mark={{$mark}}&date={{$date}}&time={{$time}}" title="Next"><img src="{{$LAYOUT_HELPER_URL}}front/img/next2.png" alt="Next" /></a></li>
		                            {{/if}}
	                            
								</ul>
							</div>
							{{/if}}
							<!-- End .pagination -->
							<div class="clear"></div>	
							</form>					
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
							<td class="bd1b p10t p5b">
							 {{if $item.image}}
							 <img src="{{$BASE_URL}}{{$item.image}}" alt="" style="max-width: 120px;"/>
							 {{/if}}
							</td>
							<td class="bd1b p10t p5b" style="padding-left:5px;" valign="top">
								<b>{{$item.name}}</b>
								<p>({{$item.cuisine_name}})</p>
								<p class="fs11">
									{{$item.address}}<br/>
									<span class="color_1"><a href="#" onclick="return fbs_click('{{$item.address}}')">Map</a> </span>									
									<br/>
									{{ if isset($res_id_ses) && ($item.restaurant_id != $res_id_ses) }}
										<a href="{{$APP_BASE_URL}}restaurant/meal/other-restaurant?id={{$item.restaurant_id}}&res_id_ses={{$res_id_ses}}&mark={{$mark}}&date={{$date}}&time={{$time}}">
											<img src="{{$LAYOUT_HELPER_URL}}front/img/btn_select.png" alt="" />
										</a>		
									{{ else }}
										<a href="{{$APP_BASE_URL}}restaurant/meal?id={{$item.restaurant_id}}&mark={{$mark}}&date={{$date}}&time={{$time}}">
											<img src="{{$LAYOUT_HELPER_URL}}front/img/btn_select.png" alt="" />
										</a>	
									{{ /if }}							
								</p>
							</td>
							<td class="bd1b p10t p5b center top">{{$item.mileage}}</td>
							<td class="bd1b p10t p5b center top"><b>{{$lead_time}}</b><br />~ {{$item.$mark}} </td>
							<td class="bd1b p10t p5b top">${{$item.delivery_minimum}}</td>
							<td class="bd1b p10t p5b top">${{$item.delivery_charge}}</td>
							<td class="bd1b p10t p5b top">
<!-- 							
								<img src="img/icon_4.png" alt="" class="mid" />&nbsp; <span class="mid">Curbside </span>
-->								
								{{ if count($item.arr_service) > 0 }}
								{{foreach from=$item.arr_service item=item}}																					
								<p class="p5t"><img src="{{$LAYOUT_HELPER_URL}}front/img/icon_4.png" alt="" class="mid" />&nbsp; <span class="mid">{{$item}} </span></p>
								{{/foreach}}
								{{ /if }}		
							</td>
						  </tr>
						  {{/foreach}}						  
						</table>
						<a href="{{$APP_BASE_URL}}restaurant?mark={{$mark}}&date={{$date}}&time={{$time}}"><img src="{{$LAYOUT_HELPER_URL}}front/img/bt_all.jpg" alt="" class="float_left p7t m5r" /></a>
						<ul class="list_4 float_left p5t">
							<li></li>
							{{foreach from=$alphabet item=item}}	
								<li><a href="{{$APP_BASE_URL}}restaurant?mark={{$mark}}&find={{$item}}&date={{$date}}&time={{$time}}">{{$item}}</a></li>
							{{/foreach}}	
						</ul>
						
						 <!-- PAGINATION -->
						 {{if $countAllPages > 1}}
						<div class="float_right">
							<ul class="list_3">
	                            {{if $prevPage}}
	                            <li><a href="?page={{$prevPage}}&mark={{$mark}}&date={{$date}}&time={{$time}}" title="Previous"><img src="{{$LAYOUT_HELPER_URL}}front/img/back2.png" alt="Previous" /></a></li>
	                            {{/if}}
	                            
	                            {{foreach from=$prevPages item=item}}
	                            <li><a href="?page={{$item}}&mark={{$mark}}&date={{$date}}&time={{$time}}"  title="{{$item}}">{{$item}}</a></li>
	                            {{/foreach}}
	                            
	                            <li><a href="#" class="current" title="{{$currentPage}}">{{$currentPage}}</a></li>
	                            
	                            {{foreach from=$nextPages item=item}}
								<li><a href="?page={{$item}}&mark={{$mark}}&date={{$date}}&time={{$time}}"  title="{{$item}}">{{$item}}</a></li>
	                            {{/foreach}}
	                            
	                            {{if $nextPage}}
								<li><a href="?page={{$nextPage}}&mark={{$mark}}&date={{$date}}&time={{$time}}" title="Next"><img src="{{$LAYOUT_HELPER_URL}}front/img/next2.png" alt="Next" /></a></li>
	                            {{/if}}
                            
							</ul>
						</div>
						{{/if}}
						<!-- End .pagination -->
						
						
						<div class="clear"></div>
					</div>
                </div>
            </div>
            <div class="bot2"></div>
        </div>
        <div class="clear"></div>
    </div>