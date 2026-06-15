{set $props = $properties[1].tvs}

<div class="card">
    <div class="card__header">
        <div class="card__media"><img class="img-fluid" src="{$props.tv_img}" alt="{$pagetitle}" /></div>
        <a class="card__title card__title_type_link" href="{$id | url}">{$pagetitle}</a>
    </div>
    <div class="card__desc">{$description}</div>
</div>