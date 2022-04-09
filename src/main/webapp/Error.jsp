<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error Page</title>
</head>
<body>

<% if(response.getStatus() == 500){ %>
<font color="red">Error: <%=exception.getMessage() %></font><br>

<%-- include login page --%>
<%@ include file="default.jsp"%>
<%}else {%>
Hi There, error code is <%=response.getStatus() %><br>
Please go to <a href="/default.jsp">home page</a>
<%} %>

</body>
</html>