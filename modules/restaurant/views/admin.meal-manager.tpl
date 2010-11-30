            <div style="float:left;">
                <h2>Meal Manager</h2>
           </div>     
           <div style="float:right;padding-right:35px;padding-top:8px;">
                <a href="{{$APP_BASE_URL}}restaurant/admin/new-meal/rid/{{$rid}}"><img style="vertical-align: middle;" src="{{$LAYOUT_HELPER_URL}}admin/images/icons/add_16.png"> Add new meal</a>
           </div>
            
             <!-- End .shortcut-buttons-set -->
            
            <div class="clear"></div> <!-- End .clear -->
            
            <div class="content-box"><!-- Start Content Box -->
                
                <div class="content-box-header">
                    
                    <div style="float:left;">
                        <a name="listofmeal"><h3>List of Meals</h3></a>
                   </div>     
                   <div style="float:right;padding-right:20px;padding-top:5px;">
                        <form class="search" name="search" method="post" action="{{$APP_BASE_URL}}restaurant/admin/meal-manager/rid/{{$rid}}">
                            
                          Meal's Name:  <input class="text-input small-input" type="text" name="condition[name]" id="mealname" value="{{$condition.name}}"/>
                            
                            <input class="button" type="submit" value="Search" />
                        </form>
                        
                   </div>
                    
                </div> <!-- End .content-box-header -->
                
                <div class="content-box-content">
                    
                    <div class="tab-content default-tab" id="tab1"> <!-- This is the target div. id must match the href of this div's tab -->
                        
                       
                       
                        <!-- MESSAGE HERE -->
                        {{if $allMeals|@count <= 0}}
                        <div class="notification information png_bg">
                            <a href="#" class="close"><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/cross_grey_small.png" title="Close this notification" alt="close" /></a>
                            <div>
                                No meal with above condition.
                            </div>
                        </div>
                        {{/if}}
                        
                        {{if $mealMessage|@count > 0 && $mealMessage.success == true}}
                        <div class="notification success png_bg">
                            <a href="#" class="close"><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/cross_grey_small.png" title="Close this notification" alt="close" /></a>
                            <div>
                                {{$mealMessage.message}}
                            </div>
                        </div>
                        {{/if}}
                        
                        {{if $mealMessage|@count > 0 && $mealMessage.success == false}}
                        <div class="notification error png_bg">
                            <a href="#" class="close"><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/cross_grey_small.png" title="Close this notification" alt="close" /></a>
                            <div>
                                {{$mealMessage.message}}
                            </div>
                        </div>
                        {{/if}}
                        
                        <!-- END MESSAGE -->
                        
                        
                        
                        
                        {{if $allMeals|@count > 0}}
                        <table>
                            <thead>
                                <tr>
                                   <th><input class="check-all" type="checkbox" /></th>
                                   <th>Name</th>
                                   <th>Description</th>
                                   <th>Price</th>
                                   <th>Type</th>
                                   <th>Enabled</th>
                                   <th>Action</th>
                                </tr>
                                
                            </thead>
                         
                         
                            <tbody>
                            
                            {{foreach from=$allMeals item=item}}
                                <tr>
                                    <td><input type="checkbox" value="{{$item.meal_id}}" name="allMeals"/></td>
                                    <td>
                                    {{$item.name}}
                                    </td>
                                    <td>
                                        {{$item.description}}
                                    </td>
                                    <td>{{$item.price|@number_format:2:'.':','}}</td>
                                    <td>
                                        {{if 0 == $item.type}}
                                        General
                                        {{else}}
                                        Catering
                                        {{/if}}
                                    </td>
                                    <td class="center">
                                        {{if $item.enabled == '1'}}
                                            <a href="{{$APP_BASE_URL}}restaurant/admin/disable-meal/rid/{{$rid}}/id/{{$item.meal_id}}" ><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/visible16x16.png"></a>
                                        {{else}}
                                            <a href="{{$APP_BASE_URL}}restaurant/admin/enable-meal/rid/{{$rid}}/id/{{$item.meal_id}}" ><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/invisible16x16.png"></a>
                                        {{/if}}
                                    </td>
                                    <td class="center">
                                        <!-- Icons -->
                                         <a href="{{$APP_BASE_URL}}restaurant/admin/edit-meal/rid/{{$rid}}/id/{{$item.meal_id}}" title="Edit"><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/pencil.png"  alt="Edit" /></a>
                                         <a href="javascript:deleteAMeal({{$item.meal_id}});" title="Delete"><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/cross.png"  alt="Delete" /></a> 
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
                                <option value="deleteMeal();">Delete</option>
                                <option value="enableMeal();">Enable</option>
                                <option value="disableMeal();">Disable</option>
                            </select>
                            <a class="button" href="javascript:applySelected();">Apply to selected</a>
                        </div>
                        
                        
                        <div class="bulk-actions align-left" style="float: left;padding-top: 10px; padding-left:30px;">
                            <form class="search" name="search" method="post" action="{{$APP_BASE_URL}}restaurant/admin/meal-manager/rid/{{$rid}}">
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
    document.getElementById('mealname').select();
    document.getElementById('mealname').focus();
});

function applySelected()
{
	var task = document.getElementById('action').value;
	eval(task);
}

function enableMeal()
{
    var all = document.getElementsByName('allMeals');
    var tmp = '';
    for (var i = 0; i < all.length; i++) {
        if (all[i].checked) {
             tmp = tmp + '_' + all[i].value;
        }
    }
    if ('' == tmp) {
        alert('Please choose an meal');
    }
    window.location.href = '{{$APP_BASE_URL}}restaurant/admin/enable-meal/rid/{{$rid}}/id/' + tmp;
}

function disableMeal()
{
    var all = document.getElementsByName('allMeals');
    var tmp = '';
    for (var i = 0; i < all.length; i++) {
        if (all[i].checked) {
             tmp = tmp + '_' + all[i].value;
        }
    }
    if ('' == tmp) {
        alert('Please choose an meal');
    }
    window.location.href = '{{$APP_BASE_URL}}restaurant/admin/disable-meal/rid/{{$rid}}/id/' + tmp;
}
function deleteMeal()
{
    var all = document.getElementsByName('allMeals');
    var tmp = '';
    var count = 0;
    for (var i = 0; i < all.length; i++) {
        if (all[i].checked) {
             tmp = tmp + '_' + all[i].value;
             count++;
        }
    }
    if ('' == tmp) {
        alert('Please choose an meal');
        return;
    } else {
    	result = confirm('Are you sure you want to delete ' + count + ' meal(s)?');
        if (false == result) {
            return;
        }
    }
    window.location.href = '{{$APP_BASE_URL}}restaurant/admin/delete-meal/rid/{{$rid}}/id/' + tmp;
}


function deleteAMeal(id)
{
    result = confirm('Are you sure you want to delete this meal?');
    if (false == result) {
        return;
    }
    window.location.href = '{{$APP_BASE_URL}}restaurant/admin/delete-meal/rid/{{$rid}}/id/' + id;
}
</script>
