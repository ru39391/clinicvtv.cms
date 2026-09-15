{extends 'file:templates/base.tpl'}

{block 'main'}
    {set $content}
        <section class="content" itemprop="mainContentOfPage">
            {$_modx->getChunk('@FILE chunks/blocks/content.tpl', [
                'isUnwrapped' => true,
                'pls' => $_modx->resource.isfolder == 1 ? '' : $_modx->resource.tv_content_ext
            ])}
        </section>
    {/set}

    {if $_modx->resource.isfolder == 1}
        <div class="section section_offset_md">
            {$content}

            <div class="js-team-grid">
                {'pdoResources' | snippet: [
                    'parents' => 7,
                    'resources' => '-17',
                    'limit' => 0,
                    'depth' => 0,
                    'sortby' => '{"menuindex":"ASC"}',
                    'tplWrapper' => '@FILE chunks/team/category-wrapper.tpl',
                    'tpl' => '@FILE chunks/team/category-item.tpl'
                ]}

                <div class="tab-content js-tab-content">
                    {'pdoResources' | snippet: [
                        'limit' => 0,
                        'depth' => 0,
                        'sortby' => '{"menuindex":"DESC"}',
                        'tplWrapper' => '@FILE chunks/team/wrapper.tpl',
                        'tpl' => '@FILE chunks/team/item.tpl'
                    ]}
                </div>
            </div>
        </div>
    {else}
        {set $specs = []}
        {set $url = $_modx->resource.id | url : ['scheme' => 'full']}
        {set $props = $_modx->resource.properties[1].tvs}
        {set $depts = 'handleCategoryData' | snippet: ['input' => $props.tv_dept, 'arr' => 1, 'delimiter' => ',']}
        {set $team_category}
            {set $depts_counter = 0}
            {foreach $depts as $depts_id}
                {set $depts_counter+=1}
                {set $properties = $depts_id | resource : 'properties'}
                {set $caption = 'handleCategoryData' | snippet: ['input' => $properties[1].tvs.tv_team_category, 'index' => 1]}
                {set $specs[$depts_id] = $caption}

                {$_modx->getChunk('@FILE chunks/team/category-item.tpl', [
                    'id' => $depts_id,
                    'caption' => $caption,
                    'classMod' => 'btn-toggler_bg_white'
                ])}
            {/foreach}
        {/set}

        <div class="section section_offset_md section_pb_none">{$content}</div>

        {set $pic = 'pthumb' | snippet: ['input' => $props.tv_img ?: $_modx->config.default_team_nophoto, 'options' => 'q=100&h=600']}
        <div id="{$_modx->resource.alias}" class="section section_type_row section_ai_stretch section_dir_reverse">
            <div class="section__wrapper section__wrapper_type_col section__wrapper_bg_white">
                {if $depts_counter > 0}{$_modx->getChunk('@FILE chunks/team/category-wrapper.tpl', ['output' => $team_category])}{/if}

                {if $_modx->resource.description}
                    {$_modx->getChunk('@FILE chunks/content/blockquote-row.tpl', [
                        'classMod' => 'blockquote_type_col',
                        'content' => $_modx->resource.description
                    ])}
                {/if}

                <button
                    class="btn btn-primary btn-md js-modal-btn"
                    type="button"
                    data-target="form"
                    data-title="{$_modx->resource.pagetitle}, запись к специалисту - страница"
                >
                    Записаться на сайте
                </button>
            </div>
            <div class="section__aside">
                <picture>
                    <source type="image/webp" srcset="{'pthumb' | snippet: ['input' => $props.tv_img ?: $_modx->config.default_team_nophoto, 'options' => 'q=100&h=600&f=webp']}" />
                    <source type="image/jpeg" srcset="{$pic}" />
                    <img class="section__img" src="{$pic}" alt="{$title}" />
                </picture>
            </div>
        </div>

        {$_modx->resource.content}

        {'pdoResources' | snippet: [
            'class' => 'testimonialItem',
            'loadModels' => 'testimonial',
            'limit' => 0,
            'sortby' => '{"createdAt":"DESC"}',
            'where' => [
                'spec_id' => $_modx->resource.id,
                'rating:>' => 3
            ],
            'tplWrapper' => '@FILE chunks/testimonials/wrapper.tpl',
            'tpl' => '@FILE chunks/testimonials/item.tpl',
        ]}

        {set $depts_nav}
            {set $depts_counter = 0}
            {foreach $depts as $depts_id}
                {set $depts_counter+=1}
                {$_modx->getChunk('@FILE chunks/examples/btn-toggler.tpl', [
                    'id' => $depts_id,
                    'query' => '?spec_id=' ~ $_modx->resource.id,
                    'pagetitle' => $depts_id | resource : 'pagetitle',
                    'properties' => $depts_id | resource : 'properties',
                ])}
            {/foreach}
        {/set}

        {if $depts_counter > 0}
            {$_modx->getChunk('@FILE chunks/blocks/examples.tpl', [
                'output' => $_modx->getChunk('@FILE chunks/content/tab-nav-row.tpl', ['output' => $depts_nav])
            ])}
        {/if}

        {include 'file:chunks/blocks/callback-divider.tpl'}

        <script type="application/ld+json">
            {
                "@context": "https://schema.org",
                "@type": "IndividualPhysician",
                "@id": "{$url}#{$_modx->resource.alias}",
                "name": "{$_modx->resource.pagetitle}",
                "url": "{$url}",
                "image": "{'site_url' | config}{$props.tv_img ?: $_modx->config.default_team_nophoto}",
                "telephone": "{'default_contacts_phone' | config}",
                {if $depts_counter > 0}
                "medicalSpecialty": [
                    {foreach $specs as $value}
                    {
                    "@type": "MedicalSpecialty",
                    "name": "{$value}"
                    }{if $value@last != true},{/if}
                    {/foreach}
                ],
                {/if}
                "description": "{if $_modx->resource.introtext}опыт работы с {$_modx->resource.introtext} года{/if}",
                "mainEntityOfPage": {
                    "@type": "WebPage",
                    "@id": "{$url}#{$_modx->resource.alias}"
                },
                "potentialAction": {
                    "@type": "ReserveAction",
                    "name": "Записаться",
                    "target": "{$url}"
                },
                "practicesAt": {
                    "@type": "Dentist",
                    "@id": "{'site_url' | config}#clinic",
                    "name": "{$_modx->config.site_name}",      
                    "priceRange": "Информация о ценах по телефону {'default_contacts_phone' | config}",
                    "image": "{$_modx->config.default_contacts_logo}"
                }
            }
        </script>
    {/if}
{/block}