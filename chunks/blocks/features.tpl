{*
    //////////////////////////////////////
    ///  Почему пациенты выбирают нас  ///
    //////////////////////////////////////
*}

{set $features = json_decode(1 | resource : 'tv_features', true)}
{set $features_section}
    {set $features_counter = 0}
    {foreach $features as $data}
        {set $features_counter+=1}
        {$_modx->getChunk('@FILE chunks/features/item.tpl', [
            'title' => $data.features_title,
            'img' => $data.features_img,
        ])}
    {/foreach}
{/set}
{if $features_counter > 0}
<div class="section">
    <div class="section-title">Почему пациенты выбирают нас</div>
    <div class="features-wrapper">{$features_section}</div>
</div>
{/if}