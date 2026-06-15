{set $logo}{include 'file:chunks/icons/logo-icon.tpl'}{/set}

<div class="{$wrapperClass}">
    {if $isMainPage}<div class="logo {$classMod}">{$logo}</div>{else}<a class="logo {$classMod}" href="/">{$logo}</a>{/if}
</div>