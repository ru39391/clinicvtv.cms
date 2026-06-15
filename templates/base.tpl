{set $static = 'setAssets' | snippet}
{set $is_main_page = $_modx->resource.id === 1}

<!DOCTYPE html>
<html lang="ru" itemscope itemtype="http://schema.org/WebPage">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <base href="{'site_url' | option}" />
        
        {block 'meta'}
        <title>{$_modx->resource.tv_seotitle ?: $_modx->resource.pagetitle ~' - '~ $_modx->config.site_name}</title>
        <meta name="keywords" content="{$_modx->resource.tv_kws}" itemprop="keywords" />
        <meta name="description" content="{$_modx->resource.description}" itemprop="description" />
        {/block}
        
        <link href="{'default_tpl_assets' | config}icons/favicon.ico" rel="shortcut icon" type="image/x-icon" />
        {$static.css}
    </head>
    <body>
        {$static.js}
    </body>
</html>