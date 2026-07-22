{*
    ///////////////////////////////////////////
    ///  Прейскурант (общая выборка), табы  ///
    ///////////////////////////////////////////
*}

{set $tabs}
    <div class="tab-section tab-section_nav_nopt js-price-tabs">
        {$output ?: 'pdoResources' | snippet: [
            'parents' => 7,
            'limit' => 0,
            'depth' => 0,
            'sortby' => '{"menuindex":"ASC"}',
            'where' => '{"hidemenu:!=":1}',
            'tplWrapper' => '@FILE chunks/content/tab-nav.tpl',
            'tpl' => '@FILE chunks/price/btn-toggler.tpl'
        ]}
        <div class="tab-content js-tab-content"></div>
    </div>
{/set}


{if $isUnwrapped}
    {$tabs}
{else}
    <div class="section">
        <div class="section-title">Прейскурант</div>
        {$tabs}
    </div>
{/if}