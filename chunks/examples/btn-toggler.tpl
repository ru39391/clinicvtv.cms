{set $props = $properties[1].tvs}
{set $name = $props.tv_example_category | handleCategoryData}

<button
    class="btn-toggler js-tabs-link {if $idx == 1}is-active{/if}"
    data-action="examples{$query}"
    data-id="{$id}"
    data-pane="examples-tab-{$id}"
    type="button"
>
    {$name ?: $pagetitle}
</button>