<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	{{$headTitle}}
	<meta content="text/html; charset=UTF-8" http-equiv="content-type">
	<meta name="description" content="visualidea administrator" >
	<meta name="keywords" content="visualidea administrator" >
	<link rel="Shortcut Icon" href="{{$LAYOUT_HELPER_URL}}admin/images/vi.ico">       
	{{$headLink}}
	{{$headStyle}}
	
	<!--                       CSS                       -->
	  
	<!-- Reset Stylesheet -->
	<link rel="stylesheet" href="{{$LAYOUT_HELPER_URL}}admin/css/reset.css"  type="text/css"  />
  
	<!-- Main Stylesheet -->
	<link rel="stylesheet" href="{{$LAYOUT_HELPER_URL}}admin/css/style.css" type="text/css" />
	
	<!-- Invalid Stylesheet. This makes stuff look pretty. Remove it if you want the CSS completely valid -->
	<link rel="stylesheet" href="{{$LAYOUT_HELPER_URL}}admin/css/invalid.css"  type="text/css" />	
	
	
	<!-- Internet Explorer Fixes Stylesheet -->
	
	<!--[if lte IE 7]>
		<link rel="stylesheet" href="{{$LAYOUT_HELPER_URL}}admin/css/ie.css" type="text/css" media="screen" />
	<![endif]-->
	
	<!--                       Javascripts                       -->

	<!-- jQuery -->
	<script type="text/javascript" src="{{$LAYOUT_HELPER_URL}}admin/js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="{{$LAYOUT_HELPER_URL}}admin/js/jquery.validate.js"></script>
	
	<!-- jQuery Configuration -->

	<script type="text/javascript" src="{{$LAYOUT_HELPER_URL}}admin/js/my.jquery.configuration.js"></script>
	
	
	<!-- jQuery WYSIWYG Plugin -->
	
	
	<!-- Internet Explorer .png-fix -->
	
	<!--[if IE 6]>
		<script type="text/javascript" src="{{$LAYOUT_HELPER_URL}}admin/js/DD_belatedPNG_0.0.7a.js" ></script>
		<script type="text/javascript">
			DD_belatedPNG.fix('.png_bg, img, li');
		</script>
	<![endif]-->
	
