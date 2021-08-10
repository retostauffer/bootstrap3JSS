{**
 * templates/frontend/components/role_dependent_navigation.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Common site navigation block with role dependent links.
 *
 * @uses $requestedPage string Used to suppress one or another thing maybe.
 * @uses $userRoles
 *}


	{* CHECK IF THE USER HAS ANY OF THESE RULES ASSIGNED *}
	{if in_array(ROLE_ID_MANAGER, (array) $userRoles) || in_array(ROLE_ID_SUB_EDITOR, (array) $userRoles) || in_array(ROLE_ID_ASSISTANT, (array) $userRoles) || in_array(ROLE_ID_REVIEWER, (array) $userRoles) || in_array(ROLE_ID_AUTHOR, (array) $userRoles)}
	
		<div class="pkp_block">

			<h2 class="title">
				{translate|escape key="plugins.themes.bootstrap3JSS.rolenav"}
			</h2>
			<div class="content">
				<ul>
					{if in_array(ROLE_ID_MANAGER, (array) $userRoles)}
						{capture assign="forManagersUrl"}{url router=$smarty.const.ROUTE_PAGE page="guides" op="managers"}{/capture}
						<li><a href="{$forManagersUrl}" target="_self">For Managers</a></li>
					{/if}
					{if in_array(ROLE_ID_SUB_EDITOR, (array) $userRoles)}
						{capture assign="forEditorsUrl"}{url router=$smarty.const.ROUTE_PAGE page="guides" op="editors"}{/capture}
						<li><a href="{$forEditorsUrl}" target="_self">For Editors</a></li>
					{/if}
					{if in_array(ROLE_ID_ASSISTANT, (array) $userRoles)}
						{capture assign="forAssistantsUrl"}{url router=$smarty.const.ROUTE_PAGE page="guides" op="assistants"}{/capture}
						<li><a href="{$forAssistantsUrl}" target="_self">For Assistants</a></li>
					{/if}
					{if in_array(ROLE_ID_REVIEWER, (array) $userRoles)}
						{capture assign="forReviewersUrl"}{url router=$smarty.const.ROUTE_PAGE page="guides" op="reviewers"}{/capture}
						<li><a href="{$forReviewersUrl}" target="_self">For Reviewers</a></li>
					{/if}
					{if in_array(ROLE_ID_AUTHOR, (array) $userRoles)}
						{capture assign="forAuthorsUrl"}{url router=$smarty.const.ROUTE_PAGE page="guides" op="authors"}{/capture}
						<li><a href="{$forAuthorsUrl}" target="_self">For Authors</a></li>
					{/if}
				</ul>
			</div>
		</div>
	{/if}
