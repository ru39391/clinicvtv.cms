<div id="{$target ?: 'form'}" class="modal-overlay">
    <div class="modal modal_type_plain">
        <div class="modal-wrapper">
            <button class="modal-close js-modal-close" type="button">
                {include 'file:chunks/icons/close-icon.tpl'}
            </button>
            <div class="modal-content">
                <div class="modal-container form-container js-form">
                    <div class="form-header js-form-header">
                        <div class="form-title js-form-title">Оставьте свой номер</div>
                        <div class="form-desc">и мы свяжемся с вами в ближайшее время</div>
                    </div>

                    <div class="form-title js-form-content-success is-hidden">
                        Спасибо! Мы свяжемся с Вами в ближайшее время.
                    </div>

                    <form class="form js-form-content" data-ym="" data-action="{$action ?: '/feedback'}">
                        <div class="form-title form-title_type_error js-form-content-failure is-hidden">
                          Не удалось отправить сообщение, повторите попытку позже.
                        </div>

                        <fieldset class="form__fieldset">
                            <div class="form__item is-hidden js-input-holder">
                                <input
                                  class="js-input-title js-input-field js-input-type-default"
                                  name="src"
                                  value=""
                                  type="hidden"
                                  data-name="src"
                                />
                            </div>
                            <div class="form__item is-hidden js-input-holder">
                                <input
                                  class="js-input-field"
                                  name="pageId"
                                  value="{$_modx->resource.id}"
                                  type="hidden"
                                  data-name="pageId"
                                />
                            </div>
                            <div class="form__item is-hidden js-input-holder">
                                <input
                                  class="js-input-field"
                                  name="pagetitle"
                                  value="{$_modx->resource.pagetitle}"
                                  type="hidden"
                                  data-name="pagetitle"
                                />
                            </div>
                            <div class="form__item js-input-holder">
                                <input
                                  class="form__field js-input-field js-input-type-phone"
                                  data-name="phone"
                                  name="phone"
                                  value=""
                                  type="tel"
                                  placeholder="+7 (999) 999-99-99"
                                />
                                <label class="form__label">Телефон</label>
                                <span class="form-error js-error-message"></span>
                            </div>
                            <div class="form__item js-input-holder">
                                <input
                                  class="form__field js-input-field js-input-type-default"
                                  data-name="name"
                                  name="name"
                                  value=""
                                  type="text"
                                  placeholder="Ваше имя"
                                />
                                <label class="form__label">Ваше имя</label>
                                <span class="form-error js-error-message"></span>
                            </div>
                        </fieldset>
                        <div class="form-toggler-row js-input-holder">
                            <input
                              id="feedback_confirm"
                              class="form-toggler js-input-checkbox js-checkbox-required"
                              type="checkbox"
                              checked
                            />
                            <label class="form-toggler-label form__label" for="feedback_confirm">
                                <span class="form-toggler-icon">{include 'file:chunks/icons/checked-icon.tpl'}</span>
                                <span>Даю согласие на <a class="td-underline" href="{57 | url}" target="_blank">обработку персональных данных</a></span>
                            </label>
                            <span class="form-error js-error-message">Примите соглашение на обработку персональных данных</span>
                        </div>
                        <button class="btn btn-md btn-primary js-form-submit" type="submit">Отправить</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
