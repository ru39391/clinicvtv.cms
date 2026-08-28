{set $props = $properties[1].tvs}

<div class="card" itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
    <meta itemprop="position" content="{$idx}" />
    <div class="card__header" itemscope itemtype="https://schema.org/Service" itemprop="item">
        <meta itemprop="url" content="{$id | url : ['scheme' => 'full']}">
        <meta itemprop="description" content="{$description}" />
        <div class="card__media">
            <meta itemprop="image" content="{'site_url' | config}{$props.tv_img}" />
            <picture>
                <source type="image/webp" srcset="{'pthumb' | snippet: ['input' => $props.tv_img, 'options' => 'q=100&f=webp']}" />
                <source type="image/jpeg" srcset="{$props.tv_img}" />
                <img src="{$props.tv_img}" alt="{$pagetitle}" />
            </picture>
        </div>
        <a class="card__title card__title_type_link" href="{$id | url}">
            <span itemprop="name">{$pagetitle}</span>
        </a>
    </div>
    <div class="card__desc">{$description}</div>
</div>