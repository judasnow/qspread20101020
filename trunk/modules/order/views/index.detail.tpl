    <div id="main">
        

        <div class="w692 order_detail" style="padding-left: 96px;">
            <p class="title1">Order detail</p>
            <br/>
        
            <form>
                         <fieldset style="float: left;"> <!-- Set class to "column-left" or "column-right" on fieldsets to divide the form into columns -->
                                <p class="p15t" style="color: #624027;"><b>Customer Information:</b></p> 
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
                                
                            </fieldset>
                            
                        
                         <fieldset style="float: right;"> <!-- Set class to "column-left" or "column-right" on fieldsets to divide the form into columns -->
                               <p class="p15t"  style="color: #624027;"><b>Order Information:</b></p> 
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
                        </form>
            
            
            <br style="clear: both;"/>
            

        <!-- Meal part -->
        <div class="top2"></div>
        <div class="cen2">
                <div class="cen_2">
                    <div class="p10">
                        

                        <table cellpadding="0" cellspacing="0" border="0" style="width:100%;">
                          <tr>
                              <td width="20%"  class="color_1 p5t p5b bd1b"><b>Name</b></td>
                              <td width="40%"  class="color_1 p5t p5b bd1b"><b>Description</b></td>
                              <td width="10%"  class="color_1 p5t p5b bd1b "><b>Quantity</b></td>
                              <td width="10%"  class="color_1 p5t p5b bd1b "><b>Price</b></td>
                              <td width="10%"  class="color_1 p5t p5b bd1b "><b>Sub Total</b></td>
                            </tr>
                          
                          
                          {{foreach from=$allMeals item=item}}
                            <tr>
                              <td class="bd1b p10t p5b" style="vertical-align: top; padding: 10px 5px;">
                                 {{$item.name}}
                              </td>
                              <td class="bd1b p10t p5b" style="vertical-align: top;">
                                  {{$item.description}}
                              </td>
                              <td class="bd1b p10t p5b" style="vertical-align: top;">
                                  {{$item.quantity}}
                              </td>
                              <td class="bd1b p10t p5b" style="vertical-align: top;">
                                  ${{$item.price|@number_format:2:'.':','}}
                              </td>
                              <td class="bd1b p10t p5b" style="vertical-align: top;">
                                  ${{$item.total|@number_format:2:'.':','}}
                              </td>
                            </tr>
                          {{/foreach}}    
                          
                          
                        </table>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
            <div class="bot2"></div>
            
            <br/>
            <a href="{{$APP_BASE_URL}}order/index/manager"><img src="{{$LAYOUT_HELPER_URL}}front/img/bt_back.jpg"></a>
        <!-- END Meal -->
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

<style type="text/css"> 
 .order_detail label {
    float: left;
    font-weight: bold;
    max-width: 150px;
    min-width: 150px;
    padding: 0 0 10px;
}
.order_detail p {
    line-height: 1.2em;
    padding: 5px 0 10px;
}
</style>