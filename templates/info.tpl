{extends 'file:templates/base.tpl'}

{block 'main'}
    {set $dept_id = $_modx->resource.tv_dept_id ?: $_modx->resource.parent}

    {include 'file:chunks/blocks/promo.tpl'}

    {$_modx->getChunk('@FILE chunks/blocks/content.tpl', [
        'pls' => $_modx->resource.tv_content_ext,
    ])}

    {include 'file:chunks/blocks/cards.tpl'}

    {set $price_nav = $_modx->getChunk('@FILE chunks/price/btn-toggler.tpl', [
        'id' => $dept_id,
        'pagetitle' => $dept_id | resource : 'pagetitle',
        'properties' => $dept_id | resource : 'properties',
    ])}
    {$_modx->getChunk('@FILE chunks/blocks/price.tpl', [
        'output' => $_modx->getChunk('@FILE chunks/content/tab-nav.tpl', ['output' => $price_nav])
    ])}

    {$_modx->resource.content}

    {set $team_nav = $_modx->getChunk('@FILE chunks/team/btn-toggler.tpl', [
        'id' => $dept_id,
        'pagetitle' => $dept_id | resource : 'pagetitle',
        'properties' => $dept_id | resource : 'properties',
    ])}
    {$_modx->getChunk('@FILE chunks/blocks/team.tpl', [
        'output' => $_modx->getChunk('@FILE chunks/content/tab-nav.tpl', ['output' => $team_nav])
    ])}

    {$_modx->getChunk('@FILE chunks/blocks/testimonials.tpl', ['dept_id' => $dept_id])}

    {include 'file:chunks/blocks/features.tpl'}

    {include 'file:chunks/blocks/faq.tpl'}

    {'pdoResources' | snippet: [
        'parents' => 55,
        'tplWrapper' => '@FILE chunks/articles/wrapper.tpl',
        'tpl' => '@FILE chunks/articles/item.tpl',
    ]}

    {include 'file:chunks/blocks/callback-divider.tpl'}
{/block}