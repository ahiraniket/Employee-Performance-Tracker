<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="z" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>EffortLogger</title>
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
	min-width: 50%;
	box-shadow: 0 8px 32px 0 RGB(152, 193, 217, 0.25);
	backdrop-filter: blur(6.5px);
	-webkit-backdrop-filter: blur(6.5px);
	border-radius: 10px;
	border: 1px solid RGB(152, 193, 217, 0.18);
	background: RGB(152, 193, 217, 0.75);
}

input {
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

button[type="submit"] {
	margin: 10px auto;
	margin-right: 10%;
	background-color: #293241;
	border-radius: 5px;
	border: 1px solid #98C1D9;
	color: white;
	font-size: 18px;
	padding: 8px 34px;
	cursor: pointer;
	transition: 0.3s;
	box-shadow: 0px 0px 20px RGB(224, 251, 252, 0.1);
}

button[type="submit"]:hover {
	background-color: #98C1D9;
	color: #293241;
	border-color: #293241;
	font-weight: bold;
	text-decoration: underline blink;
	box-shadow: 0px 0px 20px RGB(224, 251, 252, 0.7);
	transition: 0.3s;
	cursor: pointer;
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
	justify-content: center;
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
		<f:form method="GET" action="sendResetEmail"
			modelAttribute="forgotPasswordVO">
			<h2>Forgot Password?</h2>
			<f:input id="emailId" path="emailId"
				placeholder="Enter Your Email-Id here" type="email" />
			<div class="userBtn">
				<button type="submit" class="loginBtn">Send Reset Link</button>

				<button type="button" class="registerBtn"
					onclick="window.location.href='register'">Sign Up</button>
			</div>
		</f:form>
	</div>
</body>

</body>

</html>
