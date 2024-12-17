<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to Book Store</title>
<link rel="stylesheet" type="text/css" href="Welcome.css">
</head>
<body bgcolor="skyblue">
<center>
	<h1><b>Book Store</b></h1>
	<table border="2" cellpacing="S" cellpadding="20">
	<tr>
		<td>Book Name</td>
		<td>Author</td>
		<td>Price</td>
	</tr>
	<%
	try
	{
			ResultSet rs = (ResultSet)session.getAttribute("rs");
			System.out.println("Data in WelcomeUser.jsp");
			
			while(rs.next())
			{
			%>
			<tr>
				<td><a href="Book.jsp?BKID=<%=rs.getString("book_ID") %>"><%=rs.getString("book_name") %></a></td>
				<td><%=rs.getString("author") %></td>
				<td><%=rs.getString("price") %></td>
			</tr>
			<%
			}
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
	%>
	</table>
</center>
</body>
</html>