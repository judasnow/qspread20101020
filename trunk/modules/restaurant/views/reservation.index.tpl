<link href="{{$LAYOUT_HELPER_URL}}front/css/jquery-ui.custom.css" rel="stylesheet" type="text/css" />


<script type="text/javascript">


function fbs_click(address){	
    u = 'http://nyhederne.tv2.dk/article.php/id-35170936:clinton-er-f%C3%A6rdig-som-stemmej%C3%A6ger.html';
    t = document.title;
    o = 'toolbar=0,status=0,width=626,height=436';
    window.open('{{$APP_BASE_URL}}restaurant/map?address='+address, 'sharer', o);
    
    return false;
}  

$(function() {
    $( "#date" ).datepicker({
    	minDate: new Date()
     });
});

</script>
<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAfC0VI1TK8TYdshSdnHDNSxSeGj8z-4c3Gkvm2sCURIKgXVhMtBRfYmT9EDfSCVyiP26LwRJpOXAiBg" type="text/javascript"></script>
<div id="main">
      <div class="w201 float_left">
        <div class="top1 m20t"></div>
        <div class="cen1">
          <div class="cen_1">
            <div class="p10"> <img src="{{$LAYOUT_HELPER_URL}}front/img/tt_yourreser.jpg" alt="" />
              
              
              <div class="input_form p20b">
              <br/>
                <p>Date: <span class="color_1">{{$date}}</span></p> 
                <br/>
                <p>Time: <span class="color_1">{{$time}}</span></p> 
                <br/>
                <p>Party Size: <span class="color_1">{{$partySize}}</span></p> 
                
                {{if '1' == $res.reser_deposit_onoff}}
                <br/>
                <p>Deposit: <span class="color_1">${{$res.reser_deposit}}</span></p> 
                {{/if}}
                
              </div>
              
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
            <li  ><a href="{{$APP_BASE_URL}}restaurant/meal?id={{$resId}}"><span>General menu</span></a></li>
            <li ><a href="{{$APP_BASE_URL}}restaurant/meal?id={{$resId}}&type=1"><span>Catering</span></a></li>
            <li  class="current" ><a href="{{$APP_BASE_URL}}restaurant/reservation/index/rid/{{$resId}}"><span>Reservation</span></a></li>
          </ul>
        </div>

        <br class="clear" />
        
        
        <!-- SEARCH FORM -->
        <div class="top2"></div>
        <div class="cen2">
          <div class="cen_2">
            <div class="p10 resevation">
              <p style="color:#300;font-size:18px;padding-bottom:10px;">Make a reservation now </p>
                <table width="659" style="border-top:1px dotted #666">
                    <tr>
                        <td width="156"><span style="color:#300">Date</span> <br />
                            <input type="text" id="date" name="search[date]" style="width: 148px; height: 18px;" value="{{$search.date}}">
                        </td>
                        <td width="161"><span style="color:#300">Time</span> <br />
                            <select>
                                {{foreach from=$allTimes item=item}}
                                <option value="{{$item.time}}">{{$item.text}}</option>
                                {{/foreach}}
                            </select>
                        </td>
                        <td width="176"><span style="color:#300">Party Size</span> <br />
                            <select>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>                             
                            </select>
                        </td>
                        <td width="146">
                            <input type="button" value="" class="btn_find" />
                        </td>
                    </tr>
                </table>
            </div>
          </div>
        </div>
        <div class="bot2"></div>
        <!-- END SEARCH FORM -->
        
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