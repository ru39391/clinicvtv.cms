{extends 'file:templates/base.tpl'}

{block 'content'}{/block}

{block 'main'}
{set $props = $_modx->resource.properties[1].tvs}
{set $depts = 'handleCategoryData' | snippet: ['input' => $props.tv_dept, 'arr' => 1, 'delimiter' => ',']}

<div class="section section_offset_md container">
    <section class="content">
        {$_modx->getChunk('@FILE chunks/blocks/content.tpl', [
            'classMod' => 'content_py_md',
            'isUnwrapped' => true
        ])}
    </section>

    {if $_modx->resource.isfolder == 1}
    <div class="js-team-grid">
        {'pdoResources' | snippet: [
            'parents' => 7,
            'limit' => 0,
            'depth' => 0,
            'sortby' => '{"menuindex":"ASC"}',
            'where' => '{"hidemenu:!=":1}',
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
    {else}
        {include 'file:chunks/blocks/content-section.tpl'}

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
    {/if}
</div>
{/block}