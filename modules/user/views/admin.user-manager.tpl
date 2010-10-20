            <h2>User Manager</h2>
            
             <!-- End .shortcut-buttons-set -->
            
            <div class="clear"></div> <!-- End .clear -->
           
            
            <div class="content-box"><!-- Start Content Box -->
                
                <div class="content-box-header">
                    
                    <div style="float:left;">
                        <a name="listofcontent"><h3>List of Users</h3></a>
                   </div>     
                   <div style="float:right;padding-right:20px;padding-top:5px;">
                        <form class="search" name="search" method="post" action="{{$APP_BASE_URL}}user/admin/user-manager">
                            <input class="text-input small-input" type="text" name="condition[username]" id="username" value="{{$condition.username}}"/>
                            
                            <select name="condition[group_id]">
                                <option value="">All groups</option>
                            {{foreach from=$allGroups item=item}}
                                <option value="{{$item.group_id}}" {{if $condition.group_id == $item.group_id}}selected="selected"{{/if}}>{{$item.name}}</option>
                            {{/foreach}}
                            </select> 
                            <input class="button" type="submit" value="Search" />
                        </form>
                        
                   </div>
                    
                </div> <!-- End .content-box-header -->
                
                <div class="content-box-content">
                    
                    <div class="tab-content default-tab" id="tab1"> <!-- This is the target div. id must match the href of this div's tab -->
                        
                       
                       
                        <!-- MESSAGE HERE -->
                        {{if $allUsers|@count <= 0}}
                        <div class="notification information png_bg">
                            <a href="#" class="close"><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/cross_grey_small.png" title="Close this notification" alt="close" /></a>
                            <div>
                                No user with above conditions.
                            </div>
                        </div>
                        {{/if}}
                        
                        {{if $userMessage|@count > 0 && $userMessage.success == true}}
                        <div class="notification success png_bg">
                            <a href="#" class="close"><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/cross_grey_small.png" title="Close this notification" alt="close" /></a>
                            <div>
                                {{$userMessage.message}}
                            </div>
                        </div>
                        {{/if}}
                        
                        {{if $userMessage|@count > 0 && $userMessage.success == false}}
                        <div class="notification error png_bg">
                            <a href="#" class="close"><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/cross_grey_small.png" title="Close this notification" alt="close" /></a>
                            <div>
                                {{$userMessage.message}}
                            </div>
                        </div>
                        {{/if}}
                        
                        <!-- END MESSAGE -->
                        
                        
                        
                        
                        {{if $allUsers|@count > 0}}
                        <table>
                            <thead>
                                <tr>
                                   <th><input class="check-all" type="checkbox" /></th>
                                   <th>ID</th>
                                   <th>Username</th>
                                   <th>Full Name</th>
                                   <th>Email</th>
                                   <th>Group</th>
                                   <th>Created Date</th>
                                   <th>Lastest Login</th>
                                   <th>Enabled</th>
                                   <th>Action</th>
                                </tr>
                                
                            </thead>
                         
                         
                            <tbody>
                            
                            {{foreach from=$allUsers item=item}}
                                <tr>
                                    <td><input type="checkbox" value="{{$item.user_id}}" name="allUsers"/></td>
                                    <td>{{$item.user_id}}</td>
                                    <td>{{$item.username}}</td>
                                    <td>{{$item.full_name}}</td>
                                    <td>{{$item.email}}</td>
                                    <td><span style="
                                                        {{if $item.gcolor}} color: {{$item.gcolor}}; {{/if}}
                                                        {{if $item.genabled == '0'}} text-decoration: line-through;  {{/if}}
                                                ">{{$item.gname}}</span></td>
                                    <td>{{$item.created_date}}</td>
                                    <td>{{$item.last_login_date}}</td>
                                    <td class="center">
                                        {{if $item.enabled == '1'}}
                                            <a href="{{$APP_BASE_URL}}user/admin/disable-user/id/{{$item.user_id}}" ><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/visible16x16.png"></a>
                                        {{else}}
                                            <a href="{{$APP_BASE_URL}}user/admin/enable-user/id/{{$item.user_id}}" ><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/invisible16x16.png"></a>
                                        {{/if}}
                                    </td>
                                    <td class="center">
                                        <!-- Icons -->
                                         <a href="{{$APP_BASE_URL}}user/admin/edit-user/id/{{$item.user_id}}" title="Edit"><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/pencil.png"  alt="Edit" /></a>
                                         <a href="javascript:deleteAUser({{$item.user_id}});" title="Delete"><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/cross.png"  alt="Delete" /></a> 
                                       <!--   
                                         <a href="#" title="Send Mail"><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/mail_send_16.png"  alt="Send Mail" /></a>
                                        -->
                                    </td>
                                </tr>
                            {{/foreach}}    
                                
                            
                            </tbody>
                        </table>
                        
                        <br/>
                        <!-- CHOOSE ACTION -->
                        <div class="bulk-actions align-left" style="float: left;padding-top: 14px;">
                            <select id="action">
                                <option value=";">Choose an action...</option>
                                <option value="deleteUser();">Delete</option>
                                <option value="enableUser();">Enable</option>
                                <option value="disableUser();">Disable</option>
                            </select>
                            <a class="button" href="javascript:applySelected();">Apply to selected</a>
                        </div>
                        
                        
                        <div class="bulk-actions align-left" style="float: left;padding-top: 10px; padding-left:30px;">
                            <form class="search" name="search" method="post" action="{{$APP_BASE_URL}}user/admin/user-manager">
                                Display #
                                <select name="displayNum" onchange="this.parentNode.submit();" style="clear: both;">
                                    <option value="5" {{if $displayNum == 5}} selected="selected" {{/if}}>5</option>
                                    <option value="10" {{if $displayNum == 10}} selected="selected" {{/if}}>10</option>
                                    <option value="20" {{if $displayNum == 20}} selected="selected" {{/if}}>20</option>
                                    <option value="50" {{if $displayNum == 50}} selected="selected" {{/if}}>50</option>
                                    <option value="100" {{if $displayNum == 100}} selected="selected" {{/if}}>100</option>
                                    <option value="1000000000" {{if $displayNum >= 1000000000}} selected="selected" {{/if}}>All</option>
                                </select>
                            </form>
                        </div>
                        
                        <!-- PAGINATION -->
                        {{if $countAllPages > 1}}
                        <div class="pagination" style="float: right;">
                            {{if $first}}
                            <a href="?page=1" class="number" title="First Page">&laquo; First</a>
                            {{/if}}
                            {{if $prevPage}}
                            <a href="?page={{$prevPage}}" class="number" title="Previous Page">&laquo;</a>
                            {{/if}}
                            
                            {{foreach from=$prevPages item=item}}
                            <a href="?page={{$item}}" class="number" title="{{$item}}">{{$item}}</a>
                            {{/foreach}}
                            
                            <a href="#" class="number current" title="{{$currentPage}}">{{$currentPage}}</a>
                            
                            {{foreach from=$nextPages item=item}}
                            <a href="?page={{$item}}" class="number" title="{{$item}}">{{$item}}</a>
                            {{/foreach}}
                            
                            {{if $nextPage}}
                            <a href="?page={{$nextPage}}" class="number" title="Next Page">&raquo;</a>
                            {{/if}}
                            {{if $last}}
                            <a href="?page={{$countAllPages}}" class="number" title="Last Page">Last &raquo;</a>
                            {{/if}}
                        </div> <!-- End .pagination -->
                        {{/if}}
                    {{/if}}    
                        
                        <div class="clear"></div>
                    </div> <!-- End #tab1 -->
                    
                    
                </div> <!-- End .content-box-content -->
                
            </div> <!-- End .content-box -->
            
            
            <div class="clear"></div>
            
