<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="no-js">
<head>
<title>Primetime: Your Shopping Cart</title>
<meta charset="utf-8" />
<link rel="stylesheet" href="http://52.88.249.233/Magic_Store/css/cartstyle.css" media="screen" type="text/css" />
<link rel="shortcut icon" href="http://52.88.249.233/Magic_Store/images/Primetime.ico">

<!-- Important! This script must be linked before any other script -->
<script type="text/javascript" src="/js/sessiontransfer.js"></script>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script type="text/javascript" src="http://52.88.249.233/Magic_Store/js/jquery.shop.js"></script>


</head>

<link href="http://52.88.249.233/Magic_Store/css/bootstrap.min.css" rel="stylesheet">

<body>

	<jsp:include page="WEB-INF/jsp/navbar.jsp" />


<div id="site">
	<header id="masthead">
		<h1>Primetime </h1>
	</header>
	
	
	
	<div id="content">
		<h1>Your Shopping Cart</h1>
		<form id="shopping-cart" action="cart.jsp" method="post">
			<table class="shopping-cart">
			  <thead>
				<tr>
					<th scope="col">Item</th>
					<th scope="col">Qty</th>
					<th scope="col" colspan="2">Price</th>
				</tr>
			  </thead>
			  <tbody>
			  
			  </tbody>
			</table>
			<p id="sub-total">
				<strong>Sub Total</strong>: <span id="stotal"></span>
			</p>
			<ul id="shopping-cart-actions">
				<li>
					<input type="submit" name="update" id="update-cart" class="btn" value="Update Cart" />
				</li>
				<li>
					<input type="submit" name="delete" id="empty-cart" class="btn" value="Empty Cart" />
				</li>
				<li>
					<a href="index.jsp" class="btn">Continue Shopping</a>
				</li>
				<li>
					<a href="checkout.jsp" class="btn">Go To Checkout</a>
				</li>
			</ul>
		</form>
		
		
	</div>
	
	

</div>


</body>
</html>	