<h2>Welcome {{$backendUser.full_name}}</h2>
            <p id="page-intro">What would you like to do?</p>
            
            <ul class="shortcut-buttons-set">
               <!--  
                <li><a class="shortcut-button" href="{{$APP_BASE_URL}}user/admin/new-registration-user"><span>
                    <img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/add_user_48.png" alt="icon" /><br />
                    New Register User
                </span></a></li>
                
                -->  
                <li><a class="shortcut-button" href="{{$APP_BASE_URL}}user/admin/user-manager"><span>
                    <img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/group_48.png" alt="icon" /><br />
                    User Manager
                </span></a></li>
               
                 
                <li><a class="shortcut-button" href="{{$APP_BASE_URL}}scontent/admin/manager"><span>
                    <img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/paper_content_pencil_48.png" alt="icon" /><br />
                    Content Manager
                </span></a></li>
                
                <li><a class="shortcut-button" href="{{$APP_BASE_URL}}restaurant/admin/manager"><span>
                    <img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/image_add_48.png" alt="icon" /><br />
                    Restaurant Manager
                </span></a></li>
                
                <li><a class="shortcut-button" href="{{$APP_BASE_URL}}order/admin/manager"><span>
                    <img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/dolor.png" alt="icon" /><br />
                    Order Manager
                </span></a></li>
                
                
            </ul><!-- End .shortcut-buttons-set -->
            
            <div class="clear"></div> <!-- End .clear -->
