<script type="text/javascript">
function fbs_click(address){	
    u = 'http://nyhederne.tv2.dk/article.php/id-35170936:clinton-er-f%C3%A6rdig-som-stemmej%C3%A6ger.html';
    t = document.title;
    o = 'toolbar=0,status=0,width=626,height=436';
    window.open('{{$APP_BASE_URL}}restaurant/map?address='+address, 'sharer', o);
    
    return false;
}  
</script>
<script src="http://maps.google.com/maps?file=api&amp;v=2.x&amp;key=ABQIAAAAfC0VI1TK8TYdshSdnHDNSxRj8XIJxol65Pr1PoVJbiw1L5MubxQzaLoL5T5ECViyoO6PVtMdT4Wlog" type="text/javascript"></script>
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
        <p class="float_left m10r"><img src="{{$LAYOUT_HELPER_URL}}front/img/img.jpg" alt="" /></p>
        <span class="fs14"><b>{{$arr_restaurant.name}}</b></span><br />
        {{$arr_restaurant.street}}<br />
        {{$arr_restaurant.city}} {{$arr_restaurant.state}} <span class="color_1"><a href="#" onclick="return fbs_click('{{$address_restaurant}}')">Map</a> </span><br />
        {{$arr_restaurant.description}}<br />
<!--         
        <a href="#"><img src="{{$LAYOUT_HELPER_URL}}front/img/btn_ecit.png" alt="" /></a>
-->                 
        <div class="clear_left"></div>
        <br />
        <div id="na_2">
          <ul>            
            <li {{if $type eq 0 }} class="current" {{/if}} ><a href="{{$APP_BASE_URL}}restaurant/meal?id={{$res_id}}&mark={{$mark}}&date={{$date}}&time={{$time}}"><span>General menu</span></a></li>
            <li {{if $type eq 1 }} class="current" {{/if}} ><a href="{{$APP_BASE_URL}}restaurant/meal?id={{$res_id}}&mark={{$mark}}&date={{$date}}&time={{$time}}&type=1"><span>Catering</span></a></li>
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
            <div class="p10">
              <table cellpadding="0" cellspacing="0" border="0" style="width:100%;">
                <tr>
                  <td width="70%" class="color_1 p5t p5b bd1b"><b>Restaurant name</b></td>
                  <td width="20%" class="color_1 p5t p5b bd1b"><b>Price</b></td>
                  <td width="10%" class="color_1 p5t p5b bd1b"><b>Active</b></td>
                </tr>
                {{foreach from=$arr_meal item=item}}
                <tr>
                  <td class="bd1b p10t p5b"><p><b>{{$item.name}}</b></p>
                  <br />
                    <p>{{$item.description}}
<!--                     
                      <a href="#"><img src="{{$LAYOUT_HELPER_URL}}front/img/btn_ecit.png" alt="" /></a> <a href="#"><img src="{{$LAYOUT_HELPER_URL}}front/img/btn_delete.png" alt="" /></a>
-->                       
                    </p></td>
                  <td class="bd1b p10t p5b top">${{$item.price}}</td>
                  <td class="bd1b p10t p5b top"><a href="{{$APP_BASE_URL}}restaurant/cart?meal_id={{$item.meal_id}}&mark={{$mark}}&time={{$time}}&date={{$date}}"><img src="{{$LAYOUT_HELPER_URL}}front/img/btn_select.png" alt="" /></a></td>
                </tr>
                {{/foreach}}	                
              </table>
<!--              
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
-->              
			  {{if $countAllPages > 1}}
              <div class="float_right">
                <ul class="list_3">
                	{{if $prevPage}}
						<li><a href="?page={{$prevPage}}&id={{$res_id}}&mark={{$mark}}&date={{$date}}&time={{$time}}&type={{$type}}"><img src="{{$LAYOUT_HELPER_URL}}front/img/back2.png" alt="" /></a></li>
					{{/if}}
					{{foreach from=$prevPages item=item}}
						<li><a href="?page={{$item}}&id={{$res_id}}&mark={{$mark}}&date={{$date}}&time={{$time}}&type={{$type}}">{{$item}}</a></li>
					{{/foreach}}
						<li><a href="#" class="current" title="{{$currentPage}}">{{$currentPage}}</a></li>
					{{foreach from=$nextPages item=item}}
						<li><a href="?page={{$item}}&id={{$res_id}}&mark={{$mark}}&date={{$date}}&time={{$time}}&type={{$type}}">{{$item}}</a></li>
					{{/foreach}}
					{{if $nextPage}}
						<li><a href="?page={{$nextPage}}&id={{$res_id}}&mark={{$mark}}&date={{$date}}&time={{$time}}&type={{$type}}"><img src="{{$LAYOUT_HELPER_URL}}front/img/next2.png" alt="" /></a></li>
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