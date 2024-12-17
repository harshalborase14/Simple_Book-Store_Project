<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Purchase Page</title>
<link rel="stylesheet" type="text/css" href="PurchasePage.css">
</head>
<body bgcolor="skyblue">
<center>

<div class="form">

		<h1 style="color:red">Shopping cart for book store</h1>
		<h2 style="color:green">Selected Book Details are displayed</h2>
		
		<form action ="./Customer">
			<%
			try
			{
				ResultSet rs =(ResultSet)session.getAttribute("rs1");
				while(rs.next())
				{
					%>
					Book Name : <%=rs.getString("book_name") %><br>
					Author : <%=rs.getString("author") %><br>
					Price : <%=rs.getInt("price") %><br>
					<% 
				}
				
			}
			catch(Exception e)
			{
				System.out.println(e+"in PurchasePage.jsp");
			}
			%>
			
			<h4>Quantity : <input type="text" name="Quantity"></h4>
			<input type="submit" value="purchase">
			
		</form>
		<br>
		
		<form action="Index.jsp">
			<input type="submit" value="cancel">
		</form>
</div>
</center>
</body>
</html>