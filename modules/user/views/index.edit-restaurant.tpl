<script type="text/javascript">
function toggleDiv(id)
{
	$("#" + id + '_div').toggle();
}

function makeSameAbove(id)
{
	var pid = id - 1;
	$("#date" + id).attr('checked', true);
	$("#date" + id + "_start").val($("#date" + pid + "_start").val());
    $("#date" + id + "_end").val($("#date" + pid + "_end").val());
	
}

$().ready(function() {
    // validate signup form on keyup and submit
    $("#register").validate({
        rules: {
            'user[username]': "required",
            'user[password]':  {
                minlength: 6
            },
            'user[retype_password]':  {
                equalTo: "#password"
            },
            'data[owner]': "required",
            'data[owner_phone]': "required",
            'data[name]': "required",
            'data[cuisine]': "required",
            'data[street]': "required",
            'data[city]': "required",
            'data[zip]': "required",
            'data[manager]': "required",
            'data[phone]': "required",
            'data[fax]': "required",
            'data[owner_email]': {
                required: true,
                email: true
            }
        },
        messages: {
            'user[username]': "",
            'user[password]': "",
            'user[retype_password]': "",
            'data[owner]': "",
            'data[owner_phone]': "",
            'data[name]': "",
            'data[cuisine]': "",
            'data[street]': "",
            'data[city]': "",
            'data[zip]': "",
            'data[manager]': "",
            'data[phone]': "",
            'data[fax]': "",
            'data[owner_email]': ""
        }
    }); 
});
</script>
<form method="POST" name="register" id="register">
            <div class="bg_howitwork" style="padding-top:30px; padding-left: 100px;">
                <p class="title1">My Restaurant</p>
                
                
                {{if $errors|@count > 0}}        
                <div class="register_error"  style="width: 375px;">
                    <b>Error:</b>
                    <ul>
                        {{foreach from=$errors item=item}}
                        <li>{{$item}}</li>
                        {{/foreach}}
                    </ul>
                </div>
                {{/if}}
                
                {{if $updateSuccess}}     
                <br/>   
                <div style="width: 430px;padding: 10px 0; color: green; font-weight: bold; border-top: 1px solid green; border-bottom: 1px solid green;">
                    Your restaurant is updated successfully.
                </div>
                <br/>
                {{/if}}
            
            
                <p class="p15t color_2"><b>Account Information </b></p>
                <div class="input_form">
                
                <label class="w155">Username:<span class="red">*</span></label>
                <input name="user[username]" type="text" value="{{$user.username}}" disabled="disabled" class="w270" /><br />
                
                <label class="w155">New Password:</label>
                <input name="user[password]" id="password" type="password" value="" class="w270" /><br />
                 <label class="w155"> </label>(More than 6 characters)<br/>
                
                <label class="w155">Confirm New Password:</label>
                <input name="user[retype_password]" type="password" value="" class="w270" /><br />
                
                
                
                <label class="w155">Owner's Name:<span class="red">*</span></label>
                <input name="data[owner]" type="text" value="{{$data.owner}}" class="w270" /><br />
                
                <label class="w155">Owner's Phone Number:<span class="red">*</span></label>
                <input name="data[owner_phone]" type="text" value="{{$data.owner_phone}}" class="w270" /><br />
                
                <label class="w155">Owner's Email Address:<span class="red">*</span></label>
                <input name="data[owner_email]" type="text" value="{{$data.owner_email}}" class="w270" disabled="disabled"/><br />
                
                
                
                
                <p class="p15t color_2"><b>Restaurant Information</b></p>        
                <br/>     
                  
                <label class="w155">Restaurant Name:<span class="red">*</span></label>
                <input name="data[name]" type="text" value="{{$data.name}}" class="w270" /><br />
                
                <label class="w155">Restaurant Website:</label>
                <input name="data[website]" type="text" value="{{$data.website}}" class="w270" /><br />
                
                <label class="w155">Cuisine:<span class="red">*</span></label>
                <select name="data[cuisine]" style="width: 121px;" >
                        {{foreach from=$cuisines item=item}}
                        <option {{if $item.value==$data.cuisine}} selected="selected" {{/if}} value="{{$item.value}}">{{$item.name}}</option>
                        {{/foreach}}
                </select>
                <br/>
                
                <label class="w155">Street:<span class="red">*</span></label>
                <input name="data[street]" type="text" value="{{$data.street}}" class="w270" /><br />
                
                <label class="w155">City:<span class="red">*</span></label>
                <input name="data[city]" type="text" value="{{$data.city}}" class="w270" /><br />
                
                <label class="w155">State:<span class="red">*</span></label>
                <select name="data[state]" style="width: 121px;" >
                        {{foreach from=$allProvinces item=item}}
                        <option {{if $item.province==$data.state}} selected="selected" {{/if}} value="{{$item.province}}">{{$item.province}}</option>
                        {{/foreach}}
                </select>
                
                <span class="w175 right">Postal code:<span class="red">*</span></span>
                <input name="data[zip]" type="text" value="{{$data.zip}}" class="w70" /><br />
                
                <label class="w155">Manager's Name:<span class="red">*</span></label>
                <input name="data[manager]" type="text" value="{{$data.manager}}" class="w270" /><br />
                
                <label class="w155">Phone Number:<span class="red">*</span></label>
                <input name="data[phone]" type="text" value="{{$data.phone}}" class="w270" /><br />
                
                <label class="w155">Fax Number:<span class="red">*</span></label>
                <input name="data[fax]" type="text" value="{{$data.fax}}" class="w270" /><br />
                <label class="w155">Description:</label>
                <textarea name="data[description]" cols="79" rows="5">{{$data.description}}</textarea>
                
                
                
                <br/>
                <p class="p15t color_2"><b>Hours of Operation</b></p>    
                <br/>           
                
                <label class="w155"><input checked="checked" type="checkbox" value="1" class="mid m20r" style="border:none;" name="data[date_mon]" {{if $data.date_mon}} checked="checked" {{/if}}/> Mon:</label>
                <input type="text" value="{{if $data.date_mon_start}}{{$data.date_mon_start}}{{else}}08:00{{/if}}" class="w50" name="data[date_mon_start]" id="date1_start"/> 
                - 
                <input type="text" value="{{if $data.date_mon_end}}{{$data.date_mon_end}}{{else}}22:00{{/if}}" class="w50" name="data[date_mon_end]" id="date1_end"/>
                <br style="clear:both;"/>
                
                <label class="w155"><input type="checkbox" value="1" class="mid m20r" style="border:none;" name="data[date_tue]" id="date2"  {{if $data.date_tue}} checked="checked" {{/if}}/> Tue:</label>
                <input type="text" value="{{$data.date_tue_start}}" class="w50" name="data[date_tue_start]" id="date2_start"/>
                 - 
                <input type="text" value="{{$data.date_tue_end}}" class="w50" name="data[date_tue_end]" id="date2_end"/> 
                <input onclick="makeSameAbove(2);" type="checkbox" value="1" class="mid m20l" style="border:none;" /> Same as above
                <br style="clear:both;"/>
                
                <label class="w155"><input type="checkbox" value="1" class="mid m20r" style="border:none;" name="data[date_wed]" id="date3"  {{if $data.date_wed}} checked="checked" {{/if}}/> Wed:</label>
                <input type="text" value="{{$data.date_wed_start}}" class="w50" name="data[date_wed_start]" id="date3_start"/> 
                -
                <input type="text" value="{{$data.date_wed_end}}" class="w50" name="data[date_wed_end]" id="date3_end"/> 
                <input onclick="makeSameAbove(3);" type="checkbox" value="1" class="mid m20l" style="border:none;" /> Same as above
                <br style="clear:both;"/>
                
                <label class="w155"><input type="checkbox" value="1" class="mid m20r" style="border:none;" name="data[date_thu]" id="date4"  {{if $data.date_thu}} checked="checked" {{/if}}/> Thus:</label>
                <input type="text" value="{{$data.date_thu_start}}" class="w50" name="data[date_thu_start]" id="date4_start"/> 
                -
                <input type="text" value="{{$data.date_thu_end}}" class="w50" name="data[date_thu_end]" id="date4_end"/> 
                <input onclick="makeSameAbove(4);" type="checkbox" value="1" class="mid m20l" style="border:none;" /> Same as above
                <br style="clear:both;"/>
                
                <label class="w155"><input type="checkbox" value="1" class="mid m20r" style="border:none;" name="data[date_fri]" id="date5"  {{if $data.date_fri}} checked="checked" {{/if}}/> Fri:</label>
                <input type="text" value="{{$data.date_fri_start}}" class="w50" name="data[date_fri_start]" id="date5_start"/> 
                -
                <input type="text" value="{{$data.date_fri_end}}" class="w50" name="data[date_fri_end]" id="date5_end"/> 
                <input onclick="makeSameAbove(5);" type="checkbox" value="1" class="mid m20l" style="border:none;" /> Same as above
                <br style="clear:both;"/>
                
                <label class="w155"><input type="checkbox" value="1" class="mid m20r" style="border:none;" name="data[date_sat]" id="date6"  {{if $data.date_sat}} checked="checked" {{/if}}/> Sat:</label>
                <input type="text" value="{{$data.date_sat_start}}" class="w50" name="data[date_sat_start]" id="date6_start"/> 
                -
                <input type="text" value="{{$data.date_sat_end}}" class="w50" name="data[date_sat_end]" id="date6_end"/> 
                <input onclick="makeSameAbove(6);" type="checkbox" value="1" class="mid m20l" style="border:none;" /> Same as above
                <br style="clear:both;"/>
                
                <label class="w155"><input type="checkbox" value="1" class="mid m20r" style="border:none;" name="data[date_sun]" id="date7"  {{if $data.date_sun}} checked="checked" {{/if}}/> Sun:</label>
                <input type="text" value="{{$data.date_sun_start}}" class="w50" name="data[date_sun_start]" id="date7_start"/> 
                -
                <input type="text" value="{{$data.date_sun_end}}" class="w50" name="data[date_sun_end]" id="date7_end"/> 
                <input onclick="makeSameAbove(7);" type="checkbox" value="1" class="mid m20l" style="border:none;" /> Same as above
                <br style="clear:both;"/>
                
                
                <br/>
                <p class="p15t color_2"><b>Available Order Types</b></p>
                <br/>
                <p class="p5t"><b>Please note:</b> Five additional minutes are added to all lead times for transmission and confirmation of orde</p>
                <br/>
                              
                              
                 <!-- PICKUP      --> 
                         
                <label class="w155"><input {{if $data.pickup}} checked="checked" {{/if}}  name="data[check][pickup]" type="checkbox" value="1" class="mid m20r" style="border:none;" id="pickup" onclick="toggleDiv(this.id);"/> Pickup</label>
                    <span id="pickup_div" {{if !$data.pickup}}style="display: none;"{{/if}}> - Lead Time: <select name="data[pickup]">
                    
                    {{foreach from=$leadTimeNormal item=item}}
                    <option {{if $data.pickup == $item.name}} selected="selected" {{/if}} value="{{$item.name}}">{{$item.name}}</option>
                    {{/foreach}}
                
                </select> (Time from Receiving Order to prepared for Customer)</span>

                <br style="clear:both;"/>
                
                
                 <!-- CURBSIDE --> 
                
                <label class="w155"><input {{if $data.curbside}} checked="checked" {{/if}}  name="data[check][curbside]" type="checkbox" value="1" class="mid m20r" style="border:none;" id="curbside" onclick="toggleDiv(this.id);" /> Curbside</label>
                <span class="rsu-info" {{if !$data.curbside}}style="display: none;"{{/if}} id="curbside_div"> - Lead Time: <select name="data[curbside]">
                    
                    {{foreach from=$leadTimeNormal item=item}}
                    <option  {{if $data.curbside == $item.name}} selected="selected" {{/if}} value="{{$item.name}}">{{$item.name}}</option>
                    {{/foreach}}
                
                </select> (Time from Receiving Order to prepared for Customer)</span>
                
                <br style="clear:both;"/>
                
                
                
                
                
                 <!-- DELIVERY --> 
                <label class="w155"><input {{if $data.delivery}} checked="checked" {{/if}}  name="data[check][delivery]" type="checkbox" value="1" class="mid m20r" style="border:none;" id="delivery" onclick="toggleDiv(this.id);" /> Delivery</label>
                
                <span class="rsu-info" {{if !$data.delivery}}style="display: none;"{{/if}} id="delivery_div"> - Lead Time: <select name="data[delivery]">
                    
                    {{foreach from=$leadTimeNormal item=item}}
                    <option  {{if $data.delivery == $item.name}} selected="selected" {{/if}} value="{{$item.name}}">{{$item.name}}</option>
                    {{/foreach}}
                
                </select>
                <span style="margin-left: 10px;">&nbsp;</span>
                    <input {{if $data.delivery_limit_hour}} checked="checked" {{/if}}  type="checkbox" value="1" name="data[delivery_limit_hour]" style="vertical-align: middle;" > Delivery available for limited hours<br style="clear:both;"/>
                
                <label class="w155">&nbsp;</label>
                <span style="">- Delivery Fee: $<input type="text" style="width: 30px;"  maxlength="5"  name="data[delivery_charge]" value="{{$data.delivery_charge}}">
                               - Minimum Order: $<input type="text" style="width: 30px;" maxlength="5"  name="data[delivery_minimum]"  value="{{$data.delivery_minimum}}"></span><br>
                </span>
                
                <br style="clear:both;"/>
                
                
                
                
                
                 <!-- CATERING PICKUP --> 
                
                <label class="w155"><input {{if $data.catering_pickup}} checked="checked" {{/if}}  name="data[check][catering_pickup]" type="checkbox" value="1" class="mid m20r" style="border:none;"  id="catering_pickup" onclick="toggleDiv(this.id);"/> Catering Pickup</label>
                
                <span class="rsu-info" {{if !$data.catering_pickup}}style="display: none;"{{/if}} id="catering_pickup_div"> - Lead Time: <select  name="data[catering_pickup]">
                    
                    {{foreach from=$leadTimeCatering item=item}}
                    <option  {{if $data.catering_pickup == $item.name}} selected="selected" {{/if}} value="{{$item.name}}">{{$item.name}}</option>
                    {{/foreach}}
                
                </select></span>
                
                <br style="clear:both;"/>
                
                
                
                
                
                
                
                
                <!--  CATERING DELIVERY --> 
                <label class="w155"><input  {{if $data.catering_delivery}} checked="checked" {{/if}}  name="data[check][catering_delivery]" type="checkbox" value="1" class="mid m20r" style="border:none;"  id="catering_delivery" onclick="toggleDiv(this.id);"/> Catering Delivery</label>
                
                <span class="rsu-info" {{if !$data.catering_delivery}}style="display: none;"{{/if}} id="catering_delivery_div"> - Lead Time: <select name="data[catering_delivery]">
                    
                    {{foreach from=$leadTimeCatering item=item}}
                    <option  {{if $data.catering_delivery == $item.name}} selected="selected" {{/if}} value="{{$item.name}}">{{$item.name}}</option>
                    {{/foreach}}
                
                </select>
                <span style="margin-left: 10px;">&nbsp;</span>
                    <input {{if $data.catering_delivery_limit_hour}} checked="checked" {{/if}}   type="checkbox" value="1" name="data[catering_delivery_limit_hour]" style="vertical-align: middle;" > Delivery available for limited hours<br style="clear:both;"/>
                
                <label class="w155">&nbsp;</label>
                <span style="">- Delivery Fee: $<input type="text" style="width: 30px;" maxlength="5" name="data[catering_delivery_charge]"  value="{{$data.catering_delivery_charge}}">
                               - Minimum Order: $<input type="text" style="width: 30px;" maxlength="5" name="data[catering_delivery_minimum]"   value="{{$data.catering_delivery_minimum}}"></span><br>
                </span>
                
                <br/><br/>
                
                 <p class="p15t color_2"><b>Table Reservation</b></p> 
                 <br/>            
                  
                <label class="w155">Reservation:<span class="red">*</span></label>
                <select name="data[reser_onoff]" style="width: 121px;" >
                        <option {{if 1==$data.reser_onoff}} selected="selected" {{/if}} value="1">On</option>
                        <option {{if 0==$data.reser_onoff}} selected="selected" {{/if}} value="1">Off</option>
                </select>
                <br />
                
                <label class="w155">Deposit:</label>
                <select name="data[reser_deposit_onoff]" style="width: 121px;" >
                        <option {{if 1==$data.reser_deposit_onoff}} selected="selected" {{/if}} value="1">On</option>
                        <option {{if 0==$data.reser_deposit_onoff}} selected="selected" {{/if}} value="1">Off</option>
                </select>
                &nbsp;&nbsp;&nbsp;$ <input name="data[reser_deposit]" type="text" value="{{$data.reser_deposit}}" style="width: 125px;" />
                <br />
                
                <label class="w155">Seat quantity:</label>
                <input name="data[reser_quantity]" type="text" value="{{$data.reser_quantity}}" style="width:115px;" /><br />
                
                <label class="w155">Period of Repast:</label>
                
                
                <select name="data[reser_period]" style="width: 121px;" >
                     <option {{if '900' == $data.reser_period}} selected="selected" {{/if}} value="900">15 min</option>
                     <option {{if '1800' == $data.reser_period}} selected="selected" {{/if}} value="1800">30 min</option>
                     <option {{if '2700' == $data.reser_period}} selected="selected" {{/if}} value="2700">45 min</option>
                     <option {{if '3600' == $data.reser_period}} selected="selected" {{/if}} value="3600">1 hour</option>
                     <option {{if '4500' == $data.reser_period}} selected="selected" {{/if}} value="4500">1 hour 15</option>
                     <option {{if '5400' == $data.reser_period}} selected="selected" {{/if}} value="5400">1 hour 30</option>
                     <option {{if '6300' == $data.reser_period}} selected="selected" {{/if}} value="6300">1 hour 45</option>
                     <option {{if '7200' == $data.reser_period}} selected="selected" {{/if}} value="7200">2 hours</option>
                     <option {{if '10800' == $data.reser_period}} selected="selected" {{/if}} value="10800">3 hours</option>
                     <option {{if '14400' == $data.reser_period}} selected="selected" {{/if}} value="14400">4 hours</option>
                     <option {{if '18000' == $data.reser_period}} selected="selected" {{/if}} value="18000">5 hours</option>
                </select>
                <br />
                
                
                <br style="clear:both;"/>
            
            </div>
                <br />
                <br />
                <input type="image" src="{{$LAYOUT_HELPER_URL}}front/img/btn_apply.png" style="padding:0px;"/>
            </div>
            
</form>