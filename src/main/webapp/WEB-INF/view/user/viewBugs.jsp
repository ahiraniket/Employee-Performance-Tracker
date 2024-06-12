<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Bugs</title>
<link rel="stylesheet" href="../userResources/css/font-awesome.css">
<link rel="stylesheet"
	href="../adminResources/css/materialdesignicons.min.css">
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,400;0,500;0,600;0,700;0,800;1,400;1,500;1,600;1,700&display=swap')
	;

body {
	background-image: url("../adminResources/image/4.jpg");
	background-size: 110%;
	background-position: center;
	font-family: 'Raleway', sans-serif !important;
	background-repeat: no-repeat;
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

.container {
	display: flex;
	justify-content: space-between;
	flex-wrap: wrap;
	padding: 10px;
	max-width: 1400px;
	margin: auto;
}

.box {
	background: RGBA(224, 251, 252, 0.9);
	box-shadow: 0 8px 32px 0 RGBA(224, 251, 252, 0.1);
	backdrop-filter: blur(7px);
	-webkit-backdrop-filter: blur(7px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	padding: 10px;
	margin-bottom: 5px;
	width: 250px;
}

.box h2 {
	margin: 0;
	color: RGB(41, 50, 65);
	text-align: center;
	font-weight: lighter;
	text-align: center;
}

.box p {
	text-align: center;
	font-size: 34px;
	padding: 0px;
	margin: 0px;
	color: RGB(41, 50, 65);
	font-weight: bolder;
	text-decoration: underline;
	margin: 0px;
}

h3 {
	margin: auto;
	padding: 10px;
	color: RGB(224, 251, 252);
	text-align: center;
	font-size: 22px;
}

table {
	border-collapse: collapse;
	width: 100%;
	text-align: center;
	margin: 70px auto;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-wrap: wrap;
	padding: 33px 30px;
	overflow-y: auto;
	height: 430px;
	padding-top: 0;
}

th {
	background-color: RGB(41, 50, 65);
	color: RGB(224, 251, 252);
	font-weight: bolder;
	padding: 10px;
	position: sticky;
	top: 0px;
}

th, td {
	border: 1px solid #ddd;
	padding: 10px;
}

tr:nth-child(odd) {
	color: RGB(224, 251, 252);
	background-color: RGB(107, 142, 156);
}

tr:nth-child(even) {
	color: RGB(224, 251, 252);
	background-color: RGB(61, 90, 128);
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
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<table>
		<tr>
			<th>SR</th>
			<th>Date</th>
			<th>Effort Name</th>
			<th>Description</th>
			<th>Status</th>
			<th>Actions</th>

		</tr>
		<c:forEach var="i" items="${viewBugList}" varStatus="j">
			<tr>
				<td>${ j.count }</td>
				<td>${ i.bugDate }</td>
				<td>${ i.bugName }</td>
				<td>${ i.bugDescription }</td>
				<td><c:if test="${i.bugStatus eq 'ONGOING'}">
						<span style="color: #FF9800 ; font-weight: bold"><i
							class="mdi mdi-timer-sand"></i></span>
					</c:if> <c:if test="${i.bugStatus eq 'RESOLVED'}">
						<span style="color: #8BC34A ; font-weight: bold"><i
							class="mdi mdi-check-circle"></i></span>
					</c:if> <c:if test="${i.bugStatus eq 'OPEN'}">
						<span style="color: #03A9F4 ; font-weight: bold"><i
							class="mdi mdi-clock-outline"></i></span>
					</c:if></td>
				<td><span style="color: #2196F3; font-weight: bold"><i
						class="mdi mdi-pencil-circle"></i></span> | <span
					style="color: #FF5252 ; font-weight: bold"><i
						class="mdi mdi-delete"></i></span></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>