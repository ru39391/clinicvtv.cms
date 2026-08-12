{if $isfolder == 1}
    <li class="nav__row js-accordion">
        <a {$classes} href="{$link}">{$pagetitle}</a>
        {$wrapper}
        <button class="nav__toggler js-accordion-btn" type="button"></button>
    </li>
{else}
    <a {$classes} href="{$link}">{$menutitle}</a>
{/if}