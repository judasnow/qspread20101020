
<script type="text/javascript">
$().ready(function() {
    // validate signup form on keyup and submit
    $("#register").validate({
        rules: {
            'email': {
                required: true,
                email: true
            }
        },
        messages: {
            'email': ""
        }
    }); 
});

</script>


    <form method="POST" name="register" id="register">
    <div id="main">
        <p class="title1">Forgot password</p>
        <div class="p10">
        
            {{if $error}}        
            <div class="register_error" style="padding: 10px 20px;">
                <b>Error:</b> Email doesn't exist. Please try with correct email.
            </div>
            {{/if}}
                    
            <div class="w450 float_left">
                <div class="input_form">
                    
                    Enter your email:
                    
                    <input name="email" type="text" value="{{$email}}" class="w230" />
                    
                    <input type="image" name="SUBMIT" src="{{$LAYOUT_HELPER_URL}}front/img/bt_conti.jpg" alt="" style="border: none;padding: 0px;margin: 0px; margin-bottom:-5px; height: 100%" />
                    
                </div> 
            </div>
            <div class="clear"></div>
        </div>
    </div>
    </form>