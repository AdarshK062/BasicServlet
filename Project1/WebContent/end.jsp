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
DBConnect db=(DBConnect)s.getAttribute("db");
db.End();
%>
<br>
<br>
<h2>Successfully logged out</h2>
<br>
<h3><a href='./index.jsp'>Login Again</a></h3>
</body>
</html>