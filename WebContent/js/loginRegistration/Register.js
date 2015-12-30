var usernameBad = false;
var passwordBad = false;

var typingTimer;
var doneTypingInterval = 500;
var $input = $("#username");


$input.on('keyup', function () {
	  clearTimeout(typingTimer);
	  typingTimer = setTimeout(doneTyping, doneTypingInterval);
});

$input.on('keydown', function () {
	clearTimeout(typingTimer);
});
	
function doneTyping() {
	var namefield = document.getElementById("username");
	var name = $("#username").val();

	if(name == "")
		{
		$("#confirmUsername").attr("src","");
		namefield.className = namefield.className.replace(
				/(?:^|\s)form-control-red(?!\S)/g, '');
		}
	else
		{
		if(name.match(/[\u0020-\u002C\u002E-\u002F\u003A-\u003F\u005B-\u005E\u0060\u007B-\uFFFF]/) != null || name.length > 16)
		{
			$("#confirmUsername").attr("src","http://52.88.249.233/Magic_Store/images/Confirmation/cross.png");
			namefield.className += " form-control-red";
			$("#confirmUsername").attr("data-content", "Invalid username");
			usernameBad = true;
		}
		// Send the data using post
		else
			{
			
			$("#confirmUsername").attr("src","http://52.88.249.233/Magic_Store/images/Confirmation/loader.gif");
			namefield.className = namefield.className.replace(
					/(?:^|\s)form-control-red(?!\S)/g, '');
			$("#confirmUsername").attr("data-content", "Checking username availability");

	        $.post("http://localhost:8080/Magic_Store/Check",
	                {
	                  name: name,
	                },
	                function(data){
	                    if(data == "true")
	                    	{
	                    	namefield.className += " form-control-red";
	                    	$("#confirmUsername").attr("src","http://52.88.249.233/Magic_Store/images/Confirmation/cross.png");
	                    	$("#confirmUsername").attr("data-content", "Username is taken");
	                    	usernameBad = true;
            				$("#confirmsignup").addClass("disabled");
            				$("#confirmsignup").attr("disabled", "disabled");
	                    	}

	                    else if(data == "false")
	                    	{
	                    	$("#confirmUsername").attr("src","http://52.88.249.233/Magic_Store/images/Confirmation/tick.png");
	            			namefield.className = namefield.className.replace(
	            					/(?:^|\s)form-control-red(?!\S)/g, '');
	            			$("#confirmUsername").attr("data-content", "Username is available");
	            			usernameBad = false;
	            			if(!usernameBad && !passwordBad)
	            				{
	            				$("#confirmsignup").removeClass("disabled");
	            				$("#confirmsignup").removeAttr("disabled");
	            				}
	                    	}
	                });
			}

		}
}


function checkPass() {
	//Store the password field objects into variables ...
	var pass1 = document.getElementById('password');
	var pass2 = document.getElementById('password_confirmation');
	//Compare the values in the password field 
	//and the confirmation field

	if (pass1.value == pass2.value && pass2.value != "") {
		//The passwords match. 
		if(pass1.value.length > 7 && pass1.value.length < 17)
			{
			//Set the color to the good color and inform
			//the user that they have entered the correct password
			pass1.className = pass1.className.replace(
					/(?:^|\s)form-control-red(?!\S)/g, '');
			pass2.className = pass2.className.replace(
					/(?:^|\s)form-control-red(?!\S)/g, '');
			passwordBad = false;
			if(!usernameBad && !passwordBad)
				{
				$("#confirmsignup").removeClass("disabled");
				$("#confirmsignup").removeAttr("disabled");
				$("#confirmPassword").attr("src","http://52.88.249.233/Magic_Store/images/Confirmation/tick.png");
				$("#confirmPassword").attr("data-content", "Passwords match");
				}
			}
		else
			{
			pass1.className += " form-control-red";
	    	passwordBad = true;
			$("#confirmsignup").addClass("disabled");
			$("#confirmsignup").attr("disabled", "disabled");
			$("#confirmPassword").attr("src","http://52.88.249.233/Magic_Store/images/Confirmation/cross.png");
			$("#confirmPassword").attr("data-content", "Invalid password");
			}
	} else if (pass2.value != "") {
		//The passwords do not match.
		//Set the color to the bad color and
		//notify the user.
		pass1.className += " form-control-red";
		pass2.className += " form-control-red";
    	passwordBad = true;
		$("#confirmsignup").addClass("disabled");
		$("#confirmsignup").attr("disabled", "disabled");
		$("#confirmPassword").attr("src","http://52.88.249.233/Magic_Store/images/Confirmation/cross.png");
		$("#confirmPassword").attr("data-content", "Passwords do not match");
	} else if (pass1.value != ""){
		//Password 1 has some stuff in it, but it's wrong.
		//Password 2 is empty
		pass1.className += " form-control-red";
    	passwordBad = true;
		$("#confirmsignup").addClass("disabled");
		$("#confirmsignup").attr("disabled", "disabled");
		$("#confirmPassword").attr("src","http://52.88.249.233/Magic_Store/images/Confirmation/cross.png");
		$("#confirmPassword").attr("data-content", "Invalid password");
	} else {
		//Password is neither good nor bad.
		pass1.className = pass1.className.replace(
				/(?:^|\s)form-control-red(?!\S)/g, '');
		pass2.className = pass2.className.replace(
				/(?:^|\s)form-control-red(?!\S)/g, '');
		passwordBad = false;
		if(!usernameBad && !passwordBad)
		{
		$("#confirmsignup").removeClass("disabled");
		$("#confirmsignup").removeAttr("disabled");
		$("#confirmPassword").removeAttr("src");
		$("#confirmPassword").removeAttr("data-content");
		}
	}
	message.style.fontWeight = 'bold';
}

//Triggers all popovers to activate when they are hovered over
$(document).ready(function(){
    $('[data-toggle="popover"]').popover(); 
});
