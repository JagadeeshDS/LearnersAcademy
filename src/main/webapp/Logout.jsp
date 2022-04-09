<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	session.invalidate();

	out.println("<script type=\"text/javascript\">");
	out.println("alert('Logged out successfully');");
	out.println("location='default.jsp';");
	out.println("</script>");

	//response.sendRedirect("default.jsp");

	
%>

</body>
</html>