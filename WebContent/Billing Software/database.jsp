<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Database</title>
<link rel="icon" href="images/favicon.ico">
<!-- Font Awesome -->
<script src="https://kit.fontawesome.com/07a7cc3607.js"></script>
<!--navbar menu-->
            <%@include file="navbar.jsp" %> 
<!--sidebar menu-->
            <%@include file="sidebar.jsp" %>
            
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet" />
	<link href="css/bootstrap-theme.css" rel="stylesheet" />
	<script src="js/bootstrap.min.js"></script>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
       
        
</head>
<body style="background-color:lemonchiffon">
	<div class="container"><br>
		<fieldset>
			<legend>Category</legend>
		</fieldset>
		<a href="Category.jsp"><button   class="btn btn-primary">Add / View Category</button></a><br><br>
		
		<fieldset>
			<legend>Product</legend>
		</fieldset>
		<a href="product.jsp" ><button  class="btn btn-primary">Add / View / Remove Product</button></a><br><br>
		
		<fieldset>
			<legend>Customers</legend>
		</fieldset>
		<a href="Customer.jsp"><button  class="btn btn-primary">Add / View / Remove Customer</button></a><br><br>
	</div>
</body>
</html>