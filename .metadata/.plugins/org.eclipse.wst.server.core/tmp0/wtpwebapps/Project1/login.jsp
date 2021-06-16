<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
	<head>
		<% HttpSession s=request.getSession(true); %>
		<meta charset="ISO-8859-1">
		<title>Login</title>
		<style>
			@import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap');

			* {
				margin: 0;
				padding: 0;
				box-sizing: border-box;
				font-family: 'Poppins', sans-serif;
			}

			html,
			body {
				display: grid;
				height: 100%;
				width: 100%;
				place-items: center;
				/* background: -webkit-linear-gradient(left, #a445b2, #fa4299); */
				background: #eddeff
			}

			::selection {
				/* background: #fa4299; */
				background: #c99efd;
				color: #fff;
			}

			.wrapper {
				overflow: hidden;
				max-width: 390px;
				width: 70%;
				min-width: 200px;
				height: auto;
				background: #fff;
				padding: 40px 30px;
				border-radius: 5px;
				box-shadow: 0 0 10px 0 #000;
				margin: auto;
				position: relative;
			}

			.wrapper .title-text {
				display: flex;
				width: 200%;
			}

			.wrapper .title {
				width: 50%;
				font-size: 35px;
				font-weight: 600;
				text-align: center;
				transition: all 0.6s cubic-bezier(0.68, -0.55, 0.265, 1.55);
			}

			.wrapper .slide-controls {
				position: relative;
				display: flex;
				height: 50px;
				width: 100%;
				overflow: hidden;
				margin: 30px 0 10px 0;
				justify-content: space-between;
				border: 1px solid lightgrey;
				border-radius: 5px;
			}

			.slide-controls .slide {
				height: 100%;
				width: 100%;
				color: #fff;
				font-size: 18px;
				font-weight: 500;
				text-align: center;
				line-height: 48px;
				cursor: pointer;
				z-index: 1;
				transition: all 0.6s ease;
			}

			.slide-controls label.director {
				color: #000;
			}

			.slide-controls .slider-tab {
				position: absolute;
				height: 100%;
				width: 50%;
				left: 0;
				z-index: 0;
				border-radius: 5px;
				background: #a764fa;
				transition: all 0.6s cubic-bezier(0.68, -0.55, 0.265, 1.55);
			}

			input[type="radio"] {
				display: none;
			}

			#director:checked~.slider-tab {
				left: 50%;
			}

			#director:checked~label.director {
				color: #fff;
				cursor: default;
				user-select: none;
			}

			#director:checked~label.user {
				color: #000;
			}

			#user:checked~label.director {
				color: #000;
			}

			#user:checked~label.user {
				cursor: default;
				user-select: none;
			}

			.wrapper .form-container {
				width: 100%;
				overflow: hidden;
			}

			.form-container .form-inner {
				display: flex;
				width: 200%;
			}

			.form-container .form-inner form {
				width: 50%;
				transition: all 0.6s cubic-bezier(0.68, -0.55, 0.265, 1.55);
			}

			.form-inner form .field {
				height: 50px;
				width: 100%;
				margin-top: 20px;
			}

			.form-inner form .field input {
				height: 100%;
				width: 100%;
				outline: none;
				padding-left: 15px;
				border-radius: 5px;
				border: 1px solid lightgrey;
				border-bottom-width: 2px;
				font-size: 17px;
				transition: all 0.3s ease;
			}

			.form-inner form .field input:focus {
				border-color: #a764fa;
				/* box-shadow: inset 0 0 3px #fb6aae; */
			}

			.form-inner form .field input::placeholder {
				color: #999;
				transition: all 0.3s ease;
			}

			form .field input:focus::placeholder {
				color: #b3b3b3;
			}

			.form-inner form .pass-link {
				margin-top: 5px;
			}

			.form-inner form .director-link {
				text-align: center;
				margin-top: 30px;
			}

			form .btn {
				height: 50px;
				width: 100%;
				border-radius: 5px;
				position: relative;
				overflow: hidden;
			}

			form .btn .btn-layer {
				height: 100%;
				width: 300%;
				position: absolute;
				left: -100%;
				background: #a764fa;
				border-radius: 5px;
				transition: all 0.4s ease;
				;
			}

			form .btn:hover .btn-layer {
				left: 0;
			}

			form .btn input[type="submit"] {
				height: 100%;
				width: 100%;
				z-index: 1;
				position: relative;
				background: none;
				border: none;
				color: #fff;
				padding-left: 0;
				border-radius: 5px;
				font-size: 20px;
				font-weight: 500;
				cursor: pointer;
			}

			#snackbar,
			#snackbar1,
			#snackbar2 {
				visibility: hidden;
				min-width: 250px;
				float: right;
				background-color: rgb(75, 74, 74);
				color: #fff;
				text-align: center;
				border-radius: 2px;
				padding: 16px;
				position: fixed;
				z-index: 1;
				right: 5%;
				bottom: 30px;
				font-size: 17px;
			}

			#snackbar.show,
			#snackbar1.show,
			#snackbar2.show {
				visibility: visible;
				-webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
				animation: fadein 0.5s, fadeout 0.5s 2.5s;
			}

			@-webkit-keyframes fadein {
				from {
					bottom: 0;
					opacity: 0;
				}

				to {
					bottom: 30px;
					opacity: 1;
				}
			}

			@keyframes fadein {
				from {
					bottom: 0;
					opacity: 0;
				}

				to {
					bottom: 30px;
					opacity: 1;
				}
			}

			@-webkit-keyframes fadeout {
				from {
					bottom: 30px;
					opacity: 1;
				}

				to {
					bottom: 0;
					opacity: 0;
				}
			}

			@keyframes fadeout {
				from {
					bottom: 30px;
					opacity: 1;
				}

				to {
					bottom: 0;
					opacity: 0;
				}
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
				<div class="title user">
					User Login</div>
				<div class="title director">
					Director Login</div>
			</div>
			<div class="form-container">
				<div class="slide-controls">
					<input type="radio" name="slide" id="user" checked>
					<input type="radio" name="slide" id="director">
					<label for="user" class="slide user">User</label>
					<label for="director" class="slide director">Director</label>
					<div class="slider-tab">
					</div>
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
							<div class="btn-layer">
							</div>
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
							<div class="btn-layer">
							</div>
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