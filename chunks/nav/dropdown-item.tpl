{if $isfolder == 1}
    <li class="nav__row js-accordion">
        <a {$classes} href="{$link}" content="{$id | url : ['scheme' => 'full']}" itemprop="url">
            <span itemprop="name">{$pagetitle}</span>
        </a>
        {$wrapper}
        <button class="nav__toggler js-accordion-btn" type="button"></button>
    </li>
{else}
    <a {$classes} href="{$link}" content="{$id | url : ['scheme' => 'full']}" itemprop="url">
        <span itemprop="name">{$menutitle}</span>
    </a>
{/if}