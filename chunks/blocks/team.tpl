{*
    ////////////////////////////////////////////
    ///  Наша команда (общая выборка), табы  ///
    ////////////////////////////////////////////
*}

<div class="section">
    <div class="section-title">Наша команда</div>
    <div class="tab-section js-team-tabs">
        {$output ?: 'pdoResources' | snippet: [
            'parents' => 7,
            'resources' => '-17',
            'limit' => 0,
            'depth' => 0,
            'sortby' => '{"menuindex":"ASC"}',
            'tplWrapper' => '@FILE chunks/content/tab-nav.tpl',
            'tpl' => '@FILE chunks/team/btn-toggler.tpl'
        ]}
        <div class="tab-content js-tab-content" data-href={8 | url}></div>
    </div>
</div>