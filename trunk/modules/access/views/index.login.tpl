<!-- 
<script type="text/javascript">
$(document).ready(function (){
	openLoginForm();
	document.getElementById('loginMessage').style.display = '';
});
</script>
 -->

<div id="main" style="height: 300px;">
    <div class="clear"></div>
    <div class="page">
        <div class="bg_login p10t">
            <form action="" method="POST">
                <p style="margin: 0px 0 0 20px; color: #FFF; font-weight: bold;"
                	class="font14">Login</p>
                	
                <div class="form_input">
                {{if $loginError}}
                <p class="red">Username or Password is incorrect</p><br/>
                {{/if}}
                
                <input type="text" value="User name" name="username" onclick="this.value='';"/><br />
                <input type="password" value="Password" name="password" onclick="this.value='';" onfocus="this.value='';"/><br />
                <input type="image" name="submit" src="{{$LAYOUT_HELPER_URL}}front/img/btn_login.jpg" style="width: 68px;height: 27px; padding:0px;;" />
                
                <div style="float: right; padding-right: 20px;">
                <a href="{{$BASE_URL}}user/index/forgot-password">Forgot password</a><br/>
                <a href="{{$BASE_URL}}register.html">Register new account</a>
                </div>
                </div>
            </form>
        </div>
    </div>
</div>