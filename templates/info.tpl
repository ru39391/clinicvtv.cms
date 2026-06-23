{extends 'file:templates/base.tpl'}

{block 'content'}{/block}

{block 'main'}
    {include 'file:chunks/blocks/promo.tpl'}

    {include 'file:chunks/blocks/content.tpl'}

    {include 'file:chunks/blocks/cards.tpl'}

    <!--
    Прейскурант - dept_id из tv или parent

    Блок с белой подложкой, включает:
        content-row
        цитата
        колонки
        plain text
        запись на приём

    Блок с белой подложкой, включает:
        plain text
        content-row

    Цитата

    Блок с белой подложкой, включает:
        plain text
        колонки
        plain text
    
    Team - dept_id из tv или parent

    Отзывы - получаем dept_id, ищем spec_id, которые сюда относятся
    -->
    {include 'file:chunks/blocks/testimonials.tpl'}

    {include 'file:chunks/blocks/features.tpl'}

    {include 'file:chunks/blocks/faq.tpl'}

    {'pdoResources' | snippet: [
        'parents' => 55,
        'tplWrapper' => '@FILE chunks/articles/wrapper.tpl',
        'tpl' => '@FILE chunks/articles/item.tpl',
    ]}

    {include 'file:chunks/blocks/callback-divider.tpl'}
{/block}