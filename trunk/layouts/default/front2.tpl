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
                        <!-- LEFT MENU -->
                        {{sticker name=left_menu}}
                        <!-- END LEFT MENU -->
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
    {{sticker name=bottom_menu}}
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

