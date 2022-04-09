<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
		<h1>Enter Subject Name</h1>

		<div class="w3-sidebar w3-light-grey w3-bar-block" style="width: 25%">
			<h3 class="w3-bar-item">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Menu</h3>
			<a href="Showclass.jsp" class="w3-bar-item w3-button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Show
				Class</a> <a href="Subject.jsp" class="w3-bar-item w3-button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Add
				Subject</a> <a href="Teacher.jsp" class="w3-bar-item w3-button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Add
				Teacher</a> <a href="Student.jsp" class="w3-bar-item w3-button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Add
				Student</a> <a href="Logout.jsp" class="w3-bar-item w3-button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Logout</a>
		</div>

		<form action="Showclass.jsp" method="get">

			<table>
				<tr>
					<td>Enter Subject Name :</td>
					<td><input type="text" name="sname"
						placeholder="Enter Subject Name"></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="Submit">&nbsp;&nbsp;&nbsp;<input type="reset" value="Reset"></td>
				</tr>
			</table>
			<div style="text-align: center">
				<h3>Subject Available</h3>
			</div>

			<table border="1px">

				<tr>
					<td>Subject</td>
					<td>Time</td>
					<td>Student</td>
					<td>Teacher</td>
				</tr>

				<%
				try {
					String subnames = (String)request.getParameter("sname");
					String url = "jdbc:sqlserver://LAPTOP-UHCHDTEN\\\\MSSQLSERVER:1434;databaseName=LearnersAcademy";
					String username = "sa";
					String pswd = "jaggu";
					Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
					Connection conn = DriverManager.getConnection(url, username, pswd);
					Statement st = conn.createStatement();
					String query = "select subject.Name as 'Subject',subject.Time,Student.S_Name as 'Student',teacher.Name as'Teacher' from Student,teacher,subject where subject.Name = teacher.Subject and Student.S_Subject = subject.Name and subject.Name = '"+subnames+"'";
					ResultSet rSet = st.executeQuery(query);
					while (rSet.next()) {
				%>
				<tr>
					<td><%=rSet.getString("Subject")%></td>
					<td><%=rSet.getString("Time")%></td>
					<td><%=rSet.getString("Student")%></td>
					<td><%=rSet.getString("Teacher")%></td>
				</tr>
				<%
				}
				} catch (Exception e) {
				e.printStackTrace();
				}
				%>

			</table>

		</form>

	</center>

</body>
</html>