{*
    //////////////////////////
    ///  Вопросы и ответы  ///
    //////////////////////////
*}

{set $faq_rows = json_decode($_modx->resource.tv_faq, true)}
{set $faq_section}
    {set $faq_counter = 0}
    {set $faq_section_title = ''}
    {set $faq_section_intro = ''}
    {foreach $faq_rows as $data}
        {if $data.MIGX_id == 1}
            {set $faq_section_title = $data.faq_title}
            {set $faq_section_intro = $data.faq_intro}
        {/if}

        {set $faq_counter+=1}
        {$_modx->getChunk('@FILE chunks/content/faq-row.tpl', [
            'title' => $data.faq_caption,
            'content' => $data.faq_text,
        ])}
    {/foreach}
{/set}
{if $faq_counter > 0}
<div class="section section_bg_white section_type_rounded section_type_row section_type_cols">
    <div class="section__aside">
        <div class="section-title section-title_mb_md">{$faq_section_title}</div>
        <div class="section-desc section-desc_type_plain">{$faq_section_intro}</div>
    </div>
    <div class="section__wrapper">
        <div class="faq-wrapper" itemscope itemtype="https://schema.org/FAQPage">{$faq_section}</div>
    </div>
</div>
{/if}