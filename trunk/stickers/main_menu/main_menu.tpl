
        <ul>
            {{foreach from=$menus item=item}}
            <li id="menu_{{$item.id}}" {{if $item.id==$menuId}}class="current"{{/if}}><a href="{{$item.url}}"><span>{{$item.name}}</span></a></li>
            {{/foreach}}
        </ul>