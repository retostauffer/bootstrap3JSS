{**
 * templates/authorDashboard/reviewRoundInfo.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * Display submission review details in author dashboard page.
 *}

<!--  Display round status -->
{include file="controllers/notification/inPlaceNotification.tpl" notificationId="reviewRoundNotification_"|concat:$reviewRoundId requestOptions=$reviewRoundNotificationRequestOptions}

<!-- Display editor's message to the author -->
{include file="authorDashboard/submissionEmails.tpl" submissionEmails=$submissionEmails}

{* Reviewer grid *}
{if $showReviewerGrid}
	{capture assign="reviewersGridUrl"}{url router=$smarty.const.ROUTE_COMPONENT component="grid.users.reviewer.AuthorReviewerGridHandler" op="fetchGrid" submissionId=$submission->getId() stageId=$stageId reviewRoundId=$reviewRoundId escape=false}{/capture}
	{load_url_in_div id="reviewersGrid-round_"|concat:$reviewRoundId url=$reviewersGridUrl}
{/if}

<!-- Display review attachments grid -->
{if $showReviewAttachments}
	{** need to use the stage id in the div because two of these grids can appear in the dashboard at the same time (one for each stage). *}
	{capture assign=reviewAttachmentsGridUrl}{url router=$smarty.const.ROUTE_COMPONENT component="grid.files.attachment.AuthorReviewAttachmentsGridHandler" op="fetchGrid" submissionId=$submission->getId() stageId=$stageId reviewRoundId=$reviewRoundId escape=false}{/capture}
	{load_url_in_div id="reviewAttachmentsGridContainer-`$stageId`-`$reviewRoundId`" url=$reviewAttachmentsGridUrl}

	{capture assign=revisionsGridUrl}{url router=$smarty.const.ROUTE_COMPONENT component="grid.files.review.AuthorReviewRevisionsGridHandler" op="fetchGrid" submissionId=$submission->getId() stageId=$stageId reviewRoundId=$reviewRoundId escape=false}{/capture}
	{load_url_in_div id="revisionsGrid-`$stageId`-`$reviewRoundId`" url=$revisionsGridUrl}

	<div class="pkp_notification jss_notification">
		<div class="notifyInfo">
			<span class="title">
				Information for authors
			</span>
			<span class="description">
				When you have uploaded <strong>Revisions</strong> for all required files above
				(including your point-to-point response), you need to inform the editors that
				your revision is complete. To do so click the <strong>Add discussion</strong>
				button below, using the subject "Resubmission" and adding all involved section
				editors and journal editors (if any) as participants. 
			</span>
		</div>
	</div>
{/if}

