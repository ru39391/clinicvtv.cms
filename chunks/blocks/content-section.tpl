{*
    ////////////////////////////////////
    ///  Блок текста с изображением  ///
    ////////////////////////////////////
*}

{set $content_rows = json_decode($_modx->resource.tv_content_row, true)}
{set $content_section}
    {set $content_counter = 0}
    {foreach $content_rows as $data}
        {set $content_counter+=1}
        {$_modx->getChunk('@FILE chunks/content/content-row.tpl', [
            'title' => $data.content_row_caption,
            'content' => $data.content_row_text,
            'img' => $data.content_row_img,
            'isRowReversed' => $data.content_row_reverse,
            'isBtnVisible' => $data.content_row_btn,
        ])}
    {/foreach}
{/set}
{if $content_counter > 0}{$content_section}{/if}