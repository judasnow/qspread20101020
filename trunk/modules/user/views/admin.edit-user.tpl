            <div class="content-box"><!-- Start Content Box -->
                
                <div class="content-box-header">
                    
                    <h3>Edit User</h3>
                    
                    <ul class="content-box-tabs">
                        <li><a href="#tab1" class="default-tab">Basic</a></li>
                        <li><a href="#tab2">Detail</a></li>
                        <li><a href="#tab3">Notification</a></li>
                    </ul>
                    
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
                                    <label>Username<span class="red">*</span></label>
                                        <input class="text-input small-input" type="text" id="small-input" name="data[username]" value="{{$data.username}}" />{{if $errors.username}}<span class="input-notification error png_bg">{{$errors.username}}</span>{{/if}}
                                </p>
                                <p>
                                    <label>New Password<span class="red">*</span></label>
                                        <input class="text-input small-input" type="password" id="small-input" name="data[password]" value="" />{{if $errors.password}}<span class="input-notification error png_bg">{{$errors.password}}</span>{{/if}}
                                        <br /><small>Between 6-20 characters</small>
                                </p>
                                <p>
                                    <label>Repeat New Password<span class="red">*</span></label>
                                        <input class="text-input small-input" type="password" id="small-input" name="data[repeat_password]" value="{{$data.repeat_password}}" />{{if $errors.repeat_password}}<span class="input-notification error png_bg">{{$errors.repeat_password}}</span>{{/if}}
                                </p>
                                <p>
                                    <label>Email<span class="red">*</span></label>
                                        <input class="text-input small-input" type="text" id="small-input" name="data[email]"  value="{{$data.email}}" />{{if $errors.email}}<span class="input-notification error png_bg">{{$errors.email}}</span>{{/if}}
                                </p>
                                <p>
                                    <label>Full Name<span class="red">*</span></label>
                                        <input class="text-input small-input" type="text" id="small-input" name="data[full_name]"  value="{{$data.full_name}}" />{{if $errors.full_name}}<span class="input-notification error png_bg">{{$errors.full_name}}</span>{{/if}}
                                </p>
                                <p>
                                    <label>Group<span class="red">*</span></label>              
                                    <select name="data[group_id]" class="small-input">
                                    {{foreach from=$allGroups item=item}}
                                        <option value="{{$item.group_id}}" {{if $data.group_id == $item.group_id}}selected="selected"{{/if}}>{{$item.name}}</option>
                                    {{/foreach}}
                                    </select> 
                                    <br /><small>Each group has different <a href="{{$APP_BASE_URL}}user/admin/permission-manager">permissions</a>.</small>
                                </p>
                                
                                <p>
                                <br/>
                                    <input class="button" type="button" value="&laquo; Back" onclick="javascript:history.back();"/>
                                    <input class="button" type="submit" value="Save" />
                                </p>
                                
                            </fieldset>
                            
                            <div class="clear"></div><!-- End .clear -->
                            
                    </div>  <!-- End #tab1 --> 
                    
                    <div class="tab-content hidden" id="tab2">
                    
                            <fieldset> <!-- Set class to "column-left" or "column-right" on fieldsets to divide the form into columns -->
                                <p>
                                    <label>Enable user</label>
                                    <input type="radio" name="data[enabled]" value="1" {{if $data.enabled != '0'}}checked="checked"{{/if}}/> Yes &nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="data[enabled]" value="0" {{if $data.enabled == '0'}}checked="checked"{{/if}}/> No
                                </p>
                                <p>
                                    <label>FB Session</label>
                                        <input class="text-input small-input" type="text" id="small-input" name="data[fb_session]" value="{{$data.fb_session}}"/>
                                </p>
                                <p>
                                    <label>FB User ID</label>
                                        <input class="text-input small-input" type="text" id="small-input" name="data[fb_user_id]" value="{{$data.fb_user_id}}"/>
                                </p>
                                <p>
                                    <label>Twitter User ID</label>
                                        <input class="text-input small-input" type="text" id="small-input" name="data[tw_user_id]" value="{{$data.tw_user_id}}"/>
                                </p>
                                <p>
                                    <label>Num of Words - Today</label>
                                        <input class="text-input small-input" type="text" id="small-input" name="data[learned_word_num_today]" value="{{$data.learned_word_num_today}}"/>
                                </p>
                                <p>
                                    <label>Num of Words - Week</label>
                                        <input class="text-input small-input" type="text" id="small-input" name="data[learned_word_num_week]" value="{{$data.learned_word_num_week}}"/>
                                </p>
                                <p>
                                    <label>Num of Words - Month</label>
                                        <input class="text-input small-input" type="text" id="small-input" name="data[learned_word_num_month]" value="{{$data.learned_word_num_month}}"/>
                                </p>
                                <p>
                                    <label>Num of Words - Total</label>
                                        <input class="text-input small-input" type="text" id="small-input" name="data[learned_word_num_total]" value="{{$data.learned_word_num_total}}"/>
                                </p>
                                <p>
                                    <label>Num of Posts - Week</label>
                                        <input class="text-input small-input" type="text" id="small-input" name="data[posted_word_num_week]" value="{{$data.posted_word_num_week}}"/>
                                </p>
                                <p>
                                    <label>Num of Posts - Total</label>
                                        <input class="text-input small-input" type="text" id="small-input" name="data[posted_word_num_total]" value="{{$data.posted_word_num_total}}"/>
                                </p>
                                <p>
                                    <label>Num of Friends</label>
                                        <input class="text-input small-input" type="text" id="small-input" name="data[friend_num]" value="{{$data.friend_num}}"/>
                                </p>
                                <p>
                                    <label>Friends' String</label>
                                        <input class="text-input large-input" type="text" id="small-input" name="data[friend_id_string]" value="{{$data.friend_id_string}}"/>
                                </p>
                                
                                <p>
                                    <label>Admin's Note</label>
                                    <textarea class="text-input textarea" id="textarea" name="data[admin_note]" cols="79" rows="5">{{$data.admin_note}}</textarea>
                                </p>
                                <p>
                                    <label>About Me</label>
                                    <textarea class="text-input textarea" id="textarea" name="data[about_me]" cols="79" rows="5">{{$data.about_me}}</textarea>
                                </p>
                                
                                <p>
                                    <input class="button" type="button" value="&laquo; Back" onclick="javascript:history.back();"/>
                                    <input class="button" type="submit" value="Save" />
                                </p>
                                
                            </fieldset>
                            
                            <div class="clear"></div><!-- End .clear -->
                            
                    </div>      
                    <div class="tab-content hidden" id="tab3">
                    
                            <fieldset> <!-- Set class to "column-left" or "column-right" on fieldsets to divide the form into columns -->
                                <p>Send email to user when:</p>
                                <p>
                                    <label>Add me as friend</label>
                                    <input type="radio" name="data[notify_add_friend]" value="1" {{if $data.notify_add_friend != '0'}}checked="checked"{{/if}}/> Yes &nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="data[notify_add_friend]" value="0" {{if $data.notify_add_friend == '0'}}checked="checked"{{/if}}/> No
                                </p>
                                <p>
                                    <label>Send me a message</label>
                                    <input type="radio" name="data[notify_send_message]" value="1" {{if $data.notify_send_message != '0'}}checked="checked"{{/if}}/> Yes &nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="data[notify_send_message]" value="0" {{if $data.notify_send_message == '0'}}checked="checked"{{/if}}/> No
                                </p>
                                <p>
                                    <label>Confirm my request</label>
                                    <input type="radio" name="data[notify_confirm_friend_request]" value="1" {{if $data.notify_confirm_friend_request != '0'}}checked="checked"{{/if}}/> Yes &nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="data[notify_confirm_friend_request]" value="0" {{if $data.notify_confirm_friend_request == '0'}}checked="checked"{{/if}}/> No
                                </p>
                                <p>
                                    <label>Comment my post</label>
                                    <input type="radio" name="data[notify_comment_post]" value="1" {{if $data.notify_comment_post != '0'}}checked="checked"{{/if}}/> Yes &nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="data[notify_comment_post]" value="0" {{if $data.notify_comment_post == '0'}}checked="checked"{{/if}}/> No
                                </p>
                                <p>
                                    <label>Me in TOP 5</label>
                                    <input type="radio" name="data[notify_top5]" value="1" {{if $data.notify_top5 != '0'}}checked="checked"{{/if}}/> Yes &nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="data[notify_top5]" value="0" {{if $data.notify_top5 == '0'}}checked="checked"{{/if}}/> No
                                </p>
                                <p>
                                    <label>Me out TOP 5</label>
                                    <input type="radio" name="data[notify_out_top5]" value="1" {{if $data.notify_out_top5 != '0'}}checked="checked"{{/if}}/> Yes &nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="data[notify_out_top5]" value="0" {{if $data.notify_out_top5 == '0'}}checked="checked"{{/if}}/> No
                                </p>
                                <p>
                                    <label>My friend in TOP 5</label>
                                    <input type="radio" name="data[notify_friend_top5]" value="1" {{if $data.notify_friend_top5 != '0'}}checked="checked"{{/if}}/> Yes &nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="data[notify_friend_top5]" value="0" {{if $data.notify_friend_top5 == '0'}}checked="checked"{{/if}}/> No
                                </p>
                                <p>
                                    <label>My friend out TOP 5</label>
                                    <input type="radio" name="data[notify_friend_out_top5]" value="1" {{if $data.notify_friend_out_top5 != '0'}}checked="checked"{{/if}}/> Yes &nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="data[notify_friend_out_top5]" value="0" {{if $data.notify_friend_out_top5 == '0'}}checked="checked"{{/if}}/> No
                                </p>
                                
                                <p>
                                    <input class="button" type="button" value="&laquo; Back" onclick="javascript:history.back();"/>
                                    <input class="button" type="submit" value="Save" />
                                </p>
                                
                            </fieldset>
                            
                            <div class="clear"></div><!-- End .clear -->
                            
                    </div>    
                      
                  </form>
                </div> <!-- End .content-box-content -->
                
            </div> <!-- End .content-box -->
            
            
            <div class="clear"></div>