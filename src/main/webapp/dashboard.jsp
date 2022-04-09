<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<!-- https://www.w3schools.com/w3css/tryit.asp?filename=tryw3css_sidebar -->
	<center>
		<h1>Dash Board</h1>
	</center>

	<%
	String name = String.valueOf(session.getAttribute("username"));
	if (name == "null") {
		response.sendRedirect("default.jsp");
	}
	if(request.getSession(false) == null) {
	    response.sendRedirect("default.jsp");
	}
	%>
	Welcome :
	<%=name%>
	<div class="w3-sidebar w3-light-grey w3-bar-block" style="width: 25%">
		<h3 class="w3-bar-item">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Menu</h3>
		<a href="Showclass.jsp" class="w3-bar-item w3-button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			Show Class</a> <a href="Subject.jsp" class="w3-bar-item w3-button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Add
			Subject</a> <a href="Teacher.jsp" class="w3-bar-item w3-button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Add
			Teacher</a> <a href="Student.jsp" class="w3-bar-item w3-button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Add
			Student</a> <a href="Logout.jsp" class="w3-bar-item w3-button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Logout</a>
	</div>

</body>
</html>