<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>
<head>
	<!-- Sets name for search results but NOT what the database queries -->
	<c:choose>
		<c:when test="${empty param.category}">
			<c:set var="query" value="All products"></c:set>
		</c:when>
		<c:otherwise>
			<c:set var="query" value="${param.category}"></c:set>
		</c:otherwise>
	</c:choose>
	
	<title>Primetime: ${query}</title>
	<link rel="shortcut icon" href="http://52.88.249.233/Magic_Store/images/Primetime.ico">
	<jsp:include page="WEB-INF/jsp/navbar.jsp" />
	<script type="text/javascript" src="http://52.88.249.233/Magic_Store/js/jquery.shop.js"></script>
	

	
	<style>
	.img {
	    position: relative;
	    float: left;
	    width:  160px;
	    height: 160px;
	    background-position: 50% 50%;
	    background-repeat:   no-repeat;
	    background-size:     cover;
	}
	</style>
</head>


<body>
<br><br><br>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://54.68.205.239:3306/primetime"
     user="Justin"  password="PrimetimeGames"/>

<div id="site" class="container">
  <h2>Search Results</h2>
  <p id="showing">Showing results for ${query}</p>            
  <table class="table table-striped">

<c:choose>
	<c:when test="${empty param.category }">
	
		<c:set var="category" value="Battle for Zendikar"/>
		<sql:query dataSource="${snapshot}" var="result">
		SELECT * from product
		</sql:query>
		<c:forEach var="row" items="${result.rows}">
		<tr>
			<td><a><img class= "img" src="${row.imagesrc}"></a></td>
			<td><h3 class="product-name">${row.name}</h3><h5>Product id: ${row.id }</h5></td>
			<td><h5 class="text-justify">in ${row.category}</h5></td>
			<td>
				<div class="product-description caption text-center" data-name="${row.id}" data-price="${row.price}">
					<h3 class="text-center product-price">$ ${row.price}</h3>
					<form class="add-to-cart" action="cart.jsp" method="post">
						<div class="text-center">
							<label for="qty-1">Quantity</label>
							<input type="text" name="qty-1" id="qty-1" class="qty" value="1" />
						</div>
						<p><input type="submit" value="Add to cart" class="btn btn-primary" /></p>
					</form>
				</div>
			</td>
		</tr>
		</c:forEach>
	</c:when>
	
	<c:otherwise>
		<c:set var="category" value="Battle for Zendikar"/>
		<sql:query dataSource="${snapshot}" var="result">
		SELECT * from product WHERE Category = ? OR name = ?
		<sql:param value="${param.category}"/>
		<sql:param value="${param.category}"/>
		</sql:query>
		<c:forEach var="row" items="${result.rows}">
		<tr>
			<td><a><img src="${row.imagesrc}"></a></td>
			<td><h3 class="product-name">${row.name}</h3><h5>Product id: ${row.id }</h5></td>
			<td><h5 class="text-justify">in ${row.category}</h5></td>
			<td>
				<div class="product-description caption text-center" data-name="${row.id}" data-price="${row.price}">
					<h3 class="text-center product-price">$ ${row.price}</h3>
					<form class="add-to-cart" action="cart.jsp" method="post">
						<div class="text-center">
							<label for="qty-1">Quantity</label>
							<input type="text" name="qty-1" id="qty-1" class="qty" value="1" />
						</div>
						<p><input type="submit" value="Add to cart" class="btn btn-primary" /></p>
					</form>
				</div>
			</td>
		</tr>
		</c:forEach>
	</c:otherwise>
</c:choose>
  </table>
</div>

</body>
</html>

		