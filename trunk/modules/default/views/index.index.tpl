<div id="main">
        <div class="col1">
        
           
            <div class="bg_1">
            <form method="POST" action="{{$APP_BASE_URL}}restaurant?mark=pickup">
                <img src="{{$LAYOUT_HELPER_URL}}front/img/tt_find.png" alt="" />
                <div class="input_form">
                    <label class="w55">by zip</label>
                    <input type="text" value="" class="w50" name="data[zip]"/>
                    <span class="color_1"><b>OR</b></span><br />
                    <label class="w55">by zip</label>
                    <select class="w165">
                        <option></option>
                    </select><br />
                    <label>Choose Cuisine (optional)</label><br class="clear_left" />
                    <select class="w215" name="condition[cuisine]">
                    
                    	{{foreach from=$cuisines item=item}}
                        <option value="{{$item.value}}">{{$item.name}}</option>
                        {{/foreach}}
                        
                    </select><br />
                    <div class="w110 float_left">
                        <label>Time</label><br class="clear_left" />
                        <select class="w70">
                            <option value="asap">ASAP</option>
                            {{foreach from=$arr_time item=item}}
	                        <option value="{{$item}}">{{$item}}</option>
	                        {{/foreach}}
                        </select><br />
                    </div>
                    <div class="w110 float_left">
                        <label>Date</label><br class="clear_left" />
                        <select class="w110">
                            <option>Sep - 6th</option>
                        </select><br />
                    </div>
                    <br class="clear_left" />
                </div>
                <div class="uper float_left p20t m10t"><a href="#">Begin your oder</a></div>
                <div class="float_left m5l m10t">
               <!--               
                	<img src="{{$LAYOUT_HELPER_URL}}front/img/icon_6.jpg" alt="" />
           	   -->           	
					<input type="submit" style="background: url({{$LAYOUT_HELPER_URL}}front/img/icon_6.jpg) repeat scroll 0% 0% transparent; cursor: pointer; width: 42px; height: 39px; border: 0pt none;" value="">
                </div>
            </form>
            </div>
            
            
            <div class="bg_tt m10t"><img src="{{$LAYOUT_HELPER_URL}}front/img/tt_1.png" alt="" /></div>
            <div class="bg_tt m15t"><img src="{{$LAYOUT_HELPER_URL}}front/img/tt_2.png" alt="" /></div>
            <div class="bg_tt m15t"><img src="{{$LAYOUT_HELPER_URL}}front/img/tt_3.png" alt="" /></div>
            <div class="bg_2 m15t">
                <img src="{{$LAYOUT_HELPER_URL}}front/img/tt_4.png" alt="" /><br /><br /><br />
                <div class="float_left m10t"><img src="{{$LAYOUT_HELPER_URL}}front/img/icon_top.png" alt="" /></div>
                <div class="w215 float_left p10t p5l b_color">
                    <b>Lorem ipsum dolor sit amet, consec- tetuer adipiscing elit. Nullam sed justo. Morbi purus. Maecenas facilisis vesti- bulum felis. Aliquam sed risus. Etiam egestas mollis mauris. Proin sceleris- que mollis enim. Suspendisse potenti. Phasellus id lectus. Mauris tristique, ligula in scelerisque tempus,....</b>                 
                </div><br class="clear_left" />
                <div class="right"><img src="{{$LAYOUT_HELPER_URL}}front/img/icon_bot.png" alt="" /></div>
            </div>
        </div>
        <div class="col2">
            <div class="flash"><img src="{{$LAYOUT_HELPER_URL}}front/img/flash.jpg" alt="" /></div>
            <div class="bg_t m20t"></div>
            <div class="bg_c">
                <div class="bg_cen">
                    <img src="{{$LAYOUT_HELPER_URL}}front/img/tt_order.png" alt="" />
                    <div class="m25t">
                        <img src="{{$LAYOUT_HELPER_URL}}front/img/icon_zoom.jpg" alt="" class="m35l" />
                        <img src="{{$LAYOUT_HELPER_URL}}front/img/icon_1.png" alt="" class="m35l" />
                        <img src="{{$LAYOUT_HELPER_URL}}front/img/icon_2.jpg" alt="" class="m35l" />
                        <img src="{{$LAYOUT_HELPER_URL}}front/img/icon_1.png" alt="" class="m35l" />
                        <img src="{{$LAYOUT_HELPER_URL}}front/img/icon_card.jpg" alt="" class="m35l" />
                    </div>
                    <div class="p10t p10b">
                        <div class="w155 float_left m10l">
                            <span class="fs30 color_2">1.</span>
                            Select your zip code or city to search hundreds of great restaurants and menus.
                        </div>
                        <div class="w155 float_left m50l">
                            <span class="fs30 color_2">2.</span>
                            Select when you want your food to be ready, in as little as 10 minutes or up to 2 weeks out.
                        </div>
                        <div class="w155 float_left m50l">
                            <span class="fs30 color_2">3.</span>
                            Place and pay for your order online so you don't have to wait on the phone or stand in line.
                        </div>
                        <div class="clear_left"></div>
                    </div>
                </div>
            </div>
            <div class="bg_b"></div>
            <div class="bg_t m15t"></div>
            <div class="bg_c">
                <div class="bg_cen">
                    <ul class="list_1 p10t">
                        <li><a href="#"><img src="{{$LAYOUT_HELPER_URL}}front/img/logo_1.jpg" alt="" /></a></li>
                        <li><a href="#"><img src="{{$LAYOUT_HELPER_URL}}front/img/logo_2.jpg" alt="" /></a></li>
                        <li><a href="#"><img src="{{$LAYOUT_HELPER_URL}}front/img/logo_3.jpg" alt="" /></a></li>
                        <li><a href="#"><img src="{{$LAYOUT_HELPER_URL}}front/img/logo_4.png" alt="" /></a></li>
                    </ul>
                    <ul class="list_1 p20t p20b">
                        <li><a href="#"><img src="{{$LAYOUT_HELPER_URL}}front/img/logo_1.jpg" alt="" /></a></li>
                        <li><a href="#"><img src="{{$LAYOUT_HELPER_URL}}front/img/logo_2.jpg" alt="" /></a></li>
                        <li><a href="#"><img src="{{$LAYOUT_HELPER_URL}}front/img/logo_3.jpg" alt="" /></a></li>
                        <li><a href="#"><img src="{{$LAYOUT_HELPER_URL}}front/img/logo_4.png" alt="" /></a></li>
                    </ul>                  
                </div>
            </div>
            <div class="bg_b"></div>
        </div>
        <div class="clear"></div>
    </div>