            <h2>Content Manager</h2>
            
             <!-- End .shortcut-buttons-set -->
            
            <div class="clear"></div> <!-- End .clear -->
           
            
            
            <div class="content-box"><!-- Start Content Box -->
                
                <div class="content-box-header">
                    
                    <div style="float:left;">
                        <a name="listofcontent"><h3>List of Contents</h3></a>
                   </div>     
                   <div style="float:right;padding-right:20px;padding-top:5px;">
                        <form class="search" name="search" method="post" action="{{$APP_BASE_URL}}scontent/admin/manager">
                            <input class="text-input small-input" type="text" name="condition[keyword]" id="keyword" value="{{$condition.keyword}}"/>
                            
                            <select name="condition[scontent_category_id]">
                                <option value="">All categories</option>
                            {{foreach from=$allCats item=item}}
                                <option value="{{$item.scontent_category_id}}" {{if $condition.scontent_category_id== $item.scontent_category_id}}selected="selected"{{/if}}>{{$item.name}}</option>
                            {{/foreach}}
                            </select> 
                            <input class="button" type="submit" value="Search" />
                        </form>
                        
                   </div>
                    
                </div> <!-- End .content-box-header -->
                
                <div class="content-box-content">
                    
                    <div class="tab-content default-tab" id="tab1"> <!-- This is the target div. id must match the href of this div's tab -->
                        
                       
                       
                        <!-- MESSAGE HERE -->
                        {{if $allScontents|@count <= 0}}
                        <div class="notification information png_bg">
                            <a href="#" class="close"><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/cross_grey_small.png" title="Close this notification" alt="close" /></a>
                            <div>
                                No content with above conditions.
                            </div>
                        </div>
                        {{/if}}
                        
                        {{if $scontentMessage|@count > 0 && $scontentMessage.success == true}}
                        <div class="notification success png_bg">
                            <a href="#" class="close"><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/cross_grey_small.png" title="Close this notification" alt="close" /></a>
                            <div>
                                {{$scontentMessage.message}}
                            </div>
                        </div>
                        {{/if}}
                        
                        {{if $scontentMessage|@count > 0 && $scontentMessage.success == false}}
                        <div class="notification error png_bg">
                            <a href="#" class="close"><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/cross_grey_small.png" title="Close this notification" alt="close" /></a>
                            <div>
                                {{$scontentMessage.message}}
                            </div>
                        </div>
                        {{/if}}
                        
                        <!-- END MESSAGE -->
                        
                        
                        
                        <form method="POST" name="sortForm">
                        {{if $allScontents|@count > 0}}
                        <table>
                            <thead>
                                <tr>
                                   <th width="3%"><input class="check-all" type="checkbox" /></th>
                                   <th width="3%">ID</th>
                                   <th width="10%">Category</th>
                                   <th width="10%">Created</th>
                                   <th class="center" width="4%">
                                        Sort
                                        {{if $fullPermisison}}
                                        <a href="javascript:document.sortForm.submit();"><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/save_16.png" alt="Save sorting"></a>
                                        {{/if}}
                                   </th>
                                   <th width="55%">Title</th>
                                   <th width="5%">Hit</th>
                                   <th width="5%">Pub</th>
                                   <th width="5%" style="padding-right:20px;">Edit</th>
                                </tr>
                                
                            </thead>
                         
                         
                            <tbody>
                            
                            {{foreach from=$allScontents item=item}}
                                <tr>
                                    <td><input type="checkbox" value="{{$item.scontent_id}}" name="allScontents"/></td>
                                    <td>{{$item.scontent_id}}</td>
                                    <td>{{$item.cname}}</td>
                                    <td>{{$item.created_date}}</td>
                                    <td class="center">
                                        {{if $fullPermisison}}
                                        <input name="data[{{$item.scontent_id}}]" value="{{$item.sorting}}" size="3" style="text-align: center;"></input>
                                        {{else}}
                                        {{$item.sorting}}
                                        {{/if}}
                                    </td>
                                    
                                    <td colspan="5">
                                    <!-- All languages -->
                                        <table>
                                            <tbody id="table{{$item.scontent_id}}">
                                                <tr>
                                                    <td width="55%">--</td>
                                                    <td width="5%">--</td>
                                                    <td width="5%">
                                                        {{if $item.enabled == '1'}}
                                                            {{if $fullPermisison}}
                                                            <a href="{{$APP_BASE_URL}}scontent/admin/disable-general-content/id/{{$item.scontent_id}}" ><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/visible16x16.png"></a>
                                                            {{else}}
                                                            <img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/visible16x16.png">
                                                            {{/if}}
                                                        {{else}}
                                                            {{if $fullPermisison}}
                                                            <a href="{{$APP_BASE_URL}}scontent/admin/enable-general-content/id/{{$item.scontent_id}}" ><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/invisible16x16.png"></a>
                                                            {{else}}
                                                            <img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/invisible16x16.png">
                                                            {{/if}}
                                                        {{/if}}
                                                    </td>
                                                    <td width="5%">
                                                        {{if $fullPermisison}}
                                                        <a href="{{$APP_BASE_URL}}scontent/admin/edit/id/{{$item.scontent_id}}" title="Edit"><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/pencil.png"  alt="Edit" /></a>
                                                        {{else}}
                                                        --
                                                        {{/if}}
                                                    </td>
                                                </tr>
                                                
                                                {{foreach from=$item.details item=item2}}
                                                <tr>
                                                    <td width="55%"><image style="vertical-align:middle;" src="{{$BASE_URL}}{{$item2.lang_image}}"> {{$item2.title}}</td>
                                                    <td width="5%">{{$item2.hit}}</td>
                                                    <td width="5%">
                                                    
                                                    {{assign var='langId' value=$item2.lang_id}}
                                                    
                                                    {{if $item.enabled == '1'}}
                                                    
                                                        <!-- FULL PERMISSION -->
                                                        {{p name=edit_scontent module=scontent expandId=$langId}}
                                                            {{if $item2.enabled == '1'}}
                                                                <a href="{{$APP_BASE_URL}}scontent/admin/disable-lang-content/id/{{$item2.scontent_lang_id}}" ><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/visible16x16.png"></a>
                                                            {{else}}
                                                                <a href="{{$APP_BASE_URL}}scontent/admin/enable-lang-content/id/{{$item2.scontent_lang_id}}" ><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/invisible16x16.png"></a>
                                                            {{/if}}
                                                        {{/p}}
                                                        <!-- DON'T HAVE PERMISSION -->
                                                        {{np name=edit_scontent module=scontent expandId=$langId}}
                                                            {{if $item2.enabled == '1'}}
                                                                <img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/visible16x16.png">
                                                            {{else}}
                                                                <img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/invisible16x16.png">
                                                            {{/if}}
                                                        {{/np}}
                                                    {{else}}
                                                        <img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/invisible16x16.png">
                                                    {{/if}}
                                                    </td>
                                                    <td width="5%">
                                                        {{p name=edit_scontent module=scontent expandId=$langId}}
                                                        <a href="{{$APP_BASE_URL}}scontent/admin/edit/id/{{$item.scontent_id}}/lid/{{$item2.lang_id}}" title="Edit"><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/pencil.png"  alt="Edit" /></a>
                                                        {{/p}}
                                                        {{np name=edit_scontent module=scontent expandId=$langId}}
                                                        --
                                                        {{/np}}
                                                    </td>
                                                </tr>
                                                {{/foreach}}
                                                
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                            {{/foreach}}    
                                
                            
                            </tbody>
                        </table>
                        </form>
                        
                        <br/>
                        <!-- CHOOSE ACTION -->
                        {{p name=edit_scontent module=scontent}}
                        <div class="bulk-actions align-left" style="float: left;padding-top: 14px;">
                            <select id="action">
                                <option value=";">Choose an action...</option>
                                {{p name=delete_scontent module=scontent}}
                                <option value="deleteContent();">Delete</option>
                                {{/p}}
                                <option value="enableContent();">Enable</option>
                                <option value="disableContent();">Disable</option>
                            </select>
                            <a class="button" href="javascript:applySelected();">Apply to selected</a>
                        </div>
                        {{/p}}
                        
                        <div class="bulk-actions align-left" style="float: left;padding-top: 10px; padding-left:30px;">
                            <form class="search" name="search" method="post" action="{{$APP_BASE_URL}}scontent/admin/manager">
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
    document.getElementById('keyword').select();
    document.getElementById('keyword').focus();
});

