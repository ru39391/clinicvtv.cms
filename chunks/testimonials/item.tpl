{set $intro = $desc | truncate : 130}
{set $isIntroVisible = $desc | length > $intro | length}
{set $isSlide = $isPlainRow != 1}

{set $row}
  <div class="{if $isIntroVisible && $isSlide}testimonials-item js-accordion{else}testimonials-item{/if}" itemscope itemtype="https://schema.org/Review">
    <span class="testimonials-item__meta" itemprop="reviewRating" itemscope itemtype="https://schema.org/Rating">
      <meta itemprop="ratingValue" content="{$rating}" />
      <meta itemprop="bestRating" content="5" />
    </span>
    <span class="testimonials-item__meta" itemprop="itemReviewed" itemscope itemtype="https://schema.org/Dentist">
      <meta itemprop="name" content="{'site_name' | config}" />
    </span>

    <div class="testimonials-item__header" itemprop="author" itemscope itemtype="https://schema.org/Person">
      <span class="color-grey">{include 'file:chunks/icons/blockquote-icon.tpl'}</span>
      <div class="testimonials-item__caption" itemprop="name">{$name}</div>
    </div>
    {if $isIntroVisible && $isSlide}
    <div class="testimonials-item__text testimonials-item__text_type_intro">{$intro}</div>
    <div class="testimonials-item__text accordion-content" itemprop="reviewBody">{$desc}</div>
    <button class="readmore-link js-accordion-btn">
      <span class="readmore-link__show">Читать далее</span>
      <span class="readmore-link__hide">Скрыть</span>
    </button>
    {else}
    <div class="testimonials-item__text" itemprop="reviewBody">{$desc}</div>
    {/if}
  </div>
{/set}

{if $isSlide}<div class="testimonials-slide swiper-slide w-auto h-auto">{$row}</div>{else}{$row}{/if}
