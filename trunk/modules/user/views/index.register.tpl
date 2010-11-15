
    <div id="main">
        <p class="title1">Create Your Free Account</p>
        <div class="p10">
            <div class="w450 float_left">
                <p class="color_2 uper"><b>Personal Information</b></p>
                <div class="input_form">
                    <label class="w130 m10r right">Full Name:<span class="red">*</span></label>
                    <input type="text" value="" class="w230" /><br />
                    <label class="w130 m10r right">Comapny Name:</label>
                    <input type="text" value="" class="w230" /><br />
                    <label class="w130 m10r right">Address:<span class="red">*</span></label>
                    <input type="text" value="" class="w230" /><br />
                    <label class="w130 m10r right">Suite#/Apt.#/Note:</label>
                    <input type="text" value="" class="w230" /><br />
                    <label class="w130 m10r right">City:<span class="red">*</span></label>
                    <input type="text" value="" class="w230" /><br />
                    <label class="w130 m10r right">State:<span class="red">*</span></label>
                    <select class="w235">
                        {{foreach from=$allProvinces item=item}}
                        <option value="{{$item.province}}">{{$item.province}}</option>
                        {{/foreach}}
                    </select><br />
                    <label class="w130 m10r right">Zip/Postal Code:<span class="red">*</span></label>
                    <input type="text" value="" class="w230" /><br />
                    <label class="w130 m10r right">Phone:(XXX-XXX-XXXX)<span class="red">*</span></label>
                    <input type="text" value="000" class="w70" />
                    <input type="text" value="000" class="w70" />
                    <input type="text" value="0000" class="w70" /><br />
                    
                    <!-- 
                    <label class="w130 m10r right">Mobile Phone:</label>
                    <input type="text" value="000" class="w70" />
                    <input type="text" value="000" class="w70" />
                    <input type="text" value="0000" class="w70" /><br />
                    <label class="w130 m10r right">Mobile Phone Carrier:</label>
                    <input type="text" value="" class="w230" /><br />
                     -->
                    
                    
                    <label class="w130 m10r right">Email:<span class="red">*</span></label>
                    <input type="text" value="" class="w230" /><br />
                    <label class="w130 m10r right">Please Retype Email:<span class="red">*</span></label>
                    <input type="text" value="" class="w230" /><br />
                    <label class="w130 m10r right">Birthday:(MM/DD/YYYY)</label>
                    <input type="text" value="00" class="w70" />
                    <input type="text" value="00" class="w70" />
                    <input type="text" value="0000" class="w70" /><br />
                    <label class="w130 m10r right">Gender:</label>
                    <select class="w235">
                        <option value="0">-select gender-</option>
                        <option value="1">Male</option>
                        <option value="2">Female</option>
                    </select><br />
                    
                </div> 
            </div>
            
            <div class="w400 float_right">
                <p class="color_2 uper"><b>Account Information</b></p>
                <div class="input_form">
                    <label class="w130 m10r right">Username:<span class="red">*</span></label>
                    <input type="text" value="" class="w230" /><br />
                    <label class="w130 m10r right">Password:<span class="red">*</span></label>
                    <input type="text" value="" class="w230" /><br />
                    <label class="w130 m10r right">Confirm Password:<span class="red">*</span></label>
                    <input type="text" value="" class="w230" /><br />
                    <label class="w130 m10r right">Security Question:<span class="red">*</span></label>
                    <select class="w235">
                        {{foreach from=$allQuestions item=item}}
                        <option value="{{$item.value}}">{{$item.name}}</option>
                        {{/foreach}}
                    </select><br />
                    <label class="w130 m10r right">Security Answer:<span class="red">*</span></label>
                    <input type="text" value="" class="w230" /><br />
                    
                    <p class="color_2 uper p15t"><b>Additonal Information</b></p>
                    <div class="p10t"><input type="checkbox" class="mid" style="border:none;" />&nbsp; <b>Send me QuickSpread discount codes</b></div>
                    <p class="m15l">We never share your info with 3rd parties and you can unsubscribe at any time</p>
                    
                    <!-- 
                    <div class="p10t"><input type="checkbox" class="mid" style="border:none;" />&nbsp; <b>Send me SMS text order confirmations</b></div>
                    <p class="m15l p10b">Your standard text message rates will apply</p>
                    <label class="w130 m10r right"><b>Referred by</b> (username):</label>
                    <input type="text" value="" class="w230" /><br />
                    <p class="fs11 p5t">This field only applies if you were referred by an existing QuickSpread user. If you were, enter their Username.</p>
                     -->
                    
                    <p class="color_2 uper p15t"><b>Finalize Your Sign Up</b></p>
                    <p class="p10t"><b>Word Verification*<br />Please type in numbers and letters you see into the field above.</b></p>
                    <input type="text" value="" class="w230 float_left m20t m10r" />
                    <img src="{{$LAYOUT_HELPER_URL}}front/img/img_register.jpg" alt="" class="float_left m10t" /><br class="clear_left" />
                    <div class="p10t"><input type="checkbox" class="mid" style="border:none;" />&nbsp;
                    <b>I have read and accepted the <span class="color_2"><a href="#">QuickSpread.com User Agreement*</a></span></b></div>
                    <div class="p20t">
                        <a href="#"><img src="{{$LAYOUT_HELPER_URL}}front/img/bt_signup.jpg" alt="" /></a>
                        <a href="#"><img src="{{$LAYOUT_HELPER_URL}}front/img/bt_cancel.jpg" alt="" /></a>
                    </div>
                 </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>