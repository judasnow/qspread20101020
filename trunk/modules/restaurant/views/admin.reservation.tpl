    <div id="main">
        

        <div class="w692" style="padding-left: 96px;">
            <p class="title1">Order manager</p>
            <br/>
        
            
            
                {{if $orderMessage|@count > 0 && $orderMessage.success == true}}
                <br/>   
                <div style="padding: 10px 0; color: green; font-weight: bold; border-top: 1px solid green; border-bottom: 1px solid green;">
                    {{$orderMessage.message}}
                </div>
                <br/>
                {{/if}}
                
                {{if $orderMessage|@count > 0 && $orderMessage.success == false}}
                <br/> 
                <div style="padding: 10px 0; color: red; font-weight: bold; border-top: 1px solid red; border-bottom: 1px solid red;">
                    <b>Error:</b>
                    {{$orderMessage.message}}
                </div>
                <br/>
                {{/if}}
                
                
            
            <div style="float: right;padding: 10px;">
                <form class="search" name="search" method="post" action="{{$BASE_URL}}order/index/manager">
                            
                  Customer:  <input class="text-input small-input" type="text" name="condition[full_name]" id="ordername" value="{{$condition.full_name}}"/>
                    
                    <input style="margin-bottom: -5px;" type="image" name="submit" value="Search" src="{{$LAYOUT_HELPER_URL}}front/img/bt_search.jpg"/>
                </form>
            </div>
            
            <br style="clear: both;"/>
            <div class="top2"></div>
            <div class="cen2">
                <div class="cen_2">
                    <div class="p10">
                    
                        

                        <table cellpadding="0" cellspacing="0" border="0" style="width:100%;">
                          <tr>
                              <td  class="color_1 p5t p5b bd1b"><b> Customer </b></td>
                              <td  class="color_1 p5t p5b bd1b"><b> Address </b></td>
                              <td  class="color_1 p5t p5b bd1b"><b> Total </b></td>
                              <td  class="color_1 p5t p5b bd1b "><b> Time </b></td>
                              <td  class="color_1 p5t p5b bd1b "><b> Order Type </b></td>
                              <!-- <td  class="color_1 p5t p5b bd1b center"><b>Created Date</b></td> -->
                              <td  class="color_1 p5t p5b bd1b "><b> Status </b></td>
                              <td  class="color_1 p5t p5b bd1b "><b> Action </b></td>
                            </tr>
                          
                          
                          {{foreach from=$allOrders item=item}}
                            <tr>
                              <td class="bd1b p10t p5b" style="vertical-align: top;">
                                    {{$item.full_name}}<br/>
                                    <br/>
                                    Email: <a href="mailto:{{$item.email}};">{{$item.email}}</a><br/>
                                    Phone: {{$item.phone}}
                              </td>
                              <td class="bd1b p10t p5b" style="vertical-align: top;">
                                        {{$item.address}}<br/>
                                        {{$item.city}} {{$item.state}} {{$item.zip_code}}<br/>
                                        Suite#/Apt.#/Note: {{$item.suite}}
                              </td>
                              <td class="bd1b p10t p5b top">${{$item.order_total|number_format:2}}</td>
                              <td class="bd1b p10t p5b top">
                                        {{$item.time}}<br/>
                                        {{$item.date}}
                              </td>
                              <td class="bd1b p10t p5b top">
                                    {{$item.order_service}}
                              </td>
                              <!-- <td class="bd1b p10t p5b top">
                                    {{$item.created_date}}
                              </td> -->
                              <td class="bd1b p10t p5b top">
                                    
                                        {{if $item.status == 1}}
                                        <span style="color: red">Paid</span>
                                        {{else}}
                                        Finished
                                        {{/if}}
                                        <br/>
                                        (<a href="{{$APP_BASE_URL}}order/index/change-status/id/{{$item.order_id}}">change</a>)
                                    
                              </td>
                              <td class="bd1b p10t p5b top center">
                                        <!-- Icons -->
                                         <a href="javascript:deleteAOrder({{$item.order_id}});" title="Delete"><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/cross.png"  alt="Delete" /></a> 
                                         <a href="{{$APP_BASE_URL}}order/index/detail/id/{{$item.order_id}}" title="Order detail"><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/edit_list_16.png"  alt="Order detail" /></a>
                              </td>
                            </tr>
                          {{/foreach}}    
                          
                          
                        </table>
                        
                        
                    
                     <!-- MESSAGE HERE -->
                        {{if $allOrders|@count <= 0}}
                        <tr>
                            <td colspan="7"> <br/>No order with above condition.</td> 
                        </tr>
                        {{/if}}
                        
                        
                     <!-- END MESSAGE -->
                        
                      {{if $countAllPages > 1}}
                      <div class="float_right">
                        <ul class="list_3">
                            {{if $prevPage}}
                                <li><a href="?page={{$prevPage}}"><img src="{{$LAYOUT_HELPER_URL}}front/img/back2.png" alt="" /></a></li>
                            {{/if}}
                            {{foreach from=$prevPages item=item}}
                                <li><a href="?page={{$item}}">{{$item}}</a></li>
                            {{/foreach}}
                                <li><a href="#" class="current" title="{{$currentPage}}">{{$currentPage}}</a></li>
                            {{foreach from=$nextPages item=item}}
                                <li><a href="?page={{$item}}">{{$item}}</a></li>
                            {{/foreach}}
                            {{if $nextPage}}
                                <li><a href="?page={{$nextPage}}"><img src="{{$LAYOUT_HELPER_URL}}front/img/next2.png" alt="" /></a></li>
                            {{/if}}
                        </ul>
                      </div>
                      {{/if}}
              
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
            <div class="bot2"></div>
        </div>
        <div class="clear"></div>
    </div>
    
            
<script language="javascript" type="text/javascript">


function deleteAOrder(id)
{
    result = confirm('Are you sure you want to delete this order?');
    if (false == result) {
        return;
    }
    window.location.href = '{{$APP_BASE_URL}}order/index/delete/id/' + id;
}
</script>