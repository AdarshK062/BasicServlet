<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

<!DOCTYPE html>
<html>
<head>
	<% HttpSession s=request.getSession(true); %>
	<meta charset="ISO-8859-1">
	<title>Login</title>
	<link rel="stylesheet" href="./style.css">

	<style>
		* {
			box-sizing: border-box;
		}

		html,
		body {
			display: grid;
			height: 100%;
			width: 100%;
			place-items: center;
		}

		::selection {
			background: #c99efd;
			color: #fff;
		}
	</style>
</head>

<body onload="myFunction()">

	<script>
		function myFunction() {
			if (document.getElementById("toast") != null) {
				var x = document.getElementById("snackbar");
				x.className = "show";
				setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);
			}

			if (document.getElementById("toast1") != null) {
				var x = document.getElementById("snackbar1");
				x.className = "show";
				setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);
			}

			if (document.getElementById("toast2") != null) {
				var x = document.getElementById("snackbar2");
				x.className = "show";
				setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);
			}
		}

	</script>

	<div class="wrapper">
		<div class="title-text">
			<div class="title user">User Login</div>
			<div class="title director">Director Login</div>
		</div>

		<div class="form-container">
			<div class="slide-controls">
				<input type="radio" name="slide" id="user" checked>
				<input type="radio" name="slide" id="director">
				<label for="user" class="slide user">User</label>
				<label for="director" class="slide director">Director</label>
				<div class="slider-tab"></div>
			</div>

			<div class="form-inner">
				<form action="validateLogin.jsp" method="post" class="user">
					<div class="field">
						<input type="text" required placeholder="User Id" name="userId" required>
					</div>

					<div class="field">
						<input type="password" placeholder="Password" name="password" required>
					</div>

					<div class="field btn">
						<div class="btn-layer"></div>
						<input type="submit" value="Login">
					</div>

					<input type="hidden" value="user" name="loginType"/>
				</form>

				<form action="validateLogin.jsp" method="post" class="director">
					<div class="field">
						<input type="text" required placeholder="User Id" name="userId" required>
					</div>

					<div class="field">
						<input type="password" placeholder="Password" name="password" required>
					</div>

					<div class="field btn">
						<div class="btn-layer"></div>
						<input type="submit" value="Login">
					</div>

					<input type="hidden" value="director" name="loginType"/>
				</form>

			</div>
		</div>
	</div>

	<script>
		const userText = document.querySelector(".title-text .user");
		const userForm = document.querySelector("form.user");
		const userBtn = document.querySelector("label.user");
		const directorBtn = document.querySelector("label.director");

		directorBtn.onclick = (() => {
			userForm.style.marginLeft = "-50%";
			userText.style.marginLeft = "-50%";
		});

		userBtn.onclick = (() => {
			userForm.style.marginLeft = "0%";
			userText.style.marginLeft = "0%";
		});

	</script>

	<div id="snackbar">Successfully Logged Out</div>
	<div id="snackbar1">Invalid User Id or Password</div>
	<div id="snackbar2">Session Timed out or Error</div>

	<%if(request.getParameter("logout")!=null){ %>
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