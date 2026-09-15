# Сайт стоматологической клиники — интеграция с CMS MODX Revolution

Шаблоны реализованы на Fenom, логика вывода и обработки данных — через пакеты CMS MODX (pdoTools, pThumb, FormIt и другие). Статика и клиентская логика подключаются из отдельного репозитория статической сборки.

## Содержание

- [Требования](#требования)
- [Установка](#установка)
- [Структура проекта](#структура-проекта)
- [Стек технологий](#стек-технологий)
- [Шаблоны](#шаблоны)
- [Чанки](#чанки)
- [Модели](#модели)
- [API](#api)
- [Взаимодействие со статикой](#взаимодействие-со-статикой)
- [Особенности реализации](#особенности-реализации)
- [Сборка и деплой](#сборка-и-деплой)
- [Changelog](#changelog)
- [Лицензия](#лицензия)

## Требования

- PHP 7.4+
- MODX Revolution 2.8+
- ZoomX 3.3.0-pl
- Компоненты:
  - pdoTools 3.0.3-pl
  - pThumb 2.3.3-pl
  - phpThumbOn 1.3.1-pl
  - FormIt 5.2.4-pl
  - MIGX 3.0.2-beta1
  - Ace 1.9.8-pl
  - CKEditor 1.4.7-ce
  - translit 1.0.0-beta
- Node.js и npm для сборки статики.

## Установка

1. Развернуть CMS MODX Revolution 2.8+.
2. Установить необходимые компоненты.
3. Скопировать шаблоны в `core/elements/templates/`, чанки — в `core/elements/chunks/`.
4. Скопировать директорию `Controllers` API в `core/components/ZoomX/src/`.
5. Настроить маршруты ZoomX в `core/config/routes.php`.
6. Заполнить системные настройки CMS MODX.
7. Собрать и разместить статику по пути из `default_tpl_assets`.

## Структура проекта

```
core/
├── components/
│   └── ZoomX/
│       └── src/
│           └── Controllers/     # API-контроллеры (CRUD, публичные GET/POST)
├── elements/
│   ├── chunks/                  # Чанки (см. раздел «Чанки»)
│   └── templates/               # Fenom-шаблоны страниц
└── config/                      # Конфигурация CMS
```

## Стек технологий

- PHP 7.4+
- MODX Revolution 2.8+
- Fenom — шаблонизатор
- ZoomX — фреймворк для API-контроллеров
- pdoTools — вывод ресурсов и меню
- pThumb — миниатюры
- FormIt — формы обратной связи
- MIGX — пользовательский контент информационных страниц

## Шаблоны

- `templates/base.tpl` — шаблон по умолчанию;
- `templates/main.tpl` — главная;
- `templates/team.tpl` — стр. специалиста;
- `templates/promo.tpl` — стр. акций;
- `templates/depts.tpl` — услуги и специализации;
- `templates/info.tpl` — информационная стр.;
- `templates/testimonials.tpl` — список отзывов;
- `templates/price.tpl` — стоимость услуг;
- `templates/articles.tpl` — статьи;
- `templates/contacts.tpl` — контактная информация.

## Чанки

- `chunks/articles/` — материалы статей;
- `chunks/bc/` — хлебные крошки;
- `chunks/blocks/` — крупные блоки страниц;
- `chunks/content/` — контентные элементы;
- `chunks/depts/` — услуги и специализации;
- `chunks/examples/` — примеры работ;
- `chunks/features/` — элементы инфографики;
- `chunks/form/` — формы;
- `chunks/icons/` — SVG-иконки;
- `chunks/nav/` — меню и навигация;
- `chunks/pagination/` — пагинация;
- `chunks/price/` — прайс-лист;
- `chunks/promo/` — акции;
- `chunks/team/` — список сотрудников;
- `chunks/testimonials/` — отзывы.

## Модели

Все модели наследуют `xPDOSimpleObject` и используют движок InnoDB с кодировкой utf8mb4. Идентификатор `id` — автоинкрементный `INT UNSIGNED`.

### exampleItem

Пакет `example`. Используется для хранения примеров работ «до/после».

Поля:

- `name` (text, not null) — название примера.
- `desc` (mediumtext) — описание.
- `img_before` (text, not null) — изображение «до».
- `img_after` (text, not null) — изображение «после».
- `spec_id` (int unsigned, not null, default 0) — ID специалиста.
- `dept_id` (int unsigned, not null, default 0) — ID отделения.
- `subdept_id` (int unsigned, not null, default 0) — ID специализации.
- `is_hidden` (tinyint(1), not null, default 0) — флаг скрытия (не мягкое удаление).
- `createdAt` (datetime, not null) — дата создания.
- `updatedAt` (datetime, not null) — дата обновления.

Индексы: `is_hidden`, `spec_id`, `dept_id`, `subdept_id`, `createdAt`.

### pricelistItem

Пакет `pricelist`. Используется для хранения позиций прайс-листа.

Поля:

- `name` (text, not null) — название услуги.
- `price` (int unsigned, not null, default 0) — цена.
- `isMinValue` (tinyint(1), not null, default 0) — признак минимальной цены (префикс «от»).
- `dept_id` (int unsigned, not null, default 0) — ID отделения.
- `subdept_id` (int unsigned, not null, default 0) — ID специализации.
- `is_hidden` (tinyint(1), not null, default 0) — флаг скрытия (не мягкое удаление).
- `createdAt` (datetime, not null) — дата создания.
- `updatedAt` (datetime, not null) — дата обновления.

Индексы: `is_hidden`, `dept_id`, `subdept_id`, `price`, `createdAt`.

### testimonialItem

Пакет `testimonial`. Используется для хранения отзывов пациентов.

Поля:

- `name` (text, not null) — имя автора отзыва.
- `desc` (mediumtext) — текст отзыва.
- `spec_id` (int unsigned, not null, default 0) — ID специалиста; `0` — валидное значение «без привязки к врачу».
- `rating` (int unsigned, not null, default 1) — рейтинг.
- `is_hidden` (tinyint(1), not null, default 0) — флаг скрытия (не мягкое удаление).
- `createdAt` (datetime, not null) — дата создания.
- `updatedAt` (datetime, not null) — дата обновления.

Индексы: `is_hidden`, `spec_id`, `rating`, `createdAt`.

### Общие замечания по моделям

- `is_hidden` во всех трёх моделях — флаг отображения на сайте (0/1), не является мягким удалением.
- `createdAt` и `updatedAt` имеют тип `datetime` и не допускают `NULL` в схеме, хотя в карте полей указано значение по умолчанию `NULL` — это наследие генератора xPDO.
- Связь с отделениями (`dept_id`, `subdept_id`) и специалистами (`spec_id`) реализована через целочисленные идентификаторы без внешних ключей.
- Для отзывов допускается `spec_id = 0` — отзыв без привязки к конкретному врачу.

## API

API реализовано на ZoomX-контроллерах в `core/components/ZoomX/src/Controllers/`. Кратко:

- Публичные GET-эндпоинты: `/api/dept`, `/api/pictures`, `/api/team`, `/api/examples`, `/api/pricelist`, `/api/testimonials`.
- Публичные POST: `/api/testimonials`, `/api/feedback`.
- Защищённые (Administrator): все POST/PATCH/DELETE, кроме публичных выше.
- Единый формат ответа:

```json
{
  "success": true,
  "data": {},
  "meta": {
    "total_time": "0.1314 s",
    "query_time": "0.0047 s",
    "php_time": "0.1267 s",
    "queries": 13,
    "source": "cache",
    "memory": "10 240 KB"
  }
}
```

## Взаимодействие со статикой

Статика и клиентская логика собираются отдельно (Twig, SCSS, TypeScript, Vite). В CMS MODX подключаются через сниппет `setAssets`, который возвращает объект с полями `css` и `js`:

```
{set $static = 'setAssets' | snippet}
...
{$static.css}
...
{$static.js}
```

Сниппет читает настройки CMS MODX (`default_tpl_assets` и связанные) и формирует ссылки на собранные CSS и JS.

## Особенности реализации

- Все шаблоны страниц расширяют `base.tpl` и переопределяют блок `main`.
- Блок `meta` позволяет задавать title, keywords, description на уровне дочерних шаблонов.
- Блок `forms` предназначен для подключения дополнительных форм.
- Списки ресурсов и элементов моделей выводятся через `pdoResources` с указанием `class` и `loadModels`.
- Миниатюры генерируются через `pthumb` с параметрами `q`, `h`, `f` (webp/jpeg).
- Schema.org-разметка встроена в `base.tpl`, `team.tpl` и другие шаблоны.
- Формы обратной связи используют FormIt и сниппет `sendFeedBackData`.
- Публичные POST-эндпоинты API: `POST /api/testimonials`, `POST /api/feedback`.

## Сборка и деплой

1. Сборка статики выполняется в отдельном репозитории.
2. Собранные CSS и JS размещаются по пути, указанному в настройке `default_tpl_assets`.
3. Сниппет `setAssets` формирует ссылки на эти файлы.
4. Шаблоны, чанки, сниппеты и API-контроллеры размещаются в CMS MODX.
5. Настройки CMS MODX заполняются необходимыми значениями.
6. CI/CD отсутствует, деплой выполняется вручную.

Порядок деплоя:
1. Собрать статику.
2. Скопировать собранные файлы на сервер.
3. Обновить шаблоны, чанки и контроллеры в CMS MODX.
4. Очистить кеш CMS MODX.
5. Проверить работу публичных эндпоинтов API и форм.

## Changelog

- v1.0 — первая версия:
  - Шаблоны на Fenom: base, main, team, promo, depts, info, testimonials, price, articles, contacts.
  - API на ZoomX: публичные GET, публичные POST (testimonials, feedback), защищённые CRUD.
  - Интеграция со статикой через сниппет `setAssets`.
  - Schema.org-разметка для страниц и специалистов.