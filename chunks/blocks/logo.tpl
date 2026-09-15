{set $name}
    <meta itemprop="name" content="{$_modx->config.site_name}" />
    <meta itemprop="url" content="{'site_url' | config}" />
{/set}

{set $logo}
    {include 'file:chunks/icons/logo-icon.tpl'}
    {$name}

    {if $wrapperClass == 'header__logo'}
    <meta itemprop="logo" content="{'default_contacts_logo' | config}" />
    {/if}
{/set}

{set $meta}
 itemscope{if $wrapperClass == 'header__logo'} itemtype="https://schema.org/Brand"{else} itemprop="copyrightHolder" itemtype="http://schema.org/Dentist"{/if}     
{/set}

<div class="{$wrapperClass}">
    {if $isMainPage}
    <div class="logo {$classMod}"{$meta}>{$logo}</div>
    {else}
    <a class="logo {$classMod}" href="/"{$meta}>{$logo}</a>
    {/if}

    {if $wrapperClass != 'header__logo'}
    <span itemprop="publisher" itemscope itemtype="http://schema.org/Dentist">
        {$name}
        <meta itemprop="medicalSpecialty" content="Dentistry">
    </span>
    {/if}
</div>