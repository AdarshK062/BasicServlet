<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
<!-- <form action="LoginServlet" method="post">
<table>
<caption>Login Form</caption>
<tr>
	<th>
	<input type="text" name="userId" placeholder="enter user Id"/>
	</th>
</tr>
<tr>
	<th>
	<input type="text" name="password" placeholder="enter Password"/>
	</th>
</tr>
<tr>
	<td>
	<input type="submit"/>
	</td>
	<td>
	<input type="reset"/>
	</td>
</tr>
</table>
</form>-->
<br>
<br>
<br>
<form action="LoginServlet" method="post">
<fieldset>
<legend>Login Form</legend>
	<input type="text" name="userId" placeholder="enter user Id"/>
	<br><br>
	<input type="text" name="password" placeholder="enter Password"/>
	<br><br>
	<input type="submit" value="Submit"/>
	&nbsp;
	<input type="reset"/>
</fieldset>
</form>
</body>
</html>