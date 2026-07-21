{set $props = $properties[1].tvs}
{set $isModWebLink = 'isModWebLink' | snippet : ['class' => $class_key]}
{set $pic_mob = 'pthumb' | snippet: ['input' => $props.tv_img_ext, 'options' => 'q=100&h=364']}
{set $pic = 'pthumb' | snippet: ['input' => $props.tv_img, 'options' => 'q=100&h=548']}

<div class="promo__item swiper-slide{if $idx % 3 > 0} promo__item_type_col{/if}">
    <picture>
      <source type="image/webp" srcset="{'pthumb' | snippet: ['input' => $props.tv_img_ext, 'options' => 'q=100&h=364&f=webp']}" />
      <source type="image/jpeg" srcset="{$pic_mob}" />
      <img class="promo__img promo__img_type_mobile" src="{$pic_mob}" alt="{$pagetitle}" />
    </picture>
    <picture>
      <source type="image/webp" srcset="{'pthumb' | snippet: ['input' => $props.tv_img, 'options' => 'q=100&h=548&f=webp']}" />
      <source type="image/jpeg" srcset="{$pic}" />
      <img class="promo__img promo__img_type_desktop" src="{$pic}" alt="{$pagetitle}" />
    </picture>
    <div class="promo__wrapper">
        <div class="promo__content">
            {if $description}<div class="promo__subtitle">{$description}</div>{/if}
            <div class="promo__title">{$pagetitle}</div>
            {if $introtext}<div class="promo__desc">{$introtext}</div>{/if}
            {if $isModWebLink}
            <button
              class="btn btn-primary btn-md js-modal-btn"
              type="button"
              data-target="form"
              data-title="{$pagetitle}, слайд"
            >
              Записаться на сайте
            </button>
            {else}
            <a class="btn btn-primary btn-md" href="{$id | url}">Подробнее</a>
            {/if}
        </div>
    </div>
</div>