{set $content}
    <h1 itemprop="name">{$_modx->resource.longtitle ?: $_modx->resource.pagetitle}</h1>
    {$pls ?: $_modx->resource.content}
{/set}

{if $isUnwrapped}
    {$content}
{else}
    <section class="section content {$classMod ?: 'content_offset_px content_type_col'}" itemprop="mainContentOfPage">{$content}</section>
{/if}