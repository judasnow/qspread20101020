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
                required: true,
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
            <div class="bg_howitwork">
                <p class="title1">Sign Up Now</p>
                <p class="p5t">Enter your information below to become a QuickSpread Restaurant Partner</p>
                
                
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
            
            
                <p class="p15t color_2"><b>Account Information </b></p>
                <div class="input_form">
                
                <label class="w155">Username:<span class="red">*</span></label>
                <input name="user[username]" type="text" value="{{$user.username}}" class="w270" /><br />
                
                <label class="w155">Password:<span class="red">*</span></label>
                <input name="user[password]" id="password" type="password" value="{{$user.password}}" class="w270" /><br />
                 <label class="w155"> </label>(More than 6 characters)<br/>
                
                <label class="w155">Confirm Password:<span class="red">*</span></label>
                <input name="user[retype_password]" type="password" value="{{$user.retype_password}}" class="w270" /><br />
                
                
                
                <label class="w155">Owner's Name:<span class="red">*</span></label>
                <input name="data[owner]" type="text" value="{{$data.owner}}" class="w270" /><br />
                
                <label class="w155">Owner's Phone Number:<span class="red">*</span></label>
                <input name="data[owner_phone]" type="text" value="{{$data.owner_phone}}" class="w270" /><br />
                
                <label class="w155">Owner's Email Address:<span class="red">*</span></label>
                <input name="data[owner_email]" type="text" value="{{$data.owner_email}}" class="w270" /><br />
                
                
                
                
                <p class="p15t color_2"><b>Restaurant Information</b></p>             
                  
                <label class="w155">Restaurant Name:<span class="red">*</span></label>
                <input name="data[name]" type="text" value="{{$data.name}}" class="w270" /><br />
                
                <label class="w155">Restaurant Website:</label>
                <input name="data[website]" type="text" value="{{$data.website}}" class="w270" /><br />
                
                <label class="w155">Cuisine:<span class="red">*</span></label>
                <input name="data[cuisine]" type="text" value="{{$data.cuisine}}" class="w270" /><br />
                
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
                
                
                
                
                <br/>
                <p class="p15t color_2"><b>Hours of Operation</b></p>               
                
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
                <p class="p5t"><b>Please note:</b> Five additional minutes are added to all lead times for transmission and confirmation of orde</p>
                <br/>
                              
                              
                 <!-- PICKUP      --> 
                         
                <label class="w155"><input {{if $data.check.pickup}} checked="checked" {{/if}}  name="data[check][pickup]" type="checkbox" value="1" class="mid m20r" style="border:none;" id="pickup" onclick="toggleDiv(this.id);"/> Pickup</label>
                    <span id="pickup_div" {{if !$data.check.pickup}}style="display: none;"{{/if}}> - Lead Time: <select name="data[pickup]">
                    
                    {{foreach from=$leadTimeNormal item=item}}
                    <option {{if $data.pickup == $item.name}} selected="selected" {{/if}} value="{{$item.name}}">{{$item.name}}</option>
                    {{/foreach}}
                
                </select> (Time from Receiving Order to prepared for Customer)</span>

                <br style="clear:both;"/>
                
                
                 <!-- CURBSIDE --> 
                
                <label class="w155"><input {{if $data.check.curbside}} checked="checked" {{/if}}  name="data[check][curbside]" type="checkbox" value="1" class="mid m20r" style="border:none;" id="curbside" onclick="toggleDiv(this.id);" /> Curbside</label>
                <span class="rsu-info" {{if !$data.check.curbside}}style="display: none;"{{/if}} id="curbside_div"> - Lead Time: <select name="data[curbside]">
                    
                    {{foreach from=$leadTimeNormal item=item}}
                    <option  {{if $data.curbside == $item.name}} selected="selected" {{/if}} value="{{$item.name}}">{{$item.name}}</option>
                    {{/foreach}}
                
                </select> (Time from Receiving Order to prepared for Customer)</span>
                
                <br style="clear:both;"/>
                
                
                
                
                
                 <!-- DELIVERY --> 
                <label class="w155"><input {{if $data.check.delivery}} checked="checked" {{/if}}  name="data[check][delivery]" type="checkbox" value="1" class="mid m20r" style="border:none;" id="delivery" onclick="toggleDiv(this.id);" /> Delivery</label>
                
                <span class="rsu-info" {{if !$data.check.delivery}}style="display: none;"{{/if}} id="delivery_div"> - Lead Time: <select name="data[delivery]">
                    
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
                
                <label class="w155"><input {{if $data.check.catering_pickup}} checked="checked" {{/if}}  name="data[check][catering_pickup]" type="checkbox" value="1" class="mid m20r" style="border:none;"  id="catering_pickup" onclick="toggleDiv(this.id);"/> Catering Pickup</label>
                
                <span class="rsu-info" {{if !$data.check.catering_pickup}}style="display: none;"{{/if}} id="catering_pickup_div"> - Lead Time: <select  name="data[catering_pickup]">
                    
                    {{foreach from=$leadTimeCatering item=item}}
                    <option  {{if $data.catering_pickup == $item.name}} selected="selected" {{/if}} value="{{$item.name}}">{{$item.name}}</option>
                    {{/foreach}}
                
                </select></span>
                
                <br style="clear:both;"/>
                
                
                
                
                
                
                
                
                <!--  CATERING DELIVERY --> 
                <label class="w155"><input  {{if $data.check.catering_delivery}} checked="checked" {{/if}}  name="data[check][catering_delivery]" type="checkbox" value="1" class="mid m20r" style="border:none;"  id="catering_delivery" onclick="toggleDiv(this.id);"/> Catering Delivery</label>
                
                <span class="rsu-info" {{if !$data.check.catering_delivery}}style="display: none;"{{/if}} id="catering_delivery_div"> - Lead Time: <select name="data[catering_delivery]">
                    
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
                
                <br style="clear:both;"/>
            
            </div>
                <br />
                <br />
                <input type="image" src="{{$LAYOUT_HELPER_URL}}front/img/bt_conti.jpg" style="padding:0px;"/>
            </div>
            
</form>