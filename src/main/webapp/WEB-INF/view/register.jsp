<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>Register Page</title>
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
	margin-bottom: 0;
	display: flex;
}

.application-heading h1 {
	z-index: 999;
	color: white;
	text-decoration: overline 7px;
	font-size: 56px;
	padding-bottom: 20px;
	padding-left: 25px;
}

input[type="text"], input[type="email"], input[type="password"] {
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

button[type="button"].loginBtn {
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

button[type="button"].loginBtn:hover {
	background-color: #4CAF50;
	color: white;
	border-color: #2C6E49;
	font-weight: bold;
	text-decoration: underline blink;
	box-shadow: 0px 0px 20px RGB(224, 251, 252, 0.7);
	transition: 0.3s;
}

button[type="submit"].registerBtn {
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

button[type="submit"].registerBtn:hover {
	background-color: #98C1D9;
	color: white;
	border-color: #2D7DD2;
	font-weight: bold;
	text-decoration: underline blink;
	box-shadow: 0px 0px 20px RGB(224, 251, 252, 0.7);
	transition: 0.3s;
}

</style>
</head>
<body>
	<div class="application-heading">
		<h1>EffortLogger</h1>
	</div>
	<div class="container">
		<f:form method="post" action="signup" modelAttribute="registerVO">
			<h2>Register</h2>
			<label for="firstName">First Name</label>
			<f:input type="text" id="firstName" placeholder="First Name"
				path="firstName" />

			<label for="lastName">Last Name</label>
			<f:input type="text" id="lastName" placeholder="Last Name"
				path="lastName" />

			<label for="contact">Contact</label>
			<f:input type="text" id="contact" placeholder="Contact"
				path="contact" />

			<label for="email">Email</label>
			<f:input type="email" id="email" placeholder="Email"
				path="loginVO.username" />

			<label for="password">Password</label>
			<f:input type="password" id="password" placeholder="Password"
				path="loginVO.password" />

			<div class="userBtn">
				<button type="submit" class="registerBtn">Register</button>

				<button type="button" class="loginBtn"
					onclick="window.location.href='login'">Login</button>
			</div>
		</f:form>
	</div>
</body>
</html>
