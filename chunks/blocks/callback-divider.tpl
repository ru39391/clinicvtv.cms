{*
    /////////////////////////////
    ///  Записаться на приём  ///
    /////////////////////////////
*}

<div class="section{$classMod}">
    <div class="section-card">
        <div class="section-intro">
            <div class="section-title">Записаться на приём</div>
            <div class="section-desc">Если вы хотите записаться на прием или у Вас остались вопросы</div>
        </div>
        <div class="section-card__wrapper">
            <a class="readmore-link readmore-link_fs_lg" href="tel:{$_modx->config.default_contacts_phone | formatPhoneValue}">{$_modx->config.default_contacts_phone}</a>
            <button class="btn btn-primary btn-md" type="button">Записаться на сайте</button>
        </div>
      </div>
</div>