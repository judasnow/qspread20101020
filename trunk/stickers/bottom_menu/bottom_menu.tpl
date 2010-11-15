<div id="main_bot">
        <div id="page_margin">
            <div class="w200 float_left">
                <p class="color_2 p20l"><b><a href="{{$BASE_URL}}">QuickSpread.com</a></b></p>
                <ul class="list_2 p5t p20l">
                
                    {{foreach from=$menus1 item=item}}
                    <li id="menu_{{$item.id}}"><a href="{{$item.url}}">{{$item.name}}</a></li>
                    {{/foreach}}
                    
                </ul>
            </div>
            <div class="w200 float_left m10l">
                <p class="color_2"><b>Programs</b></p>
                <ul class="list_2 p5t">
                
                    {{foreach from=$menus2 item=item }}
                    <li id="menu_{{$item.id}}"><a href="{{$item.url}}">{{$item.name}}</a></li>
                    {{/foreach}}
                    
                </ul>
            </div>
            <div class="w200 float_left">
                <p class="color_2"><b>Business Solutions</b></p>
                <ul class="list_2 p5t">
                
                    {{foreach from=$menus3 item=item}}
                    <li id="menu_{{$item.id}}"><a href="{{$item.url}}">{{$item.name}}</a></li>
                    {{/foreach}}
                    
                </ul>
            </div>
            <div class="w175 float_left">
                <p class="color_2"><b>Legal Info</b></p>
                <ul class="list_2 p5t">
                
                    {{foreach from=$menus4 item=item}}
                    <li id="menu_{{$item.id}}"><a href="{{$item.url}}">{{$item.name}}</a></li>
                    {{/foreach}}
                    
                </ul>
            </div>
            <div class="w110 float_left">
                <p class="color_2"><b>More Info</b></p>
                <ul class="list_2 p5t">
                
                    {{foreach from=$menus5 item=item}}
                    <li id="menu_{{$item.id}}"><a href="{{$item.url}}">{{$item.name}}</a></li>
                    {{/foreach}}
                    
                </ul>
            </div>
            <div class="clear_left"></div>
        </div>
    </div>