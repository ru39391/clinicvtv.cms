{set $props = $properties[1].tvs}
{set $name = $props.tv_price_category | handleCategoryData}

<button
    class="btn-toggler js-tabs-link {if $idx == 1}is-active{/if}"
    data-action="pricelist"
    data-id="{$id}"
    data-pane="price-tab-{$id}"
    type="button"
>
    {$name ?: $pagetitle}
</button>