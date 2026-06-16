{set $props = $properties[1].tvs}

<div class="card">
    <div class="card__header">
        <div class="card__media">
        <picture>
            <source type="image/webp" srcset="{'pthumb' | snippet: ['input' => $props.tv_img, 'options' => 'q=100&f=webp']}" />
            <source type="image/jpeg" srcset="{$props.tv_img}" />
            <img src="{$props.tv_img}" alt="{$pagetitle}" />
        </picture>
        </div>
        <a class="card__title card__title_type_link" href="{$id | url}">{$pagetitle}</a>
    </div>
    <div class="card__desc">{$description}</div>
</div>