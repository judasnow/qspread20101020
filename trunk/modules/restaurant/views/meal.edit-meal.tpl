 
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
  
    <div id="main">
        

        <div class="w692" style="padding-left: 96px;">
            <p class="title1">Edit meal</p>
            <br/>
            
            <p class="float_left m10r"><img src="{{$BASE_URL}}{{$res.image}}" alt="" /></p>
            <span class="fs14"><b>{{$res.name}}</b> (<a href="{{$BASE_URL}}user/index/edit-restaurant">Edit</a>)</span><br />
            {{$res.street}}<br />
            {{$res.city}}, {{$res.state}} {{$res.zip}}<br />
            <br/>
            {{$res.description}}<br/>
            <br/>
            <div class="clear_left"></div>
            
            <form method="POST" name="register" id="register">
                    
               <div class="input_form">
                    
                    <label class="w155">Meal Name:<span class="red">*</span></label>
                    <input name="data[name]" type="text" value="{{$data.name}}" class="w270" /><br />
                    
                    
                    <!-- MEAL's IMAGE -->
                        <label class="w155">Image :</label>
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

                    <label class="w155">Description:<span class="red">*</span></label>
                    <textarea id="textarea" name="data[description]" cols="79" rows="5">{{$data.description}}</textarea>

                    <label class="w155">Price:<span class="red">*</span></label>
                    <input  name="data[price]" type="text" value="{{$data.price}}" class="w270" /><br />
                    
                    <label class="w155">Type:<span class="red">*</span></label>
                        <select name="data[type]" >
                                <option {{if 0==$data.type}} selected="selected" {{/if}} value="0">General</option>
                                <option {{if 1==$data.type}} selected="selected" {{/if}} value="1">Catering</option>
                        </select><br />
                    
                    <label class="w155">Enable:</label>
                        <input type="radio" name="data[enabled]" value="1" {{if $data.enabled != '0'}}checked="checked"{{/if}}/> Yes &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="data[enabled]" value="0" {{if $data.enabled == '0'}}checked="checked"{{/if}}/> No
                    <br />
                    
                 </div>
                    <br />
                    <br />
                    <input type="image" src="{{$LAYOUT_HELPER_URL}}front/img/btn_apply.png" style="padding:0px;"/>
                        
        </form> 
                
                
        </div>
        <div class="clear"></div>
    </div>
    
            
<script language="javascript" type="text/javascript">

function deleteAMeal(id)
{
    result = confirm('Are you sure you want to delete this meal?');
    if (false == result) {
        return;
    }
    window.location.href = '{{$APP_BASE_URL}}restaurant/meal/delete-meal/id/' + id;
}
</script>