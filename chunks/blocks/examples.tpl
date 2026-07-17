{*
    /////////////////////////////////////////////
    ///  Примеры работ (общая выборка), табы  ///
    /////////////////////////////////////////////
*}

<div class="section section_bg_white section_type_rounded js-example-tabs">
    <div class="section-title">Примеры работ</div>
    {$output ?: 'pdoResources' | snippet: [
        'parents' => 7,
        'limit' => 0,
        'depth' => 0,
        'sortby' => '{"menuindex":"ASC"}',
        'where' => '{"hidemenu:!=":1}',
        'tplWrapper' => '@FILE chunks/content/tab-nav-row.tpl',
        'tpl' => '@FILE chunks/examples/btn-toggler.tpl'
    ]}
</div>