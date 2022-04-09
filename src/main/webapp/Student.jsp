<%@page import="jakarta.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="org.eclipse.jdt.internal.compiler.ast.IfStatement"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@page import="model.academy.Student"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="org.eclipse.jdt.internal.compiler.ast.ForeachStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
/* table {  
  border: 1px solid #ddd;
  text-align: center;
}

th, td {
	border: 1px;
  padding: 1px;
}
/* tr {
  border-bottom: 1px solid #ddd;
} */
*
/
</style>
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
		<h1>Student Add Page</h1>
		<div class="w3-sidebar w3-light-grey w3-bar-block" style="width: 25%">
			<h3 class="w3-bar-item">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Menu</h3>
			<a href="Showclass.jsp" class="w3-bar-item w3-button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				Show Class</a> <a href="Subject.jsp" class="w3-bar-item w3-button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Add
				Subject</a> <a href="Teacher.jsp" class="w3-bar-item w3-button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Add
				Teacher</a> <a href="Student.jsp" class="w3-bar-item w3-button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Add
				Student</a> <a href="Logout.jsp" class="w3-bar-item w3-button">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Logout</a>
		</div>


		<form action="AddStudentServlet" method="get">

			<table>
				<tr>
					<td>Student Name :</td>
					<td><input type="text" name="sname" placeholder="Full Name"></td>
				</tr>
				<tr>
					<td>Age :</td>
					<td><input type="text" name="sage" placeholder="Age"></td>
				</tr>
				<tr>
					<td>Location :</td>
					<td><input type="text" name="slocation" placeholder="Location"></td>
				</tr>
				<tr>
					<td>State :</td>
					<td><input type="text" name="sstate" placeholder="State"></td>
				</tr>
				<tr>
					<td>Email :</td>
					<td><input type="email" name="semail" placeholder="Email"></td>
				</tr>
				<tr>
					<td>Subject :</td>
					<td><input type="text" name="ssubject" placeholder="Subject"></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="Submit" name="submit">&nbsp;&nbsp;&nbsp;<input
						type="reset" value="Reset"></td>
				</tr>
			</table>
		</form>
		<div style="text-align: center">
			<h3>Student Details</h3>
		</div>


		<table border="1px">
			<tr>
				<td>ID</td>
				<td>Name</td>
				<td>Age</td>
				<td>Email</td>
				<td>Subject</td>
				<td>Location</td>
				<td>State</td>
				<td>Action</td>
			</tr>

			<%
			try {
				String url = "jdbc:sqlserver://LAPTOP-UHCHDTEN\\\\MSSQLSERVER:1434;databaseName=LearnersAcademy";
				String username = "sa";
				String pswd = "jaggu";
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				Connection conn = DriverManager.getConnection(url, username, pswd);
				Statement st = conn.createStatement();
				String query = "select * from dbo.Student";
				ResultSet rSet = st.executeQuery(query);
				while (rSet.next()) {
			%>
			<tr>
				<form action="AddStudentServlet" method="get">
					<td><%=rSet.getInt("id")%> <input type="hidden" name="stuid"
						value="<%=rSet.getInt("id")%>" /></td>
					<td><%=rSet.getString("S_Name")%></td>
					<td><%=rSet.getInt("age")%></td>
					<td><%=rSet.getString("S_Email")%></td>
					<td><%=rSet.getString("S_Subject")%></td>
					<td><%=rSet.getString("S_LOcation")%></td>
					<td><%=rSet.getString("S_State")%></td>
					<td><input type="submit" name="delete" value="Delete" /></td>
			</tr>
			</form>
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