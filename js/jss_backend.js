

$(document).ready(function() {


	// Whenever we add an element with class pkp_modal_panel:
	// Check (and manipulate) a series of objects/elements.
	$("body").on("DOMNodeInserted", ".pkp_modal_panel", function() {

		// Change default decision when a user clicks
		// "Request Revision". Change to "Revision will be subject
		// to a new review round" (text may be changed).
		var decisionResubmit = $("#decisionResubmit");
		$.each(decisionResubmit, function() {
			if (!$(this).is(":checked")) {
				$(this).attr("checked", true);
				console.log($(this));
			}
		});

		// Looking for element with id "skipEmail-send". Whenever found,
		// make sure it is checked (do send email; don't skip)
		// and hide closest parent div behind a text.
		var skipEmailSend = $("#skipEmail-send");
		$.each(skipEmailSend, function() {

			// Now find closest div.section
			var skipEmailDiv = $(this).closest("div.section")
			//console.log(skipEmailDiv)

			// There is no div.section? Well ... back to the keyboard, Reto
			if (skipEmailDiv.length != 1) {
				alert("Shit, call Reto")
				return;
			}

			// Change id of the object found. Else it would be found
			// infinite times.
			$(this).attr("id", "skipEmail-send-manipulated");

			// Now do the following with it
			// - extract content
			// - remove the id from the div; add new id and class (we won't rely
			//   on the id for further manipulation in case it occurs more than
			//   once - which is should not!)
			// - add content of existing div to the new div
			var old_content = $(skipEmailDiv).html()
			var newdiv_msg = $(skipEmailDiv).empty()
				.html("<span class=\"jss_skipemail_hidden_change\">An email notification will be sent (click to change decision).</span>")
				.append("<div class=\"jss_skipemail_hidden\"></div>")
			var newdiv_content = $(newdiv_msg).find("div").html(old_content);

			// Now add interaction
			$(newdiv_msg).on("click", function() {
				$(this).find("div").show();
			});
		});

		// Next we try to find a hyperlink (a) with the id "importPeerReviews"
		// and hide it. Would allow to append files to the email sent to the
		// users; we use an email template which tells the users to log in to 
		// the system to get the point-to-point review rather than sending
		// out any kind of files!
		var importPeerReviewLink = $("#importPeerReviews");
		var importPeerReviewDiv  = $(importPeerReviewLink).closest("div.section")
		$.each(importPeerReviewLink, function() {
			$(this).attr("id", "importPeerReviews_hidden");
			$(importPeerReviewDiv).css("display", "none");
		});

	});

	// Replace a-content (text of link) when we find a hyperref containing "Round&nbsp;1".
	// \u00a0 is just &nbsp; in unicode
	$("body").on("DOMNodeInserted", "#reviewTabs", function() {
		var a = $("#reviewTabs ul[role = 'tablist'] > li[role = 'tab'] a:contains('Round\u00a01')")
		$.each(a, function() {
			if ($(this).text() != "Round\u00a01") return
			$(this).html("Round\u00a01\u00a0(prescreening)"); 
		});
	});

}); // End on document ready
