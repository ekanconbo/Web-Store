#System Overview
The Primetime Games website is an online store which utilizes html, CSS, jQuery, jsps, servlets, and MySQL to buy items. The website allows users to register an account, login, search for items, purchase items, and checkout. Additionally, the admin user (username: admin password: adminadmin) can add and remove products to the site’s backend.


#Design Overview
	The website is designed to be as close to a Single-Page Application as possible. Each page is dynamic to allow for dynamic linking to the navigation bar. Login and Registration can be done on any page, and the user will be redirected to the page they were viewing when they login. To minimize page refreshes, scripts are used to validate forms, and redirects aren’t done unless the user submits the form successfully. Additionally all database queries are done asynchronously using AJAX to help prevent redirects.







#Related Works

	The website uses the Bootstrap framework to provide a sleek design for the main page and navigation bar, and a session-based template written entirely in JavaScript to handle the cart, order, and checkout. The index page is an open-source Bootstrap template.
Bootstrap: http://getbootstrap.com/
Winery: http://www.smashingmagazine.com/2014/02/create-client-side-shopping-cart/
Shop Homepage: http://startbootstrap.com/template-overviews/shop-homepage/

#System Architectural Design
	The system utilizes two Amazon EC2 servers, one for Apache, one for Apache Tomcat and MySQL. Since there are no HTML pages the website uses a reverse proxy to link it to the Tomcat server. The Magic_Store directory is ignored to allow the web server to reach the static content located on the Apache server. Additionally, I purchased my own domain name, ekanconbo.com (PrimetimeGames cost a few thousand dollars), and pointed it to my Apache server.
	 The database contains two tables, account which stores the user’s username, first name, last name, and password and product, which contains the a product’s id, name, price, category, and quantity. 
		Chosen System Architecture 
	I chose to implement a 3-tier architecture with the static content located on the apache server, and the application and database located on the dynamic content server. Putting the database on its own server would be ideal, but in the interest of saving money it shares the server.
	If I had more time and resources to dedicate to the web application, I would like to implement a 4-tier architecture using Hadoop and a database cluster, which would allow for a more robust database.
Components

#Login
Checks the database for a matching username and password. If one is found, logs user in with that username and creates a cookie storing the username. If remember me is checked, the cookie will be set to expire in 1 month, otherwise, the cookie is given its default value, which will delete it when the session ends.
I chose to have the page refresh only when the user successfully, which can only be done using AJAX. So AJAX makes a GET request to Login.java and either redirects you or prints an Invalid Username/Password message based on whether or not Login.java returns a redirect JSON object.
#Logout
Logs user out, deletes the username cookie and session storage, which clears the cart.
#Registration
Adds a new entry in the database when the user submits a form. Form checking is done both client and server side using Bootstrap and some JS and AJAX to query the server looking for the desired username.
#Search
Queries the database with your search form, dynamically populates a table with all products with the matching name or category. The search form is very strict with its search rules so name or category have to match.
Add to Cart
Adds a cart object and item in session storage with the item’s id and the quantity specified. Items can be removed from the cart and the cart can be cleared by clearing the sessionstorage.
#Checkout
Submits your items to the PayPal sandbox (a test version of PayPal that works like real PayPal but doesn’t charge you) and clears sessionstorage so your cart is empty.
#Manage
A special feature given only to the admin account (which is not listed in this document). Can create new items by inputting the id (the item name on PayPal), name, price, category, image source and quantity. The id, name and price are required fields. If the last 3 options are left blank the category is set to All, the image source is set to no-image-available.jpg, and the quantity is set to null (which will mean there is an infinite number of the item available).
Items can be removed by submitting the product’s id.
I encourage you to login with the admin account and create whatever items you like. Removing items is also possible, but I ask that you don’t remove my pre-listed items. There is no user feedback that the item has been successfully added or removed, but you can test this by selecting “All products” in index.jsp or by submitting a blank search query in the search bar.
