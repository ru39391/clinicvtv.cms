{set $pic_after = 'pthumb' | snippet: ['input' => $img_after, 'options' => 'q=100&h=340']}
{set $img_before = 'pthumb' | snippet: ['input' => $img_before, 'options' => 'q=100&h=340']}
{set $alt}
    {$name}, доктор {$spec_id | resource : 'pagetitle'}
{/set}

<div class="swiper-slide w-auto">
    <div class="examples-item">
        <picture>
            <source type="image/webp" srcset="{'pthumb' | snippet: ['input' => $img_after, 'options' => 'q=100&h=340&f=webp']}" />
            <source type="image/jpeg" srcset="{$pic_after}" />
            <img class="img-cover" src="{$pic_after}" alt="{$desc}" />
        </picture>
        <div class="examples-item__pic">
            <picture>
                <source type="image/webp" srcset="{'pthumb' | snippet: ['input' => $img_before, 'options' => 'q=100&h=340&f=webp']}" />
                <source type="image/jpeg" srcset="{$img_before}" />
                <img class="img-cover" src="{$img_before}" alt="{$desc}" />
            </picture>
        </div>
        <div class="examples-item__footer">
            <div class="examples-item__togglers">
                <button class="examples-item__btn is-active" type="button">после</button>
                <button class="examples-item__btn" type="button">до</button>
            </div>
            <div class="examples-item__content">
                {if $name}<p>{$name}</p>{/if}
                {if $spec_id}<p>Доктор {$spec_id | resource : 'pagetitle'}</p>{/if}
                {if $desc}<p>{$desc}</p>{/if}
            </div>
        </div>
    </div>
</div>