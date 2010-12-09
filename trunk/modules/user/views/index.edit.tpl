
<script type="text/javascript">
$().ready(function() {
    // validate signup form on keyup and submit
    $("#register").validate({
        rules: {
            'data[full_name]': "required",
            'data[address]': "required",
            'data[city]': "required",
            'data[zipcode]': "required",
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
            'data[birthday_date]':  {
                rangelength: [1, 2],
                range: [1, 31]
            },
            'data[birthday_month]':  {
                rangelength: [1, 2],
                range: [1, 12]
            },
            'data[birthday_year]':  {
                rangelength: [4, 4],
                min: 1900
            },
            'data[password]': {
                minlength: 6
            },
            'data[retype_password]': {
                equalTo: "#password"
            },
            'data[security_answer]': "required",
            'data[captcha]': "required"
        },
        messages: {
            'data[full_name]': "",
            'data[address]': "",
            'data[city]': "",
            'data[zipcode]': "",
            'data[phone1]': "",
            'data[phone2]': "",
            'data[phone3]':  "",
            'data[birthday_date]': "",
            'data[birthday_month]': "",
            'data[birthday_year]': "",
            'data[retype_email]': "",
            'data[password]': "",
            'data[retype_password]': "",
            'data[security_answer]': "",
            'data[captcha]': ""
        }
    }); 
});

</script>


    <form method="POST" name="register" id="register">
    <div id="main">
        <p class="title1">Edit Account</p>
        <div class="p10">
        
            {{if $errors|@count > 0}}        
            <div class="register_error">
                <b>Error:</b>
                <ul>
                    {{foreach from=$errors item=item}}
                    <li>{{$item}}</li>
                    {{/foreach}}
                </ul>
            </div>
            {{/if}}
            
            {{if $updateSuccess}}        
            <div style="padding: 10px 0; color: green; font-weight: bold; border-top: 1px solid green; border-bottom: 1px solid green;">
                Your account is updated successfully.
            </div>
            <br/>
            {{/if}}
            
                    
            <div class="w450 float_left">
                <p class="color_2 uper"><b>Personal Information</b></p>
                <div class="input_form">
                    <label class="w130 m10r right">Full Name:<span class="red">*</span></label>
                    <input name="data[full_name]" type="text" value="{{$data.full_name}}" class="w230" /><br />
                    
                    <label class="w130 m10r right">Company Name:</label>
                    <input name="data[company]" type="text" value="{{$data.company}}" class="w230" /><br />
                    
                    <label class="w130 m10r right">Address:<span class="red">*</span></label>
                    <input name="data[address]" type="text" value="{{$data.address}}" class="w230" /><br />
                    
                    <label class="w130 m10r right">Suite#/Apt.#/Note:</label>
                    <input name="data[suite_apt_note]" type="text" value="{{$data.suite_apt_note}}" class="w230" /><br />
                    
                    <label class="w130 m10r right">City:<span class="red">*</span></label>
                    <input name="data[city]" type="text" value="{{$data.city}}" class="w230" /><br />
                    
                    <label class="w130 m10r right">State:<span class="red">*</span></label>
                    <select name="data[state]" class="w235">
                        {{foreach from=$allProvinces item=item}}
                        <option {{if $item.province==$data.state}} selected="selected" {{/if}} value="{{$item.province}}">{{$item.province}}</option>
                        {{/foreach}}
                    </select><br />
                    
                    <label class="w130 m10r right">Postal Code:<span class="red">*</span></label>
                    <input name="data[zipcode]" type="text" value="{{$data.zipcode}}" class="w230" /><br />
                    
                    <label class="w130 m10r right">Phone:(XXX-XXX-XXXX)<span class="red">*</span></label>
                    <input name="data[phone1]" type="text" value="{{$data.phone1}}" class="w70" />
                    <input name="data[phone2]" type="text" value="{{$data.phone2}}" class="w70" />
                    <input name="data[phone3]" type="text" value="{{$data.phone3}}" class="w70" /><br />
                    
                    <!-- 
                    <label class="w130 m10r right">Mobile Phone:</label>
                    <input type="text" value="000" class="w70" />
                    <input type="text" value="000" class="w70" />
                    <input type="text" value="0000" class="w70" /><br />
                    <label class="w130 m10r right">Mobile Phone Carrier:</label>
                    <input type="text" value="" class="w230" /><br />
                     -->
                    
                    
                    <label class="w130 m10r right">Email:<span class="red">*</span></label>
                    <input disabled="disabled" name="data[email]" id="email" type="text" value="{{$data.email}}" class="w230" /><br />
                    
                    <label class="w130 m10r right">Birthday:(MM/DD/YYYY)</label>
                    <input name="data[birthday_month]" type="text" value="{{$data.birthday_month}}" class="w70" />
                    <input name="data[birthday_date]" type="text" value="{{$data.birthday_date}}" class="w70" />
                    <input name="data[birthday_year]" type="text" value="{{$data.birthday_year}}" class="w70" /><br />
                    
                    <label class="w130 m10r right">Gender:</label>
                    <select  name="data[gender]" class="w235">
                        <option {{if 0==$data.gender}} selected="selected" {{/if}} value="0">-select gender-</option>
                        <option {{if 1==$data.gender}} selected="selected" {{/if}} value="1">Male</option>
                        <option {{if 2==$data.gender}} selected="selected" {{/if}} value="2">Female</option>
                    </select><br />
                    
                </div> 
            </div>
            
            <div class="w400 float_right">
                <p class="color_2 uper"><b>Account Information</b></p>
                <div class="input_form">
                    <label class="w130 m10r right">Username:<span class="red">*</span></label>
                    <input disabled="disabled" name="data[username]" type="text" value="{{$data.username}}" class="w230" /><br />
                    
                    <label class="w130 m10r right">New Password:</label>
                    <input name="data[password]" id="password" type="password" value="" class="w230" /><br />
                    
                    <label class="w130 m10r right"></label>
                    (More than 6 characters)<br/>
                    
                    <label class="w130 m10r right">Confirm New Password:</label>
                    <input name="data[retype_password]" type="password" value="" class="w230" /><br />
                    <br/>
                    
                    <label class="w130 m10r right">Security Question:<span class="red">*</span></label>
                    <select name="data[security_question]" class="w235">
                        {{foreach from=$allQuestions item=item}}
                        <option {{if $item.value==$data.security_question}} selected="selected" {{/if}} value="{{$item.value}}">{{$item.name}}</option>
                        {{/foreach}}
                    </select><br />
                    
                    <label class="w130 m10r right">Security Answer:<span class="red">*</span></label>
                    <input  name="data[security_answer]" type="text" value="{{$data.security_answer}}" class="w230" /><br />
                    
                    <p class="color_2 uper p15t"><b>Additonal Information</b></p>
                    <div class="p10t">
                        <input name="data[send_discount_code]" {{if '1'==$data.send_discount_code}} checked="checked" {{/if}} value="1" type="checkbox" class="mid" style="border:none;" />&nbsp; <b>Send me QuickSpread discount codes</b></div>
                    <p class="m15l">We never share your info with 3rd parties and you can unsubscribe at any time</p>
                    
                    <div class="p20t">
                        <input type="image" name="SUBMIT" src="{{$LAYOUT_HELPER_URL}}front/img/bt_update.jpg" alt="" style="border: none;padding: 0px;margin: 0px; height: 100%" />
                        <a href="{{$BASE_URL}}"><img src="{{$LAYOUT_HELPER_URL}}front/img/bt_cancel.jpg" alt="" /></a>
                    </div>
                 </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    </form>