function applySelected()
{
	var task = document.getElementById('action').value;
	eval(task);
}
function enableContent()
{
    var all = document.getElementsByName('allScontents');
    var tmp = '';
    for (var i = 0; i < all.length; i++) {
        if (all[i].checked) {
             tmp = tmp + '_' + all[i].value;
        }
    }
    if ('' == tmp) {
        alert('Please choose an content');
    }
    window.location.href = '{{$APP_BASE_URL}}scontent/admin/enable-general-content/id/' + tmp;
}

function disableContent()
{
    var all = document.getElementsByName('allScontents');
    var tmp = '';
    for (var i = 0; i < all.length; i++) {
        if (all[i].checked) {
             tmp = tmp + '_' + all[i].value;
        }
    }
    if ('' == tmp) {
        alert('Please choose an content');
    }
    window.location.href = '{{$APP_BASE_URL}}scontent/admin/disable-general-content/id/' + tmp;
}

function deleteContent()
{
    var all = document.getElementsByName('allScontents');
    var tmp = '';
    var count = 0;
    for (var i = 0; i < all.length; i++) {
        if (all[i].checked) {
             tmp = tmp + '_' + all[i].value;
             count++;
        }
    }
    if ('' == tmp) {
        alert('Please choose an content');
        return;
    } else {
    	result = confirm('Are you sure you want to delete ' + count + ' content(s)?');
        if (false == result) {
            return;
        }
    }
    window.location.href = '{{$APP_BASE_URL}}scontent/admin/delete-general-content/id/' + tmp;
}


function deleteAContent(id)
{
    result = confirm('Are you sure you want to delete this content?');
    if (false == result) {
        return;
    }
    window.location.href = '{{$APP_BASE_URL}}content/admin/delete-content/id/' + id;
}
</script>
