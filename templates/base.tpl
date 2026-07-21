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
    <meta name="description" content="{$_modx->resource.tv_desc}" itemprop="description" />
    {/block}

    <link href="{'default_tpl_assets' | config}icons/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    {$static.css}
</head>
<body>
    <div class="wrapper">
        <div class="container">
            <header class="header">
                {$_modx->getChunk('@FILE chunks/blocks/logo.tpl', [
                    'wrapperClass' => 'header__logo',
                    'isMainPage' => $is_main_page,
                    'classMod' => ''
                ])}
                <div class="header__social">
                    <div class="social social_jc_end social_hidden">
                        {set $social}
                        <button
                            class="btn btn-primary js-modal-btn"
                            type="button"
                            data-target="form"
                            data-title="Записаться, блок соц. сетей"
                        >
                            Записаться
                        </button>
                        <a class="social__item" href="{'default_social_max' | config}" target="_blank" rel="nofollow">{include 'file:chunks/icons/max-icon.tpl'}</a>
                        {/set}
                        {$social}
                    </div>
                </div>
                <div class="header__contacts">
                    <button class="nav-toggler js-nav-toggler" data-target="js-nav" type="button">
                        <span class="nav-toggler__show-icon">{include 'file:chunks/icons/nav-icon.tpl'}</span>
                        <span class="nav-toggler__close-icon">{include 'file:chunks/icons/close-icon.tpl'}</span>
                    </button>
                    <div class="contacts contacts_type_list contacts_border_right">
                        {set $phones = [$_modx->config.default_contacts_phone, $_modx->config.default_contacts_mobile]}
                        {foreach $phones as $phones__item}
                            {$_modx->getChunk('@FILE chunks/content/contacts-row.tpl', [
                                'value' => $phones__item,
                                'hasClassMod' => true,
                                'icon' => 'phone'
                            ])}
                        {/foreach}
                    </div>
                    <div class="contacts contacts_type_list">
                        {set $address}
                        <span class="contacts__item-caption">
                            {'default_contacts_subway' | config}<span class="contacts__item-address">{'default_contacts_address' | config}</span>
                        </span>
                        {/set}
                        {foreach [
                            0 => ['value' => $address, 'classMod' => 'contacts__item_color_secondary contacts__item_fs_sm', 'icon' => 'placemark'],
                            1 => ['value' => $_modx->config.default_contacts_hours, 'classMod' => 'contacts__item_color_secondary', 'icon' => 'hours']
                        ] as $address__item}
                            {$_modx->getChunk('@FILE chunks/content/contacts-row.tpl', [
                                'value' => $address__item.value,
                                'hasClassMod' => false,
                                'classMod' => $address__item.classMod,
                                'icon' => $address__item.icon,
                                'isRow' => true
                            ])}
                        {/foreach}
                    </div>
                </div>
            </header>

            <div class="nav-wrapper js-nav">
                {'pdoMenu' | snippet: [
                    'parents' => 0,
                    'level' => 1,
                    'limit' => 5,
                    'outerClass' => 'nav',
                    'rowClass' => 'nav__item',
                    'hereClass' => 'is-active',
                    'tplOuter' => '@FILE chunks/nav/wrapper.tpl',
                    'tpl' => '@FILE chunks/nav/nav-item.tpl'
                ]}
                <form class="search-form search-form_hidden">
                    {set $search}
                    <button class="search-form__btn" type="button">{include 'file:chunks/icons/search-icon.tpl'}</button>
                    <input class="search-form__field" type="text">
                    {/set}
                    {$search}
                </form>
            </div>

            {'pdoCrumbs' | snippet: [
                'showHome' => 1,
                'showAtHome' => 0,
                'tplWrapper' => '@FILE chunks/bc/wrapper.tpl'
                'tplCurrent' => '@FILE chunks/bc/current.tpl'
                'tplHome' => '@FILE chunks/bc/home.tpl'
                'tpl' => '@FILE chunks/bc/item.tpl'
            ]}

            {block 'main'}
                {$_modx->getChunk('@FILE chunks/blocks/content.tpl', [
                    'classMod' => 'section_offset_md',
                ])}
            {/block}
        </div>
    </div>
    <div class="footer-holder">
        <footer class="footer container">
            {$_modx->getChunk('@FILE chunks/blocks/logo.tpl', [
                'wrapperClass' => 'footer__logo',
                'isMainPage' => $is_main_page,
                'classMod' => 'logo_bg_white'
            ])}

            {'pdoMenu' | snippet: [
                'parents' => 0,
                'level' => 1,
                'limit' => 0,
                'outerClass' => 'footer__nav',
                'rowClass' => 'footer__nav-item',
                'tplOuter' => '@FILE chunks/nav/wrapper.tpl',
                'tpl' => '@FILE chunks/nav/item.tpl'
            ]}

            <div class="footer__nav footer__nav_type_search">
                <form class="search-form">{$search}</form>                
                {'pdoMenu' | snippet: [
                    'parents' => 0,
                    'resources' => '55,56,54,57',
                    'level' => 1,
                    'showHidden' => 1,
                    'rowClass' => 'footer__nav-item',
                    'tplOuter' => '@INLINE {$wrapper}',
                    'tpl' => '@FILE chunks/nav/item.tpl'
                ]}
            </div>

            <div class="footer__contacts">
                <div class="contacts contacts_offset_none">
                    {$_modx->getChunk('@FILE chunks/content/contacts-row.tpl', [
                        'value' => $_modx->config.default_contacts_phone,
                        'hasClassMod' => false,
                        'icon' => 'phone'
                    ])}
                    {$_modx->getChunk('@FILE chunks/content/contacts-row.tpl', [
                        'value' => $_modx->config.default_contacts_subway ~ ', ' ~ $_modx->config.default_contacts_address,
                        'hasClassMod' => false,
                        'classMod' => 'contacts__item_fs_sm'
                        'icon' => 'placemark',
                        'isRow' => true
                    ])}
                    {$_modx->getChunk('@FILE chunks/content/contacts-row.tpl', [
                        'value' => $_modx->config.default_contacts_mobile,
                        'hasClassMod' => false,
                        'icon' => 'phone'
                    ])}
                </div>
                <div class="social social_hidden">{$social}</div>
                <nav class="footer__nav footer__nav_type_copyright">
                    <a class="footer__nav-item" href="{57 | url}">{57 | resource: 'pagetitle'}</a>
                    <p class="footer__text">© {'' | date : 'Y'} Все права защищены</p>
                </nav>
            </div>
        </footer>
    </div>

    {include 'file:chunks/blocks/form.tpl'}

    {block 'forms'}{/block}
    {$static.js}
</body>
</html>