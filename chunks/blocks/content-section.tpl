{*
    ////////////////////////////////////
    ///  Блок текста с изображением  ///
    ////////////////////////////////////
*}

{set $arr = []}
{set $content_rows = json_decode($_modx->resource.tv_content_row, true)}
{set $rows = 'handleCategoryData' | snippet: ['input' => '[[+rows]]', 'arr' => 1, 'delimiter' => ',']}

{if $rows | length == 0}
    {foreach $content_rows as $data}
        {set $rows[] = $data.MIGX_id}
    {/foreach}
{/if}

{$rows | length}<br />
{set $content_section}
    {set $content_bg = 0}
    {set $content_counter = 0}
    
    {foreach $content_rows as $data}
        {if $data.MIGX_id in $rows}
            {set $content_counter+=1}
            {set $content_bg+=($data.content_row_bg ?: 0)}

            {$_modx->getChunk('@FILE chunks/content/content-row.tpl', [
                'title' => $data.content_row_caption,
                'content' => $data.content_row_text,
                'img' => $data.content_row_img,
                'isRowReversed' => $data.content_row_reverse,
                'isBtnVisible' => $data.content_row_btn,
                'isTitleCentered' => $data.content_row_center,
                'isBlockquoteVisible' => $data.content_row_blockquote,
                'isContentColumned' => $data.content_row_columns,
                'isFormVisible' => $data.content_row_form
            ])}
        {/if}
    {/foreach}
{/set}

{if $content_counter > 0}
    {$content_bg > 0 ? '<div class="section-holder">'~ $content_section ~'</div>' : $content_section}
{/if}