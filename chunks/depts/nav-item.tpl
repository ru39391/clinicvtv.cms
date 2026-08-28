{set $props = $properties[1].tvs}

<div class="card card_type_row" itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
    <meta itemprop="position" content="{$idx}" />
    <span class="card__meta" itemscope itemtype="https://schema.org/Service" itemprop="item">
        <meta itemprop="url" content="{$id | url : ['scheme' => 'full']}">
        <meta itemprop="name" content="{$menutitle}" />
        <meta itemprop="description" content="{$description}" />
        <meta itemprop="image" content="{'site_url' | config}{$props.tv_img}" />
    </span>
    <a class="card__media" href="{$link}"><img class="img-fluid" src="{$props.tv_img}" alt="{$menutitle}" /></a>
    <a class="card__title card__title_ta_center" href="{$link}">{$menutitle}</a>
    {$wrapper}
</div>