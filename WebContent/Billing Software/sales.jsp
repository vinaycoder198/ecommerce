<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.* "
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href="images/favicon.ico">
<title>Sales</title>
<!-- Font Awesome -->
<script src="https://kit.fontawesome.com/07a7cc3607.js"></script>

<link href="css/bootstrap.css" rel="stylesheet" />
	<link href="css/bootstrap-theme.css" rel="stylesheet" />
	<script src="js/bootstrap.min.js"></script>
	
	<style> 
            html, body, #container {
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
}
        </style> 
		
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

</head>

 <body style="background-color:lemonchiffon">
			
			<!--navbar menu-->
            <%@include file="navbar.jsp" %>
           		<script src="https://static.anychart.com/js/8.0.1/anychart-core.min.js"></script>
<script src="https://static.anychart.com/js/8.0.1/anychart-pie.min.js"></script>
<script src="https://cdn.anychart.com/releases/8.7.1/js/anychart-base.min.js"></script>
<div id="101">
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/billing_software", "root", "qwerty");
	PreparedStatement ps = con.prepareStatement("select * from order_details");
	ResultSet rs = ps.executeQuery();
	int mob=0,tel=0,hed=0,lap=0,pen=0,app=0;
	while(rs.next())
	{
		if(rs.getInt("cat_id")==101)
		{
			mob = mob + (rs.getInt("prod_qty"));
		}
		else if(rs.getInt("cat_id")==102)
		{
			tel = tel + (rs.getInt("prod_qty"));
		}
		else if(rs.getInt("cat_id")==103)
		{
			lap = lap + (rs.getInt("prod_qty"));
		}
		else if(rs.getInt("cat_id")==104)
		{
			hed = hed + (rs.getInt("prod_qty"));
		}
		else if(rs.getInt("cat_id")==105)
		{
			pen = pen + (rs.getInt("prod_qty"));
		}
		else if(rs.getInt("cat_id")==106)
		{
			app = app + (rs.getInt("prod_qty"));
		}
	}

%>
<span id="1"><%=mob %></span>
<span id="2"><%=tel %></span>
<span id="3"><%=lap %></span>
<span id="4"><%=hed %></span>
<span id="5"><%=pen %></span>
<span id="6"><%=app %></span>

</div>

<div id="container"></div>
  	
	<br> <br>
  <div>
  	<h5>Created by: Vinay Pandit</h5>
  
  </div>
<script type="text/javascript">
anychart.onDocumentReady(function() {
	$('#101').hide();
	
	var mob = $('#1').html();
	var tel = $('#2').html();
	var hed = $('#3').html();
	var lap = $('#4').html();
	var pen = $('#5').html();
	var app = $('#6').html();
	
	
	  // set the data
	  var data = [
	      {x: "Mobile", value: mob},
	      {x: "Television", value: tel},
	      {x: "Headphones", value: hed},
	      {x: "Laptops", value: lap},
	      {x: "Pen Drives and Storage", value: pen},
	      {x: "Large Appliances", value: app},
	      
	  ];

	  // create the chart
	  chart = anychart.pie(data);

	  // set the chart title
	  chart.title("Category - Wise Sales Report");

	  // add the data
	  //chart.data(data);

	  // display the chart in the container
	  chart.container('container');
	  chart.draw();

	});
</script>
</body>
</html>