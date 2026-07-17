{*
    ////////////////////////////////////
    ///  Блок текста с изображением  ///
    ////////////////////////////////////
*}

{set $arr = 'renderContentRows' | snippet: [
    'data' => $_modx->resource.tv_content_row,
    'input' => '[[+rows]]'
]}
{set $arrLenght = $arr | length}
{set $isBgWhite = '[[+bg]]'}

{set $content_section}
    {set $content_counter = 0}
    
    {foreach $arr as $key => $data}
        {set $content_counter+=1}

        {$_modx->getChunk('@FILE chunks/content/content-row.tpl', [
            'first' => $key == 0,
            'last' => $key == $arrLenght - 1,
            'inner' => $key != 0 && $key != $arrLenght - 1,
            'title' => $data.content_row_caption,
            'content' => $data.content_row_text,
            'img' => $data.content_row_img,
            'isBgWhite' => $isBgWhite == 1,
            'isBlockquoteVisible' => $data.content_row_blockquote,
            'isBtnVisible' => $data.content_row_btn,
            'isContentColumned' => $data.content_row_columns,
            'isFormVisible' => $data.content_row_form,
            'isRowReversed' => $data.content_row_reverse,
            'isTitleCentered' => $data.content_row_center
        ])}
    {/foreach}
{/set}

{if $content_counter > 0}{$content_section}{/if}