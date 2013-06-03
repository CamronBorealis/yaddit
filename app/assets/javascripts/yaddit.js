$(document).ready(function(){

	/* Hides User Options menu: */
	$("#userOptions").hide(); 

	/* Toggles User Options menu when button is clicked: */
	$("#userOptionsBtn").click(function(event) {
		$("#userOptions").toggle(); 
	});

	/* Adjust menu UI depending on URL path */
	var path = window.location.pathname; 

	if(path == "/messages/list" || path == "/") {
		newmessages.className = 'selected'; 
	}
	if(path == "/messages/new") {
		submit.className = 'selected'; 
	}

	/* Set bg color if on login page */
	if(path == "/login" || path =="/register") {
		document.body.className = 'gray'; 
	}

	//Hide the Reply forms: 
	$(".replyForm").each(function(i, obj) {
		$(this).hide();
	}); 

	//Add a click handler to each "Reply button" which toggles the next div:
	$(".replyButton").each(function(i, obj) {
		$(this).click(function(event) {
			$(this).next(".replyForm").toggle(); 
		})
	})
});