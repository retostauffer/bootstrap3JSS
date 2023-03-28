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

	{* Using the following two variables *}
	{* $requestedPage *}
	{* $requestedOp *}

	{* If a single article view is requested *}
	{if $requestedPage == "article" && $requestedOp == "view"}
		{capture assign=ogAuthors}{$article->getAuthorString()}{/capture}
		{capture assign=ogUrl}{"https://doi.org/`$article->getStoredPubId("doi")`"}{/capture}
		{capture assign=ogTitle}{$article->getLocalizedTitle()}{/capture}
		{capture assign=ogDescription}{$article->getLocalizedAbstract()}{/capture}
	
		{* Empty string (less than 10 non-empty characters) for ogDescription? That means no article and must be a book review *}
		{if $ogDescription|count_characters < 10}
			{capture assign=ogDescription}{"Book review by `$ogAuthors`"}{/capture}
		{else}
			{capture assign=ogTitle}{"`$ogTitle` by `$ogAuthors`"}{/capture}
		{/if}

	{* An issue view is the overview of one volume in the world of JSS *}
	{elseif $requestedPage == "issue" && $requestedOp == "view"}
		{capture assign=ogUrl}{"`$baseUrl`/`$smarty.server.REQUEST_URI`"}{/capture}
		{capture assign=ogTitle}{"`$currentContext->getLocalizedName()` `$pageTitleTranslated|strip_tags`"}{/capture}
		{capture assign=ogDescription}{"`$currentContext->getLocalizedName()`: Volume `$issue->getVolume()` with `$issue->getNumArticles()` articles published `$issue->getYear()`."}{/capture}

	{* The issue archive view is simply the archive *}
	{elseif $requestedPage == "issue" && $requestedOp == "archive"}
		{capture assign=ogUrl}{"`$baseUrl``$smarty.server.REQUEST_URI`"}{/capture}
		{capture assign=ogTitle}{"`$currentContext->getLocalizedName()` publication archive."}{/capture}
		{capture assign=ogDescription}{"Archive of all published articles. Free and peer-reviewed."}{/capture}

	{* Else rolling out a default description *}
	{else}
		{capture assign=ogUrl}{"`$baseUrl``$smarty.server.REQUEST_URI`"}{/capture}
		{capture assign=ogTitle}{"`$currentContext->getLocalizedName()`"}{/capture}
		{capture assign=ogDescription}{"`$currentContext->getLocalizedName()`"}{/capture}
	{/if}

	{* link to claim the website for mastodon/fosstodon *}
	<link rel="me" href="https://fosstodon.org/@jstatsoft" />

	{* twitter card settings *}
	<meta name="og:title" content="{$ogTitle}" />
	<meta name="og:description" content="{$ogDescription}" />
	<meta name="og:image" content="{$baseUrl}/plugins/themes/bootstrap3JSS/images/jsslogo.jpg" />
	<meta name="og:type" content="website" />
	<meta name="og:url" content="{$ogUrl}" />
	<meta name="twitter:card" content="summary" />
	<meta name="twitter:site" content="@jstatsoft" />

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
