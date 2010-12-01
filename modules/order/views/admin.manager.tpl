            <h2>Order Manager</h2>
            
             <!-- End .shortcut-buttons-set -->
            
            <div class="clear"></div> <!-- End .clear -->
           
            
            <div class="content-box"><!-- Start Content Box -->
                
                <div class="content-box-header">
                    
                    <div style="float:left;">
                        <a name="listoforder"><h3>List of Orders</h3></a>
                   </div>     
                   <div style="float:right;padding-right:20px;padding-top:5px;">
                        <form class="search" name="search" method="post" action="{{$APP_BASE_URL}}order/admin/manager">
                            
                          Customer:  <input class="text-input small-input" type="text" name="condition[full_name]" id="ordername" value="{{$condition.name}}"/>
                            
                            <input class="button" type="submit" value="Search" />
                        </form>
                        
                   </div>
                    
                </div> <!-- End .content-box-header -->
                
                <div class="content-box-content">
                    
                    <div class="tab-content default-tab" id="tab1"> <!-- This is the target div. id must match the href of this div's tab -->
                        
                       
                       
                        <!-- MESSAGE HERE -->
                        {{if $allOrders|@count <= 0}}
                        <div class="notification information png_bg">
                            <a href="#" class="close"><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/cross_grey_small.png" title="Close this notification" alt="close" /></a>
                            <div>
                                No order with above condition.
                            </div>
                        </div>
                        {{/if}}
                        
                        {{if $orderMessage|@count > 0 && $orderMessage.success == true}}
                        <div class="notification success png_bg">
                            <a href="#" class="close"><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/cross_grey_small.png" title="Close this notification" alt="close" /></a>
                            <div>
                                {{$orderMessage.message}}
                            </div>
                        </div>
                        {{/if}}
                        
                        {{if $orderMessage|@count > 0 && $orderMessage.success == false}}
                        <div class="notification error png_bg">
                            <a href="#" class="close"><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/cross_grey_small.png" title="Close this notification" alt="close" /></a>
                            <div>
                                {{$orderMessage.message}}
                            </div>
                        </div>
                        {{/if}}
                        
                        <!-- END MESSAGE -->
                        
                        
                        
                        
                        {{if $allOrders|@count > 0}}
                        <table>
                            <thead>
                                <tr>
                                   <th><input class="check-all" type="checkbox" /></th>
                                   <th>Customer</th>
                                   <th>Address</th>
                                   <th>Total</th>
                                   <th>Time</th>
                                   <th>Order Type</th>
                                   <th>Created Date</th>
                                   <th>Status</th>
                                   <th>Action</th>
                                </tr>
                                
                            </thead>
                         
                         
                            <tbody>
                            
                            {{foreach from=$allOrders item=item}}
                                <tr>
                                    <td><input type="checkbox" value="{{$item.order_id}}" name="allOrders"/></td>
                                    <td>
                                        {{$item.full_name}}<br/>
                                        <br/>
                                        Email: <a href="mailto:{{$item.email}};">{{$item.email}}</a><br/>
                                        Phone: {{$item.phone}}
                                    </td>
                                    <td>
                                        {{$item.address}}<br/>
                                        {{$item.city}} {{$item.state}} {{$item.zip_code}}<br/>
                                        Suite#/Apt.#/Note: {{$item.suite}}
                                    </td>
                                    <td>${{$item.order_total|number_format:2}}</td>
                                    <td>
                                        {{$item.time}}<br/>
                                        {{$item.date}}
                                    </td>
                                    <td>{{$item.order_service}}</td>
                                    <td>{{$item.created_date}}</td>
                                    <td>
                                        {{if $item.status == 1}}
                                        <span style="color: red">Paid</span>
                                        {{else}}
                                        Finished
                                        {{/if}}
                                        <br/>
                                        (<a href="{{$APP_BASE_URL}}order/admin/change-status/id/{{$item.order_id}}">change</a>)
                                    </td>
                                    <td class="center">
                                        <!-- Icons -->
                                         <a href="javascript:deleteAOrder({{$item.order_id}});" title="Delete"><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/cross.png"  alt="Delete" /></a> 
                                         <a href="{{$APP_BASE_URL}}order/admin/detail/id/{{$item.order_id}}" title="Meal manager"><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/edit_list_16.png"  alt="Meal manager" /></a>
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
                                <option value="deleteOrder();">Delete</option>
                            </select>
                            <a class="button" href="javascript:applySelected();">Apply to selected</a>
                        </div>
                        
                        
                        <div class="bulk-actions align-left" style="float: left;padding-top: 10px; padding-left:30px;">
                            <form class="search" name="search" method="post" action="{{$APP_BASE_URL}}order/admin/manager">
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
    document.getElementById('ordername').select();
    document.getElementById('ordername').focus();
});

function applySelected()
{
	var task = document.getElementById('action').value;
	eval(task);
}

function deleteOrder()
{
    var all = document.getElementsByName('allOrders');
    var tmp = '';
    var count = 0;
    for (var i = 0; i < all.length; i++) {
        if (all[i].checked) {
             tmp = tmp + '_' + all[i].value;
             count++;
        }
    }
    if ('' == tmp) {
        alert('Please choose an order');
        return;
    } else {
    	result = confirm('Are you sure you want to delete ' + count + ' order(s)?');
        if (false == result) {
            return;
        }
    }
    window.location.href = '{{$APP_BASE_URL}}order/admin/delete/id/' + tmp;
}


function deleteAOrder(id)
{
    result = confirm('Are you sure you want to delete this order?');
    if (false == result) {
        return;
    }
    window.location.href = '{{$APP_BASE_URL}}order/admin/delete/id/' + id;
}
</script>
