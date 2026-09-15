{extends 'file:templates/base.tpl'}

{block 'main'}
    {set $price}
        {$_modx->getChunk('@FILE chunks/blocks/price.tpl', [
            'isUnwrapped' => true,
        ])}
    {/set}

    <div class="section section_offset_md">
        <section class="content" itemprop="mainContentOfPage">
            {$_modx->getChunk('@FILE chunks/blocks/content.tpl', [
                'isUnwrapped' => true,
                'pls' => $price ~ $_modx->resource.content
            ])}
        </section>
    </div>

    {'pdoResources' | snippet: [
        'class' => 'pricelistItem',
        'loadModels' => 'pricelist',
        'limit' => 0,
        'outputSeparator' => ',',
        'sortby' => '{"id":"ASC"}',
        'where' => '{"is_hidden":0}',
        'tplWrapper' => '@FILE chunks/price/microdata-wrapper.tpl',
        'tpl' => '@FILE chunks/price/microdata-item.tpl'
    ]}
{/block}