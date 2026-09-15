{*
    ////////////////////////
    ///  Карусель акций  ///
    ////////////////////////
*}

{'pdoResources' | snippet: [
    'parents' => 10,
    'resources' => $_modx->resource.tv_promo,
    'limit' => 0,
    'tplWrapper' => '@FILE chunks/promo/wrapper.tpl',
    'tpl' => '@FILE chunks/promo/item.tpl'
]}