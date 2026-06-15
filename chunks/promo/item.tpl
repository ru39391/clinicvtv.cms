{set $props = $properties[1].tvs}
{set $isModWebLink = 'isModWebLink' | snippet : ['class' => $class_key]}

<div class="promo__item swiper-slide">
    <img class="promo__img promo__img_type_mobile" src="{$props.tv_img_ext}" alt="{$pagetitle}" />
    <img class="promo__img promo__img_type_desktop" src="{$props.tv_img}" alt="{$pagetitle}" />
    <div class="promo__wrapper">
        <div class="promo__content">
            {if $description}<div class="promo__subtitle">{$description}</div>{/if}
            <div class="promo__title">{$pagetitle}</div>
            {if $introtext}<div class="promo__desc">{$introtext}</div>{/if}
            {if $isModWebLink}
            <button class="btn btn-primary btn-md" type="button">Записаться на сайте</button>
            {else}
            <a class="btn btn-primary btn-md" href="{$id | url}">Подробнее</a>
            {/if}
        </div>
    </div>
</div>