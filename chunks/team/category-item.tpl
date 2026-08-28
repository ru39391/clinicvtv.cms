{set $props = $properties[1].tvs}
{set $name = $props.tv_team_category | handleCategoryData}

<button
    class="btn-toggler js-tabs-link {$classMod}"
    type="button"
    data-action="team"
    data-id="{$id}"
    data-pane="team-tab-{$id}"
>
    {$caption ?: $name}
</button>