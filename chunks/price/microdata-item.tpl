{
    "@type": "Service",
    "name": "{$name}",
    "description": "{if $isMinValue == 1}Цена от {$price} руб.{/if}",
    "provider": {
        "@id": "{$_modx->config.site_url}#clinic"
    },
    "offers": {
        "@type": "Offer",
        "price": "{$price}",
        "priceCurrency": "RUB"
    }
}