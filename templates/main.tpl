{extends 'file:templates/base.tpl'}

{block 'content'}{/block}

{block 'main'}
<div class="wrapper wrapper_bg_right">
    {include 'file:chunks/blocks/promo.tpl'}

    <div class="container">
        {include 'file:chunks/blocks/content.tpl'}

        {include 'file:chunks/blocks/depts.tpl'}

        {include 'file:chunks/blocks/content-section.tpl'}

        {include 'file:chunks/blocks/team.tpl'}

        {include 'file:chunks/blocks/price.tpl'}
    </div>
</div>
{/block}