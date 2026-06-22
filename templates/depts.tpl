{extends 'file:templates/base.tpl'}

{block 'content'}{/block}

{block 'main'}
    {include 'file:chunks/blocks/promo.tpl'}

    <div class="container">
    {if $_modx->resource.id == 7}
        {'pdoMenu' | snippet: [
            'parents' => $_modx->resource.id,
            'level' => 2,
            'limit' => 0,
            'showHidden' => 1,
            'tplOuter' => '@FILE chunks/depts/nav-wrapper.tpl',
            'tpl' => '@FILE chunks/depts/nav-item.tpl',
            'tplInner' => '@FILE chunks/depts/subnav-wrapper.tpl',
            'tplInnerRow' => '@FILE chunks/depts/subnav-item.tpl',
        ]}

        {include 'file:chunks/blocks/content-section.tpl'}

        {include 'file:chunks/blocks/team.tpl'}

        {include 'file:chunks/blocks/features.tpl'}
    {else}
        {set $props = $_modx->resource.properties[1].tvs}
        {set $title = ($_modx->resource.longtitle ?: $_modx->resource.menutitle) ?: $_modx->resource.pagetitle}
        <section class="section content content_offset_px">
            <h1>{$title}</h1>
            <div class="card card_type_plain">
                <div class="card__media"><img class="img-fluid" src="{$props.tv_img}" alt="{$title}" /></div>
                {'pdoResources' | snippet: [
                    'parents' => $_modx->resource.id,
                    'level' => 1,
                    'limit' => 0,
                    'tplWrapper' => '@FILE chunks/depts/subnav-wrapper.tpl',
                    'tpl' => '@FILE chunks/depts/subnav-item.tpl',
                ]}
            </div>
        </section>

        {set $dept = [
            'idx' => 1,
            'id' => $_modx->resource.id,
            'properties' => $_modx->resource.properties,
            'pagetitle' => $_modx->resource.pagetitle
        ]}

        {include 'file:chunks/blocks/features.tpl'}

        {set $team_dept = $_modx->getChunk('@FILE chunks/team/btn-toggler.tpl', $dept)}
        {if $_modx->resource.hidemenu != 1}
        <div class="section">
            <div class="section-title">Наша команда</div>
            <div class="tab-section js-team-tabs">
                {$_modx->getChunk('@FILE chunks/content/tab-nav.tpl', ['output' => $team_dept])}
                <div class="tab-content js-tab-content" data-href={8 | url}></div>
            </div>
        </div>
        {/if}

        {set $examples_dept = $_modx->getChunk('@FILE chunks/examples/btn-toggler.tpl', $dept)}
        {if $_modx->resource.hidemenu != 1}
        <div class="section section_bg_white js-example-tabs">
            <div class="section-title">Примеры работ</div>
            {$_modx->getChunk('@FILE chunks/content/tab-nav-row.tpl', ['output' => $examples_dept])}
        </div>
        {/if}
    {/if}
    </div>
{/block}