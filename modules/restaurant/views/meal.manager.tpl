    <div id="main">
        

        <div class="w692" style="padding-left: 96px;">
            <p class="title1">Meal manager</p>
            <br/>
        
            <p class="float_left m10r"><img src="{{$BASE_URL}}{{$res.image}}" alt="" /></p>
            <span class="fs14"><b>{{$res.name}}</b> (<a href="{{$BASE_URL}}user/index/edit-restaurant">Edit</a>)</span><br />
            {{$res.street}}<br />
            {{$res.city}}, {{$res.state}} {{$res.zip}}<br />
            <br/>
            {{$res.description}}<br/>
            <br/>
            <div class="clear_left"></div>
            
            
            {{if false === $mealMessage}}        
                <div style="padding: 10px 0; color: red; font-weight: bold; border-top: 1px solid red; border-bottom: 1px solid red;">
                    <b>Error:</b>
                    The meal is not updated now. Please try again.
                </div>
                <br/>
                {{/if}}
                
                {{if true === $mealMessage}}     
                <br/>   
                <div style="padding: 10px 0; color: green; font-weight: bold; border-top: 1px solid green; border-bottom: 1px solid green;">
                    The meal is updated successfully.
                </div>
                <br/>
                {{/if}}
                
                
            <div id="na_2">
                <ul>
                                    <!-- CSS Tabs -->
                    <li {{if 0==$type}} class="current" {{/if}}><a href="{{$BASE_URL}}restaurant/meal/manager/type/0"><span>General menu</span></a></li>
                    <li {{if 1==$type}} class="current" {{/if}}><a href="{{$BASE_URL}}restaurant/meal/manager/type/1"><span>Catering</span></a></li>
                </ul>
            </div>
            
            <br class="clear_left" />
            <div class="top2"></div>
            <div class="cen2">
                <div class="cen_2">
                    <div class="p10">
                        

                        <table cellpadding="0" cellspacing="0" border="0" style="width:100%;">
                          <tr>
                              <td width="10%" class="color_1 p5t p5b bd1b"><b>Meal name</b></td>
                              <td width="50%" class="color_1 p5t p5b bd1b"></td>
                              <td width="20%" class="color_1 p5t p5b bd1b"><b>Price</b></td>
                              <td width="10%" class="color_1 p5t p5b bd1b center"><b>Enabled</b></td>
                              <td width="10%" class="color_1 p5t p5b bd1b center"><b>Action</b></td>
                            </tr>
                          
                          
                          {{foreach from=$allMeals item=item}}
                            <tr>
                              <td class="bd1b p10t p5b" style="vertical-align: top; text-align: center; padding: 10px 5px;">
                                  {{if $item.image_thumb}}
                                     <a href="{{$BASE_URL}}{{$item.image}}" rel="prettyPhoto" title="{{$item.name|@addslashes}} (${{$item.price}})"><img alt="{{$item.name|@addslashes}}" src="{{$BASE_URL}}{{$item.image_thumb}}" style="max-width: 100px;"></a>
                                  {{/if}}
                              </td>
                              <td class="bd1b p10t p5b" style="vertical-align: top;">
                                  <p><b>{{$item.name}}</b></p>
                                  <br />
                                   <p>{{$item.description}}</p>
                              </td>
                              <td class="bd1b p10t p5b top">${{$item.price}}</td>
                              <td class="bd1b p10t p5b top center">
                                    {{if $item.enabled == '1'}}
                                        <a href="{{$APP_BASE_URL}}restaurant/meal/disable-meal/id/{{$item.meal_id}}" ><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/visible16x16.png"></a>
                                    {{else}}
                                        <a href="{{$APP_BASE_URL}}restaurant/meal/enable-meal/id/{{$item.meal_id}}" ><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/invisible16x16.png"></a>
                                    {{/if}}
                              </td>
                              <td class="bd1b p10t p5b top center">
                                <!-- Icons -->
                                     <a href="{{$APP_BASE_URL}}restaurant/meal/edit-meal/id/{{$item.meal_id}}" title="Edit"><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/pencil.png"  alt="Edit" /></a>
                                     <a href="javascript:deleteAMeal({{$item.meal_id}});" title="Delete"><img src="{{$LAYOUT_HELPER_URL}}admin/images/icons/cross.png"  alt="Delete" /></a>
                              </td>
                            </tr>
                          {{/foreach}}    
                          
                          
                        </table>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
            <div class="bot2"></div>
        </div>
        <div class="clear"></div>
    </div>
    
            
<script language="javascript" type="text/javascript">

function deleteAMeal(id)
{
    result = confirm('Are you sure you want to delete this meal?');
    if (false == result) {
        return;
    }
    window.location.href = '{{$APP_BASE_URL}}restaurant/meal/delete-meal/id/' + id;
}
</script>