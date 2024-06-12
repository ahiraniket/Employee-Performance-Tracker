<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<title>Login Page</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,400;0,500;0,600;0,700;0,800;1,400;1,500;1,600;1,700&display=swap')
	;

body {
	background-image: url("../adminResources/image/4.jpg");
	background-size: 110%;
	background-position: center;
	font-family: 'Raleway', sans-serif !important;
	overflow: hidden;
	background-repeat: no-repeat;
}

body::before {
	margin: 0;
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	z-index: -1;
	background: linear-gradient(to bottom, RGB(4, 50, 65, 1),
		RGB(4, 50, 65, 0.9));
	filter: blur(0px);
	opacity: 0.9;
	content: "";
}

.container {
	display: flex;
	justify-content: center;
	align-items: center;
	height: fit-content;
}

form {
	min-width: 30%;
	box-shadow: 0 8px 32px 0 RGB(152, 193, 217, 0.25);
	backdrop-filter: blur(6.5px);
	-webkit-backdrop-filter: blur(6.5px);
	border-radius: 10px;
	border: 1px solid RGB(152, 193, 217, 0.18);
	background: RGB(152, 193, 217, 0.75);
}

input[type="text"], input[type="password"] {
	display: block;
	width: 80%;
	margin: auto;
	padding: 10px;
	margin-bottom: 20px;
	border-radius: 5px;
	border: none;
	background-color: RGB(224, 251, 252);
	box-shadow: 0px 0px 10px RGB(224, 251, 252, 0.1);
}

.userBtn {
	display: flex;
	margin-left: 10%;
	margin-right: 10%;
}

button[type="submit"].loginBtn {
	margin: 10px auto;
	margin-right: 10%;
	background-color: #4CAF50;
	border-radius: 5px;
	border: 1px solid green;
	color: white;
	font-size: 18px;
	padding: 8px 34px;
	cursor: pointer;
	transition: 0.3s;
	box-shadow: 0px 0px 20px RGB(224, 251, 252, 0.1);
}

button[type="submit"].loginBtn:hover {
	background-color: #4CAF50;
	color: white;
	border-color: #2C6E49;
	font-weight: bold;
	text-decoration: underline blink;
	box-shadow: 0px 0px 20px RGB(224, 251, 252, 0.7);
	transition: 0.3s;
}

button[type="button"].registerBtn {
	margin: 10px auto;
	background-color: #98C1D9;
	border-radius: 5px;
	border: 1px solid #2D7DD2;
	color: white;
	font-size: 18px;
	padding: 8px 34px;
	cursor: pointer;
	box-shadow: 0px 0px 20px RGB(224, 251, 252, 0.1);
	transition: 0.3s;
}

button[type="button"].registerBtn:hover {
	background-color: #98C1D9;
	color: white;
	border-color: #2D7DD2;
	font-weight: bold;
	text-decoration: underline blink;
	box-shadow: 0px 0px 20px RGB(224, 251, 252, 0.7);
	transition: 0.3s;
}

.fPBtn {
	display: flex;
	justify-content:center;
	margin: 10px auto;
	color: #293241;
	font-size: 16px;
	padding: 10px 45px;
	cursor: pointer;
	transition: 0.3s;
	margin-bottom: 30px;
}

.fPBtn:hover {
	color: #C0392B;
	transition: 0.3s;
	font-weight: bold;
	text-decoration: underline blink;
}

h1 {
	font-size: 32px;
	font-weight: bold;
	margin-bottom: 20px;
	color: #333;
}

h2 {
	font-size: 32px;
	text-align: center;
	font-weight: bold;
	margin-bottom: 20px;
	color: RGB(41, 50, 65);
	font-weight: 800;
	text-decoration: overline RGB(41, 50, 65, 0.5);;
}

a {
	text-decoration: none;
	font-size: 15px;
	color: white;
}

label {
	margin-left: 7%;
	padding-bottom: 5px;
	display: flex;
	color: RGB(41, 50, 65);
	font-weight: 700;
}

.application-heading {
	margin-bottom: 5%;
	display: flex;
}

.application-heading h1 {
	z-index: 999;
	color: white;
	text-decoration: overline 7px;
	font-size: 56px;
	padding-bottom: 50px;
	padding-left: 25px;
}
</style>
</head>

<body>

	<div class="application-heading">
		<h1>EffortLogger</h1>
	</div>
	<div class="container">
		<form method="post" action="j_spring_security_check">
			<h2
				style="font-size: 34px; font-weight: 'extrabold'; font-stretch: extra-expanded;">Login</h2>
			<label for="inputUsername">Email</label> <input type="text"
				id="inputUsername" name="username" placeholder="Email" name="email"
				required /> <label for="inputPassword">Password</label> <input
				type="password" placeholder="Password" name="password"
				id="inputPassword" name="password" required />
			<c:if test="${param.error eq 'true'}">
				<p style="color: red; text-align: center;">Incorrect Email
					ID/Password!</p>
			</c:if>
			<div class="userBtn">
				<button type="submit" class="loginBtn">Login</button>

				<button type="button" class="registerBtn"
					onclick="window.location.href='register'">Sign Up</button>
			</div>
			<!-- <span class="fPBtn" onclick="window.location.href='forgotPassword'">Forgot
				Password?</span> -->
		</form>
	</div>
</body>
</html>
