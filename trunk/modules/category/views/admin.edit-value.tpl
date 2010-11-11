            
            <div class="content-box"><!-- Start Content Box -->
                
                <div class="content-box-header">
                    
                    <h3>Edit Value</h3>
                    
                    <div class="clear"></div>
                    
                </div> <!-- End .content-box-header -->
                
                <div class="content-box-content">
                
                    <form action="" method="post">
                    
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
                            
                            <fieldset> <!-- Set class to "column-left" or "column-right" on fieldsets to divide the form into columns -->
                                
                                <p>
                                    <label>Category</label>
                                        {{$category.name}}
                                </p>
                                <p>
                                    <label>New Value</label>
                                        <input class="text-input small-input" type="text" id="small-input" name="data[name]" value="{{$data.name}}" />
                                </p>
                                <p>
                                    <label>Sort</label>
                                        <input class="text-input small-input" type="text" id="small-input" name="data[sorting]" value="{{$data.sorting}}" />
                                </p>
                                
                                <p>
                                <br/>
                                    <input class="button" type="submit" value="Save" />
                                </p>
                                
                            </fieldset>
                            
                            <div class="clear"></div><!-- End .clear -->
                            
                    </div>  <!-- End #tab1 --> 
                    
                    
                  </form>
                </div> <!-- End .content-box-content -->
                
            </div> <!-- End .content-box -->
            
            
            <div class="clear"></div>
