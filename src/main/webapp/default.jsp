<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h1>Welcome to Learners Academy</h1>
		<img alt="" src="Img/Academy.jpg" width="350" height="150">

		<form action="LoginServlet" method="post">
			UserName : <input type="text" value="username" name="uname"></br>
			</br> Password : <input type="password" value="password" name="pswd"></br>
			</br> <input type="submit" value="Submit">
		</form>
		<%
		String login_msg = (String) request.getAttribute("error");
		if (login_msg != null)
			out.println("<font color=red size=4px>" + login_msg + "</font>");
		%>
	</center>
</body>
</html>