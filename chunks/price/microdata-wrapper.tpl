{set $itemid = $_modx->config.site_url ~ '#clinic'}

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@graph": [
    {
      "@type": "Dentist",
      "@id": "{$itemid}",
      "name": "{$_modx->config.site_name}",      
      "priceRange": "Информация о ценах по телефону {$_modx->config.default_contacts_phone}",
      "image": "{$_modx->config.default_contacts_logo}"
    },
    {
      "@type": "WebPage",
      "@id": "{$_modx->resource.id | url : ['scheme' => 'full']}",
      "mainEntity": {
        "@id": "{$itemid}"
      }
    },
    {$output}
  ]
}
</script>