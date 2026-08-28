{set $static = 'setAssets' | snippet}
{set $is_main_page = $_modx->resource.id === 1}

<!DOCTYPE html>
<html lang="ru" itemscope itemtype="http://schema.org/WebPage">
<head>
    <meta charset="utf-8" />
    <meta itemprop="inLanguage" content="ru" />
    <meta itemprop="url" content="{$_modx->resource.id | url : ['scheme' => 'full']}" />
    <meta itemprop="datePublished" content="{$_modx->resource.createdon | date : 'Y-m-d\TH:i:sP'}" />
    <meta itemprop="dateModified" content="{$_modx->resource.updatedon | date : 'Y-m-d\TH:i:sP'}" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <base href="{'site_url' | option}" />

    {block 'meta'}
    <title>{$_modx->resource.tv_seotitle ?: $_modx->resource.pagetitle ~' - '~ $_modx->config.site_name}</title>
    <meta name="keywords" content="{$_modx->resource.tv_kws}" itemprop="keywords" />
    <meta name="description" content="{$_modx->resource.tv_desc}" itemprop="description" />
    {/block}

    {if $_modx->resource.id != 1}<link itemprop="isPartOf" href="{'site_url' | option}#website">{/if}
    <link href="{'default_tpl_assets' | config}icons/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    {$static.css}
</head>
<body{if $_modx->resource.id == 1} id="website"{/if}>
    <div class="wrapper{if $_modx->resource.template | in : [6,3]} wrapper_type_bg{/if}">
        <div class="wrapper__inner container">
            <header class="header" itemprop="hasPart" itemscope itemtype="https://schema.org/WPHeader">
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

            <nav class="nav-wrapper js-nav">
                {'pdoMenu' | snippet: [
                    'parents' => 0,
                    'resources' => '-54',
                    'level' => 3,
                    'limit' => 0,
                    'outerClass' => 'nav',
                    'rowClass' => 'nav__item',
                    'hereClass' => 'is-active',
                    'tplOuter' => '@FILE chunks/nav/wrapper.tpl',
                    'tpl' => '@FILE chunks/nav/nav-item.tpl',
                    'tplInner' => '@FILE chunks/nav/dropdown-wrapper.tpl',
                    'tplInnerRow' => '@FILE chunks/nav/dropdown-item.tpl',
                    'isMainNav' => 1
                ]}
                <form class="search-form search-form_hidden">
                    {set $search}
                    <button class="search-form__btn" type="button">{include 'file:chunks/icons/search-icon.tpl'}</button>
                    <input class="search-form__field" type="text" placeholder="Поиск" />
                    {/set}
                    {$search}
                </form>
            </nav>

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
        <footer class="footer container" itemprop="hasPart" itemscope itemtype="http://schema.org/WPFooter">
            <meta itemprop="isFamilyFriendly" content="true">
            <meta itemprop="inLanguage" content="ru">

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
                <div id="clinic" class="contacts contacts_offset_none" itemscope itemtype="http://schema.org/Dentist">
                    <meta itemprop="medicalSpecialty" content="Dentistry" />
                    <meta itemprop="name" content="{'site_name' | config}" />
                    <meta itemprop="image" content="{'default_contacts_logo' | config}" />
	                <meta itemprop="priceRange" content="Информация о ценах по телефону {'default_contacts_phone' | config}" />
                    <meta itemprop="paymentAccepted" content="Наличные, Банковские карты" />
                    <meta itemprop="openingHours" content="{$_modx->config.default_contacts_hours | replace : ' |' : ', '}" />

                    {set $phoneRow = '<span itemprop="telephone">' ~ $_modx->config.default_contacts_phone ~ '</span>'}
                    {set $addressRow}
                    <span itemprop="address" itemscope itemtype="http://schema.org/PostalAddress">
                        <meta itemprop="postalCode" content="{'default_contacts_zip' | config}" />
                        <meta itemprop="addressCountry" content="RU" />
                        <meta itemprop="addressRegion" content="{'default_contacts_loc' | config}" />
                        <meta itemprop="addressLocality" content="{'default_contacts_loc' | config}" />
                        <span itemprop="streetAddress">{'default_contacts_address' | config}</span>
                    </span>
                    {/set}
                    {set $mobilePhoneRow}
                    <span itemprop="contactPoint" itemscope itemtype="https://schema.org/ContactPoint">
                        <meta itemprop="contactType" content="Запись на приём" />
                        <meta itemprop="availableLanguage" content="Russian" />
                        <span itemprop="telephone">{'default_contacts_mobile' | config}</span>
                    </span>
                    {/set}

                    {$_modx->getChunk('@FILE chunks/content/contacts-row.tpl', [
                        'value' => $phoneRow,
                        'hasClassMod' => false,
                        'icon' => 'phone'
                    ])}
                    {$_modx->getChunk('@FILE chunks/content/contacts-row.tpl', [
                        'value' => $_modx->config.default_contacts_subway ~ ', ' ~ $addressRow,
                        'hasClassMod' => false,
                        'classMod' => 'contacts__item_fs_sm'
                        'icon' => 'placemark',
                        'isRow' => true
                    ])}
                    {$_modx->getChunk('@FILE chunks/content/contacts-row.tpl', [
                        'value' => $mobilePhoneRow,
                        'hasClassMod' => false,
                        'icon' => 'phone'
                    ])}

                    <span class="contacts__item is-hidden" itemprop="geo" itemscope itemtype="http://schema.org/GeoCoordinates">
                        <meta itemprop="latitude" content="{'default_coords_lat' | config}" />
                        <meta itemprop="longitude" content="{'default_coords_lon' | config}" />
                    </span>
                </div>
                <div class="social social_hidden">{$social}</div>
                <nav class="footer__nav footer__nav_type_copyright">
                    <a class="footer__nav-item" href="{57 | url}" content="{57 | url : ['scheme' => 'full']}" itemprop="license">{57 | resource: 'pagetitle'}</a>
                    <p class="footer__text">© <span itemprop="copyrightYear">{'' | date : 'Y'}</span> Все права защищены</p>
                </nav>
            </div>
        </footer>
    </div>

    {include 'file:chunks/blocks/form.tpl'}

    {block 'forms'}{/block}
    {$static.js}
</body>
</html>