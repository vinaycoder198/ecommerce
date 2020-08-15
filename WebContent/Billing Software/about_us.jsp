<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.* "
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href="images/favicon.ico">
<title>About Us</title>
<!-- Font Awesome -->
<script src="https://kit.fontawesome.com/07a7cc3607.js"></script>

<link href="css/bootstrap.css" rel="stylesheet" />
	<link href="css/bootstrap-theme.css" rel="stylesheet" />
	<script src="js/bootstrap.min.js"></script>
	
	<style> 
            table, thead, td,th{ 
                border: 2px solid green; 
                text-align:center; 
            } 
            th{
            	border: 2px solid green;
            	padding: 40px;
            	width: 20%;
             	background-color:lightgreen; 
            }
             td { 
                padding: 40px; 
                width: 20%;
                background-color:lightblue; 
            }   
        </style> 
	<script>
function myFunction() {
  alert("Data Save");
}
</script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

</head>
 <body style="background-color:lemonchiffon">
		
			<!--navbar menu-->
            <%@include file="navbar.jsp" %>
        
</body>
</html>