
        <ul>
            {{foreach from=$menus item=item key=key}}
            <li {{if $key==$menuId}}class="current"{{/if}}><a href="{{$item.url}}"><span>{{$item.name}}</span></a></li>
            {{/foreach}}
        </ul>