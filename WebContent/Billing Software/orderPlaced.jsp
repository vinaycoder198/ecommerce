<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Placed</title>
<link rel="icon" href="images/favicon.ico">
<!-- Font Awesome -->
<script src="https://kit.fontawesome.com/07a7cc3607.js"></script>
<!--navbar menu-->
            <%@include file="navbar.jsp" %> 
<!--sidebar menu-->
            <%@include file="sidebar.jsp" %>
           
            <!-- font -->
            <link href="https://fonts.googleapis.com/css?family=Courgette|Dancing+Script&display=swap" rel="stylesheet">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet" />
<link href="css/bootstrap-theme.css" rel="stylesheet" />
<script src="js/bootstrap.min.js"></script>
	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<style> 

	.a{
	font-size:40px;
	 text-align:center; 
	 color:cornflowerblue ; 
	font-family: 'Dancing Script', cursive;
	
	}
	.b{
		font-size:20px;
		text-align:center;
		color:black;
		font-family:'Dancing Script', cursive;
	}
        
        </style> 
  
</head>
<body  style="background-color:lemonchiffon">
<div class="container">
	<div>
		<h3 class="a" style="" >Your Order is Successfully Placed</h3>
		<h1 style="font-size:80px; text-align:center; color:limegreen; font-family: 'Courgette', cursive;"><i class="far fa-smile-beam"></i>Thank You For Placing Order</h1>
		<h3 class="a">Your order will be Delivered within 7 to 10 Days</h3>
		
	</div>
