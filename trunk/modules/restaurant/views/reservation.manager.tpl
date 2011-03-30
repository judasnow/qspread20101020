    <div id="main">
        

        <div class="w692" style="padding-left: 96px;">
            <p class="title1">Reservation manager</p>
            <br/>
        
            
            
                {{if $reserMessage|@count > 0 && $reserMessage.success == true}}
                <br/>   
                <div style="padding: 10px 0; color: green; font-weight: bold; border-top: 1px solid green; border-bottom: 1px solid green;">
                    {{$reserMessage.message}}
                </div>
                <br/>
                {{/if}}
                
                {{if $reserMessage|@count > 0 && $reserMessage.success == false}}
                <br/> 
                <div style="padding: 10px 0; color: red; font-weight: bold; border-top: 1px solid red; border-bottom: 1px solid red;">
                    <b>Error:</b>
                    {{$reserMessage.message}}
                </div>
                <br/>
                {{/if}}
                
                
            
            <div style="float: right;padding: 10px;">
                <form class="search" name="search" method="post" action="{{$BASE_URL}}restaurant/reservation/manager">
                            
                  Customer:  <input style="height: 18px;" class="text-input small-input" type="text" name="condition[full_name]" id="ordername" value="{{$condition.full_name}}"/>
                    
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
                              <td  class="color_1 p5t p5b bd1b"><b> Reservation </b></td>
                              <td  class="color_1 p5t p5b bd1b"><b> Customer </b></td>
                              <td  class="color_1 p5t p5b bd1b "><b>Created Date</b></td>
                              <td  class="color_1 p5t p5b bd1b "><b> Action </b></td>
                            </tr>
                          
                          
                          {{foreach from=$allResers item=item}}
                            <tr>
                              <td class="bd1b p10t p5b" style="vertical-align: top;">

                                    
                                     <b>{{$item.time|date_format:'%a, %m/%d/%Y %I:%M %p'}}</b><br/>
                                        <br/>
                                      Quantity: {{$item.quantity}}<br/>
                                      Deposit: ${{$item.deposit|number_format:2}}
                              </td>
                              <td class="bd1b p10t p5b" style="vertical-align: top;">
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
                              <td class="bd1b p10t p5b top">{{$item.created_date|date_format:'%m/%d/%Y'}}</td>
                              <td class="bd1b p10t p5b top center">
                                        <!-- Icons -->
                                         <a href="javascript:deleteAReser({{$item.reservation_id}});" title="Delete"><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/cross.png"  alt="Delete" /></a> 
                                    </td>
                            </tr>
                          {{/foreach}}    
                          
                          
                        </table>
                        
                        
                    
                     <!-- MESSAGE HERE -->
                        {{if $allResers|@count <= 0}}
                        <tr>
                            <td colspan="7"> <br/>No reservation with above condition.</td> 
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



function deleteAReser(id)
{
    result = confirm('Are you sure you want to delete this reservation?');
    if (false == result) {
        return;
    }
    window.location.href = '{{$APP_BASE_URL}}restaurant/reservation/delete-reservation/id/' + id;
}
</script>