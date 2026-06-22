{set $props = $properties[1].tvs}
{set $img = 'pthumb' | snippet: ['input' => $props.tv_img, 'options' => 'q=100&w=365&h=265&zc=1']}

<div class="article-slide swiper-slide w-auto">
    <div class="article-item">
        <picture>
            <source type="image/webp" srcset="{'pthumb' | snippet: ['input' => $props.tv_img, 'options' => 'q=100&w=365&h=265&zc=1&f=webp']}" />
            <source type="image/jpeg" srcset="{$img}" />
            <img class="article-item__img img-fluid" src="{$img}" alt="{$pagetitle}" />
        </picture>
        <a class="article-item__title" href="{$id | url}">{$pagetitle}</a>
        <div class="article-item__desc">{$description | truncate : 160}</div>
    </div>
</div>