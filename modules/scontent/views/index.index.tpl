<!-- CONTENT MODULE -->
{{if $layout == '' || $layout == 'front'}}
<div id="main">
{{/if}}

<!-- 
<p class="title1 p10b">{{$content.title}}</p>
 -->
{{$content.full_text}}

{{if $layout == '' || $layout == 'front'}}
</div>
{{/if}}

<!-- END CONTENT MODULE -->