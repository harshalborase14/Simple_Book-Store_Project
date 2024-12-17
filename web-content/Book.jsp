<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="skyblue">

	<%
		String bkid=request.getParameter("BKID");
		System.out.println("Clickable Book ID in Book.jsp"+bkid);
		
		session.setAttribute("bid",bkid);
		
		response.sendRedirect("./Purchase");
	%>

</body>
</html>