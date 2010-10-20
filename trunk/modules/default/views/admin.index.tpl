<h2>Welcome {{$backendUser.full_name}}</h2>
            <p id="page-intro">What would you like to do?</p>
            
            <ul class="shortcut-buttons-set">
               <!--  
                <li><a class="shortcut-button" href="{{$APP_BASE_URL}}user/admin/new-registration-user"><span>
                    <img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/add_user_48.png" alt="icon" /><br />
                    New Register User
                </span></a></li>
                
                -->  
                <li><a class="shortcut-button" href="{{$APP_BASE_URL}}user/admin/registration-user-manager"><span>
                    <img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/group_48.png" alt="icon" /><br />
                    Register User Manager
                </span></a></li>
               
                 
                <li><a class="shortcut-button" href="{{$APP_BASE_URL}}page/admin/manager"><span>
                    <img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/paper_content_pencil_48.png" alt="icon" /><br />
                    Edit Pages
                </span></a></li>
                
                <li><a class="shortcut-button" href="{{$APP_BASE_URL}}crush/admin/upload"><span>
                    <img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/image_add_48.png" alt="icon" /><br />
                    Upload Crush Item
                </span></a></li>
                
                <li><a class="shortcut-button" href="{{$APP_BASE_URL}}order/admin/credit-manager"><span>
                    <img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/dolor.png" alt="icon" /><br />
                    Credit Order Manager
                </span></a></li>
                
                <li><a class="shortcut-button" href="{{$APP_BASE_URL}}notification/admin/matches-manager" rel="modal"><span>
                    <img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/comment_48.png" alt="icon" /><br />
                    Matches Manager
                </span></a></li>
                
            </ul><!-- End .shortcut-buttons-set -->
            
            <div class="clear"></div> <!-- End .clear -->
