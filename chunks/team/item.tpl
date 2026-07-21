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
{set $default_pic = $_modx->config.default_team_nophoto}
{set $pic = 'pthumb' | snippet: ['input' => $props.tv_img ?: $default_pic, 'options' => 'q=100&h=470']}

<div class="team-item">
    <picture>
        <source type="image/webp" srcset="{'pthumb' | snippet: ['input' => $props.tv_img ?: $default_pic, 'options' => 'q=100&h=470&f=webp']}" />
        <source type="image/jpeg" srcset="{$pic}" />
        <img class="team-item__img" src="{$pic}" alt="{$pagetitle}" />
    </picture>
    <div class="team-item__wrapper">
        <a class="team-item__title" href="{$id | url}">{$pagetitle}</a>
        <ul class="team-item__list">
            <li class="team-item__feature">
                <span class="color-grey">{include 'file:chunks/icons/checked-icon.tpl'}</span>
                {$features}
            </li>
            {if $introtext}
            <li class="team-item__feature">
                <span class="color-grey">{include 'file:chunks/icons/checked-icon.tpl'}</span>
                опыт работы с {$introtext} года
            </li>
            {/if}
        </ul>
    </div>
    <div class="team-item__footer">
        <a class="team-item__link" href="{$id | url}">Отзывы о докторе</a>
        <button
            class="btn btn-primary btn-sm js-modal-btn"
            type="button"
            data-target="form"
            data-title="{$pagetitle}, запись к специалисту - категория"
        >
            Записаться
        </button>
    </div>
</div>