$(document).ready(function(){

	/* Hides User Options menu: */
	$("#userOptions").hide(); 

	/* Toggles User Options menu when button is clicked: */
	$("#userOptionsBtn").click(function(event) {
		$("#userOptions").toggle(); 
	});

	/* Adjust menu UI depending on URL path */
	var path = window.location.pathname; 

	if(path == "/messages/list") {
		newmessages.className = 'selected'; 
	}
	if(path == "/messages/new")
		submit.className = 'selected'; 

});