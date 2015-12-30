<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" class="no-js">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Online Magic: the Gathering Store">
<meta name="author" content="Justin Ross"/>
<link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700' rel='stylesheet' type='text/css'>
<link rel="shortcut icon" href="http://52.88.249.233/Magic_Store/images/Primetime.ico">
<title>Primetime Games - Trading, Events and More!</title>

<jsp:include page="WEB-INF/jsp/navbar.jsp" />


<style>
body{
background-color:#ffffff;
filter:progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr=#ffffff, endColorstr=#919191);
background-image:-moz-linear-gradient(top, #ffffff 0%, #919191 0%,#000000 100%);
background-image:linear-gradient(top, #ffffff 0%, #919191 0%,#000000 100%);
background-image:-webkit-linear-gradient(top, #ffffff 0%, #919191 0%,#000000 100%);
background-image:-o-linear-gradient(top, #ffffff 0%, #919191 0%,#000000 100%);
background-image:-ms-linear-gradient(top, #ffffff 0%, #919191 0%,#000000 100%);
background-image:-webkit-gradient(linear, right top, right bottom, color-stop(0%,#ffffff), color-stop(0%,#919191),color-stop(100%,#000000));
background-size: 100% 100%;
background-repeat: no-repeat; 
}





</style>

</head>


<body>
	
	
<jsp:include page="WEB-INF/jsp/navbar.jsp" />
<head>

<!-- Custom CSS -->
<link href="http://52.88.249.233/Magic_Store/css/shop-homepage.css" rel="stylesheet">

<style>
body{
background-color:#ffffff;
filter:progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr=#ffffff, endColorstr=#919191);
background-image:-moz-linear-gradient(top, #ffffff 0%, #919191 0%,#000000 100%);
background-image:linear-gradient(top, #ffffff 0%, #919191 0%,#000000 100%);
background-image:-webkit-linear-gradient(top, #ffffff 0%, #919191 0%,#000000 100%);
background-image:-o-linear-gradient(top, #ffffff 0%, #919191 0%,#000000 100%);
background-image:-ms-linear-gradient(top, #ffffff 0%, #919191 0%,#000000 100%);
background-image:-webkit-gradient(linear, right top, right bottom, color-stop(0%,#ffffff), color-stop(0%,#919191),color-stop(100%,#000000));
background-size: 100% 100%;
background-repeat: no-repeat; 
}


</style>

<body>



    <!-- Page Content -->
    <div class="container">

        <div class="row">

            <div class="col-md-3">
                <h2 class="lead">Primetime Games</h2>
                <h5 style="text-center;">View Products</h5>
                <div class="list-group">
					<a href="products.jsp?category=" class="list-group-item">All products</a>
                    <a href="products.jsp?category=Battle for Zendikar" class="list-group-item">Battle for Zendikar</a>
                    <a href="products.jsp?category=Commander" class="list-group-item">Commander 2015</a>
                    <a href="products.jsp?category=Cards" class="list-group-item">Singles</a>
					<a href="products.jsp?category=From the Vault" class="list-group-item">From the Vault</a>
                </div>
            </div>

            <div class="col-md-9">
            
				<!-- Carousel -->
                <div class="row carousel-holder">

                    <div class="col-md-12">
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="item active">
                                    <a href="products.jsp?category=Battle for Zendikar"><img class="slide-image" src="http://52.88.249.233/Magic_Store/images/Zendikar-Pre-Release.jpg" alt="Zendikar"></a>
                                </div>
                                <div class="item">
                                    <a href="products.jsp?category=Commander"><img class="slide-image" src="http://52.88.249.233/Magic_Store/images/daxos.png" alt="Daxos"></a>
                                </div>
                                <div class="item">
                                    <a href="products.jsp?category=Cards"><img class="slide-image" src="http://52.88.249.233/Magic_Store/images/magic_store.png" alt="Cards"></a>
                                </div>
                            </div>
                            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                            </a>
                        </div>
                    </div>

                </div>

                <div class="row">

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <a href="products.jsp?category=Battle for Zendikar"> <img class="img-responsive" src="http://52.88.249.233/Magic_Store/images/sale/bfz/battleforzendikar.jpg" alt=""></a>
                            <div class="caption">
                                <h4><a href="products.jsp?category=Battle for Zendikar">Battle for Zendikar</a>
                                </h4>
                                <p>Help Gideon defend Zendikar from the Eldrazi!</p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">15 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <a href="products.jsp?category=Commander"><img src="http://52.88.249.233/Magic_Store/images/sale/commander/doxas-featured.jpg" alt=""></a>
                            <div class="caption">
                                <h4><a href="products.jsp?category=Commander">Commander 2015</a>
                                </h4>
                                <p>Jump right into Commander with these ready-to-play decks featuring brand-new commanders!</p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">12 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <a href="products.jsp?category=Cards"><img src="http://52.88.249.233/Magic_Store/images/liliana.jpg" class="img-responsive" alt=""></a>
                            <div class="caption">
                                <h4><a href="products.jsp?category=Cards">Buy & Sell</a>
                                </h4>
                                <p>Find the best prices on cards here! Now featuring 10% off select cards!</p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">31 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <a href="products.jsp?category=From the Vault"><img src="http://52.88.249.233/Magic_Store/images/sale/ftv/ftv-annihilation.jpg" alt=""></a>
                            <div class="caption">
                                <h4><a href="products.jsp?category=From the Vault: Annihilation">From the Vault: Annihilation</a>
                                </h4>
                                <p>Wreak havoc with the latest set From the Vault!</p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">6 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </p>
                            </div>
                        </div>
                    </div>


                </div>

            </div>

        </div>

    </div>
    <!-- /.container -->

    <div class="container">

        <hr>

        <!-- Footer -->
        <footer style="color: gray;">
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Primetime Games 2015</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="http://52.88.249.233/Magic_Store/js/jquery-1.11.3.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="http://52.88.249.233/Magic_Store/js/bootstrap.min.js"></script>

</body>
</html>

