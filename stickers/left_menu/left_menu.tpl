
        <ul class="list_menu">
            {{foreach from=$menus item=item name=leftMenu}}
            <li id="menu_{{$item.id}}" {{if $smarty.foreach.leftMenu.last}} style="border:none;" {{/if}}><a {{if $item.id==$menuId}}class="current"{{/if}} href="{{$item.url}}"><span>{{$item.name}}</span></a></li>
            {{/foreach}}
        </ul>