<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@page import="db.academy.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

</head>
<body>
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
	<center>
		<h1>Add Teacher Details</h1>

		<div class="w3-sidebar w3-light-grey w3-bar-block" style="width: 25%">
			<h3 class="w3-bar-item">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Menu</h3>
			<a href="Showclass.jsp" class="w3-bar-item w3-button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				Show Class</a> <a href="Subject.jsp" class="w3-bar-item w3-button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Add
				Subject</a> <a href="Teacher.jsp" class="w3-bar-item w3-button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Add
				Teacher</a> <a href="Student.jsp" class="w3-bar-item w3-button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Add
				Student</a> <a href="Logout.jsp" class="w3-bar-item w3-button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Logout</a>
		</div>

		<form action="TeacherServlet" method="get">

			<table>
				<tr>
					<td>Teacher Name :</td>
					<td><input type="text" name="tname" placeholder="Full Name"></td>
				</tr>
				<tr>
					<td>Email :</td>
					<td><input type="email" name="temail" placeholder="Email"></td>
				</tr>
				<tr>
					<td>Subject :</td>
					<td><input type="text" name="tSubject" placeholder="Subject"></td>
				</tr>
			</table>

			<input type="submit" value="submit">&nbsp;&nbsp;<input
				type="reset" value="Reset">
		</form>


		<h2>Teachers Details</h2>
		<table border="1px">
			<tr>
				<td>ID</td>
				<td>Name</td>
				<td>Email</td>
				<td>Subject</td>
				<td>Action</td>
			</tr>

			<%
			try {
				Login db = new Login();
				Connection connect = db.dbConnection();
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				Statement st = connect.createStatement();
				String query = "select * from teacher";
				ResultSet rSet = st.executeQuery(query);
				while (rSet.next()) {
			%>
			<tr>
				<form action="TeacherServlet" method="get">
				<td><%=rSet.getInt("id")%>
				<input type="hidden" name="tid" value="<%=rSet.getInt("id")%>"></td>
				<td><%=rSet.getString("Name")%></td>
				<td><%=rSet.getString("emali")%></td>
				<td><%=rSet.getString("Subject")%></td>
				<td><input type="submit" name="delete" value="Delete" /></td>
				</form>
			</tr>
			<%
			}
			} catch (Exception e) {
			e.printStackTrace();
			}
			%>

		</table>
	</center>
</body>
</html>