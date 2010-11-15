<script type="text/javascript">
$().ready(function() {
    // validate signup form on keyup and submit
    $("#contact").validate({
        rules: {
            'data[name]': "required",
            'data[email]': {
                required: true,
                email: true
            },
            'data[retype_email]': {
            	equalTo: "#email"
            },
            'data[phone]': "required"
        },
        messages: {
            'data[name]': "",
            'data[email]': "",
            'data[retype_email]': "",
            'data[phone]': ""
        }
    }); 
});

</script>

    <div id="main">
        <p class="p10t title1">Contact Us</p>
        <div class="w201 float_left">
            <div class="top1 m20t"></div>
            <div class="cen1">
                <div class="cen_1">
                    <div class="p10">
                        <div class="center"><img src="img/tt_quick.png" alt="" /></div>
                        <p class="p10t fs14"><b>Address:</b></p>
                        1210 N. Jefferson Street, Suite<br /> 
                        PAnaheim, CA 92807
                        <p class="p10t fs14"><b>Contact Information</b></p>
                        Phone: 866.545.8808
                        <p class="p10t fs14"><b>Mailing Address</b></p>
                        1210 N. Jefferson Street, Suite <br /> 
                        P Anaheim, CA 92807
                    </div>
                </div>
            </div>
            <div class="bot1"></div>
        </div>
        <div class="w692 float_right m20t">
            We welcome your feedback and want to hear from you. We are constantly searching for ways to better serve you, so your comments and suggestions are valuable to us. Thank you for choosing to share your viewpoint with us.
            <div class="input_form">
            <form method="POST" id="contact" name="contact">
                <label class="w110">Name:<span class="red">*</span></label>
                <input name="data[name]" type="text" value="" class="w270" /><br />
                
                <label class="w110">Title:</label>
                <input name="data[title]"  type="text" value="" class="w270" /><br />
                
                <label class="w110">Company Name:</label>
                <input name="data[company_name]"  type="text" value="" class="w270" /><br />
                
                <label class="w110">E-mail:<span class="red">*</span></label>
                <input id="email" name="data[email]"  type="text" value="" class="w270" /><br />
                
                <label class="w110">Re-type E-mail:<span class="red">*</span></label>
                <input name="data[retype_email]"  type="text" value="" class="w270" /><br />
                
                <label class="w110">Phone:<span class="red">*</span></label>
                <input name="data[phone]"  type="text" value="" class="w270" /><br />
                
                <label class="w110">Fax:</label>
                <input name="data[fax]"  type="text" value="" class="w270" /><br />
                
                <label class="w110">Your message:</label>
                <textarea name="data[message]"  rows="5" class="w270"></textarea><br />
                
                <label class="w110">&nbsp;</label>
                <input type="image" name="SUBMIT" src="img/bt_send.jpg" alt="" style="border: none;padding: 0px;margin: 0px; height: 100%" />
                <a href="javascript:document.contact.reset();"><img src="img/bt_reset.jpg" alt="" /></a><br />
            </form>
            </div>
        </div>
        <div class="clear"></div>
    </div>