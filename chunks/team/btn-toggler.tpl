{set $props = $properties[1].tvs}

<button
    class="btn-toggler js-tabs-link {if $idx == 1}is-active{/if}"
    data-pane="team-tab-{$id}"
    data-action="team"
    data-id="{$id}"
    type="button"
>
    {$props.tv_team_category | handleCategoryData}
</button>