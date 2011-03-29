<script type="text/javascript">
function fbs_click(address){	
    u = 'http://nyhederne.tv2.dk/article.php/id-35170936:clinton-er-f%C3%A6rdig-som-stemmej%C3%A6ger.html';
    t = document.title;
    o = 'toolbar=0,status=0,width=626,height=436';
    window.open('{{$APP_BASE_URL}}restaurant/map?address='+address, 'sharer', o);
    
    return false;
}
function Complete_Order(){	
//	window.location.href = "{{$APP_BASE_URL}}restaurant/meal?id={{$res_id_ses}}&mark={{$mark}}&date={{$date}}&time={{$time}}";
	window.location.href = "{{$APP_BASE_URL}}restaurant/{{$res_id_ses}}/meal";
}
function Cancel_Order(){
	if( confirm('Are you sure you want to CANCEL your order?') == true) 
//		window.location.href = "{{$APP_BASE_URL}}restaurant/meal?id={{$restaurant_id}}&res_id_ses={{$res_id_ses}}&mark={{$mark}}&date={{$date}}&time={{$time}}";
		window.location.href = "{{$APP_BASE_URL}}cancel_res/{{$restaurant_id}}/{{$res_id_ses}}";
}
</script>
<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAfC0VI1TK8TYdshSdnHDNSxSeGj8z-4c3Gkvm2sCURIKgXVhMtBRfYmT9EDfSCVyiP26LwRJpOXAiBg" type="text/javascript"></script>
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
                  <span class="mid color_1">{{$mark}}</span> <br class="clear_left"/>
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
                <label class="w130 color_1">&nbsp;{{$date}}</label>                
<!--                
                <select class="w130">
                  <option></option>
                </select>
-->                
                <br />
                <label class="w30">Time: </label>
                <label class="w130 color_1">&nbsp;{{$time}}</label>                
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

      <div class="w692 float_right m20t po_re">
<!--       
        <div class="bg_popup p10">
          <div class="bd1b p5b w600"> <img src="{{$LAYOUT_HELPER_URL}}front/img/text_fire.png" alt="" class="float_left"/>
            <div class="float_right l_title"> <b>Quality:</b> &nbsp;&nbsp;
              <input style="input"/>
              &nbsp;&nbsp;&nbsp; <b>Price:</b> &nbsp;&nbsp;<span>$40.0</span> </div>
            <div class="clear"></div>
          </div>
          <div class="w600"> <br />
            <div class="p5b"><b>Choose form</b></div>
            <div>
              <input type="radio" class="mid float_left m5r" />
              <span class="mid">Cup ($3.50)</span> <br class="clear_left"/>
            </div>
            <div>
              <input type="radio" class="mid float_left m5r" />
              <span class="mid">Pint ($4.95)</span> <br class="clear_left"/>
            </div>
            <div>
              <input type="radio" class="mid float_left m5r" />
              <span class="mid">Quart ($7.95)</span> <br class="clear_left"/>
            </div>
            <br />
            <div class="p5b"><b>Choose form</b></div>
            <div>
              <input type="checkbox" class="mid float_left m5r" />
              <span class="mid">Bread bowl $(0.75)</span> </div>
            <br />
            <div class="p5b"><b>Special intruction(e.g sauce on the side)</b><br />
              <span style="font-size:9px"> Please note any price altering intructions entered below will be change to your credit card after your order is processed(extre cheese.ect) </span>
              <textarea class="text_choose"></textarea>
              <br />
              <label class="float_left p10t m5r"><strong>For whom</strong></label>
              <input type="text" style="width:533px;height:20px;margin-top:5px;"/>
              <div class="float_right m10t"> <a href="#"><img src="{{$LAYOUT_HELPER_URL}}front/img/btn_additem.png" alt="" /></a> <a href="#"><img src="{{$LAYOUT_HELPER_URL}}front/img/btn_cancel.png" alt="" /></a> </div>
              <div class="clear"></div>
            </div>
          </div>
        </div>               
-->      
<!--   
        <p class="float_left m10r"><img src="{{$LAYOUT_HELPER_URL}}front/img/img.jpg" alt="" /></p>
 -->        
        <div style="margin-left: 20px;">
        <form id="aspnetForm" action="" method="post" name="aspnetForm">
		<h1 style="color:#EB680A;font-size:22px;font-weight:bold;margin:0;padding:6px;">
			You have selected a new restaurant without completing<br>
			your order for {{$restaurant_name}}.</h1><br>
		<div style="margin-bottom: 30px;" class="cancelmessage">
			If you don't complete your {{$restaurant_name}} order it will be CANCELLED!</div>
		<table cellspacing="0" cellpadding="0" style="margin-left: 20px; width: 520px;">
		<tbody><tr>
		<td><div class="hover completeorder">
		<a href="javascript:Complete_Order();"><img src="{{$LAYOUT_HELPER_URL}}front/img/btn_complete_original_order.gif"></a>
		</div></td>
		<td align="right"><div class="hover cancelorder">
		<a href="javascript:Cancel_Order();"><img src="{{$LAYOUT_HELPER_URL}}front/img/btn_cancel_original_order_and_proceed_to_next_restaurant.gif"></a>
<!-- 		
		<input type="image" style="border-width: 0px; margin-top: 0px;" onclick="if( confirm('Are you sure you want to CANCEL your order?') == true) location.replace('{{$APP_BASE_URL}}restaurant/meal?id={{$restaurant_id}}&res_id_ses={{$res_id_ses}}&mark={{$mark}}&date={{$date}}&time={{$time}}');" src="{{$LAYOUT_HELPER_URL}}front/img/btn_cancel_original_order_and_proceed_to_next_restaurant.gif" title="Continue to New Restaurant" id="ctl00_cBody_ibChange" name="ctl00$cBody$ibChange"></div></td>
 -->		
		</tr>
		</tbody></table>
		</form>
		</div>
<!-- 		
        <span class="fs14"><b>{{$arr_restaurant.name}}</b></span><br />
        {{$arr_restaurant.street}}<br />
        {{$arr_restaurant.city}}, {{$arr_restaurant.state}} <span class="color_1"><a href="#" onclick="return fbs_click('{{$address_restaurant}}')">Map</a> </span><br />
        {{$arr_restaurant.description}}<br />   
 -->         	
      </div>
      <div class="clear"></div>
    </div>
    
<script type="text/javascript">
function openLoginForm()
{
    document.getElementById('overlay').style.display = 'block';
    document.getElementById('div_meal').style.display = 'block';
}
function closeLoginForm()
{
    document.getElementById('overlay').style.display = 'none';
    document.getElementById('div_meal').style.display = 'none';
}

{{if $loginError === true}}
$(document).ready(function (){
    openLoginForm();
    document.getElementById('loginMessage').style.display = '';
});
{{/if}}

</script>