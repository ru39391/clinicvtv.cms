{set $props = $properties[1].tvs}
{set $name = $props.tv_price_category | handleCategoryData}

<button
    class="btn-toggler js-tabs-link {if $idx == 1}is-active{/if}"
    data-pane="price-tab-{$id}"
    data-action="pricelist"
    data-id="{$id}"
    type="button"
>
    {$name ?: $pagetitle}
</button>