</head>
<body><div id="body-wrapper" class="body-wrapper"> <!-- Wrapper for the radial gradient background -->
		<div style="float: left; position: absolute; z-index: 100; width:230px;">
          <a href="javascript:hideSlideBar();"><p id="hide_slidebar_button" style="text-align: right;padding: 0px;"><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/arrow_left.png"></img></p></a>
          <a href="javascript:showSlideBar();"><p id="show_slidebar_button" style="text-align: left;padding: 0px; display: none;"><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/arrow_right.png"></img></p></a>
        </div>  
		<div id="sidebar">
		  <div id="sidebar-wrapper"> <!-- Sidebar with logo and menu -->
			
			<div><h1  style="top:20px;padding-left:20px; color:white;">Administrator</h1></div>
			<!-- Logo (221px wide) -->
		  
			<!-- Sidebar Profile links -->
			<div id="profile-links" style="padding-top:100px;">
				Hello, <a href="{{$APP_BASE_URL}}user/admin/edit-user/id/{{$backendUser.user_id}}" title="Edit your profile">{{$backendUser.full_name}}</a> <!-- , you have <a href="#messages" rel="modal" title="3 Messages">3 Messages</a> --><br />
				<br />
				<a target="_blank" href="{{$APP_BASE_URL}}../" title="View the Site">View the Site</a> | <a href="{{$APP_BASE_URL}}access/admin/logout" title="Sign Out">Sign Out</a>
			</div>        
			
			<ul id="main-nav">  <!-- Accordion Menu -->
				
				<li>
					<a href="{{$APP_BASE_URL}}" class="nav-top-item no-submenu {{if $menu[0]=='controlpanel'}}current{{/if}}">
						Control Panel
					</a>       
				</li>
                
				
				<li> 
					<a href="#" class="nav-top-item {{if $menu[0]=='usergroup'}}current{{/if}}">
					Users & Groups
					</a>
					<ul>
						{{p name='new_user' module='user'}}<li><a href="{{$APP_BASE_URL}}user/admin/new-user" class="{{if $menu[1]=='newuser'}}current{{/if}}">New User</a></li>{{/p}}
						{{p name='see_user' module='user'}}<li><a href="{{$APP_BASE_URL}}user/admin/user-manager" class="{{if $menu[1]=='usermanager'}}current{{/if}}">User Manager</a></li>{{/p}}
                        {{p name='see_group' module='user'}}<li><a href="{{$APP_BASE_URL}}user/admin/group-manager" class="{{if $menu[1]=='groupmanager'}}current{{/if}}">Group Manager</a></li>{{/p}}
                       <!--  {{p name='see_permission' module='permission'}}<li><a href="{{$APP_BASE_URL}}permission/admin/manager" class="{{if $menu[1]=='permissionmanager'}}current{{/if}}">Permission Manager</a></li>{{/p}}
                        -->
					</ul>
				</li>
				
				<li> 
                    <a href="#" class="nav-top-item {{if $menu[0]=='scontent'}}current{{/if}}">
                    Contents
                    </a>
                    <ul>
                        {{p name='new_scontent' module='scontent'  expandId='?'}}<li><a href="{{$APP_BASE_URL}}scontent/admin/new" class="{{if $menu[1]=='new'}}current{{/if}}">New Article</a></li>{{/p}}
                        {{p name='see_scontent' module='scontent'  expandId='?'}}<li><a href="{{$APP_BASE_URL}}scontent/admin/manager" class="{{if $menu[1]=='manager'}}current{{/if}}">Content Manager</a></li>{{/p}}
                    </ul>
                </li>
                
                <li> 
                    <a href="#" class="nav-top-item {{if $menu[0]=='mail'}}current{{/if}}">
                    Mails
                    </a>
                    <ul>
                    <!-- 
                        {{p name='new_scontent' module='mail'}}<li><a href="{{$APP_BASE_URL}}mail/admin/new-newsletter" class="{{if $menu[1]=='newnewsletter'}}current{{/if}}">New Newsletter</a></li>{{/p}}
                        {{p name='see_scontent' module='mail'}}<li><a href="{{$APP_BASE_URL}}mail/admin/newsletter-manager" class="{{if $menu[1]=='newslettermanager'}}current{{/if}}">Newsletter Manager</a></li>{{/p}}
                      -->
                        {{p name='see_system_mail' module='mail'}}<li><a href="{{$APP_BASE_URL}}mail/admin/system-mail-manager" class="{{if $menu[1]=='systemmailmanager'}}current{{/if}}">System Mail Manager</a></li>{{/p}}
                    </ul>
                </li>
				
				<!-- 
				<li>
                    <a href="{{$APP_BASE_URL}}default/admin/settings" class="nav-top-item no-submenu {{if $menu[0]=='settings'}}current{{/if}}">
                        Settings
                    </a>       
                </li>
                 -->
                
                <li> 
                    <a href="#" class="nav-top-item {{if $menu[0]=='others'}}current{{/if}}">
                    Others
                    </a>
                    <ul>
                        <li><a href="{{$APP_BASE_URL}}category/admin/category-manager" class="{{if $menu[1]=='categorymanager'}}current{{/if}}">Category Manager</a></li>
                    </ul>
                </li>
				
			</ul> <!-- End #main-nav -->
			
			
		</div></div> <!-- End #sidebar -->
		
		<div id="main-content"> <!-- Main Content Section with everything -->
			
			<noscript> <!-- Show a notification if the user has disabled javascript -->
				<div class="notification error png_bg">
					<div>
						Javascript is disabled or is not supported by your browser. Please <a href="javascript:if(confirm('http://browsehappy.com/  \n\nThis file was not retrieved by Teleport Pro, because it is addressed on a domain or path outside the boundaries set for its Starting Address.  \n\nDo you want to open it from the server?'))window.location='http://browsehappy.com/'" title="Upgrade to a better browser">upgrade</a> your browser or <a href="javascript:if(confirm('http://www.google.com/support/bin/answer.py?answer=23852  \n\nThis file was not retrieved by Teleport Pro, because it is addressed on a domain or path outside the boundaries set for its Starting Address.  \n\nDo you want to open it from the server?'))window.location='http://www.google.com/support/bin/answer.py?answer=23852'"  title="Enable Javascript in your browser">enable</a> Javascript to navigate the interface properly.
					</div>
				</div>
			</noscript>
			
			<!-- PAGE START -->
			
			{{$content}}
			
			<div id="footer">
				<small> <!-- Remove this notice or replace it with whatever you want -->
						&#169; Copyright 2010 WordEveryday.com | Powered by <a href="mailto:nguoiao007@gmail.com">Nguyen Hoai Tan</a> | <a href="#">Top</a>
				</small>
			</div><!-- End #footer -->
			
		</div> <!-- End #main-content -->
		
	</div>
</body>
</html>

