<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*"
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
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<link rel="stylesheets" href="orderGrid.css">
<style>

			.title:hover{
				color:blue;
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
			.fa:hover{
			color: blue;
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
</head>
<body style="background-color:lemonchiffon">
<p id="datetime" style="margin-left:85%; color:royalblue;"></p> 
<div class="container">
	
</div>
 <div class="container">
 	<div class="col-lg-10">
 	<fieldset>
 		<legend><h2>Category</h2></legend>
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
	         <h4><b>Select Category </b></h4>
	         <select class="form-control" id="cat-sel" style="width:20%">
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
 	</div>
 	<div class="col-lg-2">
				
	  			<br><br>
	  			<a href="cart.jsp"><i class="fa" style="font-size:50px; color:darkorchid;">&#xf07a;</i>
				<span class='badge badge-warning' id='lblCartCount'></span></a>
	  </div>
	</div>
	<div class="container">
    <h2>Products</h2><hr>
    <div class="row form-group product-chooser">
	<%
    		try{
    			Class.forName("com.mysql.jdbc.Driver");
    			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/billing_software","root","qwerty");
    			PreparedStatement ps = con.prepareStatement("select * from products ");
    			ResultSet rs = ps.executeQuery();
    			int i=0;
    			while(rs.next()){
    			%>  
      	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 <%=rs.getInt("cat_id") %>"  style="height:auto; width:32%;margin:0px 5px 10px 0px;border:1px ridge black; padding:20px; overflow:hidden;">
    		<div class="product-chooser-item selected"  style="align-content:center;">
    			<img src="images/office.jpg" style="width:auto; height:auto; margin-bottom:10px " class="img-responsive col-xs-4 col-sm-4 col-md-12 col-lg-12 imageChange" alt="Product Image"><br><br><br>
                <div class="card col-xs-8 col-sm-8 col-md-12 col-lg-12 " id=" " >
                	<div style="height:120px">
    				<span class="title" style="font-size:17px;"><b><%=rs.getString("prod_name") %></b></span><br><br>		
    				<span class="description"><b>Price : &#8377; <%=rs.getString("prod_price") %></b></span><br><br>
    				</div>
    				<span>Quantity : <input placeholder="1" class="form-control quantity" function="onkeyup(this.id)" id="<%=rs.getString("prod_code") %>" style="width:15%; display:inline;"></span>
    				<button class="btn btn-primary btn-group-lg" style="margin-left:100px; " onclick="add(this.id,this.name)" id="<%=rs.getString("prod_code") %>" name="<%=rs.getString("prod_name") %>- Rs.<%=rs.getString("prod_price") %>"> Add   <i class="fas fa-cart-plus"></i></button><br>
    				<br>
    			</div>
    			<div class="clearfix"></div>
    			
    		</div>
    		<br/>
    	</div>
    
    		<%	
    		i++;
    		}
    			}
    		catch(Exception e)
    {
    			e.printStackTrace();
    }
    
    %>
    </div>	
</div>	

	<script type="text/javascript">
	var dt = new Date();
	document.getElementById("datetime").innerHTML = dt.toLocaleString();
	$('.101').hide();
	$('.102').hide();
	$('.103').hide();
	$('.104').hide();
	$('.105').hide();
	$('.106').hide();

	
	// quantity pop
	
	
	
	//Quantity
	var quan = 1;
	$('.quantity').keyup(function(){
		//alert("hello");
		quan = this.value;
		//alert(quan);
	});
	
		
		
		//Add to cart
		function add(pid, pname){
		
			//alert(pid);
			//alert(pname);
			$.ajax({
				type: "GET",
				url: "orderload1.jsp?param=3",
				data: {catid: $('#cat-sel').val(),
						catname: $('#cat-sel option:selected').html(),
						prodid: pid,
						prodname:pname,
						quantity: quan },
				success: function(data){
					location.reload(true);
				}
			});
		}
		
		/*$('#addToCart').click(
				function(){
					$.ajax({
						type: "GET",
						url: "orderload1.jsp?param=3",
						data: {catid: $('#cat-sel').val(),
								catname: $('#cat-sel option:selected').html(),
								prodid: $('#prod-sel').val(),
								prodname: $('#prod-sel option:selected').html(),
								quantity: 1 },
						success: function(data){
							location.reload(true);
						}
					});
				}		
			); */
			
		
		//selecting category
		var catid ;
		$('#cat-sel').change(function(){
			catid= $('#cat-sel').val();
			
			if(catid==101){
				$('.imageChange').attr('src', "images/mobile.jpg");
				$('.101').show();
				$('.102').hide();
				$('.103').hide();
				$('.104').hide();
				$('.105').hide();
				$('.106').hide();
			}
			
			else if(catid==102){
				$('.imageChange').attr('src', "images/tv.jpg");
				$('.101').hide();
				$('.102').show();
				$('.103').hide();
				$('.104').hide();
				$('.105').hide();
				$('.106').hide();
			}
			
			else if(catid==103){
				$('.imageChange').attr('src', "images/laptop.jpg");
				$('.101').hide();
				$('.102').hide();
				$('.103').show();
				$('.104').hide();
				$('.105').hide();
				$('.106').hide();
			}
			
			else if(catid==104){
				$('.imageChange').attr('src', "images/headphone.jpg");
				$('.101').hide();
				$('.102').hide();
				$('.103').hide();
				$('.104').show();
				$('.105').hide();
				$('.106').hide();
			}
			
			else if(catid==105){
				$('.101').hide();
				$('.102').hide();
				$('.103').hide();
				$('.104').hide();
				$('.105').show();
				$('.106').hide();
			}
			
			else if(catid==106){
				$('.101').hide();
				$('.102').hide();
				$('.103').hide();
				$('.104').hide();
				$('.105').hide();
				$('.106').show();
			}
		});
		
		

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
		
		
		
		/*$('.101').click(function(){
			$('.102').hide();
			$('.103').hide();
			$('.104').hide();
			$('.105').hide();
			$('.106').hide();
		});*/
	</script>
</body>
</html>