<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*"
    pageEncoding="ISO-8859-1"%>

<%
		if(Integer.parseInt(request.getParameter("param"))==1){
			int id = Integer.parseInt(request.getParameter("userid"));
			String password = request.getParameter("pass");
			
			try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/billing_software","root","qwerty");
				
				String mobile = null;
				String name = null;
				String mob = null;
				String address = null;
				PreparedStatement ps = con.prepareStatement("select * from customers where cust_id=?");
				ps.setInt(1, id);
				ResultSet rs = ps.executeQuery();
				while(rs.next()){
					mobile = rs.getString("cust_mobile");
					name = rs.getString("cust_name");
					mob = rs.getString("cust_mobile");
					address = rs.getString("cust_address");
				}
				rs.close();
				ps.close();
				con.close();
				if(password.equals(mobile))
				{
					out.print("yes"+name+"*"+mob+"*"+address);
				}
				else
					out.print("no");
					
			}
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
		}
		%>
