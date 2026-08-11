{extends 'file:templates/base.tpl'}

{block 'main'}
    {set $props = $_modx->resource.properties[1].tvs}
    {set $title = ($_modx->resource.longtitle ?: $_modx->resource.menutitle) ?: $_modx->resource.pagetitle}

    <section class="section content section_offset_md"><h1>{$title}</h1></section>

    <div class="section section_pb_none section_type_row section_type_media section_ai_stretch section_dir_reverse">
        <div class="section__aside"><img class="section__img img-fluid" src="{$props.tv_img_ext}" alt="{$title}" /></div>
        <div class="section__wrapper section__wrapper_type_col section__wrapper_bg_white">
            <div class="content content_offset_mb">{$_modx->resource.content}</div>
            <button class="btn btn-primary btn-md js-modal-btn" type="button" data-target="form" data-title="Стр. контактов">Записаться</button>
        </div>
    </div>

    {set $phones = [$_modx->config.default_contacts_phone, $_modx->config.default_contacts_mobile]}
    {set $phones_section}
        {set $phones_counter = 0}
        {foreach $phones as $phones__item}
            {set $phones_counter+=1}
            <a class="content__link" href="tel:{$phones__item | formatPhoneValue}">{$phones__item}</a><br />
        {/foreach}
    {/set}

    <div class="section">
        <div class="features-wrapper features-wrapper_type_grid">
            {if $phones_counter > 0}
            <div class="feature feature_type_contacts feature_type_card">
                <div class="feature__title">Контакты</div>
                <div class="feature__wrapper">
                    <div class="content content_fw_light">
                        <p>
                            Телефон<br />
                            {$phones_section}
                        </p>
                        {if $_modx->config.default_contacts_email}
                        <p>
                            Почта<br />
                            <a class="content__link" href="mailto:{$_modx->config.default_contacts_email}">{$_modx->config.default_contacts_email}</a>
                        </p>
                        {/if}
                    </div>
                </div>
            </div>
            {/if}

            {if $_modx->config.default_social_max}
            <div class="feature feature_type_card">
                <div class="feature__title">Напишите нам</div>
                <div class="feature__wrapper">
                    <a class="btn btn-primary btn-sm" href="{$_modx->config.default_social_max}" target="_blank" rel="nofollow">Max</a>
                </div>
            </div>
            {/if} 

            {if $_modx->resource.tv_content_ext}
            <div class="feature feature_type_contacts feature_type_card">
                <div class="feature__title">График работы</div>
                <div class="feature__wrapper">
                    <div class="content content_fw_light">{$_modx->resource.tv_content_ext}</div>
                </div>
            </div>
            {/if}
        </div>
    </div>

    {set $arr = 'renderContentRows' | snippet: [
        'data' => $_modx->resource.tv_content_row,
        'input' => '[[+rows]]'
    ]}

    {if $arr | length > 0}
        {foreach $arr as $key => $data}
            {if $key == 0}
            <div class="section section_pb_none section_type_start section_bg_white">
                <div class="section-title section-title_mb_none">{$data.content_row_caption}</div>
            </div>
            {else}
            <div class="section section_type_row section_ai_stretch section_type_end section_bg_white">
                <div class="section__wrapper">
                    <div class="content">{$data.content_row_text}</div>
                </div>
                <div class="section__aside section__aside_width_unset">
                    {set $pic = 'pthumb' | snippet: ['input' => $data.content_row_img, 'options' => 'q=100&h=525']}
                    <picture>
                        <source type="image/webp" srcset="{'pthumb' | snippet: ['input' => $data.content_row_img, 'options' => 'q=100&h=525&f=webp']}" />
                        <source type="image/jpeg" srcset="{$pic}" />
                        <img class="section__img img-fluid" src="{$pic}" alt="{$title}" />
                    </picture>
                </div>
            </div>
            {/if}
        {/foreach}
    {/if}

    {set $adresses = json_decode($_modx->resource.tv_features, true)}
    {set $adresses_section}
        {set $adresses_counter = 0}
        {foreach $adresses as $data}
            {set $adresses_counter+=1}
            {set $pic = 'pthumb' | snippet: ['input' => $data.features_img, 'options' => 'q=100&h=560']}
            <div class="feature feature_type_pic">
                <div class="feature__title">{$data.features_title}</div>
                <div class="feature__wrapper">
                    <picture>
                        <source type="image/webp" srcset="{'pthumb' | snippet: ['input' => $data.features_img, 'options' => 'q=100&h=560&f=webp']}" />
                        <source type="image/jpeg" srcset="{$pic}" />
                        <img class="section__img img-fluid" src="{$pic}" alt="{$title}" />
                    </picture>
                </div>
            </div>
        {/foreach}
    {/set}
    {if $adresses_counter > 0}
    <div class="section">
        <div class="section-title">Как до нас добраться</div>
        <div class="features-wrapper features-wrapper_type_grid">{$adresses_section}</div>
    </div>
    {/if}
{/block}