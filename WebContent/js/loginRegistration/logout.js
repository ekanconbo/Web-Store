$("#logout").click(function(){
	$.ajax({
	type: "POST",
	url: "http://localhost:8080/Magic_Store/Logout",
	data: "/index.jsp",
	success: function (data) {	

	}
	});
});