</div>
<div class="container">
<%
                try{
                	Class.forName("com.mysql.jdbc.Driver");
                	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/billing_software","root","qwerty");
                	int cid = Integer.parseInt(request.getParameter("cusid"));
                	String name = request.getParameter("name");
                	String mobile = request.getParameter("mob");
                	String address = request.getParameter("loc");
                	int quantity[] = new int[15];
                	float price[] = new float[15];
                	int productid[] = new int[15];
                	float pricegst[] = new float[15];
                	int orderid = 0;
                	float tamount = 0;
                	%>
                	
                	<div class="row">
        <div class="col-sm-12 col-md-10 col-md-offset-1">
        <h3 class="a" style="color:red; text-align:left; font-size:30px">Customer details</h3>
                	<table class="table table-hover ">
                	<tr>
                		<td class="col-sm-1 col-md-1 text-center b">Customer Id</td>
                		<td class="col-sm-1 col-md-1 text-center b">Customer Name</td>
                		<td class="col-sm-1 col-md-1 text-center b">Customer Mobile</td>
                		<td class="col-sm-1 col-md-1 text-center b">Customer Address</td>
                	</tr>
                	<tr>
                		<td class="col-sm-1 col-md-1 text-center a" style="font-size:30px; color:#f77fee"><%=cid%></td>
                		<td class="col-sm-1 col-md-1 text-center a" style="font-size:30px; color:#f77fee"><%=name %></td>
                		<td class="col-sm-1 col-md-1 text-center a" style="font-size:30px; color:#f77fee"><%=mobile %></td>
                		<td class="col-sm-1 col-md-1 text-center a" style="font-size:30px; color:#f77fee"><%=address %></td>
                	</tr>
                	</table>
                	</div>
                	</div>

    <div class="row">
        <div class="col-sm-12 col-md-10 col-md-offset-1">
        <h3 class="a" style="color:red; text-align:left; font-size:30px">Order Details</h3>
        <h3 class="a" style="left-margin:200px ; color:#216583 " >Order ID :- <span id="orderid" style="color:#216583"></span></h3>
                	
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th class="text-center b">Product</th>
                        <th class="text-center b">Quantity</th>
                        <th class="text-center b">Price</th>
                        <th class="text-center b">Total</th>
                        <th> </th>
                    </tr>
                </thead>
                <%
                	
                	PreparedStatement ps = con.prepareStatement("select * from demo ");
                	ResultSet rs = ps.executeQuery();
                	int i=0;
                	  while(rs.next()){
                		  productid[i] = rs.getInt("prod_id");  
                		  quantity[i] = rs.getInt("quantity");
                		  price[i] = rs.getFloat("price");
                		  tamount += ((rs.getFloat("price"))*(rs.getInt("quantity")));
                		  pricegst[i] = price[i] - (price[i]*100)/109;
                %>
                <tbody>
           
                    <tr>
                        <td class="col-sm-8 col-md-6">
                        <div class="media">
                            
                            <div class="media-body">
                                <h4 class="media-heading"><a href="#"><%=rs.getString("prod_name") %> </a></h4>
                               
                            </div>
                        </div></td>
                        <td class="col-sm-1 col-md-1" style="text-align: center">
                        <label id="exampleInputEmail1" ><%=rs.getInt("quantity") %></label>
                        </td>
                        <td class="col-sm-1 col-md-1 text-center"><strong><%=rs.getFloat("price") %></strong></td>
                        <td class=" col-sm-1 col-md-1 text-center"><strong class="pprice"><%=((rs.getFloat("price"))*(rs.getInt("quantity"))) %></strong></td>
                        <td class="col-sm-1 col-md-1">    </td>
                    </tr>
                  <% 	i++; 
                  }
                	  rs.close();
                	  ps.close();
                	float sgst = tamount - (tamount*100)/109;
                  	float cgst = tamount - (tamount*100)/109;
                	//inserting data into orders table
                	if(i>0){
                  	ps = con.prepareStatement("insert into orders(cust_id,order_amount,order_sgst,order_cgst) values(?,?,?,?)");
                	  ps.setInt(1, cid);
                	  ps.setFloat(2, tamount);
                	  ps.setFloat(3,sgst);
                	  ps.setFloat(4, cgst);
                	  ps.executeUpdate();
                	  ps.close();
                	}
                	  // getting orderid from order table
                	  ps = con.prepareStatement("select * from orders where cust_id=?");
                	  ps.setInt(1, cid);
                	  rs = ps.executeQuery();
                	  while(rs.next()){
                		  orderid = rs.getInt("order_id");
                	  }
                	  rs.close();
                	  ps.close();
                	  
                	// inserting data into order_details table
                	  ps = con.prepareStatement("insert into order_details(order_id,prod_id,prod_qty,prod_price,prod_sgst,prod_cgst) values(?,?,?,?,?,?)");
                	  int j=0;
                	  while(j<i){
                		  ps.setInt(1,orderid);
                		  ps.setInt(2, productid[j]);
                		  ps.setInt(3, quantity[j]);
                		  ps.setFloat(4, price[j]);
                		  ps.setFloat(5, pricegst[j]);
                		  ps.setFloat(6, pricegst[j]);
                		  ps.executeUpdate();
                		  j++;
                	  }
                	  ps.close();
                	  
                	  // deleting product from cart (demo)
                	  ps = con.prepareStatement("delete from demo ");
                	  ps.executeUpdate();
           	
                	  // updating quantity in database
                	  ps = con.prepareStatement("update products set prod_quan=prod_quan-? where prod_code=?");
                	  int k=0;
                	  while(k<i){
                	  ps.setInt(1, quantity[k]);
                	  ps.setInt(2, productid[k]);
                	  ps.executeUpdate();
                	  k++;
                	  }
           }
           catch(Exception e){
        	   
        	   e.printStackTrace();
           }
           		%>
                    
                    <tr>
                        <td>   </td>
                        <td>   </td>
                   		<td>   </td>
                        <td><h3>Total</h3></td>
                        <td class="text-right"><h3><strong class=" total"></strong></h3></td>
                        
                    </tr>
                    
                </tbody>
            </table>
        </div>
    </div>
</div>

<script type="text/javascript">
	//function for cart products
var total ;
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
				 total = subtotal;
				$('.total').html("Rs. "+total);
			}
	});
	
	$(document).ready(function dosome(){
		$.ajax({
			type: "GET",
			url: "orderload1.jsp?param=5",
			data: {},
			success:function(data){
				$('#orderid').html(data);
			}
				
		})
		
	});

</script>
</body>
</html>