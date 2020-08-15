<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*"
    pageEncoding="ISO-8859-1"%>
<%
	if(Integer.parseInt(request.getParameter("param"))==1)
	{
	int cat = Integer.parseInt(request.getParameter("category"));
	try{
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/billing_software","root", "qwerty");
			
      	ResultSet rs1 = null;
      	String queryp = "select * from products where cat_id= ?";
      	PreparedStatement ps = con.prepareStatement(queryp);
      	ps.setInt(1, cat);
      	
      	rs1 = ps.executeQuery();
  	%>
  	<option value="#">Select Products</option>
  	<%
  	while(rs1.next())
 		{%>
 		<option value="<%=rs1.getString("prod_code")%>"><%=rs1.getString("prod_name")%>- Rs.<%=rs1.getString("prod_price") %></option>
 	<%} 
	}
	catch(Exception e)
	{
		out.print(e);
		e.printStackTrace();
	}
	}
	else if(Integer.parseInt(request.getParameter("param"))==2)
	{
		try{
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		int prodId = Integer.parseInt(request.getParameter("productSelected"));
		
		 Class.forName("com.mysql.jdbc.Driver");
		 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/billing_software","root","qwerty");
		 PreparedStatement ps = con.prepareStatement("select prod_quan from products where prod_code=?");
		 ps.setInt(1, prodId);
		 ResultSet rs = ps.executeQuery();
		while(rs.next()){
			int avalQuan = rs.getInt("prod_quan");
			if(avalQuan>quantity){
		 out.print(
				 "<h5 style=text-color: red>Quantity available</h5>"
             );
			}
			else
			{
				out.print(
						"<h5 style=text-color: red>Maximum quantity allowed exceeds, Maximum quantity allowed : "+(avalQuan-1)+"</h5>");
			}
		}
		 
	}
	catch(Exception e)
		{
			out.print("Enter Valid Quantity");
			e.printStackTrace();
		}
	}
	else if(Integer.parseInt(request.getParameter("param"))==3){
		try{
			int catId = Integer.parseInt(request.getParameter("catid"));
			String catName = request.getParameter("catname");
			int prodId = Integer.parseInt(request.getParameter("prodid"));
			String[] pn = (request.getParameter("prodname")).split("-");
			String prodName = null;
			float price = 0;
			if(catId==103){
				prodName = pn[0]+pn[1];
				price = Float.parseFloat((pn[2]).substring(4));}
			else{
				prodName = pn[0];
			price = Float.parseFloat((pn[1]).substring(4));}
			
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/billing_software","root","qwerty");
			PreparedStatement ps = con.prepareStatement("insert into demo (prod_id,prod_name,cat_id,cat_name,price,quantity) values(?,?,?,?,?,?)");
			ps.setInt(1, prodId);
			ps.setString(2, prodName);
			ps.setInt(3, catId);
			ps.setString(4, catName);
			ps.setFloat(5, price);
			ps.setInt(6, quantity);
			ps.executeUpdate();
			ps.close();
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	
	else if(Integer.parseInt(request.getParameter("param"))==4)
	{
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/billing_software","root","qwerty");
			PreparedStatement ps = con.prepareStatement("select * from demo");
			ResultSet rs = ps.executeQuery();
			int count=0;
			while(rs.next()){
				count++;
			}
			out.print(
					""+count
					);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

	else if(Integer.parseInt(request.getParameter("param"))==5)
	{
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/billing_software","root","qwerty");
			String ordid = null;
			PreparedStatement ps = con.prepareStatement("select * from orders");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				ordid = rs.getString("order_id");
			}
			out.print(
					""+ordid
					);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
%>
