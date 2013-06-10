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
		});
	});

	//Theme changer (TODO: send new theme value to database!): 
	$("input[name='theme']").change(function(){
		console.log('Theme option changed.');
		var option = $("[name='theme']:checked").val();

		//Remove any existing theme styles: 
		if ($("link[title='theme']") != 'undefined') {
			$("link[title='theme']").remove(); 
		}

		//Then apply the appropriate theme: 
		if(option == 'hacker') {
			$('head').append('<link title="theme" rel="stylesheet" type="text/css" href="https://dl.dropboxusercontent.com/u/8495276/1306/yaddit/theme_hacker.css">');			
		}
		if(option == 'subtle') {
			$('head').append('<link title="theme" rel="stylesheet" type="text/css" href="https://dl.dropboxusercontent.com/u/8495276/1306/yaddit/theme_subtle.css">');	
		}

		if(option == 'social') {
			$('head').append('<link title="theme" rel="stylesheet" type="text/css" href="https://dl.dropboxusercontent.com/u/8495276/1306/yaddit/theme_social.css">');	
		}		
	}); 

});