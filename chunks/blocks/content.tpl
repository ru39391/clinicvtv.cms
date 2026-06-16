{set $content}
    <h1>{$_modx->resource.longtitle ?: $_modx->resource.pagetitle}</h1>
    {$_modx->resource.content}
{/set}

{if $isUnwrapped}
    {$content}
{else}
    <section class="section content content_offset_px {$classMod ?: 'content_type_col'}">{$content}</section>
{/if}