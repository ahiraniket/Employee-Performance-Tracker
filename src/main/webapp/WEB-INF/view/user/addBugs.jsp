<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="z" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Bugs</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,400;0,500;0,600;0,700;0,800;1,400;1,500;1,600;1,700&display=swap')
	;

body {
	background-image: url("../adminResources/image/4.jpg");
	background-size: 150% ;
	background-position: center;
	font-family: 'Raleway', sans-serif !important;
	background-repeat: no-repeat no-repeat;
	overflow: hidden;
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

#menu {
	margin: 10px;
	margin-top: 25px;
	background: RGB(61, 90, 128);
	color: RGB(224, 251, 252);
	height: 52px;
	padding-right: 50px;
	padding-left: 20px;
	border-radius: 5px;
	margin-right: -16px;
	display: flex;
	align-items: center;
}

#menu ul, #menu li {
	margin: 0 auto;
	padding: 0;
	list-style: none;
}

#menu ul {
	width: 100%;
}

#menu li {
	float: left;
	display: inline;
	position: relative;
}

#menu a {
	display: block;
	line-height: 43px;
	padding: 0 25px;
	text-decoration: none;
	color: RGB(224, 251, 252);
	font-size: 16px;
	font-weight: bold;
}

#menu a.dropdown-arrow:after {
	content: "\23F7";
	margin-left: 5px;
}

#menu li a:hover {
	color: #1A1B41;
	background: RGB(224, 251, 252);
	border-radius: 5px;
	cursor: pointer
}

#menu input {
	display: none;
	margin: 0;
	padding: 0;
	height: 52px;
	width: 100%;
	opacity: 0;
	cursor: pointer
}

#menu label {
	display: none;
	line-height: 52px;
	text-align: center;
	position: absolute;
	left: 35px
}

#menu label:before {
	font-size: 1.6em;
	content: "\2261";
	margin-left: 20px;
}

#menu ul.sub-menus {
	height: auto;
	overflow: hidden;
	background: RGB(61, 90, 128);
	position: absolute;
	z-index: 999;
	width: 170px;
	display: none;
	border-radius: 5px;
}

#menu ul.sub-menus li {
	display: block;
	width: 100%;
}

#menu ul.sub-menus a {
	color: RGB(224, 251, 252);
	font-size: 16px;
}

#menu li:hover ul.sub-menus {
	display: block
}

#menu ul.sub-menus a:hover {
	background: RGB(224, 251, 252);
	color: #1A1B41;
}

@media screen and (max-width: 800px) {
	#menu {
		position: relative
	}
	#menu ul {
		background: #111;
		position: absolute;
		top: 100%;
		right: 0;
		left: 0;
		z-index: 3;
		height: auto;
		display: none
	}
	#menu ul.sub-menus {
		width: 100%;
		position: static;
	}
	#menu ul.sub-menus a {
		padding-left: 30px;
	}
	#menu li {
		display: block;
		float: none;
		width: auto;
	}
	#menu input, #menu label {
		position: absolute;
		top: 0;
		left: 0;
		display: block
	}
	#menu input {
		z-index: 4
	}
	#menu input:checked+label {
		color: white
	}
	#menu input:checked+label:before {
		content: "\00d7"
	}
	#menu input:checked ~ ul {
		display: block
	}
}

h1 {
	color: RGB(224, 251, 252);
	text-align: center;
	margin: 20px 0;
	text-align: center;
}

h3 {
	margin: auto;
	padding: 10px;
	color: RGB(224, 251, 252);
	text-align: center;
	font-size: 22px;
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
span {
	font-size: 25px;
	padding: 0;
	margin: auto;
}

.application-heading {
	margin-top: 10px;
	margin-bottom: 0;
	display: flex;
	justify-content: space-between;
	position: sticky;
}

.application-heading h1 {
	z-index: 999;
	color: white;
	text-decoration: overline 7px;
	font-size: 43px;
	padding-top: 10px;
	padding-bottom: 16px;
	padding-left: 25px;
}

section {
	max-height: 300px;
}

.form-container {
	justify-content: center;
	align-items: flex-start;
	height: 100vh;
	display: flex;
	flex-wrap: wrap;
	flex-direction: row;
	position: relative;
	top: 25px;
	height: auto;
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

input, textarea {
	display: block;
	width: 80%;
	margin: auto;
	padding: 10px;
	margin-bottom: 20px;
	border-radius: 5px;
	border: none;
	background-color: RGB(224, 251, 252);
	box-shadow: 0px 0px 10px RGB(224, 251, 252, 0.1);
	min-width:80%;
	max-width: 80%;
}

input[type="submit"] {
	display: block;
	margin: 10px auto;
	background-color: #2D7DD2;
	border-radius: 29px;
	border: 1px solid #2D7DD2;
	color: white;
	font-size: 15px;
	padding: 10px 45px;
	cursor: pointer;
	transition: 0.3s;
	margin: 10px auto;
	background-color: RGB(152, 193, 217);
	border-radius: 29px;
	border: 1px solid RGB(224, 251, 252);
}

input[type="submit"]:hover {
	background-color:  RGB(41, 50, 65);
	color: RGB(224, 251, 252);
	border-color: RGB(61, 90, 128);
	transition: 0.3s;
	font-weight: bold;
	text-decoration: underline blink;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="form-container">

		<f:form method="get" action="insertBug" modelAttribute="manageBugVO">
			<h2>${formName}</h2>
			<c:if test="${param.op eq 'true'}">
				<p style="color: green; text-align: center;">Operation
					Successful!</p>
			</c:if>
			<label for="bugName">Bug Name</label>
			<f:input type="text" id="bugName" placeholder="Bug Name"
				path="bugName" required="true" />

			<label for="bugDescription">Bug Description</label>
			<f:textarea id="bugDescription"
				placeholder="Enter Bug Description here..." path="bugDescription"
				required="true" />

			<input type="submit" value="Submit">
		</f:form>
	</div>
</body>
</html>