<script type="text/javascript" src="{{$LAYOUT_HELPER_URL}}admin/js/ckeditor/ckeditor.js"></script> 
<script type="text/javascript" src="{{$LAYOUT_HELPER_URL}}admin/js/ckfinder/ckfinder.js"></script> 
       
            <div class="content-box"><!-- Start Content Box -->
                
                <div class="content-box-header">
                    
                    <h3>New Article</h3>
                    
                    <ul class="content-box-tabs">
                        {{if $fullPermisison}}<li><a href="#tab0" class="default-tab">General</a></li>{{/if}}
                        {{foreach from=$allLangs item=item index=index name=langTab}}
                        <li><a {{if !$fullPermisison && $smarty.foreach.langTab.first}}class="default-tab"{{/if}} href="#tab{{$item.lang_id}}" style="padding-bottom: 4px;"><image style="vertical-align:middle;" src="{{$BASE_URL}}{{$item.lang_image}}"> {{$item.name}}</a></li>
                        {{/foreach}}
                    </ul>
                    
                    <div class="clear"></div>
                    
                </div> <!-- End .content-box-header -->
                
                <div class="content-box-content">
                
                    <form action="" method="post">
                    
                    <!-- GENERAL -->
                    <div class="tab-content {{if !$fullPermisison}}hidden{{/if}}" id="tab0">
                    
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
                            
                            <fieldset> <!-- Set class to "column-left" or "column-right" on fieldsets to divide the form into columns -->
                                <p>
                                    <label>Category<span class="red">*</span></label>              
                                    <select name="data[scontent_category_id]" class="small-input">
                                    {{foreach from=$allCats item=item}}
                                        <option value="{{$item.scontent_category_id}}" {{if $data.scontent_category_id == $item.scontent_category_id}}selected="selected"{{/if}}>{{$item.name}}</option>
                                    {{/foreach}}
                                    </select> 
                                </p>
                                <p>
                                    <label>Sorting<span class="red">*</span><br/><br/></label>
                                        <input class="text-input small-input" type="text" id="small-input" name="data[sorting]" value="{{$data.sorting}}" />{{if $errors.repeat_password}}<span class="input-notification error png_bg"></span>{{/if}}
                                        <br /><small>No 1 will display as first article</small>
                                </p>
                                <p>
                                    <label>Published<span class="red">*</span></label>
                                    <input type="radio" name="data[enabled]" value="1" {{if $data.enabled == '1'}}checked="checked"{{/if}}/> Yes &nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="data[enabled]" value="0" {{if $data.enabled != '1'}}checked="checked"{{/if}}/> No
                                </p>
                                <p>
                                    <label>Start Publishing<br/><br/></label>
                                        <input class="text-input small-input" type="text" id="small-input" name="data[publish_up_date]" value="{{$data.publish_up_date}}" />
                                        <br /><small>Format: mm/dd/yyyy</small>
                                </p>
                                <p>
                                    <label>Finish Publishing<br/><br/></label>
                                        <input class="text-input small-input" type="text" id="small-input" name="data[publish_down_date]" value="{{$data.publish_down_date}}" />
                                        <br /><small>Format: mm/dd/yyyy</small>
                                </p>
                                
                                <p>
                                <br/>
                                    <input class="button" type="submit" value="Save" />
                                </p>
                                
                            </fieldset>
                            
                            <div class="clear"></div><!-- End .clear -->
                            
                    </div>  <!-- End GENERAL --> 
                    
                    {{foreach from=$allLangs item=item name=langDiv}}
                    <!-- LANGUAGES -->
                    <div class="tab-content {{if $fullPermisison || !$smarty.foreach.langDiv.first}}hidden{{/if}}" id="tab{{$item.lang_id}}">
                    
                            <fieldset> <!-- Set class to "column-left" or "column-right" on fieldsets to divide the form into columns -->
                                <p>
                                    <label>Published</label>
                                    <input type="radio" name="data[{{$item.lang_id}}][enabled]" value="1" {{if $data[$item.lang_id].enabled == '1'}}checked="checked"{{/if}}/> Yes &nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="data[{{$item.lang_id}}][enabled]" value="0" {{if $data[$item.lang_id].enabled != '1'}}checked="checked"{{/if}}/> No
                                </p>
                                <p>
                                    <label>Title</label>
                                        <input class="text-input small-input" type="text" id="small-input" name="data[{{$item.lang_id}}][title]" value="{{$data[$item.lang_id].title}}" />
                                </p>
                                <p>
                                    <label>URL<br/><br/></label>
                                        <input class="text-input small-input" type="text" id="small-input" name="data[{{$item.lang_id}}][category_alias]" value="{{$data[$item.lang_id].category_alias}}" />
                                        /
                                        <input class="text-input small-input" type="text" id="small-input" name="data[{{$item.lang_id}}][alias]" value="{{$data[$item.lang_id].alias}}" /> .html
                                        <br /><small>(Category alias) / (Article alias) .html</small>
                                </p>
                                
                                <p>
                                    <div style="float:left;"><label>Intro text</label></div>
                                    <div style="float:left;width: 730px;"><textarea style="float:left;" class="text-input textarea editor"  name="data[{{$item.lang_id}}][intro_text]" rows="20" cols="90">{{$data[$item.lang_id].intro_text}}</textarea></div>
                                    <div class="clear"></div>
                                </p>
                                <p>
                                    <div style="float:left;"><label>Full text</label></div>
                                    <div style="float:left;width: 730px;"><textarea style="float:left;" class="text-input textarea editor"  name="data[{{$item.lang_id}}][full_text]" rows="20" cols="90">{{$data[$item.lang_id].full_text}}</textarea></div>
                                    <div class="clear"></div>
                                </p>
                                
                                <p>
                                <br/>
                                    <input class="button" type="submit" value="Save" />
                                </p>
                                
                            </fieldset>
                            
                            <div class="clear"></div><!-- End .clear -->
                            
                    </div>
                                
                        
                    {{/foreach}}
                    
                  </form>
                  
                </div> <!-- End .content-box-content -->
                
            </div> <!-- End .content-box -->
            
            
            <div class="clear"></div>

<script type="text/javascript">
    //<![CDATA[
    
        // Replace the <textarea id="editor"> with an CKEditor
        // instance, using default configurations.
        
        CKFinder.setupCKEditor( null, '{{$LAYOUT_HELPER_URL}}admin/js/ckfinder/' );
        CKEDITOR.replaceAll( 'editor');
    
//]]>
</script>
<style type="text/css">
.cke_top {
	background-color: #dddddd;
}
</style>
