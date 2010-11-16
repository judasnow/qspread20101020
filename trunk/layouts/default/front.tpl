<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
{{$headTitle}}
<meta content="text/html; charset=UTF-8" http-equiv="content-type">
<meta name="description" content="" lang="vi-VI">
<meta name="keywords" content="web" lang="vi-VI">
<link rel="Shortcut Icon" href="{{$BASE_URL}}general/icons/site/vi.ico">
{{$headLink}} {{$headStyle}} <script type="text/javascript"
	src="{{$LAYOUT_HELPER_URL}}front/js/jquery.min.js"></script> <script
	type="text/javascript"
	src="{{$LAYOUT_HELPER_URL}}front/js/jquery-ui.custom.min.js"></script>
<script type="text/javascript"
	src="{{$LAYOUT_HELPER_URL}}front/js/jquery.validate.js"></script>

<link href="{{$LAYOUT_HELPER_URL}}front/css/style.css" rel="stylesheet"
	type="text/css" />

</head>
<body>
{{$headScript}}
<!-- begin: #Page -->
<div id="page"><!-- begin: #Page_margin -->
<div id="page_margin"><!-- begin: #Header -->
<div id="header">
<div class="h115">
<div class="float_left">
<p class="color_1 p20t"><b>Making online take out easy !</b></p>
<div class="logo p20t"><a href="{{$BASE_URL}}"><img
	src="{{$LAYOUT_HELPER_URL}}front/img/logo.jpg" alt="" /></a></div>
</div>
<div class="float_right">
<ul class="na_1">
	<li><a href="index.html" class="current" style="border: none;">Home</a></li>
	<li><a href="javascript:openLoginForm();">Sign in</a></li>
	<li><a href="faq.html">FAQ</a></li>
</ul>
<div class="float_right m10r"><a href="#"><img
	src="{{$LAYOUT_HELPER_URL}}front/img/icon_setup.jpg" alt="" /></a></div>
<br class="clear_right" />
</div>
<div class="clear"></div>
</div>
<div id="tabs7"><!-- MAIN MENU --> {{sticker name=main_menu}} <!-- END MENU -->
</div>
<br class="clear_left" />
</div>
<!-- end: #Header --> <!-- begin: #Main >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> START MODULE <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<-->
{{$content}} <!-- end: #Main >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> END MODULE <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->

<!-- LOGIN DIV -->
<div id="overlay" style="display: none;"></div>
<div id="login" class="done" style="display: none;">
    <div class="lbContent">
        <form>
            <h2>Login</h2>
            <div style="float: right;margin-top: -30px;"><a href="javascript:closeLoginForm();">[X]</a></div>
            <table>
                <tr>
                    <td>Username:</td>
                    <td><input class="text" type="text" name="username"></td> 
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input class="text" type="password" name="password"></td> 
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="LOGIN"></td> 
                </tr>
            </table>
            
            <br/>
            <a href="#">Forgot password</a><br/>
            <a href="#">Register new account</a>
        </form>
    </div>
</div>

<script type="text/javascript">
function openLoginForm()
{
	document.getElementById('overlay').style.display = 'block';
	document.getElementById('login').style.display = 'block';
}
function closeLoginForm()
{
    document.getElementById('overlay').style.display = 'none';
    document.getElementById('login').style.display = 'none';
}
</script>

<!-- END LOGIN --></div>
<!-- end: #Page_margin --> <!-- begin: #Main_bot --> {{sticker
name=bottom_menu}} <!-- end: #Main_bot --> <!-- begin: #Footer -->
<div id="footer">
<div id="page_margin">
<p class="float_right">Copyright © 2008 Quick Spread, Inc. All Rights
Reserved</p>
<br class="clear" />
</div>
</div>
<!-- end: #Footer -->

</body>
</html>

