            <h2>Reservation Manager</h2>
            
             <!-- End .shortcut-buttons-set -->
            
            <div class="clear"></div> <!-- End .clear -->
           
            
            <div class="content-box"><!-- Start Content Box -->
                
                <div class="content-box-header">
                    
                    <div style="float:left;">
                        <a name="listofreser"><h3>List of Reservations</h3></a>
                   </div>     
                   <div style="float:right;padding-right:20px;padding-top:5px;">
                        <form class="search" name="search" method="post" action="{{$APP_BASE_URL}}restaurant/admin/reservation">
                            
                          Customer:  <input class="text-input small-input" type="text" name="condition[full_name]" id="ordername" value="{{$condition.full_name}}"/>
                            
                            <input class="button" type="submit" value="Search" />
                        </form>
                        
                   </div>
                    
                </div> <!-- End .content-box-header -->
                
                <div class="content-box-content">
                    
                    <div class="tab-content default-tab" id="tab1"> <!-- This is the target div. id must match the href of this div's tab -->
                        
                       
                       
                        <!-- MESSAGE HERE -->
                        {{if $allResers|@count <= 0}}
                        <div class="notification information png_bg">
                            <a href="#" class="close"><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/cross_grey_small.png" title="Close this notification" alt="close" /></a>
                            <div>
                                No reservation with above condition.
                            </div>
                        </div>
                        {{/if}}
                        
                        {{if $reserMessage|@count > 0 && $reserMessage.success == true}}
                        <div class="notification success png_bg">
                            <a href="#" class="close"><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/cross_grey_small.png" title="Close this notification" alt="close" /></a>
                            <div>
                                {{$reserMessage.message}}
                            </div>
                        </div>
                        {{/if}}
                        
                        {{if $reserMessage|@count > 0 && $reserMessage.success == false}}
                        <div class="notification error png_bg">
                            <a href="#" class="close"><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/cross_grey_small.png" title="Close this notification" alt="close" /></a>
                            <div>
                                {{$reserMessage.message}}
                            </div>
                        </div>
                        {{/if}}
                        
                        <!-- END MESSAGE -->
                        
                        
                        
                        
                        {{if $allResers|@count > 0}}
                        <table>
                            <thead>
                                <tr>
                                   <th><input class="check-all" type="checkbox" /></th>
                                   <th>Reservation</th>
                                   <th>Restaurant</th>
                                   <th>Customer</th>
                                   <th>Created Date</th>
                                   <th>Action</th>
                                </tr>
                                
                            </thead>
                         
                         
                            <tbody>
                            
                            {{foreach from=$allResers item=item}}
                                <tr>
                                    <td><input type="checkbox" value="{{$item.reservation_id}}" name="allResers"/></td>
                                    <td>
                                    
                                     <b>{{$item.time|date_format:'%a, %m/%d/%Y %I:%M %p'}}</b><br/>
                                        <br/>
                                      Quantity: {{$item.quantity}}<br/>
                                      Deposit: ${{$item.deposit|number_format:2}}
                                    </td>
                                    <td>
                                        {{if $item.image}}
                                        <img src="{{$BASE_URL}}{{$item.image}}" style="max-width: 100px;"></img>
                                        <br/>
                                        {{/if}}
                                        {{$item.name}}
                                    </td>
                                    <td>
                                        <b>{{$item.full_name}}</b><br/>
                                        <br/>
                                        Address: {{$item.address}}<br/>
                                        Suite#/Apt.#/Note: {{$item.note}}<br/>
                                        City: {{$item.city}}, {{$item.state}}<br/>
                                        Postal Code: {{$item.zip_code}}<br/>
                                        Phone: {{$item.phone}}<br/>
                                        Email: {{$item.email}}<br/>
                                        <br/>
                                        Special Requests: {{$item.special_request}}
                                    </td>
                                    <td>{{$item.created_date}}</td>
                                    <td class="center">
                                        <!-- Icons -->
                                         <a href="javascript:deleteAReser({{$item.reservation_id}});" title="Delete"><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/cross.png"  alt="Delete" /></a> 
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
                                <option value="deleteReser();">Delete</option>
                            </select>
                            <a class="button" href="javascript:applySelected();">Apply to selected</a>
                        </div>
                        
                        
                        <div class="bulk-actions align-left" style="float: left;padding-top: 10px; padding-left:30px;">
                            <form class="search" name="search" method="post" action="{{$APP_BASE_URL}}restaurant/admin/reservation">
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

function deleteReser()
{
    var all = document.getElementsByName('allResers');
    var tmp = '';
    var count = 0;
    for (var i = 0; i < all.length; i++) {
        if (all[i].checked) {
             tmp = tmp + '_' + all[i].value;
             count++;
        }
    }
    if ('' == tmp) {
        alert('Please choose an reservation');
        return;
    } else {
        result = confirm('Are you sure you want to delete ' + count + ' reservation(s)?');
        if (false == result) {
            return;
        }
    }
    window.location.href = '{{$APP_BASE_URL}}restaurant/admin/delete-reservation/id/' + tmp;
}


function deleteAReser(id)
{
    result = confirm('Are you sure you want to delete this reservation?');
    if (false == result) {
        return;
    }
    window.location.href = '{{$APP_BASE_URL}}restaurant/admin/delete-reservation/id/' + id;
}
</script>
