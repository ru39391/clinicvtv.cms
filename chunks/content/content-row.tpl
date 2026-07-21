{set $pic = 'pthumb' | snippet: ['input' => $img, 'options' => 'q=100&h=440']}

{set $startClassMod = $first ? ' section_type_start' : ''}
{set $endClassMod = $last ? ' section_type_end' : ''}
{set $innerClassMod = $inner ? ' section_type_inner' : ''}
{set $bgClassMod = $startClassMod ~ $endClassMod ~ $innerClassMod ~ ($isBgWhite ? ' section_bg_white' : '')}

{set $rowClassMod = 'section section_type_row' ~ $bgClassMod}
{set $sectionClass = $isRowReversed ? $rowClassMod ~ ' section_dir_reverse' : $rowClassMod}

{set $sectionTitleCenteredMod = $isTitleCentered ? ' section_title_centered' : ''}

{set $contentRow}
  {if $title}<div class="section-title">{$title}</div>{/if}
  {if $content}
  <div class="{if $img}content{else}content{$isContentColumned ? ' content_type_columned' : ''}{/if}">{$content}</div>
  {/if}
  {if $isBtnVisible}
  <button
    class="btn btn-primary btn-md js-modal-btn"
    type="button"
    data-target="form"
    data-title="Записаться на сайте, кнопка в блоке формируемого контента"
  >
    Записаться на сайте
  </button>
  {/if}
{/set}

{set $sectionRow}
  {if $img}
  <div class="{$sectionClass}{$sectionTitleCenteredMod}">
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
  <div class="section{$bgClassMod}">{$contentRow}</div>
  {/if}
{/set}

{set $blockquoteRow}
  <div class="section section_type_blockquote{$bgClassMod}">
    {$_modx->getChunk('@FILE chunks/content/blockquote-row.tpl', ['content' => $content])}
  </div>
{/set}

{if $isFormVisible}
  {$_modx->getChunk('@FILE chunks/blocks/callback-divider.tpl', ['classMod' => $bgClassMod])}
{else}
  {$isBlockquoteVisible ? $blockquoteRow : $sectionRow}
{/if}