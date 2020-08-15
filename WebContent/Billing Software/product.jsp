<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Products</title>
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
	
	<style> 
            table, thead, td{ 
                border: 2px solid green; 
                text-align:center; 
            } 
            th{
            border: 2px solid green;
             background-color:lightgreen; 
             text-align:center;
            }
             td { 
                padding: 40px; 
                
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
 <div class="container">
        <fieldset>
          <legend>All Products</legend>
        </fieldset>
        	
        	<h1 align="center">List of Products</h1>
	<table class="table table-bordered table-striped table-hover" id="ptable"  >
		<tr>
			<th>Product Id</th>
			<th>Category Id</th>
			<th>Product Name</th>
			<th>Price</th>
			<th>Quantity</th>
			<th>SGST</th>
			<th>CGST</th>
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
				
				
				String query = "select * from products";
				rs = smt.executeQuery(query);
				while(rs.next())
				
				{
		%>
					<tbody>
			<tr height="50px">	
				<td style="width:10%;"><%=rs.getString("prod_code") %></td>
				<td style="width:10%;"><%=rs.getString("cat_id") %></td>
		   		<td style="width:20%;"><%=rs.getString("prod_name") %></td>
		   		<td style="width:15%;"><%=rs.getString("prod_price") %> Rs</td>
		   		<td style="width:10%;"><%=rs.getString("prod_quan") %></td>
		   		<td style="width:15%;"><%=rs.getString("prod_sgst") %> Rs</td>
		   		<td style="width:15%;"><%=rs.getString("prod_cgst") %> Rs</td>
				<td style="width:15%;"><button class="btn btn-danger" onclick="deleteData(this.id)" id="<%=rs.getString("prod_code") %>"><span class="glyphicon glyphicon-remove"></span> Remove</button></td>
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
	<br> <br> <br>
  </div>
  
   <div class="container">
        <fieldset>
          <legend>Add Product</legend>
        </fieldset>
        <form class="" >
        	<label>Product Id : </label>
         <input type="number" name="pid" class="form-control" style="width:20%" style="display:block" placeholder="ID"> <br>
        	
          <label>Category: </label>
	         <select name="cid" class="form-control" style="width:20%">
	         	<option value="">--Please choose an option--</option>
	         	<option value="101">Mobile</option>
	         	<option value="102">TV</option>
	         	<option value="103">Laptops</option>
	         	<option value="104">Headphones</option>
	         	<option value="105">Pen drive and Storage</option>
	         	<option value="106">Large Appliances</option>
	          </select> <br> 
         
          <label>Product Name : </label>
          <input type="text" name="name" class="form-control" style="width:20%" placeholder="Name" value=""> <br>
          
          <label>Product Price: </label>
          <input type="number" name="price" class="form-control" style="width:20%" placeholder="Price" value=""> <br>
          
          <label>Quantities of Product : </label>
          <input type="number" name="quantity" class="form-control" style="width:20%" placeholder="Quantity" value=""> <br>
            
          <button type="submit" class="btn btn-primary" name="button">Save  <i class="far fa-save"></i> </button>
        </form> 
        
        <%
	        try
			 {  
	 		Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/billing_software","root", "qwerty");
			PreparedStatement ps = null;
        	String pids = request.getParameter("pid");
        	int pid1 = Integer.parseInt(pids);
        	String cids = request.getParameter("cid");
        	int cid1 = Integer.parseInt(cids);
        	String name1 = request.getParameter("name");
        	String sprice = request.getParameter("price");
        	double price = Double.parseDouble(sprice);
        	String squantity = request.getParameter("quantity");
        	int quantity = Integer.parseInt(squantity);
        	double sgst = price - (price*100)/109;
        	double cgst = price - (price*100)/109;
        	String queryinput = "insert into products values(?,?,?,?,?,?,?)";
        	ps = con.prepareStatement(queryinput);
        	ps.setInt(1, pid1);
        	ps.setInt(2, cid1);
        	ps.setString(3, name1);
        	ps.setDouble(4, price);
        	ps.setInt(5,quantity);
        	ps.setDouble(6, sgst);
        	ps.setDouble(7, cgst);
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
    <script src="js/bootstrap.min.js">
    </script>
    <script type="text/javascript">
    	var request;
    	function deleteData(pid){
    		if(confirm("Are you sure you want to delete this product?")){
    		$.ajax({
    			
    			type: "GET",
    			url: "deleteProduct.jsp?param=1",
    			data: {productid: pid},
    			success: function(data){
    				location.reload(true);
    				alert("Customer with Id : "+pid+" Deleted");
    				}
    			
    		});
    		}
    		else
    			return false; 		
    	}
    </script>

</body>
</html>