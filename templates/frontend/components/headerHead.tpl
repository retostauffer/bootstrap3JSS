{**
 * templates/frontend/components/headerHead.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2000-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * Common site header <head> tag and contents.
 *}
<head>

	{* Open Graph for article type sites *}
	{if $requestedPage == "article"}
		{capture assign=ogDoi}{$article->getStoredPubId("doi")}{/capture}
		{capture assign=ogTitle}{$article->getLocalizedTitle()}{/capture}
		{capture assign=ogDescription}{$article->getLocalizedAbstract()}{/capture}

		<meta name="og:title" content="{$ogTitle}" />
		<meta name="og:description" content="{$ogDescription}" />
		<meta name="og:image" content="{$baseUrl}/plugins/themes/bootstrap3JSS/images/jsslogo.jpg" />
		<meta name="og:type" content="website" />
		<meta name="og:url" content="https://doi.org/{$ogDoi}" />
		<meta name="twitter:card" content="summary" />
		<meta name="twitter:site" content="@jstatsoft" />
	
	
	{/if}

	<meta charset="{$defaultCharset|escape}">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>
		{$pageTitleTranslated|strip_tags}
		{* Add the journal name to the end of page titles *}
		{if $requestedPage|escape|default:"index" != 'index' && $currentContext && $currentContext->getLocalizedName()}
			| {$currentContext->getLocalizedName()}
		{/if}
	</title>

	<!-- favicon -->
	<link rel="apple-touch-icon" sizes="57x57"        href="/plugins/themes/bootstrap3JSS/favicon/apple-icon-57x57.png">
	<link rel="apple-touch-icon" sizes="60x60"        href="/plugins/themes/bootstrap3JSS/favicon/apple-icon-60x60.png">
	<link rel="apple-touch-icon" sizes="72x72"        href="/plugins/themes/bootstrap3JSS/favicon/apple-icon-72x72.png">
	<link rel="apple-touch-icon" sizes="76x76"        href="/plugins/themes/bootstrap3JSS/favicon/apple-icon-76x76.png">
	<link rel="apple-touch-icon" sizes="114x114"      href="/plugins/themes/bootstrap3JSS/favicon/apple-icon-114x114.png">
	<link rel="apple-touch-icon" sizes="120x120"      href="/plugins/themes/bootstrap3JSS/favicon/apple-icon-120x120.png">
	<link rel="apple-touch-icon" sizes="144x144"      href="/plugins/themes/bootstrap3JSS/favicon/apple-icon-144x144.png">
	<link rel="apple-touch-icon" sizes="152x152"      href="/plugins/themes/bootstrap3JSS/favicon/apple-icon-152x152.png">
	<link rel="apple-touch-icon" sizes="180x180"      href="/plugins/themes/bootstrap3JSS/favicon/apple-icon-180x180.png">
	<link rel="icon" type="image/png" sizes="192x192" href="/plugins/themes/bootstrap3JSS/favicon/android-icon-192x192.png">
	<link rel="icon" type="image/png" sizes="32x32"   href="/plugins/themes/bootstrap3JSS/favicon/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="96x96"   href="/plugins/themes/bootstrap3JSS/favicon/favicon-96x96.png">
	<link rel="icon" type="image/png" sizes="16x16"   href="/plugins/themes/bootstrap3JSS/favicon/favicon-16x16.png">
	<link rel="manifest" href="/plugins/themes/bootstrap3JSS/favicon//manifest.json">
	<meta name="msapplication-TileColor" content="#ffffff">
	<meta name="msapplication-TileImage" content="/plugins/themes/bootstrap3JSS/favicon//ms-icon-144x144.png">
	<meta name="theme-color" content="#ffffff">


	{load_header context="frontend"}
	{load_stylesheet context="frontend"}
</head>
