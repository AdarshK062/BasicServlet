<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
<%
HttpSession s= request.getSession(true);
 %>
	<meta charset="ISO-8859-1">
	<title>Login</title>
	<style>
		body{
			background: #eddeff
		}
		.login {
			background-color: white;
			width: 30%;
			height: auto;
			padding: 40px 30px;
			box-shadow: 0 0 10px 0 #000;
			margin: auto;
			position: relative;
			border-radius: 5px;
		}
		input {
			width: 100%;
			height: 30px;
			border: none;
		}
		input:focus {
			border: none;
			outline: none;
		}
		input[type=submit]{
			background-color: #555555;
			border-radius: 5px;
			height:40px;
			border:1px solid #4d4c4c;
			color:whitesmoke;
			font-size: medium;
			/* padding: 15px; */
			box-shadow: 0 0 7px 0 #000;
			/* padding-bottom: 20px; */
			padding-left: 15px;
			padding-right: 15px;
			margin: 10px;
		}
		fieldset {
			margin-bottom: 15px;
			border-radius: 5px;
		}
		#snackbar,#snackbar1,#snackbar2 {
  visibility: hidden;
  min-width: 250px;
  float:right;
  background-color: rgb(75, 74, 74);
  color: #fff;
  text-align: center;
  border-radius: 2px;
  padding: 16px;
  position: fixed;
  z-index: 1;
  right:5%;
  bottom: 30px;
  font-size: 17px;
}

#snackbar.show,#snackbar1.show,#snackbar2.show {
  visibility: visible;
  -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
  animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

@-webkit-keyframes fadein {
  from {bottom: 0; opacity: 0;} 
  to {bottom: 30px; opacity: 1;}
}

@keyframes fadein {
  from {bottom: 0; opacity: 0;}
  to {bottom: 30px; opacity: 1;}
}

@-webkit-keyframes fadeout {
  from {bottom: 30px; opacity: 1;} 
  to {bottom: 0; opacity: 0;}
}

@keyframes fadeout {
  from {bottom: 30px; opacity: 1;}
  to {bottom: 0; opacity: 0;}
}
		
	</style>
</head>

<body onload="myFunction()">
<script>
function myFunction() {
	if(document.getElementById("toast")!=null){
		var x = document.getElementById("snackbar");
		  x.className = "show";
		  setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
	  }
	  if(document.getElementById("toast1")!=null){
		var x = document.getElementById("snackbar1");
		  x.className = "show";
		  setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
	  }
	  if(document.getElementById("toast2")!=null){
		var x = document.getElementById("snackbar2");
		  x.className = "show";
		  setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
	  }
	}
</script>
<br><br><br>
	<div class="login">
		<form action="LoginServlet" method="post">
			<div class="list">
				<div style="text-align: center;">
					<h2>Member Login</h2>
				</div>
				<div>
					<fieldset>
						<legend>User Id</legend>
						<input type="text" name="userId" />
					</fieldset>
				</div>
				<div>
					<fieldset>
						<legend>Password</legend>
						<input type="password" name="password" />
					</fieldset>
				</div>
				<div><input type="submit" value="Submit" /></div>
			</div>
		</form>
	</div>
	<div id="snackbar">Successfully Logged Out</div>
	<div id="snackbar1">Invalid User Id or Password</div>
	<div id="snackbar2">Session Timed out or Error</div>
	
	<%if(s.getAttribute("logout")!=null){ %>
	<div id="toast" style="display:none;"></div>
	<%} %>
	<%if(s.getAttribute("invalid")!=null){%>
	<div id="toast1" style="display:none;"></div>
	<%}%>
	<%if(s.getAttribute("timeout")!=null){%>
	<div id="toast2" style="display:none;"></div>
	<%}s.invalidate();%>
</body>
</html>