<script language="javascript" type="text/javascript">
$(document).ready(function(){
    document.getElementById('username').select();
    document.getElementById('username').focus();
});

function applySelected()
{
	var task = document.getElementById('action').value;
	eval(task);
}
function enableUser()
{
    var all = document.getElementsByName('allUsers');
    var tmp = '';
    for (var i = 0; i < all.length; i++) {
        if (all[i].checked) {
             tmp = tmp + '_' + all[i].value;
        }
    }
    if ('' == tmp) {
        alert('Please choose an user');
    }
    window.location.href = '{{$APP_BASE_URL}}user/admin/enable-user/id/' + tmp;
}

function disableUser()
{
    var all = document.getElementsByName('allUsers');
    var tmp = '';
    for (var i = 0; i < all.length; i++) {
        if (all[i].checked) {
             tmp = tmp + '_' + all[i].value;
        }
    }
    if ('' == tmp) {
        alert('Please choose an user');
    }
    window.location.href = '{{$APP_BASE_URL}}user/admin/disable-user/id/' + tmp;
}

function deleteUser()
{
    var all = document.getElementsByName('allUsers');
    var tmp = '';
    var count = 0;
    for (var i = 0; i < all.length; i++) {
        if (all[i].checked) {
             tmp = tmp + '_' + all[i].value;
             count++;
        }
    }
    if ('' == tmp) {
        alert('Please choose an user');
        return;
    } else {
    	result = confirm('Are you sure you want to delete ' + count + ' user(s)?');
        if (false == result) {
            return;
        }
    }
    window.location.href = '{{$APP_BASE_URL}}user/admin/delete-user/id/' + tmp;
}


function deleteAUser(id)
{
    result = confirm('Are you sure you want to delete this user?');
    if (false == result) {
        return;
    }
    window.location.href = '{{$APP_BASE_URL}}user/admin/delete-user/id/' + id;
}
</script>
