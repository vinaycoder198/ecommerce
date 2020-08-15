<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import= "java.sql.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer SignUp</title>
<link rel="icon" href="images/favicon.ico">
<!-- Font Awesome -->
<script src="https://kit.fontawesome.com/07a7cc3607.js"></script>
<!--navbar menu-->
            <%@include file="navbar.jsp" %> 
<!--sidebar menu-->
            <%@include file="sidebar.jsp" %>
<link href="css/bootstrap.css" rel="stylesheet" />
	<link href="css/bootstrap-theme.css" rel="stylesheet" />
	<script src="js/bootstrap.min.js"></script>
	<!-- Font Awesome -->
<script src="https://kit.fontawesome.com/07a7cc3607.js"></script>

<link href="css/bootstrap.css" rel="stylesheet" />
	<link href="css/bootstrap-theme.css" rel="stylesheet" />
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<link rel="stylesheets" href="orderGrid.css">

</head>
<body style="background-color:lemonchiffon">

<div class="container">
        <fieldset>
          <legend>Add Customer</legend>
        </fieldset>
        <form class="" >
        	
          <label>Customer Name : </label>
          <input type="text" name="name" class="form-control"; style="width:20%" placeholder="Name" value=""> <br>
          
          <label>Customer Mobile : </label>
          <input type="text" name="mobile" class="form-control"; style="width:20%" placeholder="Mobile" value=""> <br>
          
          <label>Customer Address : </label>
          <input type="text" name="address" class="form-control"; style="width:20%" placeholder="Address" value=""> <br>
          
          <label>City : </label>
          <input type="text" name="city" class="form-control"; style="width:20%" placeholder="City" value=""> <br>
          
          
            
          <button type="submit" onclick="myFunction()" class="btn btn-primary" name="button">Save  <i class="far fa-save"></i> </button>
        </form> 
        
        <%
	        try
			 {  
	 		Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/billing_software","root", "qwerty");
			PreparedStatement ps = null;
        	
        
        	String name1 = request.getParameter("name");
        	String mob = request.getParameter("mobile");
        	String address = request.getParameter("address");
        	String city = request.getParameter("city");
        
        	 
        	String queryinput = "insert into customers(cust_name, cust_mobile, cust_address, city) values(?,?,?,?)";
        	ps = con.prepareStatement(queryinput);
        	
        	ps.setString(1, name1);
        	ps.setString(2, mob);
        	ps.setString(3, address);
        	ps.setString(4, city);
        	
        	ps.executeUpdate();
        	con.close();
			 }
		catch(Exception e){
			e.printStackTrace();
		}
        %>   
  </div> <br> <br> <br>

</body>
</html>