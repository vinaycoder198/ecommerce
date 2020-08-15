<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Category</title>
<link rel="icon" href="images/favicon.ico">
<!-- Font Awesome -->
<!--navbar menu-->
            <%@include file="navbar.jsp" %>
<!--sidebar menu-->
            <%@include file="sidebar.jsp" %>
<script src="https://kit.fontawesome.com/07a7cc3607.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link href="css/bootstrap.css" rel="stylesheet" />
	<link href="css/bootstrap-theme.css" rel="stylesheet" />
	<script src="js/bootstrap.min.js"></script>
	<script src="https://kit.fontawesome.com/07a7cc3607.js"></script>
	<style> 

	
            table, thead, td,th{ 
                border: 2px solid green; 
                text-align:center; 
            } 
            th{
            	border: 2px solid green;
            	padding: 40px;
             	background-color:lightgreen; 
             	
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
          <legend>All Categories</legend>
        </fieldset>
        	
        	<marquee direction="right" style=" font-size:25px" bgcolor="cyan" ><b>List of Categories</b></marquee>
	<table border="2" class="table table-bordered table-striped " style="text-align:center" >
		<tr>
			<th>Category Id</th>
			<th>Category Name</th>
			<th>Category Details</th>
			
		</tr>
		
		<% 
			 try
			 {  
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/billing_software","root", "qwerty");
			Statement smt = null;
			ResultSet rs = null;
			smt = con.createStatement();
				
				
				String query = "select * from categories";
				rs = smt.executeQuery(query);
				while(rs.next())
				
				{
		%>
					<tbody>
			<tr height="50px">	
				<td style="width:10%;"><%=rs.getString("cat_id") %></td>
				<td style="width:20%;"><%=rs.getString("cat_name") %></td>
		   		<td style="width:20%;"><%=rs.getString("cat_details") %></td>
				
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
          <legend>Create Category </legend>
        </fieldset>
        <form class="" >
        
          <label>Category Id : </label>
         <input type="number" name="cid" class="form-control" style="width:20%" style="display:block" placeholder="ID"> <br>
         
          <label>Category Name : </label>
          <input type="text" name="name" class="form-control"; style="width:20%" placeholder="Name" value=""> <br>
          
          <label>Category Details : </label>
          <input type="text" name="details" class="form-control"; style="width:20%" placeholder="Details" value=""> <br>
        
          <button type="submit" onclick="myFunction()" class="btn btn-primary" name="button">Save  <i class="far fa-save"></i> </button>
       
        </form> 
        
        <%
	        try
			 {  
	 		Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/billing_software","root", "qwerty");
			PreparedStatement ps = null;
        	String ids = request.getParameter("cid");
        	String name1 = request.getParameter("name");
        	String details1 = request.getParameter("details");
        	int id1 = Integer.parseInt(ids);
        	String queryinput = "insert into categories values(?,?,?)";
        	ps = con.prepareStatement(queryinput);
        	ps.setInt(1, id1);
        	ps.setString(2, name1);
        	ps.setString(3, details1);
        	ps.executeUpdate();
        	con.close();
			 }
		catch(Exception e){
			e.printStackTrace();
		}
        %>   
  </div> <br> <br> <br>
  
  <div class="footer">
  	<h5>Created by: Vinay Pandit</h5>
  
  </div>

  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>

</body>
</html>