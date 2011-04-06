
<script type="text/javascript" src="{{$LAYOUT_HELPER_URL}}admin/js/ckfinder/ckfinder.js"></script> 
                        
<script type="text/javascript">

$().ready(function() {
    // validate signup form on keyup and submit
    $("#register").validate({
        rules: {
            'data[name]': "required",
            'data[description]': "required",
            'data[price]': "required"
        },
        messages: {
            'data[name]': "",
            'data[description]': "",
            'data[price]': ""
        }
    }); 
});

function chooseImage()
{
    // You can use the "CKFinder" class to render CKFinder in a page:
    var finder = new CKFinder();
    finder.basePath = '{{$LAYOUT_HELPER_URL}}admin/js/ckfinder/'; // The path for the installation of CKFinder (default = "/ckfinder/").
    finder.selectActionFunction = SetFileField;
    finder.popup();

    // It can also be done in a single line, calling the "static"
    // Popup( basePath, width, height, selectFunction ) function:
    // CKFinder.Popup( '../../', null, null, SetFileField ) ;
    //
    // The "Popup" function can also accept an object as the only argument.
    // CKFinder.Popup( { BasePath : '../../', selectActionFunction : SetFileField } ) ;
} 
// This is a sample function which is called when a file is selected in CKFinder.
function SetFileField( fileUrl )
{
    document.getElementById( 'chooseImage_img' ).src = fileUrl;
    document.getElementById( 'chooseImage_input' ).value = fileUrl;
    document.getElementById( 'chooseImage_div').style.display = '';
    document.getElementById( 'chooseImage_noImage_div' ).style.display = 'none';
}
function clearImage()
{
    document.getElementById( 'chooseImage_img').src = '';
    document.getElementById( 'chooseImage_input' ).value = '';
    document.getElementById( 'chooseImage_div' ).style.display = 'none';
    document.getElementById( 'chooseImage_noImage_div').style.display = '';
}
</script>
            <div class="content-box"><!-- Start Content Box -->
                
                <div class="content-box-header">
                    
                    <h3>Edit Meal</h3>
                    
                    <div class="clear"></div>
                    
                </div> <!-- End .content-box-header -->
                
                <div class="content-box-content">
                
                    <form action="" method="post"  name="register" id="register">
                    
                    <div class="tab-content" id="tab1">
                    
                        <!-- ERROR -->
                        {{if $errors|@count > 0}}
                        <div class="notification error png_bg">
                            <a href="#" class="close"><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/cross_grey_small.png" title="Close this notification" alt="close" /></a>
                            <div>
                                {{if $errors.main}}
                                    Error: {{$errors.main}}
                                {{else}}
                                    Error: Please check following information again
                                {{/if}} 
                                                                       
                            </div>
                        </div>
                        {{/if}}
                            <!-- Meal's fields -->
                            
                                    
                                    <p><label class="w155">Meal Name:<span class="red">*</span></label>
                                    <input name="data[name]" type="text" value="{{$data.name}}" class="text-input small-input" /></p>
                                    
                                    
                                    
                                    <!-- MEAL's IMAGE -->
                                    <label class="w155">Image:</label>
                                    <div style="float: left; margin: 10px;" id ="image_div">
                                    
                                            <input type="hidden" id="chooseImage_input" name="data[image]" value="{{$BASE_URL}}{{$data.image}}">
                                            <div id="chooseImage_div" style="{{if !$data.image}} display:none{{/if}}">
                                                <img src="{{$BASE_URL}}{{$data.image}}" id="chooseImage_img" style="max-width: 150px; border:dashed thin;"></img><br/>
                                            </div>
                                            <div id="chooseImage_noImage_div" style="width: 150px; border: thin dashed; text-align: center; padding:70px 0px; {{if $data.image}} display:none{{/if}} ">
                                                No image
                                            </div>
                                            <br/>
                                            <a href="javascript:chooseImage();">Choose image</a>
                                            | 
                                            <a href="javascript:clearImage();">Delete</a>
                                    </div>     
                                    <br style="clear: both;"/>  
                                    <br/>  
                                    <!-- END IMAGE -->
                                    
                                    
                                    
                                    <p>
                                        <label>Description:<span class="red">*</span></label>
                                        <textarea class="text-input textarea" id="textarea" name="data[description]" cols="79" rows="5">{{$data.description}}</textarea>
                                    </p>
                                    
                                    <p><label class="w155">Price:<span class="red">*</span></label>
                                    <input name="data[price]" type="text" value="{{$data.price}}" class="text-input small-input" /></p>
                                    
                                    <p><label class="w155">Type:<span class="red">*</span></label>
                                    <select name="data[type]" >
                                            <option {{if 0==$data.type}} selected="selected" {{/if}} value="0">General</option>
                                            <option {{if 1==$data.type}} selected="selected" {{/if}} value="1">Catering</option>
                                    </select>
                                    </p>
                                    
                                    <p>
                                        <label>Enabled</label>
                                        <input type="radio" name="data[enabled]" value="1" {{if $data.enabled != '0'}}checked="checked"{{/if}}/> Yes &nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="data[enabled]" value="0" {{if $data.enabled == '0'}}checked="checked"{{/if}}/> No
                                    </p>
                            
                            <!-- END fields -->
                            <p>
                            <br/>
                                <input class="button" type="button" value="&laquo; Back" onclick="javascript:history.back();"/>
                                <input class="button" type="submit" value="Save" />
                            </p>
                            <div class="clear"></div><!-- End .clear -->
                            
                    </div>  <!-- End #tab1 --> 
                    
                      
                  </form>
                </div> <!-- End .content-box-content -->
                
            </div> <!-- End .content-box -->
            
            
            <div class="clear"></div>