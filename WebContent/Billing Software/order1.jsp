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
            p{
            text-color:red;
            } 
            
            <!-- style for cart icon -->
            .badge {
			  padding-left: 9px;
			  padding-right: 9px;
			  -webkit-border-radius: 9px;
			  -moz-border-radius: 9px;
			  border-radius: 9px;
			}
			
			.label-warning[href],
			.badge-warning[href] {
			  background-color: #c67605;
			}
			#lblCartCount {
			    font-size: 20px;
			    background: #ff0000;
			    color: #fff;
			    padding: 0 5px;
			    vertical-align: top;
			    margin-left: -10px; 
			}
     </style> 
		
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

</head>

<body style="background-color:lemonchiffon">
<p id="datetime" style="margin-left:85%; color:royalblue;"></p> 
		<div class="container">
		<div class="col-lg-10">
        <fieldset>
          <legend>Place Order</legend> 
        </fieldset>
        <div id="category">
       
	         	<%
	         		try{
	         			Class.forName("com.mysql.jdbc.Driver");
	        			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/billing_software","root", "qwerty");
	        			Statement smt = con.createStatement();
	        			ResultSet rs = null;
	        			rs = smt.executeQuery("select * from categories ");
	        			
	         		
	         	%>
	         <label>Select Category  </label>
	         <select class="form-control" name="cat-sel" id="cat-sel" style="width:20%">
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
	          
	          </div><br>
	          <div id="product">
	          <label>Select Products </label>
	          <select id="prod-sel" name="prod-sel" class="form-control" style="width:20%">
	          	<option>Select Category</option>
	          </select>
	  		</div><br>
	  		<div id="quantityDiv">
	  			<label>Enter Quantity </label>
	  			<input type="number" id="quantity" name="quantity" autocomplete="off" class="form-control" style="width:20%" placeholder="Enter Quantity">
	  		</div><br>
	  		<h5 id="sample">
	  		</h5>
	  		<br/>
	  		<div id="button">
	  			<button type="submit" id="addToCart" class="btn btn-primary btn-group-lg" name="button">Add to Cart  <i class="fas fa-cart-plus"></i> </button>
	  		</div>
	  		</div>
	  		<div class="col-lg-2">
				
	  			<br><br>
	  			<a href="cart.jsp"><i class="fa" style="font-size:50px; color:darkorchid;">&#xf07a;</i>
				<span class='badge badge-warning' id='lblCartCount'></span></a>
	  		</div>
	   </div>
	   <br><br> 
	    <div class="footer">
  	<h5>Created by: Vinay Pandit</h5>
  
  </div>
	<script type="text/javascript">
	var dt = new Date();
	document.getElementById("datetime").innerHTML = dt.toLocaleString();
		var request;
		
			$category = $('#cat-sel');
			
			$category.change(
				function(){
					$.ajax({
						type: "GET",
						url: "orderload1.jsp?param=1",
						data: {category: $category.val()},
						success: function(data){
							$('#prod-sel').html(data)
						}
					});
				}
			);
			var request;
			$quan = $('#quantity');
			
			$quan.keyup(
				function(){
					//$('#sample').html($quan.val());
					$.ajax({
						type: "POST",
						url: "orderload1.jsp?param=2",
						data: {quantity: $quan.val(),
								productSelected: $('#prod-sel').val()},
						success:function(data){
							$('#sample').html(data)
						}
					});		
				}
			);
			
			//Add to cart
			$('#addToCart').click(
					function(){
						$.ajax({
							type: "GET",
							url: "orderload1.jsp?param=3",
							data: {catid: $('#cat-sel').val(),
									catname: $('#cat-sel option:selected').html(),
									prodid: $('#prod-sel').val(),
									prodname: $('#prod-sel option:selected').html(),
									quantity: $('#quantity').val() },
							success: function(data){
								location.reload(true);
							}
						});
					}		
				);
			
			//cart quantity
			$(document).ready(function dosome(){
				$.ajax(
						{
							type: "GET",
							url: "orderload1.jsp?param=4",
							data: {maths: 10},
							success: function(data){
							
								$('#lblCartCount').html(data);
							}
						})
				
			}
			);
			
			
			//alert("button clicked"+$('#prod-sel option:selected').html());
			//alert($('#quantity').val());
			//<a href="cart.jsp"><button type="submit" class="btn btn-primary" name="button">Go to Cart <i class="fas fa-shopping-cart"></i> </button></a>
	</script>
</body>
</html>
