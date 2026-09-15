{set $isSlide = $isPlainRow != 1}

{if $isSlide}
<div class="section">
    <div class="section-title">Отзывы наших пацентов</div>
    <div class="swiper js-carousel" data-loop="0">
        <div class="testimonials-wrapper swiper-wrapper">{$output}</div>
        <div class="swiper-footer">
          <div class="swiper-pagination"></div>
          <a class="readmore-link" href="{63 | url}">читать все отзывы</a>
        </div>
    </div>
</div>
{else}
<div class="testimonials-wrapper testimonials-wrapper_type_grid">{$output}</div>
{/if}