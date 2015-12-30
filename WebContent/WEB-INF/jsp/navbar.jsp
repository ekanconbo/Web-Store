<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Cookie cookie = null;
	Cookie[] cookies = null;
	Cookie usernameCookie = null;
	// Get an array of Cookies associated with this domain
	cookies = request.getCookies();
	if( cookies != null ){
	   for (int i = 0; i < cookies.length; i++){
	      cookie = cookies[i];
	      if(cookie.getName().equals("username"))
	      {
	    	  usernameCookie = cookie;
	      }
	   }
	}

%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Online Magic: the Gathering Store">
<meta name="author" content="Justin Ross"/>
<!-- Important! This script must be linked before any other script -->
<script type="text/javascript" src="js/sessiontransfer.js"></script>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="http://52.88.249.233/Magic_Store/js/bootstrap.min.js"></script>

<style>
body {
  padding-top: 27px;
  
}
@media (max-width: 979px) {
  body {
    padding-top: 0px;
  }
}
</style>
</head>

<!-- Bootstrap Core CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha256-7s5uDGW3AHqw6xtJmNNtr+OBRJUlgkNJEo78P4b0yRw= sha512-nNo+yCHEyn0smMxSswnf/OnX6/KwJuZTlNZBjauKhTK0c+zT+q5JOCx0UFhXQ6rJR9jg6Es8gPuD2uZcYDLqSw==" crossorigin="anonymous">
<!-- Registration CSS -->
<link href="http://52.88.249.233/Magic_Store/css/loginRegistration/registration.css" rel="stylesheet">



