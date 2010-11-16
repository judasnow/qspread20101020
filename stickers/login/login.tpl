
<div id="overlay" style="display: none;"></div>
<div id="login" class="done" style="display: none;">
    <div class="lbContent">
        <form method="POST" action="{{$APP_BASE_URL}}access/index/login">
            <h2>Login</h2>
            <div style="float: right;margin-top: -30px;"><a href="javascript:closeLoginForm();" title="Close">
            
                <img src="{{$LAYOUT_HELPER_URL}}front/img/close_16.png" alt="Close" />
            </a></div>
            <p class="red" style="text-align: right;display:none;" id="loginMessage">Username or Password is incorrect</p><br/>
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
            <a href="{{$BASE_URL}}register.html">Register new account</a>
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

{{if $loginError === true}}
$(document).ready(function (){
    openLoginForm();
    document.getElementById('loginMessage').style.display = '';
});
{{/if}}

</script>