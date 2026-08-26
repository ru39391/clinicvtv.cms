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
        <section class="content" itemprop="mainContentOfPage">
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
            'where' => [
                'rating:>' => 3,
                'is_hidden' => 0
            ],
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
    {set $fieldset}
    <div class="form__item is-hidden js-input-holder">
        <input
            class="js-input-field"
            name="rating"
            value="5"
            type="hidden"
            data-name="rating"
        />
    </div>
    <div class="form__item is-hidden js-input-holder">
        <input
            class="js-input-field"
            name="is_hidden"
            value="1"
            type="hidden"
            data-name="is_hidden"
        />
    </div>
    <div class="form__item js-input-holder">
        <input
            class="form__field js-input-field js-input-type-default"
            data-name="name"
            name="name"
            value=""
            type="text"
            placeholder="Ваше имя"
        />
        <label class="form__label">Ваше имя</label>
        <span class="form-error js-error-message"></span>
    </div>
    {'pdoResources' | snippet: [
        'parents' => 8,
        'limit' => 0,
        'depth' => 0,
        'sortby' => '{"pagetitle":"ASC"}',
        'tplWrapper' => '@FILE chunks/team/options.tpl',
        'tpl' => '@FILE chunks/form/option.tpl',
    ]}
    <div class="form__item js-input-holder">
        <textarea
            class="form__field form__field_type_textarea js-input-field js-input-type-default"
            data-name="desc"
            name="desc"
            placeholder="Ваш отзыв"
        ></textarea>
        <label class="form__label">Ваш отзыв</label>
        <span class="form-error js-error-message"></span>
    </div>
    {/set}

    {$_modx->getChunk('@FILE chunks/blocks/form.tpl', [
        'action' => '/testimonials',
        'fieldset' => $fieldset,
        'isDescHidden' => 1,
        'message' => 'Отзыв успешно размещён',
        'target' => 'testimonials',
        'title' => 'Оставьте отзыв'
    ])}
{/block}