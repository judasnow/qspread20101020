<script type="text/javascript">
function load_data(value){
	var frm = document.form_filter;
	frm.action = "{{$APP_BASE_URL}}restaurant?mark="+value;
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
</script>
<!-- end autocomplete -->
<div id="main">
        <div class="w201 float_left">
        	<div class="top1 m20t"></div>
            <div class="cen1">
            	<div class="cen_1">
                	<div class="p10">
                		<form onsubmit="return sub_search();" id="searchForm" action="{{$APP_BASE_URL}}restaurant?search=city" method="post" name="searchForm">
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
							<input type="text" value="" class="w130" name="searchword_s" id="searchword_s" /><br />
							<label class="w30">Zip</label>
							<input type="text" value="" class="w50" /><br />
							<a href="{{$APP_BASE_URL}}restaurant?search=city"><img src="{{$LAYOUT_HELPER_URL}}front/img/bt_go.jpg" alt="" /></a>
						</div>
						<div class="input_form p20b">
							<p class="p10b"><b>Date and time</b></p>
							<label class="w30">Date</label>
							<select class="w130">
								{{foreach from=$date_month item=item}}	
								<option value="{{$item}}">{{$item}}</option>
								{{/foreach}}
							</select><br />
							<label class="w30">Time</label>
							<select class="form_text3" id="ctl00_cBody_Backet_datetimeuc_ddlTime" onchange="javascript:setTimeout('__doPostBack(\'ctl00$cBody$Backet$datetimeuc$ddlTime\',\'\')', 0)" name="ctl00$cBody$Backet$datetimeuc$ddlTime">
								{{foreach from=$arr_time item=item}}	
								<option value="{{$item}}">{{$item}}</option>
								{{/foreach}}							
							</select>							
							<div class="center"><a href="#"><img src="{{$LAYOUT_HELPER_URL}}front/img/bt_checkout.png" alt="" /></a></div>
						</div>
						</form>
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
									<input type="radio" class="mid" />
									<span class="mid">Delevery</span>
								</div>
							</div>
							<div class="float_left m20l fs11">
								<input type="radio" class="mid"  value="curbside" onclick="load_data(this.value);" {{$mark_curbside}}/>
								<span class="mid">Curbside</span>
								<div class="p5t">
									<input type="radio" class="mid"  value="catering_pickup_only" onclick="load_data(this.value);" {{$mark_catering_pickup_only}}/>
									<span class="mid">Catering Pickup Only</span>
								</div>
							</div>
							<div class="float_left m20l fs11">
								<input type="radio" class="mid" />
								<span class="mid">Catering Delivery Only</span>
							</div>							
							<!-- PAGINATION -->
							{{if $countAllPages > 1}}
							<div class="float_right p20t">
								<ul class="list_3">
		                            {{if $prevPage}}
		                            <li><a href="?page={{$prevPage}}&mark={{$mark}}" title="Previous"><img src="{{$LAYOUT_HELPER_URL}}front/img/back2.png" alt="Previous" /></a></li>
		                            {{/if}}
		                            
		                            {{foreach from=$prevPages item=item}}
		                            <li><a href="?page={{$item}}&mark={{$mark}}"  title="{{$item}}">{{$item}}</a></li>
		                            {{/foreach}}
		                            
		                            <li><a href="#" class="current" title="{{$currentPage}}">{{$currentPage}}</a></li>
		                            
		                            {{foreach from=$nextPages item=item}}
									<li><a href="?page={{$item}}&mark={{$mark}}"  title="{{$item}}">{{$item}}</a></li>
		                            {{/foreach}}
		                            
		                            {{if $nextPage}}
									<li><a href="?page={{$nextPage}}&mark={{$mark}}" title="Next"><img src="{{$LAYOUT_HELPER_URL}}front/img/next2.png" alt="Next" /></a></li>
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
							<td class="bd1b p10t p5b"><img src="{{$BASE_URL}}{{$item.image}}" alt="" /></td>
							<td class="bd1b p10t p5b" style="padding-left:5px;" valign="top">
								<b>{{$item.name}}</b>
								<p class="fs11">
									({{$item.address}}
									<span class="color_1"><a href="#">Map</a> </span>
									<br/>
									<a href="{{$APP_BASE_URL}}restaurant/meal">Select</a>
								</p>
							</td>
							<td class="bd1b p10t p5b center top">{{$item.mileage}}</td>
							<td class="bd1b p10t p5b center top"><b>{{$lead_time}}</b><br />~ {{$item.$mark}} </td>
							<td class="bd1b p10t p5b top">${{$item.minimum_delivery}}</td>
							<td class="bd1b p10t p5b top">${{$item.delivery_charge}}</td>
							<td class="bd1b p10t p5b top">
								<img src="img/icon_4.png" alt="" class="mid" />&nbsp; <span class="mid">Curbside </span>
								{{foreach from=$item.arr_service item=item}}																					
								<p class="p5t"><img src="{{$LAYOUT_HELPER_URL}}front/img/icon_4.png" alt="" class="mid" />&nbsp; <span class="mid">{{$item}} </span></p>
								{{/foreach}}		
							</td>
						  </tr>
						  {{/foreach}}						  
						</table>
						<a href="{{$APP_BASE_URL}}restaurant?mark={{$mark}}"><img src="{{$LAYOUT_HELPER_URL}}front/img/bt_all.jpg" alt="" class="float_left p7t m5r" /></a>
						<ul class="list_4 float_left p5t">
							<li></li>
							{{foreach from=$alphabet item=item}}	
								<li><a href="{{$APP_BASE_URL}}restaurant?mark={{$mark}}&find={{$item}}">{{$item}}</a></li>
							{{/foreach}}	
						</ul>
						
						 <!-- PAGINATION -->
						 {{if $countAllPages > 1}}
						<div class="float_right">
							<ul class="list_3">
	                            {{if $prevPage}}
	                            <li><a href="?page={{$prevPage}}&mark={{$mark}}" title="Previous"><img src="{{$LAYOUT_HELPER_URL}}front/img/back2.png" alt="Previous" /></a></li>
	                            {{/if}}
	                            
	                            {{foreach from=$prevPages item=item}}
	                            <li><a href="?page={{$item}}&mark={{$mark}}"  title="{{$item}}">{{$item}}</a></li>
	                            {{/foreach}}
	                            
	                            <li><a href="#" class="current" title="{{$currentPage}}">{{$currentPage}}</a></li>
	                            
	                            {{foreach from=$nextPages item=item}}
								<li><a href="?page={{$item}}&mark={{$mark}}"  title="{{$item}}">{{$item}}</a></li>
	                            {{/foreach}}
	                            
	                            {{if $nextPage}}
								<li><a href="?page={{$nextPage}}&mark={{$mark}}" title="Next"><img src="{{$LAYOUT_HELPER_URL}}front/img/next2.png" alt="Next" /></a></li>
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