{*
    ///////////////////////////////////////////
    ///  Прейскурант (общая выборка), табы  ///
    ///////////////////////////////////////////
*}

<div class="section">
    <div class="section-title">Прейскурант</div>
    <div class="tab-section js-price-tabs">
        {'pdoResources' | snippet: [
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
</div>