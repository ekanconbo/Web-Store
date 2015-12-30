var form = $('#loginform');
form.submit(function () {
	$.ajax({
	type: "GET",
	url: "http://localhost:8080/Magic_Store/Login",
	data: form.serialize(),
	dataType: "json",
	success: function (data) {	
		var jsonObj = JSON.parse(JSON.stringify(data));
		if(jsonObj.redirect)
			{
			var redirect = "/Magic_Store" + data.redirect;
			window.location.replace(redirect);
			}
		else
			{
			$('#confirmMessage').html(jsonObj.form);		
			}
	}
});
 
return false;
});
