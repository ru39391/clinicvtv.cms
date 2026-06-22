{set $props = $properties[1].tvs}

<div class="card card_type_row">
    <a class="card__media" href="{$link}"><img class="img-fluid" src="{$props.tv_img}" alt="{$menutitle}" /></a>
    <a class="card__title card__title_ta_center" href="{$link}">{$menutitle}</a>
    {$wrapper}
</div>