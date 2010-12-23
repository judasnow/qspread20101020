<!-- begin autocomplete --> 
<script src="{{$LAYOUT_HELPER_URL}}front/autocomplete/jquery.autocomplete.js" type="text/javascript"></script>
<script src="{{$LAYOUT_HELPER_URL}}front/js/jquery.cycle.lite.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="{{$LAYOUT_HELPER_URL}}front/autocomplete/styles.css" type="text/css" media="screen" />
<script type="text/javascript">
  //<![CDATA[

  var a1;
  
  jQuery(function() {  

    var options = {
      serviceUrl: '{{$APP_BASE_URL}}restaurant/index/autocomplete-city',
      width: 300,
      delimiter: /(,|;)\s*/,
      deferRequestBy: 0, //miliseconds
      noCache: false //set to true, to disable caching
    };
	
    a1 = $('#searchword').autocomplete(options);

  });
  
//]]>
</script>
<script type="text/javascript">
function submit_form(){
	var frm = document.form_submit;
	frm.submit();
}

/*
$(document).ready(function() {
    $('.slideshow').cycle({
        fx: 'scrollDown' // choose your transition type, ex: fade, scrollUp, shuffle, etc...
    });
});
*/
</script>
<!-- end autocomplete -->
<div id="main">
        <div class="col1">
        
           
            <div class="bg_1">
            <form method="POST" action="{{$APP_BASE_URL}}restaurant" name="form_submit" id="form_submit">
                <img src="{{$LAYOUT_HELPER_URL}}front/img/tt_find.png" alt="" />
                <div class="input_form">
                    <label style="width: 120px;">by Postal code</label>
                    <input type="text" value="" class="w50" name="data[zip]" id="data[zip]"/>
                    <span class="color_1"><b>OR</b></span><br />
                    <label style="width: 120px;">by City and Province</label>
                    <input type="text" value="" class="w130" name="searchword" id="searchword" /><br />
                    
                    <label>Choose Cuisine (optional)</label><br class="clear_left" />
                    <select class="w215" name="condition[cuisine]">   
                    	<option value="0">All Cuisines</option>                 
                    	{{foreach from=$cuisines item=item}}
                        <option value="{{$item.value}}">{{$item.name}}</option>
                        {{/foreach}}
                        
                    </select><br />
                    <div class="w110 float_left" style="width: 120px;">
                        <label>Time</label><br class="clear_left" />
                        <select class="w70" name="condition[time]">
                            <option value="asap">ASAP</option>
                            {{foreach from=$arr_time item=item}}
	                        <option value="{{$item}}">{{$item}}</option>
	                        {{/foreach}}
                        </select><br />
                    </div>
                    <div class="w110 float_left">
                        <label>Date</label><br class="clear_left" />
                        <select class="w110" name="condition[date]">
                            {{foreach from=$date_month item=item}}	
							<option value="{{$item}}">{{$item}}</option>
							{{/foreach}}
                        </select><br />
                    </div>
                    <br class="clear_left" />
                </div>
                <div class="uper float_left p20t m10t"><a href="#" onclick="submit_form();">Begin your oder</a></div>
                <div class="float_left m5l m10t">
               <!--               
                	<img src="{{$LAYOUT_HELPER_URL}}front/img/icon_6.jpg" alt="" />
           	   -->           	
					<input type="submit" style="background: url({{$LAYOUT_HELPER_URL}}front/img/icon_6.jpg) repeat scroll 0% 0% transparent; cursor: pointer; width: 42px; height: 39px; border: 0pt none;" value="">
                </div>
            </form>
            </div>
            
            
            <div class="bg_tt m10t"><a href="{{$BASE_URL}}restaurant?mark=pickup"><img src="{{$LAYOUT_HELPER_URL}}front/img/tt_1.png" alt="" /></a></div>
            <div class="bg_tt m15t"><a href="{{$BASE_URL}}page/refer-a-restaurant.html"><img src="{{$LAYOUT_HELPER_URL}}front/img/tt_2.png" alt="" /></a></div>
            <div class="bg_tt m15t"><a href="{{$BASE_URL}}restaurant-owner-register.html"><img src="{{$LAYOUT_HELPER_URL}}front/img/tt_3.png" alt="" /></a></div>
            <div class="bg_2 m15t">
                <img src="{{$LAYOUT_HELPER_URL}}front/img/tt_4.png" alt="" /><br /><br /><br />
                <div class="float_left m10t"><img src="{{$LAYOUT_HELPER_URL}}front/img/icon_top.png" alt="" /></div>
                <div class="w215 float_left p10t p5l b_color">
                    {{$article.full_text}}                 
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
                            Select your postal code or city to search hundreds of great restaurants and menus.
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
                <div class="bg_cen" style="min-height: 200px;">
                    <ul class="list_1 p10t">
                        <li><a href="#"><img src="{{$LAYOUT_HELPER_URL}}front/img/logo_1.jpg" alt="" /></a></li>
                        <li><a href="#"><img src="{{$LAYOUT_HELPER_URL}}front/img/logo_2.jpg" alt="" /></a></li>
                        <li><a href="#"><img src="{{$LAYOUT_HELPER_URL}}front/img/logo_3.jpg" alt="" /></a></li>
                        <li><a href="#"><img src="{{$LAYOUT_HELPER_URL}}front/img/logo_4.png" alt="" /></a></li>
                    </ul>
                   <!-- <div class="slideshow">
                        <img src="{{$LAYOUT_HELPER_URL}}front/img/logo_1.jpg" alt="" />
                        <img src="{{$LAYOUT_HELPER_URL}}front/img/logo_3.jpg" alt="" />
                        <img src="{{$LAYOUT_HELPER_URL}}front/img/logo_2.jpg" alt="" />
                    </div> --> 
                     
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