{set $props = $properties[1].tvs}

<button class="btn-toggler js-tabs-link" type="button" data-pane="team-tab-{$id}" data-action="team" data-id="{$id}">
    {$props.tv_team_category | handleCategoryData}
</button>