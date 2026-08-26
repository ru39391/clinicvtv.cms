{set $props = $properties[1].tvs}

<li class="nav__row{if $id == 7} js-accordion{/if}">
    <a {$classes} href="{$link}" content="{$id | url : ['scheme' => 'full']}" itemprop="url">
        <img class="nav__item-icon" src="{$props.tv_img}" alt="{$pagetitle}" title="{$pagetitle}" />
        <span itemprop="name">{$pagetitle}</span>
    </a>
    {if $id == 7}
    <button class="nav__toggler js-accordion-btn" type="button"></button>
    {$wrapper}
    {/if}
</li>