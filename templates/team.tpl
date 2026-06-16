{extends 'file:templates/base.tpl'}

{block 'content'}{/block}

{block 'main'}
<div class="section section_offset_md container">
    <section class="content">
        {$_modx->getChunk('@FILE chunks/blocks/content.tpl', [
            'classMod' => 'content_py_md',
            'isUnwrapped' => true
        ])}
    </section>

    {if $_modx->resource.isfolder == 1}
        {'pdoResources' | snippet: [
            'parents' => 7,
            'limit' => 0,
            'depth' => 0,
            'sortby' => '{"menuindex":"ASC"}',
            'where' => '{"hidemenu:!=":1}',
            'tplWrapper' => '@FILE chunks/team/category-wrapper.tpl',
            'tpl' => '@FILE chunks/team/category-item.tpl'
        ]}

        {'pdoResources' | snippet: [
            'limit' => 0,
            'depth' => 0,
            'sortby' => '{"menuindex":"DESC"}',
            'tplWrapper' => '@FILE chunks/team/wrapper.tpl',
            'tpl' => '@FILE chunks/team/item.tpl'
        ]}
    {/if}
</div>
{/block}