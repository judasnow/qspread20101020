<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	{{$headTitle}}
	<meta content="text/html; charset=UTF-8" http-equiv="content-type">
	<meta name="description" content="" lang="vi-VI">
	<meta name="keywords" content="web" lang="vi-VI">
	<link rel="Shortcut Icon" href="{{$BASE_URL}}general/icons/site/vi.ico">       
	{{$headLink}}
	{{$headStyle}}
	<script type="text/javascript" src="{{$LAYOUT_HELPER_URL}}front/js/jquery.min.js"></script>
	<script type="text/javascript" src="{{$LAYOUT_HELPER_URL}}front/js/jquery-ui.custom.min.js"></script>
	<script type="text/javascript" src="{{$LAYOUT_HELPER_URL}}front/js/jquery.validate.js"></script>
	
	<link href="{{$LAYOUT_HELPER_URL}}front/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	{{$headScript}}
	<!-- begin: #Page -->
<div id="page">
 <!-- begin: #Page_margin -->
 <div id="page_margin">
    <!-- begin: #Header -->
    <div id="header">
    	<div class="h115">
        	<div class="float_left">
                <p class="color_1 p20t"><b>Making online take out easy !</b></p>
                <div class="logo p20t"><a href="{{$BASE_URL}}"><img src="{{$LAYOUT_HELPER_URL}}front/img/logo.jpg" alt="" /></a></div>
            </div>
            <div class="float_right">
            	<ul class="na_1">
                	<li><a href="index.html" class="current" style="border:none;">Home</a></li>
                    <li><a href="signin.html">Sign in</a></li>
                    <li><a href="faq.html">FAQ</a></li>
                </ul>
                <div class="float_right m10r"><a href="#"><img src="{{$LAYOUT_HELPER_URL}}front/img/icon_setup.jpg" alt="" /></a></div>
				<br class="clear_right" />
            </div>
            <div class="clear"></div>
        </div>
        <div id="tabs7">
            <!-- MAIN MENU -->
            {{sticker name=main_menu}}
            <!-- END MENU -->
        </div><br class="clear_left" />
    </div>
    <!-- end: #Header -->
	
	
    <!-- begin: #Main-->
		<div id="main">
        <div class="w201 float_left">
            <div class="top1 m20t"></div>
            <div class="cen1">
                <div class="cen_1">
                    <div class="p10">
                        <ul class="list_menu">
                            <li><a href="about.html">About us</a></li>
                            <li><a href="howitwork.html">How it works</a></li>
                            <li><a href="meettheteam.html">Meet the team</a></li>
                            <li><a href="careers.html" class="current">Careers</a></li>
                            <li style="border:none;"><a href="newsroom.html">News room</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="bot1"></div>
            <div class="bg_join m10t"><a href="#">JOIN NOW</a></div>
        </div>
        <div class="w692 float_right m20t">
        <!--  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> START MODULE <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
        
            {{$content}}
         
         
         <!--  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> END MODULE <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  -->   
        </div>
        <div class="clear"></div>
    </div>
    <!-- end: #Main-->
	
	
	
 </div>
 <!-- end: #Page_margin -->
 	<!-- begin: #Main_bot -->
    <div id="main_bot">
    	<div id="page_margin">
    		<div class="w200 float_left">
            	<p class="color_2 p20l"><b><a href="#">QuickSpread.com</a></b></p>
                <ul class="list_2 p5t p20l">
                	<li><a href="aboutus.html">About Us</a></li>
                    <li><a href="howitwork.html">How it Works</a></li>
                    <li><a href="browse.html">Browse Restaurants</a></li>
                    <li><a href="blog.html">Blog</a></li>
                    <li><a href="newroom.html">Newsroom</a></li>
                </ul>
            </div>
            <div class="w200 float_left m10l">
            	<p class="color_2"><b><a href="#">Programs</a></b></p>
                <ul class="list_2 p5t">
                	<li><a href="share.html">Share the Bounty</a></li>
                    <li><a href="fund.html">Fundraising</a></li>
                    <li><a href="friend.html">Refer a Friend</a></li>
                    <li><a href="restaurant.html">Refer a Restaurant</a></li>
                </ul>
            </div>
            <div class="w200 float_left">
            	<p class="color_2"><b><a href="#">Business Solutions</a></b></p>
                <ul class="list_2 p5t">
                	<li><a href="corporate.html">Corporate Accounts</a></li>
                    <li><a href="restaurantowners.html">Restaurant Owners</a></li>
                    <li><a href="businesspartners.html">Business Partners</a></li>
                </ul>
            </div>
            <div class="w175 float_left">
            	<p class="color_2"><b><a href="#">Legal Info</a></b></p>
                <ul class="list_2 p5t">
                	<li><a href="termofuse.html">Term of Use</a></li>
                    <li><a href="privace.html">Privace Policy</a></li>
                    <li><a href="sitemap.html">Sitemap</a></li>
                    <li><a href="copyright.html">Copyright</a></li>
                </ul>
            </div>
            <div class="w110 float_left">
            	<p class="color_2"><b><a href="#">Legal Info</a></b></p>
                <ul class="list_2 p5t">
                	<li><a href="faq.html">FAQs</a></li>
                    <li><a href="contact.html">Contact Us</a></li>
                </ul>
            </div>
            <div class="clear_left"></div>
        </div>
    </div>
    <!-- end: #Main_bot -->
 	<!-- begin: #Footer -->
    <div id="footer">
    	<div id="page_margin">
            <p class="float_right">Copyright © 2008 Quick Spread, Inc. All Rights Reserved</p>
            <br class="clear" />
        </div>
    </div>
    <!-- end: #Footer -->
</body>
</html>

