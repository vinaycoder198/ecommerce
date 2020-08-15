<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		if(Integer.parseInt(request.getParameter("param"))==1){
		int id = Integer.parseInt(request.getParameter("productid"));
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/billing_software","root", "qwerty");
			
      	
      	String queryp = "delete from products where prod_code=?";
      	PreparedStatement ps = con.prepareStatement(queryp);
      	ps.setInt(1, id);
      	ps.executeUpdate();
		}
		catch(Exception e)
		{
			
			e.printStackTrace();
		}
		}
		
		else if(Integer.parseInt(request.getParameter("param"))==2)
		{
			int id =Integer.parseInt(request.getParameter("productid"));
			try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/billing_software","root","qwerty");
				PreparedStatement ps = con.prepareStatement("delete from demo where prod_id=?");
				ps.setInt(1,id);
				ps.executeUpdate();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		
		//remove customer
		else if(Integer.parseInt(request.getParameter("param"))==3)
		{
			int id = Integer.parseInt(request.getParameter("custid"));
			try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/billing_software","root", "qwerty");
				
	      	
	      	String queryp = "delete from customers where cust_id=?";
	      	PreparedStatement ps = con.prepareStatement(queryp);
	      	ps.setInt(1, id);
	      	ps.executeUpdate();
			}
			catch(Exception e)
			{
				
				e.printStackTrace();
			}
			
		}
	%>
</body>
</html>