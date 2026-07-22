{extends 'file:templates/base.tpl'}

{block 'main'}
    {set $picture}
        {if $_modx->resource.isfolder != 1}
            {set $pic = 'pthumb' | snippet: ['input' => $_modx->resource.tv_img, 'options' => 'q=100&h=548']}

            <div class="promo promo_type_picture">
                <picture>
                    <source type="image/webp" srcset="{'pthumb' | snippet: ['input' => $_modx->resource.tv_img, 'options' => 'q=100&h=548&f=webp']}" />
                    <source type="image/jpeg" srcset="{$pic}" />
                    <img class="promo__img" src="{$pic}" alt="{$_modx->resource.pagetitle}" />
                </picture>
            </div>
        {/if}
    {/set}

    {set $content}
        <section class="content">
            {$_modx->getChunk('@FILE chunks/blocks/content.tpl', [
                'isUnwrapped' => true,
                'pls' => $picture ~ $_modx->resource.content
            ])}
        </section>
    {/set}

    {if $_modx->resource.isfolder == 1}
        <div class="section section_offset_md">
            {$content}

            {'!pdoPage' | snippet: [
                'limit' => 6,
                'tplWrapper' => '@FILE chunks/articles/wrapper.tpl',
                'tpl' => '@FILE chunks/articles/item.tpl',
                'tplPage' => '@FILE chunks/pagination/item.tpl',
                'tplPageWrapper' => '@FILE chunks/pagination/wrapper.tpl',
                'tplPagePrev' => '@FILE chunks/pagination/prev.tpl',
                'tplPageNext' => '@FILE chunks/pagination/next.tpl',
                'tplPageActive' => '@FILE chunks/pagination/current.tpl',
                'tplPagePrevEmpty' => '',
                'tplPageNextEmpty' => '',
                'isPlainRow' => 1
            ]}
        </div>

        {if $_modx->getPlaceholder('pageCount') > 1}
            {$_modx->getPlaceholder('page.nav')}
        {/if}
    {else}
        <div class="section section_offset_md">{$content}</div>
    {/if}
{/block}