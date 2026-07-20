{extends 'file:templates/base.tpl'}

{block 'main'}
    {set $content}
        <section class="content">
            {$_modx->getChunk('@FILE chunks/blocks/content.tpl', [
                'isUnwrapped' => true,
            ])}
        </section>
    {/set}

    {if $_modx->resource.isfolder == 1}
        <div class="section section_offset_md">
            {$content}

            {'!pdoPage' | snippet: [
                'parents' => 10,
                'limit' => 5,
                'tplWrapper' => '@FILE chunks/promo/grid-wrapper.tpl',
                'tpl' => '@FILE chunks/promo/item.tpl',
                'tplPage' => '@FILE chunks/pagination/item.tpl',
                'tplPageWrapper' => '@FILE chunks/pagination/wrapper.tpl',
                'tplPagePrev' => '@FILE chunks/pagination/prev.tpl',
                'tplPageNext' => '@FILE chunks/pagination/next.tpl',
                'tplPageActive' => '@FILE chunks/pagination/current.tpl',
                'tplPagePrevEmpty' => '',
                'tplPageNextEmpty' => ''
            ]}
        </div>

        {if $_modx->getPlaceholder('pageCount') > 1}
            {$_modx->getPlaceholder('page.nav')}
        {/if}
    {else}
        <div class="section section_offset_md section_pb_none">{$content}</div>
    {/if}
{/block}