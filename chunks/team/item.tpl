{set $props = $properties[1].tvs}
{set $depts = 'handleCategoryData' | snippet: ['input' => $props.tv_dept, 'arr' => 1, 'delimiter' => ',']}
{set $features}
    {foreach $depts as $depts_id}
        {set $data = $depts_id | resource : 'properties'}
        {set $dept = $data[1].tvs}
        {set $value = 'handleCategoryData' | snippet: ['input' => $dept.tv_team_category, 'index' => 1] | lower}

        {if $value@last}{$value}{else}{$value}, {/if}
    {/foreach}
{/set}

<div class="team-item">
    <img class="team-item__img img-fluid" src="{$props.tv_img}" alt="{$pagetitle}" />
    <div class="team-item__wrapper">
        <div class="team-item__title">{$pagetitle}</div>
        <ul class="team-item__list">
            <li class="team-item__feature">
                {include 'file:chunks/icons/checked-icon.tpl'}
                {$features}
            </li>
            <li class="team-item__feature">
                {include 'file:chunks/icons/checked-icon.tpl'}
                опыт работы с 2022 года
            </li>
        </ul>
    </div>
    <div class="team-item__footer">
        <a class="team-item__link" href="{$id | url}">Отзывы о докторе</a>
        <button class="btn btn-primary btn-sm" type="button">Записаться</button>
    </div>
</div>