{**
 * templates/frontend/components/breadcrumbs_article.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display a breadcrumb nav item showing the current page. This basic
 *  version is for top-level pages which only need to show the Home link. For
 *  category- and series-specific breadcrumb generation, see
 *  templates/frontend/components/breadcrumbs_catalog.tpl.
 *
 * @uses $currentTitle string The title to use for the current page.
 * @uses $currentTitleKey string Translation key for title of current page.
 * @uses $issue Issue Issue this article was published in.
 * @uses $requestedPage string Used to suppress one or another thing maybe.
 *}

{capture assign="JSSIssueNumber"}{call_hook name="Templates::Common::getJSSIssueNumber"}{/capture}
<nav class="cmp_breadcrumbs" role="navigation" aria-label="{translate key="navigation.breadcrumbLabel"}">
	<ol class="breadcrumb">
		<li>
			<a href="{url page="index" router=$smarty.const.ROUTE_PAGE}">
				{translate key="common.homepageNavigationLabel"}
			</a>
		</li>
		<li>
			<a href="{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive"}">
				{translate key="navigation.archives"}
			</a>
		</li>
		<li>
			<a href="{url page="issue" op="view" path=$issue->getBestIssueId($currentJournal)}">
				{$issue->getIssueIdentification()|escape}
			</a>
		</li>
		<li class="active">
			{if $currentTitleKey}
				{translate key=$currentTitleKey}
			{else}
				{* Remove last character (the plural 's') *}
				{capture assign="currentTitleLen"}{$currentTitle|count_characters}{/capture}
				{capture assign="currentTitle"}{$currentTitle|truncate:$currentTitleLen:"":true|escape}{/capture}

				{if $currentTitle == "Article"}
					Issue
				{else}
					{$currentTitle|escape}
				{/if}
				{$JSSIssueNumber}
			{/if}
		</li>
	</ol>
</nav>
