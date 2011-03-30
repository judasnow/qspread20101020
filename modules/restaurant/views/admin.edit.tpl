
<script type="text/javascript" src="{{$LAYOUT_HELPER_URL}}admin/js/ckfinder/ckfinder.js"></script> 
                        
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
            'data[owner_phone]': "required",
            'data[name]': "required",
            'data[street]': "required",
            'data[city]': "required",
            'data[zip]': "required",
            'data[manager]': "required",
            'data[phone]': "required",
            'data[fax]': "required"
        },
        messages: {
            'data[owner_phone]': "",
            'data[name]': "",
            'data[street]': "",
            'data[city]': "",
            'data[zip]': "",
            'data[manager]': "",
            'data[phone]': "",
            'data[fax]': ""
        }
    }); 
});

function chooseImage()
{
    // You can use the "CKFinder" class to render CKFinder in a page:
    var finder = new CKFinder();
    finder.basePath = '{{$LAYOUT_HELPER_URL}}admin/js/ckfinder/'; // The path for the installation of CKFinder (default = "/ckfinder/").
    finder.selectActionFunction = SetFileField;
    finder.popup();

    // It can also be done in a single line, calling the "static"
    // Popup( basePath, width, height, selectFunction ) function:
    // CKFinder.Popup( '../../', null, null, SetFileField ) ;
    //
    // The "Popup" function can also accept an object as the only argument.
    // CKFinder.Popup( { BasePath : '../../', selectActionFunction : SetFileField } ) ;
} 
// This is a sample function which is called when a file is selected in CKFinder.
function SetFileField( fileUrl )
{
    document.getElementById( 'chooseImage_img' ).src = fileUrl;
    document.getElementById( 'chooseImage_input' ).value = fileUrl;
    document.getElementById( 'chooseImage_div').style.display = '';
    document.getElementById( 'chooseImage_noImage_div' ).style.display = 'none';
}
function clearImage()
{
    document.getElementById( 'chooseImage_img').src = '';
    document.getElementById( 'chooseImage_input' ).value = '';
    document.getElementById( 'chooseImage_div' ).style.display = 'none';
    document.getElementById( 'chooseImage_noImage_div').style.display = '';
}
</script>
            <div class="content-box"><!-- Start Content Box -->
                
                <div class="content-box-header">
                    
                    <h3>Edit Restaurant</h3>
                    
                    <div class="clear"></div>
                    
                </div> <!-- End .content-box-header -->
                
                <div class="content-box-content">
                
                    <form action="" method="post"  name="register" id="register">
                    
                    <div class="tab-content" id="tab1">
                    
                        <!-- ERROR -->
                        {{if $errors|@count > 0}}
                        <div class="notification error png_bg">
                            <a href="#" class="close"><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/cross_grey_small.png" title="Close this notification" alt="close" /></a>
                            <div>
                                {{if $errors.main}}
                                    Error: {{$errors.main}}
                                {{else}}
                                    Error: Please check following information again
                                {{/if}} 
                                                                       
                            </div>
                        </div>
                        {{/if}}
                            <!-- Restaurant's fields -->
                            <p class="p15t green"><b>Account Information </b></p>
                                    
                                    <p><label class="w155">Username:</label>
                                    <b>{{$user.username}}</b> (<i>{{if '1' == $user.enabled}}Enabled{{else}}<span style="color: red;">Disabled</span>{{/if}}</i>, <a href="{{$APP_BASE_URL}}user/admin/edit-user/id/{{$user.user_id}}">Edit account</a>)</p>
                                    <br/>
                                    
                            
                                    <p class="p15t green"><b>Contact Information </b></p>
                                    
                                    <p><label class="w155">Owner's Name:</label>
                                    {{$data.owner}}  (<a href="{{$APP_BASE_URL}}user/admin/edit-user/id/{{$user.user_id}}">Edit name</a>)</p>
                                    
                                    <p><label class="w155">Owner's Phone Number:<span class="red">*</span></label>
                                    <input name="data[owner_phone]" type="text" value="{{$data.owner_phone}}" class="text-input small-input" /></p>
                                    
                                    <p><label class="w155">Owner's Email Address:</label>
                                    {{$data.owner_email}}  (<a href="{{$APP_BASE_URL}}user/admin/edit-user/id/{{$user.user_id}}">Edit email</a>)</p>
                                    
                                    <br/>
                                    <p class="p15t green"><b>Restaurant Information</b></p>    
                                    
                                    <!-- Logo -->
                                    <label class="w155">Restaurant Logo:<span class="red">*</span></label>
                                    <div style="float: left; margin: 10px;" id ="image_div">
                                    
                                            <input type="hidden" id="chooseImage_input" name="data[image]" value="{{$BASE_URL}}{{$data.image}}">
                                            <div id="chooseImage_div" style="{{if !$data.image}} display:none{{/if}}">
                                                <img src="{{$BASE_URL}}{{$data.image}}" id="chooseImage_img" style="max-width: 150px; border:dashed thin;"></img><br/>
                                            </div>
                                            <div id="chooseImage_noImage_div" style="width: 150px; border: thin dashed; text-align: center; padding:70px 0px; {{if $data.image}} display:none{{/if}} ">
                                                No image
                                            </div>
                                            <br/>
                                            <a href="javascript:chooseImage();">Choose image</a>
                                            | 
                                            <a href="javascript:clearImage();">Delete</a>
                                    </div>     
                                    <br style="clear: both;"/>  
                                    <br/>  
                                      
                                    <p><label class="w155">Restaurant Name:<span class="red">*</span></label>
                                    <input name="data[name]" type="text" value="{{$data.name}}" class="text-input small-input" /></p>
                                    
                                    <p><label class="w155">Restaurant Website:</label>
                                    <input name="data[website]" type="text" value="{{$data.website}}" class="text-input small-input" /></p>
                                    
                                    <p><label class="w155">Cuisine:<span class="red">*</span></label>
                                        {{if !$isNumberCuisine}}User suggested: <i>{{$data.cuisine}}</i> {{/if}} (<a href="{{$APP_BASE_URL}}category/admin/new-value/cid/1">Create new cuisine</a>)
                                    </p>
                                    
                                    <p><label class="w155"> </label>
                                    System matches:
                                    <select name="data[cuisine]" >
                                            {{foreach from=$cuisines item=item}}
                                            <option {{if $item.value==$data.cuisine}} selected="selected" {{/if}} value="{{$item.value}}">{{$item.name}}</option>
                                            {{/foreach}}
                                    </select></p>
                                    
                                    <p><label class="w155">Street:<span class="red">*</span></label>
                                    <input name="data[street]" type="text" value="{{$data.street}}" class="text-input small-input" /></p>
                                    
                                    <p><label class="w155">City:<span class="red">*</span></label>
                                    <input name="data[city]" type="text" value="{{$data.city}}" class="text-input small-input" /></p>
                                    
                                    <p><label class="w155">State:<span class="red">*</span></label>
                                    <select name="data[state]" >
                                            {{foreach from=$allProvinces item=item}}
                                            <option {{if $item.province==$data.state}} selected="selected" {{/if}} value="{{$item.province}}">{{$item.province}}</option>
                                            {{/foreach}}
                                    </select>
                                    </p>
                                    
                                    <p><label class="w155">Postal code:<span class="red">*</span></label>
                                    <input name="data[zip]" type="text" value="{{$data.zip}}" class="text-input small-input" /></p>
                                    
                                    <p><label class="w155">Manager's Name:<span class="red">*</span></label>
                                    <input name="data[manager]" type="text" value="{{$data.manager}}" class="text-input small-input" /></p>
                                    
                                    <p><label class="w155">Phone Number:<span class="red">*</span></label>
                                    <input name="data[phone]" type="text" value="{{$data.phone}}" class="text-input small-input" /></p>
                                    
                                    <p><label class="w155">Fax Number:<span class="red">*</span></label>
                                    <input name="data[fax]" type="text" value="{{$data.fax}}" class="text-input small-input" /></p>
                                    
                                    <p>
                                        <label>Description:</label>
                                        <textarea class="text-input textarea" id="textarea" name="data[description]" cols="79" rows="5">{{$data.description}}</textarea>
                                    </p>
                                    
                                    
                                    
                                    
                                    <br/>
                                    <p class="p15t green"><b>Hours of Operation</b></p>               
                                    
                                    <label class="w155"><input checked="checked" type="checkbox" value="1" class="mid m20r" style="border:none;" name="data[date_mon]" {{if $data.date_mon}} checked="checked" {{/if}}/> Mon:</label>
                                    <input type="text" value="{{$data.date_mon_start}}" class="w50" name="data[date_mon_start]" id="date1_start"/> 
                                    - 
                                    <input type="text" value="{{$data.date_mon_end}}" class="w50" name="data[date_mon_end]" id="date1_end"/>
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
                                    <p class="p15t green"><b>Available Order Types</b></p>
                                    <p class="p5t"><b>Please note:</b> Five additional minutes are added to all lead times for transmission and confirmation of orde</p>
                                    <br/>
                                                  
                                                  
                                    <!-- PICKUP -->     
                                             
                                    <label class="w155"><input {{if $data.pickup}} checked="checked" {{/if}} name="data[check][pickup]" type="checkbox" value="1" class="mid m20r" style="border:none;" id="pickup"/> Pickup</label>
                                        <span id="pickup_div" style=""> - Lead Time: <select name="data[pickup]">
                                        
                                        {{foreach from=$leadTimeNormal item=item}}
                                        <option {{if $data.pickup == $item.name}} selected="selected" {{/if}} value="{{$item.name}}">{{$item.name}}</option>
                                        {{/foreach}}
                                    
                                    </select> (Time from Receiving Order to prepared for Customer)</span>
                    
                                    <br style="clear:both;"/>
                                    
                                    
                                    <!-- CURBSIDE -->
                                    
                                    <label class="w155"><input {{if $data.curbside}} checked="checked" {{/if}} name="data[check][curbside]" type="checkbox" value="1" class="mid m20r" style="border:none;" id="curbside"  /> Curbside</label>
                                    <span class="rsu-info" style="" id="curbside_div"> - Lead Time: <select name="data[curbside]">
                                        
                                        {{foreach from=$leadTimeNormal item=item}}
                                        <option  {{if $data.curbside == $item.name}} selected="selected" {{/if}} value="{{$item.name}}">{{$item.name}}</option>
                                        {{/foreach}}
                                    
                                    </select> (Time from Receiving Order to prepared for Customer)</span>
                                    
                                    <br style="clear:both;"/>
                                    
                                    
                                    
                                    
                                    
                                    <!-- DELIVERY -->
                                    <label class="w155"><input {{if $data.delivery}} checked="checked" {{/if}} name="data[check][delivery]" type="checkbox" value="1" class="mid m20r" style="border:none;" id="delivery" /> Delivery</label>
                                    
                                    <span class="rsu-info" style="" id="delivery_div"> - Lead Time: <select name="data[delivery]">
                                        
                                        {{foreach from=$leadTimeNormal item=item}}
                                        <option  {{if $data.delivery == $item.name}} selected="selected" {{/if}} value="{{$item.name}}">{{$item.name}}</option>
                                        {{/foreach}}
                                    
                                    </select>
                                    <span style="margin-left: 10px;">&nbsp;</span>
                                        <input {{if $data.delivery_limit_hour}} checked="checked" {{/if}} type="checkbox" value="1" name="data[delivery_limit_hour]" style="vertical-align: middle;" > Delivery available for limited hours<br style="clear:both;"/>
                                    
                                    <label class="w155">&nbsp;</label>
                                    <span style="">- Delivery Fee: $<input type="text" style="width: 30px;"  maxlength="5"  name="data[delivery_charge]" value="{{$data.delivery_charge}}">
                                                   - Minimum Order: $<input type="text" style="width: 30px;" maxlength="5"  name="data[delivery_minimum]"  value="{{$data.delivery_minimum}}"></span><br>
                                    </span>
                                    
                                    <br style="clear:both;"/>
                                    
                                    <br/>
                                    
                                    
                                    
                                    <!-- CATERING PICKUP -->
                                    
                                    <label class="w155"><input {{if $data.catering_pickup}} checked="checked" {{/if}} name="data[check][catering_pickup]" type="checkbox" value="1" class="mid m20r" style="border:none;"  id="catering_pickup"/> Catering Pickup</label>
                                    
                                    <span class="rsu-info" style="" id="catering_pickup_div"> - Lead Time: <select  name="data[catering_pickup]">
                                        
                                        {{foreach from=$leadTimeCatering item=item}}
                                        <option  {{if $data.catering_pickup == $item.name}} selected="selected" {{/if}} value="{{$item.name}}">{{$item.name}}</option>
                                        {{/foreach}}
                                    
                                    </select></span>
                                    
                                    <br style="clear:both;"/>
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    <!-- CATERING DELIVERY -->
                                    <label class="w155"><input  {{if $data.catering_delivery}} checked="checked" {{/if}} name="data[check][catering_delivery]" type="checkbox" value="1" class="mid m20r" style="border:none;"  id="catering_delivery"/> Catering Delivery</label>
                                    
                                    <span class="rsu-info" style="" id="catering_delivery_div"> - Lead Time: <select name="data[catering_delivery]">
                                        
                                        {{foreach from=$leadTimeCatering item=item}}
                                        <option  {{if $data.catering_delivery == $item.name}} selected="selected" {{/if}} value="{{$item.name}}">{{$item.name}}</option>
                                        {{/foreach}}
                                    
                                    </select>
                                    <span style="margin-left: 10px;">&nbsp;</span>
                                        <input {{if $data.catering_delivery_limit_hour}} checked="checked" {{/if}}  type="checkbox" value="1" name="data[catering_delivery_limit_hour]" style="vertical-align: middle;" > Delivery available for limited hours<br style="clear:both;"/>
                                    
                                    <label class="w155">&nbsp;</label>
                                    <span style="">- Delivery Fee: $<input type="text" style="width: 30px;" maxlength="5" name="data[catering_delivery_charge]"  value="{{$data.catering_delivery_charge}}">
                                                   - Minimum Order: $<input type="text" style="width: 30px;" maxlength="5" name="data[catering_delivery_minimum]"  value="{{$data.catering_delivery_minimum}}"></span><br>
                                    </span>
                                    
                                    <br style="clear:both;"/>
                                    
                                    <br/>
                                    
                                    <p class="p15t green"><b>Table Reservation</b></p>  
                                    <p>
                                        <label>Reservation</label>
                                        
                                        <select name="data[reser_onoff]"  >
                                                <option {{if 1==$data.reser_onoff}} selected="selected" {{/if}} value="1">On</option>
                                                <option {{if 0==$data.reser_onoff}} selected="selected" {{/if}} value="0">Off</option>
                                        </select>
                                    </p>
                                    <p>
                                        <label>Deposit</label>

                                        <select name="data[reser_deposit_onoff]" >
                                                <option {{if 1==$data.reser_deposit_onoff}} selected="selected" {{/if}} value="1">On</option>
                                                <option {{if 0==$data.reser_deposit_onoff}} selected="selected" {{/if}} value="0">Off</option>
                                        </select>
                                        &nbsp;&nbsp;&nbsp;$ <input name="data[reser_deposit]" type="text" value="{{$data.reser_deposit}}" style="width: 35px;" />
                                        
                                    </p>
                                    <p>
                                        <label>Seat quantity</label>
                                        <input name="data[reser_quantity]" type="text" value="{{$data.reser_quantity}}" style="width:115px;" /><br />
                                    </p>
                                    <p>
                                        <label>Period of Repast</label>

                                            <select name="data[reser_period]" >
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
                                    </p>
                                    
                                    <br/>
                                    
                                    <p class="p15t green"><b>Approve/Enable Restaurant</b></p>  
                                    <p>
                                        <label>Approved</label>
                                        <input type="radio" name="data[approved]" value="1" {{if $data.approved != '0'}}checked="checked"{{/if}}/> Yes &nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="data[approved]" value="0" {{if $data.approved == '0'}}checked="checked"{{/if}}/> No
                                    </p>
                                    <p>
                                        <label>Enalbed</label>
                                        <input type="radio" name="data[enabled]" value="1" {{if $data.enabled != '0'}}checked="checked"{{/if}}/> Yes &nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="data[enabled]" value="0" {{if $data.enabled == '0'}}checked="checked"{{/if}}/> No
                                    </p>
                            
                            <!-- END fields -->
                            <p>
                            <br/>
                                <input class="button" type="button" value="&laquo; Back" onclick="javascript:history.back();"/>
                                <input class="button" type="submit" value="Save" />
                            </p>
                            <div class="clear"></div><!-- End .clear -->
                            
                    </div>  <!-- End #tab1 --> 
                    
                  <input type="hidden" name="user_id" value="{{$user.user_id}}"></input>    
                  </form>
                </div> <!-- End .content-box-content -->
                
            </div> <!-- End .content-box -->
            
            
            <div class="clear"></div>