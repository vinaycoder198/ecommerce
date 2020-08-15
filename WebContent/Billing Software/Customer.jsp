<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customers</title>
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
	
	<style> 
            table{ 
              border-collapse:collapse;
                text-align:center; 
                
            } 
            
            tr:nth-child(even) {background-color: #f2f2f2;}
            th{
           
             padding-top: 12px;
			  padding-bottom: 12px;
			  text-align: center;
			  background-color: #4CAF50;
			  color: white;
            
            }
             td { 
                padding: 40px; 
                width:20%;
             
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
<div class="container">
        <fieldset>
          <legend>All Customers</legend>
        </fieldset>
        	
        	<h1 align="center">List of Customers</h1>
	<table border="2" class="table ">
		<tr>
			<th>Customer Id</th>
			<th>Customer Name</th>
			<th>Customer Mobile</th>
			<th>Address</th>
			<th>City</th>
			<th>Registration Date</th>
			<th>Delete</th>

		</tr>
		
		<% 
			 try
			 {  
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/billing_software","root", "qwerty");
			Statement smt = null;
			ResultSet rs = null;
			PreparedStatement ps = null;
			smt = con.createStatement();
				
				
				String query = "select * from customers ";
				rs = smt.executeQuery(query);
				while(rs.next())
				
				{
		%>
					<tbody>
			<tr height="50px">	
				<td><%=rs.getString("cust_id") %></td>
		   		<td><%=rs.getString("cust_name") %></td>
		   		<td><%=rs.getString("cust_mobile") %></td>
		   		<td><%=rs.getString("cust_address") %></td>
		   		<td><%=rs.getString("city") %></td>
		   		<td><%=rs.getString("reg_date") %></td>
				<td><button class="btn btn-danger" onclick="deleteData(this.id)" id="<%=rs.getString("cust_id") %>"><span class="glyphicon glyphicon-remove"></span> Remove</button></td>
			</tr>
		</tbody>
			
		<% 
				}
				
				
			}
			catch(Exception e){
				e.printStackTrace();
			}
		%>		 		
	</table>
	</div>
	<br> <br> <br>
  
  <div class="container">
        <fieldset>
          <legend>Add Customer</legend>
        </fieldset>
        <form class="" >
        	<label>Customer Id : </label>
         <input type="number" name="cid" class="form-control" style="width:20%" style="display:block" placeholder="ID"> <br>
        	
          <label>Customer Name : </label>
          <input type="text" name="name" class="form-control"; style="width:20%" placeholder="Name" value=""> <br>
          
          <label>Customer Mobile : </label>
          <input type="text" name="mobile" class="form-control"; style="width:20%" placeholder="Mobile" value=""> <br>
          
          <label>Customer Address : </label>
          <input type="text" name="address" class="form-control"; style="width:20%" placeholder="Address" value=""> <br>
          
          <label>City : </label>
          <input type="text" name="city" class="form-control"; style="width:20%" placeholder="City" value=""> <br>
          
          <label>Registration Date : </label>
          <input type="date" name="date" class="form-control"; style="width:20%" placeholder="Date" value=""> <br>
            
          <button type="submit" onclick="myFunction()" class="btn btn-primary" name="button">Save  <i class="far fa-save"></i> </button>
        </form> 
        
        <%
	        try
			 {  
	 		Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/billing_software","root", "qwerty");
			PreparedStatement ps = null;
        	String cids = request.getParameter("cid");
        	int cid1 = Integer.parseInt(cids);
        	String name1 = request.getParameter("name");
        	String mob = request.getParameter("mobile");
        	String address = request.getParameter("address");
        	String city = request.getParameter("city");
        	String date = request.getParameter("date");
        	 
        	String queryinput = "insert into customers values(?,?,?,?,?,?)";
        	ps = con.prepareStatement(queryinput);
        	ps.setInt(1, cid1);
        	ps.setString(2, name1);
        	ps.setString(3, mob);
        	ps.setString(4, address);
        	ps.setString(5, city);
        	ps.setString(6, date);
        	ps.executeUpdate();
        	con.close();
			 }
		catch(Exception e){
			e.printStackTrace();
		}
        %>   
  </div> <br> <br> <br>
  
  <div>
  	<h5>Created by: Vinay Pandit</h5>
  
  </div>




  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
	    var request;
		function deleteData(cid){
			if(confirm("Are you sure you want to delete this Customer?")){
			$.ajax({
				
				type: "GET",
				url: "deleteProduct.jsp?param=3",
				data: {custid: cid},
				success: function(data){
					location.reload(true);
					alert("Customer with Id : "+cid+" Deleted");
					}
				
			});
			}
			else
				return false; 		
		}
    </script>

</body>
</html>