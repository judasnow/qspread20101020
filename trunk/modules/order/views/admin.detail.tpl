            <div style="float:left;">
                <h2>Order Detail</h2>
           </div>     
            
             <!-- End .shortcut-buttons-set -->
            
            <div class="clear"></div> <!-- End .clear -->
            
            <div class="content-box"><!-- Start Content Box -->
                
                
                <div class="content-box-content">
                    
                    <div class="tab-content default-tab" id="tab1"> <!-- This is the target div. id must match the href of this div's tab -->
                        
                       
                       
                        <!-- MESSAGE HERE -->
                        {{if $allMeals|@count <= 0}}
                        <div class="notification information png_bg">
                            <a href="#" class="close"><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/cross_grey_small.png" title="Close this notification" alt="close" /></a>
                            <div>
                                No meal with in this order.
                            </div>
                        </div>
                        {{/if}}
                        
                        <!-- END MESSAGE -->
                        <form>
                         <fieldset class="column-left"> <!-- Set class to "column-left" or "column-right" on fieldsets to divide the form into columns -->
                                <p class="p15t green"><b>Customer Information:</b></p> 
                                <p>
                                    <label style="min-width: 150px;">Name:</label>
                                        {{$order.full_name}}
                                </p>
                                <p>
                                    <label style="min-width: 150px;">Email:</label>
                                        <a href="mailto:{{$order.email}};">{{$order.email}}</a>
                                </p>
                                <p>
                                    <label style="min-width: 150px;">Phone:</label>
                                        {{$order.phone}}
                                </p>
                                <p>
                                    <label style="min-width: 150px;">Address:</label>
                                        {{$order.address}},
                                        {{$order.city}} {{$order.state}} {{$order.zip_code}}<br/>
                                </p>
                                <p>
                                    <label style="min-width: 150px;">Suite#/Apt.#/Note:</label>
                                        {{$order.suite}}
                                </p>
                                
                                <br/>
                                <br/>
                                <p class="p15t green"><b>Order Information:</b></p> 
                                <p>
                                    <label style="min-width: 150px;">Sub Total:</label>
                                        ${{$order.sub_total|@number_format:2:'.':','}}
                                </p>
                                <p>
                                    <label style="min-width: 150px;">Tax:</label>
                                        ${{$order.sales_tax|@number_format:2:'.':','}}
                                </p>
                                <p>
                                    <label style="min-width: 150px;">Delivery Fee:</label>
                                        ${{$order.shipping_fee|@number_format:2:'.':','}}
                                </p>
                                <p>
                                    <label style="min-width: 150px;">Total:</label>
                                        <b>${{$order.order_total|@number_format:2:'.':','}}</b>
                                </p>
                                <p>
                                    <label style="min-width: 150px;">Time:</label>
                                        {{$order.time}}, {{$order.date}}
                                </p>
                                <p>
                                    <label style="min-width: 150px;">Order Type:</label>
                                        {{$order.order_service}}
                                </p>
                            </fieldset>
                            
                            
                        
                         <fieldset class="column-right"> <!-- Set class to "column-left" or "column-right" on fieldsets to divide the form into columns -->
                                <p class="p15t green"><b>Restaurant Information:</b></p> 
                                {{if $res.image}}
                                 <p>
                                    <label style="min-width: 150px;">Restaurant:</label>
                                        
                                        <img src="{{$BASE_URL}}{{$res.image}}" style="max-width: 100px;"></img>
                                </p>
                                {{/if}}
                                <p>
                                    <label style="min-width: 150px;"></label>
                                        
                                        {{$res.name}}
                                </p>
                                <p>
                                    <label style="min-width: 150px;">Address:</label>
                                        {{$res.street}} {{$res.city}} {{$res.state}} {{$res.zip}}
                                </p>
                                <p>
                                    <label style="min-width: 150px;">Manager:</label>
                                        {{$res.manager}}
                                </p>
                                <p>
                                    <label style="min-width: 150px;">Phone:</label>
                                        {{$res.phone}}
                                </p>
                                <p>
                                    <label style="min-width: 150px;">Fax:</label>
                                        {{$res.fax}}
                                </p>
                               

                            </fieldset>
                        </form>
                        
                        
                        <div class="clear"></div>
                    </div> <!-- End #tab1 -->
                    
                    
                </div> <!-- End .content-box-content -->
                
            </div> <!-- End .content-box -->
            
            
            
            
            
            <div class="content-box"><!-- Start Content Box -->
                
                <div class="content-box-header">
                    
                    <div style="float:left;">
                        <a name="listofmeal"><h3>List of Meals</h3></a>
                   </div>     
                    
                </div> <!-- End .content-box-header -->
                
                <div class="content-box-content">
                    
                    <div class="tab-content default-tab" id="tab1"> <!-- This is the target div. id must match the href of this div's tab -->
                        
                       
                       
                        <!-- MESSAGE HERE -->
                        {{if $allMeals|@count <= 0}}
                        <div class="notification information png_bg">
                            <a href="#" class="close"><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/cross_grey_small.png" title="Close this notification" alt="close" /></a>
                            <div>
                                No meal with in this order.
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
                                   <th>Quantity</th>
                                   <th>Price</th>
                                   <th>Sub Total</th>
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
                                    <td>{{$item.quantity}}</td>
                                    <td>${{$item.price|@number_format:2:'.':','}}</td>
                                    <td>${{$item.total|@number_format:2:'.':','}}</td>
                                </tr>
                            {{/foreach}}    
                                
                            
                            </tbody>
                        </table>
                        
                        
                    {{/if}}    
                        
                        <div class="clear"></div>
                    </div> <!-- End #tab1 -->
                    
                    
                </div> <!-- End .content-box-content -->
                
            </div> <!-- End .content-box -->
            
            <div class="clear"></div>
            
