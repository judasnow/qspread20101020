{{if false ==$isLoggedIn}}

<div class="float_right">
    <ul class="na_1">
        <li><a href="{{$BASE_URL}}" {{if $menuId == 'home'}} class="current" {{/if}} style="border: none;">Home</a></li>
        <li><a href="{{$BASE_URL}}access/index/login">Sign in</a></li>
        <li><a  {{if $menuId == 15}} class="current" {{/if}} href="{{$fqaUrl}}">FAQ</a></li>
    </ul>
    <div class="float_right m10r"><a href="{{$BASE_URL}}register.html">
        <img src="{{$LAYOUT_HELPER_URL}}front/img/icon_setup.jpg" alt="" /></a>
    </div>
    <br class="clear_right" />
</div>

{{else}}

<div class="float_right">
    <ul class="na_1">
        <li><a href="{{$BASE_URL}}"  {{if $menuId == 'home'}} class="current" {{/if}} style="border:none;">Home</a></li>
        
        {{if '1' == $loggedUser.is_restaurant}}
        <li><a href="{{$BASE_URL}}user/index/edit-restaurant">My Restaurant</a></li>
        <li><a href="{{$BASE_URL}}restaurant/meal/manager">Meal Manager</a></li>
        <li><a href="{{$BASE_URL}}order/index/manager">Order Manager</a></li>
        <li><a href="{{$BASE_URL}}restaurant/reservation/manager">Reservation Manager</a></li>
        {{else}}
        <li><a href="{{$APP_BASE_URL}}user/index/edit">My Account</a></li>
        {{/if}}
        
        <li><a href="{{$APP_BASE_URL}}access/index/logout">Signout</a></li>
        <li><a  {{if $menuId == 15}} class="current" {{/if}}  href="{{$fqaUrl}}">FAQ</a></li>
    </ul>
    <!-- 
    <div class="float_right m10r"><a href="#"><img src="{{$LAYOUT_HELPER_URL}}front/img/icon_setup.jpg" alt="" /></a></div>
     -->
    <div class="float_right m10r fs14 w_color m25t">
        Welcome: {{$loggedUser.full_name}} !
    </div>
    <br class="clear_right" />
</div>

{{/if}}