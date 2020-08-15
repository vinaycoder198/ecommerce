<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.* "
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href="images/favicon.ico">
<title>Order</title>
<!--navbar menu-->
            <%@include file="navbar.jsp" %>
<!--sidebar menu-->
            <%@include file="sidebar.jsp" %>
<!-- Font Awesome -->
<script src="https://kit.fontawesome.com/07a7cc3607.js"></script>

<link href="css/bootstrap.css" rel="stylesheet" />
	<link href="css/bootstrap-theme.css" rel="stylesheet" />
	
	
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
		
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

</head>

 <body style="background-color:lemonchiffon">
			<%
				int productId = 0;
			%>
			
           		
  	<div class="container category ">
        <fieldset>
          <legend>Place Order</legend> 
        </fieldset>
        <form class="form-group">
	         	<%
	         		try{
	         			Class.forName("com.mysql.jdbc.Driver");
	        			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/billing_software","root", "qwerty");
	        			Statement smt = con.createStatement();
	        			ResultSet rs = null;
	        			rs = smt.executeQuery("select * from categories ");
	        			
	         		
	         	%>
	         <label>Select Category : </label>
	         <select class="form-control" name="cat-sel" id="cat-sel" onchange="this.form.submit()"  style="width:20%">
	         	<option value="0">Please choose an option</option>
	         	<%while(rs.next())
	         		{%>
	         		<option value="<%=rs.getInt("cat_id")%>"
	         		<%
	         			if(request.getParameter("cat-sel")!=null)
	         			{
	         				if(rs.getInt("cat_id")==Integer.parseInt(request.getParameter("cat-sel")))
	         				{
	         					out.print("selected");
	         				}
	         			}
	         		%>         		
	         		><%=rs.getString("cat_name") %></option>
	         	<%} 
	         	%>
	          </select>
	          <%
	         		}
	         	catch(Exception e)
	         	{
	         		
	         		e.printStackTrace();
	         	}
	          %>
	          </form>
	      </div>
	      <div class="container product">    
	          
	         
	          <label>Select Product</label>
	          <select name="prod-sel" id="prod-sel" class="form-control"  style="width:20%">
	          <option value="">Please choose an option</option>
	          <%
	          try{
	       			Class.forName("com.mysql.jdbc.Driver");
	      			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/billing_software","root", "qwerty");
	      			
		          	ResultSet rs1 = null;
		          	String queryp = "select * from products where cat_id= ?";
		          	PreparedStatement ps = con.prepareStatement(queryp);
		          	int i = Integer.parseInt(request.getParameter("cat-sel"));
		          	ps.setInt(1, i);
		          	
		          	rs1 = ps.executeQuery();
	          	
	          while(rs1.next())
	         		{%>
	         		<option value="<%=rs1.getString("prod_code")%>"><%=rs1.getString("prod_name")%> - Rs.<%=rs1.getString("prod_price") %></option>
	         	<%} %>
	          
	          
	       <%
	         		}
	          	
	         	catch(Exception e)
	         	{
	         		e.printStackTrace();
	         	}
	          %>
	          </select>
	          <br>
	          <label>Quantity : </label>
         <input type="number" name="quantity" class="form-control" style="width:20%" style="display:block" placeholder="Quantity"> <br>
         
	          <button type="submit" onclick="myFunction()" class="btn btn-primary" name="button">Add to Cart  <i class="fas fa-cart-plus"></i> </button>
	          
	        <button type="submit" class="btn btn-primary" name="button">Go to Cart <i class="fas fa-shopping-cart"></i> </button>
	        
			
	         
	       
	
	</div>
	<br> <br> <br>
  
  <div class="footer">
  	<h5>Created by: Vinay Pandit</h5>
  
  </div>
	<script>
		function category(s1){
			
			document.getElementById("showcat").innerHTML = s1;
		}
	</script>
</body>
</html>