{set $currIcon = 'file:chunks/icons/' ~ $icon ~ '-icon.tpl'}
{set $classValue = $hasClassMod ? 'contacts__item_color_secondary' : $classMod}
{set $row}
    {include $currIcon}
    {$hasClassMod ? '<span class="contacts__item-caption contacts__item-caption_hidden">' ~ $value ~ '</span>' : $value}
{/set}

{if $isRow}
<div class="contacts__item {$classValue}">{$row}</div>
{else}
<a class="contacts__item {$classValue}" href="tel:{$value | formatPhoneValue}">{$row}</a>
{/if}