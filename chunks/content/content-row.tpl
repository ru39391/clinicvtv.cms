{set $pic = 'pthumb' | snippet: ['input' => $img, 'options' => 'q=100&h=440']}

<div class="section section_type_row {if $isRowReversed}section_dir_reverse{/if}">
  <div class="section__wrapper">
    {if $title}<div class="section-title">{$title}</div>{/if}
    {if $content}<div class="content">{$content}</div>{/if}
    {if $isBtnVisible}<button class="btn btn-primary btn-md" type="button">Записаться на сайте</button>{/if}
  </div>
  <div class="section__aside">
    <picture>
      <source type="image/webp" srcset="{'pthumb' | snippet: ['input' => $img, 'options' => 'q=100&h=440&f=webp']}" />
      <source type="image/jpeg" srcset="{$pic}" />
      <img class="section__img" src="{$pic}" alt="{$title}" />
    </picture>
  </div>
</div>