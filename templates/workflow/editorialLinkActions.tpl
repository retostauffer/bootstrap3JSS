{**
 * templates/workflow/editorialLinkActions.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * Show editorial link actions.
 *}

{if !empty($editorActions)}
	<script>
		// Initialise JS handler.
		$(function() {ldelim}
			$('#editorialActions').pkpHandler(
				'$.pkp.controllers.EditorialActionsHandler');
		{rdelim});
	</script>
	{if array_intersect(array(ROLE_ID_MANAGER, ROLE_ID_SUB_EDITOR), (array)$userRoles)}
		<ul id="editorialActions" class="pkp_workflow_decisions">
			{if $allRecommendations}
				<li>
					<div class="pkp_workflow_recommendations">
						{translate key="editor.submission.allRecommendations.display" recommendations=$allRecommendations}
					</div>
				</li>
			{/if}
			{if $lastRecommendation}
				<li>
					<div class="pkp_workflow_recommendations">
						{translate key="editor.submission.recommendation.display" recommendation=$lastRecommendation}
					</div>
				</li>
			{/if}
			{if $lastDecision}
				<li>
					<div class="pkp_workflow_decided">
						{translate key=$lastDecision}
						{if $editorActions|@count > 0}
							<button class="pkp_workflow_change_decision">{translate key="editor.submission.workflowDecision.changeDecision"}</button>
							<div class="pkp_workflow_decided_actions">
								{foreach from=$editorActions item=action}
									{include file="linkAction/linkAction.tpl" action=$action contextId=$contextId}
								{/foreach}
							</div>
						{/if}
					</div>
				</li>
			{elseif $editorActions|@count > 0}
				{capture assign="editorActionsCount"}{$editorActions|@count}{/capture}
				{if $editorActionsCount == 1}
					{foreach from=$editorActions item=action}
						<li>
							{include file="linkAction/linkAction.tpl" action=$action contextId=$contextId}
						</li>
					{/foreach}
				{else}
		                        <div class="jss_hidebuttons">
		                                <script>
		                                $(document).ready(function() {
		                                        $(".jss_hidebuttons > .pkp_button_offset").on("click", function() {
		                                                $(".jss_hidebuttons > div").css("display", "block");
		                                                $(this).css("display", "none");
		                                        });
		                                });
		                                </script>
		                                <span class="pkp_button_offset">Click here to make a decision now!</span>
		                                <div style="display: none;">
							{foreach from=$editorActions item=action}
								<li>
									{include file="linkAction/linkAction.tpl" action=$action contextId=$contextId}
								</li>
							{/foreach}
						</div>
					</div>
				{/if}
			{/if}
		</ul>
	{/if}
{elseif !$editorsAssigned && array_intersect(array(ROLE_ID_MANAGER, ROLE_ID_SUB_EDITOR), (array)$userRoles)}
	<div class="pkp_no_workflow_decisions">
		{translate key="editor.submission.decision.noDecisionsAvailable"}
	</div>
{elseif $lastDecision}
	<div class="pkp_no_workflow_decisions">
		{translate key=$lastDecision}
	</div>
{/if}
