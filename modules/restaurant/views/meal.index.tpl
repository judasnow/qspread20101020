<link rel="stylesheet" href="{{$LAYOUT_HELPER_URL}}front/prettyphoto/css/prettyPhoto.css" type="text/css" media="screen" title="prettyPhoto main stylesheet" charset="utf-8" />
<script src="{{$LAYOUT_HELPER_URL}}front/prettyphoto/js/jquery.prettyPhoto.js" type="text/javascript" charset="utf-8"></script>

<script type="text/javascript">

$(document).ready(function(){
    $(".meal a[rel^='prettyPhoto']").prettyPhoto({animationSpeed:'fast',slideshow:10000,theme: 'facebook'});
});

function fbs_click(address){	
    u = 'http://nyhederne.tv2.dk/article.php/id-35170936:clinton-er-f%C3%A6rdig-som-stemmej%C3%A6ger.html';
    t = document.title;
    o = 'toolbar=0,status=0,width=626,height=436';
    window.open('{{$APP_BASE_URL}}restaurant/map?address='+address, 'sharer', o);
    
    return false;
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
        <p class="float_left m10r"><img src="{{$BASE_URL}}{{$arr_restaurant.image}}" alt="" /></p>
        <span class="fs14"><b>{{$arr_restaurant.name}}</b></span><br />
        {{$arr_restaurant.street}}<br />
        {{$arr_restaurant.city}} {{$arr_restaurant.state}} <span class="color_1"><a href="#" onclick="return fbs_click('{{$address_restaurant}}')">Map</a> </span><br />
        <br/>
        {{$arr_restaurant.description}}<br />
        <div class="clear_left"></div>
        <br />
        <div id="na_2">
          <ul>            
            <li {{if $type eq 0 }} class="current" {{/if}} ><a href="{{$APP_BASE_URL}}restaurant/meal?id={{$res_id}}"><span>General menu</span></a></li>
            <li {{if $type eq 1 }} class="current" {{/if}} ><a href="{{$APP_BASE_URL}}restaurant/meal?id={{$res_id}}&type=1"><span>Catering</span></a></li>
            
            {{if '1' == $arr_restaurant.reser_onoff}}
            <li ><a href="{{$APP_BASE_URL}}restaurant/reservation/index/rid/{{$res_id}}"><span>Reservation</span></a></li>
            {{/if}}
            
          </ul>
        </div>

        <div class="float_left fs14 p20t p10t m20l"><b>Menu Serving From {{$time_start}} to {{$time_end}} on {{$date_cut}}</b></div>
<!--         
        <a href="#" class="float_right m10r"><img src="{{$LAYOUT_HELPER_URL}}front/img/btn_add.png" alt="" class="mid m5t"/></a>
-->         
        <br class="clear" />
        <div class="top2"></div>
        <!-- begin layer cover --> 
        {{ if $test_time_choose eq 0 }}
        <div id="overlay" style="display: block;color:red;font-size:16px;font-weight:bold;opacity:0.85;padding-top:30px;position:absolute;text-align:center;z-index:1010;">        	
        	This Menu is not available for your selected order time.<br/>
			To order from this menu please choose a new order time.<br/>
			Next available order time is {{$time_start}} on {{$date}}<br/><br/><br/>
			<a href="#" onclick="closeLoginForm();" style="color:red">Click here</a>        	 
        </div>    
        {{ /if }}   
        <!-- end layer cover -->    
        <div class="cen2">
          <div class="cen_2">
            <div class="p10 meal">
              <table cellpadding="0" cellspacing="0" border="0" style="width:100%;">
                <tr>
                  <td width="10%" class="color_1 p5t p5b bd1b"><b>Meal name</b></td>
                  <td width="60%" class="color_1 p5t p5b bd1b"></td>
                  <td width="20%" class="color_1 p5t p5b bd1b"><b>Price</b></td>
                  <td width="10%" class="color_1 p5t p5b bd1b"><b>Action</b></td>
                </tr>
                {{foreach from=$arr_meal item=item}}
                <tr>
                  <td class="bd1b p10t p5b" style="vertical-align: top; text-align: center; padding: 10px 5px;">
                      {{if $item.image_thumb}}
                         <a href="{{$BASE_URL}}{{$item.image}}" rel="prettyPhoto" title="{{$item.name|@addslashes}} (${{$item.price}})"><img alt="{{$item.name|@addslashes}}" src="{{$BASE_URL}}{{$item.image_thumb}}" style="max-width: 100px;"></a>
                      {{/if}}
                  </td>
                  <td class="bd1b p10t p5b" style="vertical-align: top;">
                      <p><b>{{$item.name}}</b></p>
                      <br />
                       <p>{{$item.description}}</p>
                  </td>
                  <td class="bd1b p10t p5b top">${{$item.price}}</td>
                  
                  <td class="bd1b p10t p5b top">
 					<a href="{{$APP_BASE_URL}}cart/{{$res_id}}/{{$item.meal_id}}"><img src="{{$LAYOUT_HELPER_URL}}front/img/btn_select.png" alt="" />
                  	</a>
                  </td>
                </tr>
                {{/foreach}}	                
              </table>
			  {{if $countAllPages > 1}}
              <div class="float_right">
                <ul class="list_3">
                    {{if $prevPage}}
                        <li><a href="?page={{$prevPage}}&id={{$res_id}}&type={{$type}}"><img src="{{$LAYOUT_HELPER_URL}}front/img/back2.png" alt="" /></a></li>
                    {{/if}}
                    {{foreach from=$prevPages item=item}}
                        <li><a href="?page={{$item}}&id={{$res_id}}&type={{$type}}">{{$item}}</a></li>
                    {{/foreach}}
                        <li><a href="#" class="current" title="{{$currentPage}}">{{$currentPage}}</a></li>
                    {{foreach from=$nextPages item=item}}
                        <li><a href="?page={{$item}}&id={{$res_id}}&type={{$type}}">{{$item}}</a></li>
                    {{/foreach}}
                    {{if $nextPage}}
                        <li><a href="?page={{$nextPage}}&id={{$res_id}}&type={{$type}}"><img src="{{$LAYOUT_HELPER_URL}}front/img/next2.png" alt="" /></a></li>
                    {{/if}}
				</ul>
              </div>
              {{/if}}
              <div class="clear"></div>
            </div>
          </div>
        </div>
        
        
        <div class="bot2"></div>
      </div>
      <div class="clear"></div>
    </div>
    
<script type="text/javascript">
function openLoginForm()
{
    document.getElementById('overlay').style.display = 'block';
//    document.getElementById('div_meal').style.display = 'block';
}
function closeLoginForm()
{
    document.getElementById('overlay').style.display = 'none';
//    document.getElementById('div_meal').style.display = 'none';
}

{{if $loginError === true}}
$(document).ready(function (){
    openLoginForm();
    document.getElementById('loginMessage').style.display = '';
});
{{/if}}

</script>