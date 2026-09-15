{*
    //////////////////////////
    ///  Блок с карточками  ///
    //////////////////////////
*}

{set $cards = json_decode($_modx->resource.tv_cards, true)}
{set $cards_section}
    {set $cards_counter = 0}
    {set $cards_section_title = ''}
    {set $cards_section_intro = ''}
    {foreach $cards as $data}
        {if $data.MIGX_id == 1}
            {set $cards_section_title = $data.card_title}
            {set $cards_section_intro = $data.card_intro}
        {/if}

        {set $cards_counter+=1}
        {$_modx->getChunk('@FILE chunks/content/cards-row.tpl', [
            'img' => $data.card_img,
            'title' => $data.card_caption,
            'content' => $data.card_text,
        ])}
    {/foreach}
{/set}
{if $cards_counter > 0}
<div class="section">
    <div class="section-intro">
        <div class="section-title">{$cards_section_title}</div>
        {if $cards_section_intro}<div class="section-desc">{$cards_section_intro}</div>{/if}
    </div>
    <div class="features-wrapper features-wrapper_type_grid">{$cards_section}</div>
</div>
{/if}