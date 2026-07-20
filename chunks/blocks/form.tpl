<div id="form" class="modal-overlay">
    <div class="modal modal_type_plain">
        <div class="modal-wrapper">
            <button class="modal-close js-modal-close" type="button">×</button>
            <div class="modal-content">
                <div class="modal-container form-container js-form">
                    <div class="form-header js-form-header">
                        <div class="form-title js-form-title">Заказать звонок</div>
                        <div class="form-desc">Оставьте свой номер, и мы свяжемся с вами в ближайшее время</div>
                    </div>

                    <div class="form-title js-form-content-success is-hidden">
                        Спасибо! Мы свяжемся с Вами в ближайшее время.
                    </div>

                    <form class="form form_width_max" data-ym="">
                        <div class="form-desc form-desc_type_error js-form-content-failure is-hidden">Не удалось отправить сообщение, повторите попытку позже.</div>

                        <div class="form__item is-hidden js-input-holder">
                            <input
                                class="js-input-title js-input-field js-input-type-default"
                                name="modal_form"
                                value="Заказать звонок"
                                type="hidden"
                                data-name="form"
                            />
                        </div>
                        <fieldset class="form__fieldset">
                            <div class="form__item form__item_size_xl js-input-holder">
                                <input
                                    class="form__field js-input-field js-input-type-default"
                                    data-name="name"
                                    name="modal_name"
                                    value=""
                                    type="text"
                                    placeholder="Ваше имя"
                                />
                                <span class="form-error js-error-message"></span>
                            </div>
                            <div class="form__item form__item_size_xl js-input-holder">
                                <input
                                    class="form__field js-input-field js-input-type-phone"
                                    data-name="phone"
                                    name="modal_phone"
                                    value=""
                                    type="tel"
                                    placeholder="+7 (999) 999-99-99"
                                />
                                <span class="form-error js-error-message"></span>
                            </div>
                        </fieldset>
                        <div class="form-toggler-row js-input-holder">
                            <input
                                id="modal_confirm"
                                class="form-toggler form-toggler_type_checkbox js-input-checkbox"
                                type="checkbox"
                                checked
                            />
                            <label class="form__label form__label_fs_md" for="modal_confirm">
                                <span class="form-toggler-icon"></span>
                                <span>Даю согласие на <a class="td-underline" href="{57 | url}" target="_blank">обработку персональных данных</a></span>
                            </label>
                        </div>
                        <button class="btn btn-plain btn-inverted btn-xl js-form-submit" type="submit">Заказать программу обучения</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
