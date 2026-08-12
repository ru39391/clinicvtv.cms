{set $intro = $desc | truncate : 130}
{set $isIntroVisible = $desc | length > $intro | length}
{set $isSlide = $isPlainRow != 1}

{set $row}
  <div class="{if $isIntroVisible && $isSlide}testimonials-item js-accordion{else}testimonials-item{/if}">
    <div class="testimonials-item__header">
      <span class="color-grey">{include 'file:chunks/icons/blockquote-icon.tpl'}</span>
      <div class="testimonials-item__caption">{$name}</div>
    </div>
    {if $isIntroVisible && $isSlide}
    <div class="testimonials-item__text testimonials-item__text_type_intro">{$intro}</div>
    <div class="testimonials-item__text accordion-content">{$desc}</div>
    <button class="readmore-link js-accordion-btn">
      <span class="readmore-link__show">Читать далее</span>
      <span class="readmore-link__hide">Скрыть</span>
    </button>
    {else}
    <div class="testimonials-item__text">{$desc}</div>
    {/if}
  </div>
{/set}

{if $isSlide}<div class="testimonials-slide swiper-slide w-auto h-auto">{$row}</div>{else}{$row}{/if}
