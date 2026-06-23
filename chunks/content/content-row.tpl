{set $pic = 'pthumb' | snippet: ['input' => $img, 'options' => 'q=100&h=440']}

{set $sectionClassMod = 'section section_type_row'}
{set $sectionClass = $isRowReversed ? $sectionClassMod ~ ' section_dir_reverse' : $sectionClassMod}

{set $sectionTitleClassMod = 'section-title'}
{set $sectionTitleClass = $isTitleCentered ? $sectionTitleClassMod ~ ' ta-center' : $sectionTitleClassMod}

{set $contentRow}
  {if $title}<div class="{$sectionTitleClass}">{$title}</div>{/if}
  {if $content}
    <div class="content">
      {if $isContentColumned}<div class="content__cols">{$content}</div>{else}{$content}{/if}
    </div>
  {/if}
  {if $isBtnVisible}<button class="btn btn-primary btn-md" type="button">Записаться на сайте</button>{/if}
{/set}

{set $sectionRow}
  {if $img}
  <div class="{$sectionClass}">
    <div class="section__wrapper">{$contentRow}</div>
    <div class="section__aside">
      <picture>
        <source type="image/webp" srcset="{'pthumb' | snippet: ['input' => $img, 'options' => 'q=100&h=440&f=webp']}" />
        <source type="image/jpeg" srcset="{$pic}" />
        <img class="section__img" src="{$pic}" alt="{$title}" />
      </picture>
    </div>
  </div>
  {else}
  <div class="section">{$contentRow}</div>
  {/if}
{/set}

{if $isFormVisible}
  {include 'file:chunks/blocks/callback-divider.tpl'}
{else}
  {$isBlockquoteVisible ? $_modx->getChunk('@FILE chunks/content/blockquote-row.tpl', ['content' => $content]) : $sectionRow}
{/if}