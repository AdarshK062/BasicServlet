<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Data</title>
</head>
<body>
<%@ page import="BasicServlet.*" %>
<%
HttpSession s= request.getSession(true);
Employee emp=(Employee) s.getAttribute("emp");
DBConnect db=(DBConnect)s.getAttribute("db");
%>
<script>
function month(){
	var dp=document.getElementById("drop");
	if(dp.style.display=="block"){
		dp.style.display="none";
	}
	else{
		dp.style.display="block";
	}
}
</script>
<h2>Modify Visits to Fabrication Agencies</h2>
<br>
<br>
<h3>USER DETAILS</h3>
<br>
<b>Persno : </b> <%= emp.persno%><br>
<b>Name : </b> <%= emp.name %><br>
<b>Designation : </b> <%= emp.designation %><br>
<b>Division : </b> <%= emp.division %><br>
<br>
<br>
<br>
<form action="index5.jsp" method="post">
<input type="submit" value="Add"/>
</form>
<br>
<form action="home.jsp" method="post">
<input type="submit" value="Save"/>
</form>
<br>
<form action="index6.jsp" method="post">
<input type="button" onclick="month()" value="Update"/>
<br><br>
<div id="drop" style="display: none;">
<p>Select Month</p>
<input type="month" id="start" name="start" value="2021-03"/>
<br><br>
<input type="submit" value="Next"/>
</div>
</form>
<br>
</body>
</html>