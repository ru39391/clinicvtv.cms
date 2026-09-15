{set $isSlide = $isPlainRow != 1}

{if $isSlide}
<div class="section section_type_row section_type_cols">
    <div class="section__aside">
        <div class="section-title section-title_mb_md">{55 | resource: 'introtext'}</div>
        <div class="section-desc section-desc_type_plain">{55 | resource: 'description'}</div>
    </div>
    <div class="section__wrapper">
        <div class="swiper js-carousel">
            <div class="articles-wrapper swiper-wrapper">{$output}</div>
            <div class="swiper-footer">
                <div class="swiper-pagination"></div>
                <a class="readmore-link" href="{55 | url}">читать все статьи</a>
            </div>
        </div>
    </div>
</div>
{else}
<div class="articles-wrapper articles-wrapper_type_grid">{$output}</div>
{/if}

