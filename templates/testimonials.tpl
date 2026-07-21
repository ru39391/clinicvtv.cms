{extends 'file:templates/base.tpl'}

{block 'main'}
    {set $btn}
        <button
            class="btn btn-primary btn-md js-modal-btn"
            type="button"
            data-target="testimonials"
            data-title="Оставить отзыв"
        >
            Оставить отзыв
        </button>
    {/set}

    <div class="section section_offset_md section_pb_none">
        <section class="content">
            {$_modx->getChunk('@FILE chunks/blocks/content.tpl', [
                'isUnwrapped' => true,
                'pls' => $btn ~ $_modx->resource.content
            ])}
        </section>
    </div>

    <div class="section section_offset_md">
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

{block 'forms'}
    {$_modx->getChunk('@FILE chunks/blocks/form.tpl', [
        'action' => '/testimonials',
        'target' => 'testimonials',
    ])}
{/block}