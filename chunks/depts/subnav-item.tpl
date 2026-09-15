{set $url = $id | url}

<a class="card__list-item" href="{$link ?: $url}">{$menutitle ?: $pagetitle}</a>