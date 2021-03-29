<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="BasicServlet.*" %>
<%
HttpSession s= request.getSession(true);
Employee emp=(Employee) s.getAttribute("emp");
DBConnect db=(DBConnect)s.getAttribute("db");
%>
<h3>USER DETAILS</h3>
<br>
<b>Persno : </b> <%= emp.persno%><br>
<b>Name : </b> <%= emp.name %><br>
<b>Designation : </b> <%= emp.designation %><br>
<b>Division : </b> <%= emp.division %><br>
<br>
<br>
<form action="index1.jsp" method="post">
	<input type="submit" value="Work in Progress"/>
</form>
<form action="index4.jsp" method="post">
	<input type="submit" value="Visits to fabrication agencies"/>
</form>
<form action="end.jsp" method="post">
	<input type="submit" value="Logout"/>
</form>
</body>
</html>