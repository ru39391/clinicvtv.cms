{extends 'file:templates/base.tpl'}

{block 'main'}
    {include 'file:chunks/blocks/promo.tpl'}

    {include 'file:chunks/blocks/content.tpl'}

    {include 'file:chunks/blocks/depts.tpl'}

    {include 'file:chunks/blocks/content-section.tpl'}

    {include 'file:chunks/blocks/team.tpl'}

    {'pdoResources' | snippet: [
        'class' => 'testimonialItem',
        'loadModels' => 'testimonial',
        'limit' => 10,
        'sortby' => '{"createdAt":"DESC"}',
        'where' => [
            'rating:>' => 3
        ],
        'tplWrapper' => '@FILE chunks/testimonials/wrapper.tpl',
        'tpl' => '@FILE chunks/testimonials/item.tpl',
    ]}

    {include 'file:chunks/blocks/examples.tpl'}

    {include 'file:chunks/blocks/price.tpl'}
{/block}