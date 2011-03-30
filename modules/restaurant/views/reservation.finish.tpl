<link href="{{$LAYOUT_HELPER_URL}}front/css/jquery-ui.custom.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="{{$LAYOUT_HELPER_URL}}front/js/jquery.numeric.js"></script>


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
    $(".integer").numeric(false);
    $("#reservation").validate({
        rules: {
            'search[quantity]': "required"
        },
        messages: {
            'search[quantity]': ""
        }
    }); 
});

</script>
<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAfC0VI1TK8TYdshSdnHDNSxSqPMIOVuOlI2qqAysSIBkOl7bFVRQuTcvOGXqAtdqSpgpuj-hTMLRf8Q" type="text/javascript"></script>
<div id="main">
      <div class="w201 float_left">
        <div class="top1 m20t"></div>
        <div class="cen1">
          <div class="cen_1">
            <div class="p10"> <img src="{{$LAYOUT_HELPER_URL}}front/img/tt_yourreser.jpg" alt="" />
              
              
              <div class="input_form p20b">
              <br/>
                <p>Date: <span class="color_1">{{$search.date}}</span></p> 
                <br/>
                <p>Time: <span class="color_1">{{$search.unixTime|date_format:'%I:%M %p'}}</span></p> 
                <br/>
                <p>Party Size: <span class="color_1">{{$search.quantity}}</span></p> 
                
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
        {{$arr_restaurant.city}}, {{$arr_restaurant.state}} <span class="color_1"><a href="#" onclick="return fbs_click('{{$address_restaurant}}')">Map</a> </span><br />
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
        
        <!-- START CONFIRMATION -->
        <div class="top2"></div>
        <div class="cen2">
          <div class="cen_2">
            <div class="p10 resevation">
              <p style="color:#300;font-size:18px;padding-bottom:10px;">Confirmed</p>
                <table width="659" style="border:1px solid #CCC">
                    <tr style="background:#DFDFDF;color:#630;">
                        <td width="199" class="p10">
                        <b>{{$res.name}}</b><br />
                        {{$arr_restaurant.street}}<br />
                        {{$arr_restaurant.city}}, {{$arr_restaurant.state}}
                        </td>
                        <td width="176" class="p10">
                        {{$search.unixTime|date_format:'%A, %m/%d/%Y'}}
                        </td>
                        <td width="123" class="p10">
                        {{$search.unixTime|date_format:'%I:%M %p'}}
                        </td>
                        <td width="141" class="p10">                            
                        Party of {{$search.quantity}} {{if 1==$search.quantity}}person{{else}}people{{/if}}
                        </td>
                    </tr>
                </table>
            </div>
          </div>
        </div>
        <div class="bot2"></div>
        <!-- END CONFIRMATION -->
        
        <!-- START INFO -->
        <form method="POST" id="info" name="info">
        <div class="find_result m10t">
             <div class="top2"></div>
        <div class="cen2">
          <div class="cen_2">
            <div class="p10 resevation">
              <p style="color:#300;font-size:18px;padding-bottom:10px;"><span id="lblInformationUsed"><strong>Complete your reservation below</strong></span></p>
                              

                  <div class="p10">
                        <div class="">
                        
                        <!-- ERROR -->
                        {{if null != $error}}
                        <p class="red"><b>Error</b>: {{$error}}</p>
                        <br/>
                        {{/if}}
                        <!-- END ERROR -->
                        
                        
                <p class="color_2 uper"><b>Your information</b></p>
                <div class="input_form {{if '1' == $res.reser_deposit_onoff}}bd1b{{/if}}">   
                                    
                        <label class="w130 m10r right">Full Name:<span class="red">*</span></label>
                        <input type="text" value="{{$data.full_name}}" class="w230" id="data[full_name]" name="data[full_name]"/><br />
                        
                        <label class="w130 m10r right">Address:<span class="red">*</span></label>
                        <input type="text" value="{{$data.address}}" class="w230" id="data[address]" name="data[address]"/><br />
                        
                        <label class="w130 m10r right">Suite#/Apt.#/Note:</label>
                        <input type="text" value="{{$data.note}}" class="w230" id="data[note]" name="data[note]"/><br />
                        
                        <label class="w130 m10r right">City:<span class="red">*</span></label>
                        <input type="text" value="{{$data.city}}" class="w230" id="data[city]" name="data[city]" /><br />
                        
                        <label class="w130 m10r right">State:<span class="red">*</span></label>
                        <select class="w235" id="data[state]" name="data[state]">
                            {{foreach from=$arr_province item=item}}    
                            <option {{if $data.state == $item.province}} selected="selected" {{/if}} value="{{$item.province_code}}">{{$item.province}}</option>
                            {{/foreach}}
                        </select><br />
                        
                        <label class="w130 m10r right">Postal Code:<span class="red">*</span></label>
                        <input type="text" value="{{$data.zip_code}}" class="w230" id="data[zip_code]" name="data[zip_code]" /><br />
                        
                        <label class="w130 m10r right">Phone:(XXX-XXX-XXXX)<span class="red">*</span></label>
                        <input type="text" value="{{if $data.phone1}}{{$data.phone1}}{{else}}000{{/if}}" class="w70" id="data[phone1]" name="data[phone1]" />
                        <input type="text" value="{{if $data.phone2}}{{$data.phone2}}{{else}}000{{/if}}" class="w70" id="data[phone2]" name="data[phone2]" />
                        <input type="text" value="{{if $data.phone3}}{{$data.phone3}}{{else}}0000{{/if}}" class="w70" id="data[phone3]" name="data[phone3]" /><br />

              
                        <label class="w130 m10r right">Email:<span class="red">*</span></label>
                        <input type="text" value="{{$data.email}}" class="w230" id="data[email]" name="data[email]" /><br />
                        
                        
                        <label class="w130 m10r right"><b>Special Requests for {{$res.name}}</b>:</label>
                        <textarea name="data[special_request]" style="width: 460px; height: 50px;">{{$data.special_request}}</textarea><br />
                        
                        {{if '1' != $res.reser_deposit_onoff}}
                        <label class="w130 m10r right">&nbsp;</label>
                        <input type="submit" style="background:url({{$LAYOUT_HELPER_URL}}front/img/complatefree.png);width:184px;height:21px;border:0px;cursor: pointer;" value="" />
                       
                        {{/if}}
                        <br />
                </div> 
                <br class="clear" />
                
                {{if '1' == $res.reser_deposit_onoff}}
                <p class="color_2 uper"><b>Debit/Credit Card Information</b></p>
                <div class="input_form">   
                        <label class="w130 m10r right">Card Type:<span class="red">*</span></label>
                        <select class="w235" name="data[card_type]">
                            <option value="Visa" selected="selected">Visa</option>
                            <option value="MasterCard">MasterCard</option>
                            <option value="Amex">American Express</option>
                            <option value="Discover">Discover</option>
                        </select><br />
                        
                        <label class="w130 m10r right">Card Number:<span class="red">*</span></label>
                        <input type="text" value="" class="w230" name="data[card_number]"/>
                        
                        
                        <img src="{{$LAYOUT_HELPER_URL}}front/img/card_visa.gif" style="vertical-align: top;">
                        <img src="{{$LAYOUT_HELPER_URL}}front/img/card_master.gif" style="vertical-align: top;">
                        <img src="{{$LAYOUT_HELPER_URL}}front/img/card_amex.gif" style="vertical-align: top;">
                        <img src="{{$LAYOUT_HELPER_URL}}front/img/card_dis.gif" style="vertical-align: top;">
                        <br />
                        
                        
                        
                        <label class="w130 m10r right">Expiration Date:<span class="red">*</span></label>
                        <select class="" name="data[card_month]" style="width: 100px;">
                            <option value="1">01</option>
                            <option value="2">02</option>
                            <option value="3">03</option>
                            <option value="4">04</option>
                            <option value="5">05</option>
                            <option value="6">06</option>
                            <option value="7">07</option>
                            <option value="8">08</option>
                            <option value="9">09</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                        </select>
                        <select class="" name="data[card_year]"  style="width: 131px;">
                            {{foreach from=$years item=item}}
                            <option value="{{$item}}">{{$item}}</option>
                            {{/foreach}}
                        </select>
                        <br />
                        
                        <label class="w130 m10r right">Card Verification Number:<span class="red">*</span></label>
                        <input type="text" value="" class="w230" name="data[card_cvv]" /><br />
                        <br/>
                        
                        <label class="w130 m10r right">&nbsp;</label>
                        <input type="submit" style="background:url({{$LAYOUT_HELPER_URL}}front/img/complatefree.png);width:184px;height:21px;border:0px;cursor: pointer;" value="" />
                        <br />
                </div> 
                {{/if}}
                <br class="clear" />
            </div>
                        
                  </div>



            </div>
          </div>
        </div>
        <div class="bot2"></div>
        </div>
        </form>
        <!-- END INFO -->
        
        
        
      </div>
      <div class="clear"></div>
    </div>
    


<script type="text/javascript">
$().ready(function() {
    // validate signup form on keyup and submit
    $("#info").validate({
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

            {{if '1' == $res.reser_deposit_onoff}}
            'data[card_number]':  {
                required: true,
                rangelength: [15, 16]
            },
            'data[card_cvv]': "required", 
            {{/if}}
            
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
            
            {{if '1' == $res.reser_deposit_onoff}}
            'data[card_number]': "",
            'data[card_cvv]': "",
            {{/if}}
                 
            'data[email]': ""      
        }
    }); 
});

</script>