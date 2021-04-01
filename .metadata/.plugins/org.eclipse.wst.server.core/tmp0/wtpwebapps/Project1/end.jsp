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
s.setAttribute("logout",1);
RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
rd.forward(request, response);%>
</body>
</html>