<body>
	<!-- Navigation -->
	<nav class="main-nav navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
		</div><!-- /.container-fluid -->

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="navbar navbar-inverse navbar-fixed-top">
			  <div class="container">
			    <div class="navbar-header">
			      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			      </button>
			      <a class="navbar-brand" href="index.jsp">Primetime</a>
			    </div>
			    <div class="navbar-collapse collapse" id="searchbar">
			     
			      <ul class="nav navbar-nav navbar-right">
			      	<li><a id="clear" style="display:none;" href="#" data-target="#registermodal">Clear</a></li>
			        <!-- Switches between Login/Register list item and Account list item -->
			        <c:set var="usernameCookie" value="<%= usernameCookie %>"/>
			        <c:choose>
			        	<c:when test="${not empty usernameCookie}">
    	                    <li class="dropdown">
		                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><%= usernameCookie.getValue() %> <b class="caret"></b></a>
		                        <ul class="dropdown-menu">
		                            <li>
		                                <a href="cart.jsp">Cart</a>
		                            </li>
		                            
		                            <c:if test="${usernameCookie.getValue() == 'admin' }">
		                            	<li>
		                            		<a href="#managemodal" data-toggle="modal" data-target="#managemodal">Manage</a>
		                            	</li>
		                            </c:if>
		                            
									<li>
        	                        	<a id="logout" href="Logout">Logout</a>										
		                            </li>
		                        </ul>
		                    </li>
						</c:when>
						<c:otherwise>
					        <li><a href="#registermodal" data-toggle="modal" data-target="#registermodal">Login / Register</a></li>						
						</c:otherwise>        
			        </c:choose>
			      </ul>

			     
			     
			     <form action="products.jsp" class="navbar-form">
			        <div class="form-group" style="display:inline;">
			          <div class="input-group" style="display:table;">
  			            <input id="cse-search-input-box-id" class="form-control" name="category" id="category" type="text">
			            <span class="btn input-group-addon" id="searchButton" style="width:1%;"><span class="glyphicon glyphicon-search"></span></span>
			          </div>
			        </div>
			      </form>
			
			     </div>
			     
			     <div id="cse-result-section-id" style="width: 100%; display:none;"></div>
		    	</div><!-- /.container-fluid -->
		    </div><!--/.nav-collapse -->
	</nav>
	
	
		<!-- Login / Register Modal -->
	<div class="modal fade bs-modal-lg" id="registermodal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	        <br>
	        <div class="bs-example bs-example-tabs">
	            <ul id="myTab" class="nav nav-tabs nav-justified">
	              <li class="active"><a href="#signin" data-toggle="tab">Sign In</a></li>
	              <li class=""><a href="#signup" data-toggle="tab">Register</a></li>
	            </ul>
	        </div>
	      <div class="modal-body">
	        <div id="myTabContent" class="tab-content">
	        <div class="tab-pane fade active in" id="signin">
	        
   	            <!-- Sign In Form -->
	            <form id="loginform" name="loginform" class="form-horizontal">
	            <fieldset>
	        
	            <!-- Username input-->
	            <div class="control-group">
	              <label class="control-label" for="userid">Username</label>
	              <div class="controls">
	                <input required="" id="userid" name="userid" type="text" class="form-control" placeholder="Username" class="input-medium" required="">
	              </div>
	            </div>
	
	            <!-- Password input-->
	            <div class="control-group">
	              <label class="control-label" for="passwordinput">Password</label>
	              <div class="controls">
	                <input required="" id="passwordinput" name="passwordinput" class="form-control" type="password" placeholder="********" class="input-medium">
	              </div>
	            </div>
	            	
	            <!-- Remember me -->
	            <div class="control-group">
	              <label class="control-label" for="rememberme"></label>
	              <div class="controls">
	                <label for="rememberme-0">
	                  <input type="checkbox" name="rememberme" id="rememberme-0" value="Remember me">
	                  Remember me
	                </label>
	              </div>
	            </div>
	            
	            <div style="text-align: center;">
	            	<span id="confirmMessage" style="color: red;"></span>
	            </div>	        
	            
   	            <!-- Forwarding address -->
	            <input type="hidden" name="forwardTo" value="${pageContext.request.servletPath}" /> 
	
	            <!-- Button -->
	            <div class="control-group">
	              <label class="control-label" for="signin"></label>
	              <div class="controls">
	                <button id="signin" onclick="login()" name="signin" class="btn btn-primary">Sign In</button>
	              </div>
	            </div>
	            </fieldset>
	            </form>
	        </div>
	        
            <!-- Sign Up Form -->	        
	        <div class="tab-pane fade" id="signup">
	            <form action="Registration" method="POST" class="form-horizontal">
	            <fieldset>
	            	            
	            <!-- Username -->
	            <div class="control-group">
	            	<label class="control-label" for="username">Username</label>
	            	<div class="form-group">
		              <div class="controls col-md-11">
		                <input id="username" name="username" class="form-control" type="text" placeholder="Username" class="input-large" required="true">
		              </div>
		              <img data-toggle="popover" data-trigger="hover" data-placement="top" id="confirmUsername" data-content="" src="" class="container-fluid">
		            </div>
	            </div>
	            
	            <!-- First Name-->
	            <div class="control-group">
	              <label class="control-label" for="firstname">First Name</label>
	              <div class="controls">
	                <input id="firstname" name="firstname" class="form-control" type="text" placeholder="First Name" class="input-large" required="true">
	              </div>
	            </div>
	            
	            <!-- Last Name -->
	            <div class="control-group">
	              <label class="control-label" for="lastname">Last Name</label>
	              <div class="controls">
	                <input id="lastname" name="lastname" class="form-control" type="text" placeholder="Last Name" class="input-large" required="true">
	              </div>
	            </div>
	            
				<!-- Email input-->
	            <div class="control-group">
	              <label class="control-label" for="email">Email</label>
	              <div class="controls">
	                <input id="email" name="email" class="form-control" type="email" placeholder="Email" class="input-large" required="true">
	              </div>
	            </div>
	            
	            <!-- Password input-->
	            <div class="control-group">
	              <label class="control-label" for="password">Password:</label>
  	            	<div class="form-group">
		              <div class="controls col-md-11">
		                <input id="password" name="password" class="form-control" type="password" placeholder="********" class="input-large" required="true" onkeyup="checkPass(); return false;">
       	                <em>8-16 Characters</em>                
		              </div>
		              <img data-toggle="popover" data-trigger="hover" data-placement="top" id="confirmPassword" data-content="" src="" class="container-fluid">
		            </div>
	            </div>
	            
	            <!-- Re-Enter Password input-->
	            <div class="control-group">
	              <label class="control-label" for="reenterpassword">Re-Enter Password:</label>
	              <div class="controls">
	                <input id="password_confirmation" class="form-control" name="password_confirmation" type="password" placeholder="********" class="input-large" required="true" onkeyup="checkPass(); return false;">
	              </div>
	            </div>
	            
	            <!-- Terms and Conditions -->
	            <div class="control-group">
	              <label class="control-label" for="termsandconditions"></label>
	              <div class="controls">
	                <label for="rememberme-0">
	                  <input type="checkbox" name="termsandconditions" id="termsandconditions-0" value="Terms and Conditions" required="true">
	                  I agree to the terms and conditions
	                </label>
	              </div>
	            </div>
	            
	            <!-- Forwarding address -->
	            <input type="hidden" name="forwardTo" value="${pageContext.request.servletPath}" /> 
	            
	            <!-- Button -->
	            <div class="control-group">
	              <label class="control-label" for="confirmsignup"></label>
	              <div class="controls">
	                <button id="confirmsignup" name="confirmsignup" class="btn btn-primary">Sign Up</button>
	              </div>
	            </div>
	            </fieldset>
	            </form>
	      </div>
	    </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	
	<!-- Manage Modal -->
	<div class="modal fade bs-modal-lg" id="managemodal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	        <br>
	        <div class="bs-example bs-example-tabs">
	            <ul id="myTab" class="nav nav-tabs nav-justified">
	              <li class="active"><a href="#additem" data-toggle="tab">Add Item</a></li>
	              <li class=""><a href="#removeitem" data-toggle="tab">Remove Item</a></li>
	            </ul>
	        </div>
	      <div class="modal-body">
	        <div id="myTabContent" class="tab-content">
	        <div class="tab-pane fade active in" id="additem">
	        
   	            <!-- Add Item Form -->
	            <form id="additemform" name="additemform" class="form-horizontal" action="AddProduct" method="POST">
	            <fieldset>
	        
	            <!-- Product Id input-->
	            <div class="control-group">
	              <label class="control-label" for="productID">Product ID</label>
	              <div class="controls">
	                <input required="true" id="productID" name="productID" type="text" class="form-control" placeholder="Product ID (e.g. bfz-boosterbox)" class="input-medium" required="">
	              </div>
	            </div>
	
	            <!-- Product Name input-->
	            <div class="control-group">
	              <label class="control-label" for="productName">Product Name</label>
	              <div class="controls">
	                <input required="true" id="productName" name="productName" class="form-control" type="text" placeholder="Product Name (e.g. Battle for Zendikar Booster Box)" class="input-medium">
	              </div>
	            </div>
	
	            <!-- Product Price input-->
	            <div class="control-group">
	              <label class="control-label" for="productPrice">Product Price</label>
	              <div class="controls">
	                <input required="true" id="productPrice" name="productPrice" type="text" class="form-control" placeholder="Product Price (e.g. 99.99)" class="input-medium">
	              </div>
	            </div>
	            
	            <!-- OPTIONAL: Product Image Source input-->
	            <div class="control-group">
	              <label class="control-label" for="productImagesrc">Product Image Source</label>
	              <div class="controls">
	                <input id="productImagesrc" name="productImagesrc" type="text" class="form-control" placeholder="Product image source (e.g. http://52.88.249.233/Magic_Store/images/sale/bfz/bfz-booster-box.jpg)" class="input-medium">
	              </div>
	            </div>
	            
	            <!-- OPTIONAL: Product Category input-->
	            <div class="control-group">
	              <label class="control-label" for="productCategory">Product Category</label>
	              <div class="controls">
	                <input id="productCategory" name="productCategory" type="text" class="form-control" placeholder="Product category (e.g. Battle for Zendikar)" class="input-medium">
	              </div>
	            </div>  	

	            <!-- OPTIONAL: Product Quantity input-->
	            <div class="control-group">
	              <label class="control-label" for="productQuantity">Product Quantity</label>
	              <div class="controls">
	                <input id="productQuantity" name="productQuantity" type="text" class="form-control" placeholder="Product quantity (e.g. 15)" class="input-medium">
	              </div>
	            </div> 
	                   
	            
   	            <!-- Forwarding address -->
	            <input type="hidden" name="forwardTo" value="${pageContext.request.servletPath}" /> 
	
	            <!-- Button -->
	            <div class="control-group">
	              <label class="control-label" for="signin"></label>
	              <div class="controls">
	                <button id="signin" onclick="login()" name="signin" class="btn btn-primary">Submit</button>
	              </div>
	            </div>
	            </fieldset>
	            </form>
	        </div>
	        
            <!-- Remove Item Form -->	        
	        <div class="tab-pane fade" id="removeitem">
	            <form action="RemoveProduct" method="POST" class="form-horizontal">
	            <fieldset>
	            	            
	            <!-- Product Name -->
	            <div class="control-group">
	            	<label class="control-label" for="removeProductId">Product ID</label>
	            	<div class="form-group">
		              <div class="controls col-md-11">
		                <input id="removeProductId" name="removeProductId" class="form-control" type="text" placeholder="Product ID" class="input-large" required="true">
		              </div>
		            </div>
	            </div>
	            
	            <!-- Forwarding address -->
	            <input type="hidden" name="forwardTo" value="${pageContext.request.servletPath}" /> 
	            
	            <!-- Button -->
	            <div class="control-group">
	              <label class="control-label"></label>
	              <div class="controls">
	                <button  class="btn btn-primary">Submit</button>
	              </div>
	            </div>
	            </fieldset>
	            </form>
	      </div>
	    </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
	</body>
	


	
	<!-- Registration JS -->
	<script src="http://52.88.249.233/Magic_Store/js/loginRegistration/Register.js"></script>
	
	<!-- Login JS -->
	<script src="http://52.88.249.233/Magic_Store/js/loginRegistration/login.js"></script>

	
	<!-- Clears session -->
	<script>
	$("#logout").click(function(){
		sessionStorage.clear();
	});
	
	$(document).on('click', '#searchButton',function(event)
	{
		event.stopImmediatePropagation();
		$(this).closest("form").submit();
	});
	</script>
	
	
	
</body>
</html>