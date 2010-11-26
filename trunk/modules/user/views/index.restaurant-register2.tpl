<script>
function checkSubmit(form) {
    // Check condition
    var c = document.getElementById('condition');
    if (false == c.checked) {
        alert ("Please agree 'QuickSpread - Terms & Conditions'");
    } else {
        $(form).submit();
    }
}
</script>         
         
           <form method="POST" onsubmit="checkSubmit(this);return false;">
            <div>
                <p class="title1">Almost done!</p>
                <br/>
                                
                {{$article.full_text}}

                <p class="p15t color_2"><b>Finalize Your Sign Up</b></p>
                
              <!--   <div class="m15t">
                    <label class="w155">Name:</label>
                    <input type="text" value="00" class="w165" style="margin-right:20px;" />
                    <span class="w175 right">Title:</span>
                    <input type="text" value="00" class="w165" />
                </div>
               -->  
                <div class="m15t"><input id="condition" name="condition" value="1" type="checkbox" class="mid m20r" style="border:none;" /> I have read and accepted QuickSpread - Terms & Conditions</div>
                <br />
            </div>      
                <br />
                
              <input type="image" src="{{$LAYOUT_HELPER_URL}}front/img/bt_signup.jpg" style="padding:0px;"/>
              
              </form>  