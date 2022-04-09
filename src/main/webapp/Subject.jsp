<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Subject Add</title>
</head>
<body>
	<%
	String name = String.valueOf(session.getAttribute("username"));
	/* if (name == "null") {
		out.println("<script type=\"text/javascript\">");
		out.println("alert('Record Deleted');");
		out.println("location='default.jsp';");
		out.println("</script>");
	} */
	
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
		<h1>Add Subject Details</h1>

		<div class="w3-sidebar w3-light-grey w3-bar-block" style="width: 25%">
			<h3 class="w3-bar-item">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Menu</h3>
			<a href="Showclass.jsp" class="w3-bar-item w3-button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				Show Class</a> <a href="Subject.jsp" class="w3-bar-item w3-button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Add
				Subject</a> <a href="Teacher.jsp" class="w3-bar-item w3-button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Add
				Teacher</a> <a href="Student.jsp" class="w3-bar-item w3-button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Add
				Student</a> <a href="Logout.jsp" class="w3-bar-item w3-button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Logout</a>
		</div>

		<form action="SubjectServlet" method="get">
			<table>
				<tr>
					<td>Subject Name :</td>
					<td><input type="text" name="Sname" placeholder="Subject Name"></td>
				</tr>
				<tr>
					<td>Time :</td>
					<td><input type="text" name="Stime" placeholder="Time"></td>
				</tr>
			</table>
			<input type="submit" value="submit">&nbsp;&nbsp;<input
				type="reset" value="Reset">
		</form>

		<h2>Subject List</h2>
		<table border="1px">
			<tr>
				<td>ID</td>
				<td>Name</td>
				<td>Time</td>
			</tr>

			<%
			try {
				System.out.println("Inside JSP before db conection");
				String url = "jdbc:sqlserver://LAPTOP-UHCHDTEN\\\\MSSQLSERVER:1434;databaseName=LearnersAcademy";
				String username = "sa";
				String pswd = "jaggu";
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				Connection conn = DriverManager.getConnection(url, username, pswd);
				Statement st = conn.createStatement();
				String query = "select * from subject";
				ResultSet rSet = st.executeQuery(query);
				while (rSet.next()) {
			%>
			<tr>
				<td><%=rSet.getInt("id")%></td>
				<td><%=rSet.getString("Name")%></td>
				<td><%=rSet.getString("Time")%></td>
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