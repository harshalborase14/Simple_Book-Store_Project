<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book Store</title>
<link rel="stylesheet" type="text/css" href="CustomerPage.css">
</head>
<body bgcolor="skyblue">
<center>

		<h1 style="color:red">Shopping Cart for Book Store</h1>
		
		<form action="./CustomerRegister">
		Customer Name : <input type="text" name="name"><br><br>
		Address : <input type="text" name="addr"><br><br>
		Phone No. : <input type="text" name="phone"><br><br>
		Order Date : <input type="date" name="date"><br><br>
		
		Your Order Details are:
		
		<table border="2">
			<tr>
				<th>Book Name</th>
				<th>Author</th>
				<th>Price</th>
				<th>Quantity</th>
				<th>Total Price</th>
			</tr>
			
			
			<%
			try
			{
				ResultSet rs = (ResultSet)session.getAttribute("rs2");
				String Qty=(String)session.getAttribute("Qty");
				int qty=Integer.parseInt(Qty);
				while(rs.next())
				{
					int price=rs.getInt("price");
					%>
					<tr>
						<td><%=rs.getString("book_name") %></td>
						<td><%=rs.getString("author") %></td>
						<td><%=rs.getInt("price") %></td>
						<td><%=qty %></td>
						<td><%=price*qty %></td>
					</tr>
					
					<%
				}
			}
			catch(Exception e)
			{
				System.out.println(e+" in CustomerPage.jsp");
			}
			%>
		</table><br>
		<input  type="submit" value="Confirm"><br>
		</form>
		<form action="Index.jsp">
		<h4><input type="submit" value="Cancel"></h4>
		</form>
</center>
</body>
</html>