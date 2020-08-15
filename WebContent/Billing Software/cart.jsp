<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart</title>
<link rel="icon" href="images/favicon.ico">
<!--navbar menu-->
            <%@include file="navbar.jsp" %>
<!--sidebar menu-->
            <%@include file="sidebar.jsp" %>
<!-- Font Awesome -->
<script src="https://kit.fontawesome.com/07a7cc3607.js"></script>

<link href="css/bootstrap.css" rel="stylesheet" />
	<link href="css/bootstrap-theme.css" rel="stylesheet" />
	
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
</head>

<body style="background-color:lemonchiffon">
	

<div class="container">
    <div class="row">
        <div class="col-sm-12 col-md-10 col-md-offset-1">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th class="text-center">Price</th>
                        <th class="text-center">Total</th>
                        <th> </th>
                    </tr>
                </thead>
                <%
                try{
                	Class.forName("com.mysql.jdbc.Driver");
                	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/billing_software","root","qwerty");
                	PreparedStatement ps = con.prepareStatement("select * from demo ");
                	ResultSet rs = ps.executeQuery();
                %>
                <tbody>
           <%     while(rs.next()){%>
                    <tr>
                        <td class="col-sm-8 col-md-6">
                        <div class="media">
                            <a class="thumbnail pull-left" href="#"> <img class="media-object" src="http://icons.iconarchive.com/icons/archigraphs/mac/64/iPhone-icon.png" style="width: 72px; height: 72px;"> </a>
                            <div class="media-body">
                                <h4 class="media-heading"><a href="#"><%=rs.getString("prod_name") %></a></h4>
                                <h5 class="media-heading"> Category : <a href="#"><%=rs.getString("cat_name") %></a></h5>
                                <span>Status: </span><span class="text-success"><strong>In Stock</strong></span>
                            </div>
                        </div></td>
                        <td class="col-sm-1 col-md-1" style="text-align: center">
                        <label id="exampleInputEmail1" ><%=rs.getString("quantity")%></label>
                        </td>
                        <td class="col-sm-1 col-md-1 text-center"><strong><%=rs.getFloat("price") %></strong></td>
                        <td class=" col-sm-1 col-md-1 text-center"><strong class="pprice"><%=((rs.getFloat("price"))*(rs.getInt("quantity"))) %></strong></td>
                        <td class="col-sm-1 col-md-1">
                        <button type="button" class="btn btn-danger " onclick="deleteProduct(this.id)" id="<%=rs.getInt("prod_id")%>">
                            <span class="glyphicon glyphicon-remove"></span> Remove
                        </button></td>
                    </tr>
                  <%  }
           
           }
           catch(Exception e){
        	   e.printStackTrace();
           }
           		%>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h5>Subtotal</h5></td>
                        <td class="text-right "><h5><strong class="subtotal"></strong></h5></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h5>Estimated shipping</h5></td>
                        <td class="text-right"><h5><strong class="shipping"></strong></h5></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                   		<td>   </td>
                        <td><h3>Total</h3></td>
                        <td class="text-right"><h3><strong class=" total"></strong></h3></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>
                        <a href="orderGrid.jsp"><button type="button" class="btn btn-default">
                          <span class="glyphicon glyphicon-shopping-cart"></span> Continue Shopping
                        </button></a></td>
                        <td>
                       <a href="login.jsp"> <button type="button" class="btn btn-success" >
                            Checkout <span class="glyphicon glyphicon-play"></span>
                        </button></a></td>
                        <td>   </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
 <div class="footer">
  	<h5>Created by: Vinay Pandit</h5>
  
  </div>
<script type="text/javascript">
	//function for cart products
	$(function(){
		var prices = $('.pprice');
		var subtotal=0;
		for(var i=0;i<prices.length;i++){
			subtotal +=  $(prices[i]).html() << 0 ;
			}
		$('.subtotal').html("Rs. "+subtotal);
		if(subtotal<20000 && subtotal>0){
			$('.shipping').html("Rs. 200");
		var total = subtotal+200;
		$('.total').html("Rs. "+total);
		}
		else
			{
				$('.shipping').html("Free");
				var total = subtotal;
				$('.total').html("Rs. "+total);
			}
	});
	
	//function for removing product
	function deleteProduct(pid){
		if(confirm("Do you want to Remove this Product?")){
		$.ajax({
			type: "GET",
			url: "deleteProduct.jsp?param=2",
			data: {productid : pid},
			success: function(data){
				location.reload(true);
				alert("Product Removed");
			}
		})
		}	
		else
			return false;
	}
	
	
	
	
</script>
</body>
</html>