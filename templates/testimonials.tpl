{extends 'file:templates/base.tpl'}

{block 'main'}
    <div class="section section_offset_md">
        <section class="content">
            {$_modx->getChunk('@FILE chunks/blocks/content.tpl', [
                'isUnwrapped' => true,
            ])}
        </section>

        {'!pdoPage' | snippet: [
            'class' => 'testimonialItem',
            'loadModels' => 'testimonial',
            'limit' => 10,
            'sortby' => '{"createdAt":"DESC"}',
            'tplWrapper' => '@FILE chunks/testimonials/wrapper.tpl',
            'tpl' => '@FILE chunks/testimonials/item.tpl',
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
{/block}