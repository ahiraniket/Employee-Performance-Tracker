<%@page import="org.springframework.web.context.annotation.SessionScope"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="z" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>EffortLogger - User Dashboard</title>
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
	z-index: 9999;
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
	max-width: 1200px;
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
	width: 80%;
	text-align: center;
	margin: auto;
}

th {
	background-color: RGB(41, 50, 65);
	color: RGB(224, 251, 252);
	font-weight: bolder;
	padding: 10px;
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
	z-index: 9999; margin-top : 10px;
	margin-bottom: 0;
	display: flex;
	justify-content: space-between;
	position: sticky;
	margin-top: 10px;
}

.application-heading h1 {
	z-index: 999;
	color: white;
	text-decoration: overline 7px;
	font-size: 43px;
	padding-top: 10px;
	padding-bottom: 10px;
	padding-left: 25px;
}

section {
	max-height: 300px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<main>
	<div class='container'>
		<div class='box'>
			<c:if test="${empty userEfforts}">
				<p>0</p>
			</c:if>
			<c:if test="${!empty userEfforts}">
				<p>${userEfforts}</p>
			</c:if>
			<h2>Total Efforts</h2>
		</div>
		<div class='box'>
			<c:if test="${empty userHours}">
				<p>0</p>
			</c:if>
			<c:if test="${!empty userHours}">
				<p>${userHours}</p>
			</c:if>
			<h2>Total Hours</h2>
		</div>
		<div class='box'>
			<c:if test="${!empty userBugs}">
				<p>${userBugs}</p>
			</c:if>
			<c:if test="${empty userBugs}">
				<p>0</p>
			</c:if>
			<h2>Total Bugs</h2>
		</div>
	</div>
	<section>
		<h3>Recent Efforts</h3>
		<table>
			<thead>
				<tr>
					<th>SR</th>
					<th>Date</th>
					<th>Name</th>
					<th>Description</th>
					<th>Time</th>
					<th>Status</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${userEfforts < 3}">
					<c:set var="effortBegin" value="0"></c:set>
					<c:set var="effortEnd" value="${userEfforts-1}"></c:set>
				</c:if>
				<c:if test="${!(userEfforts < 3)}">
					<c:set var="effortBegin" value="${userEfforts-3}"></c:set>
					<c:set var="effortEnd" value="${userEfforts-1}"></c:set>
				</c:if>
				<c:if test="${userEfforts eq 0}">
					<tr>
						<td colspan="6" style="color: red; font-weight: bold;">No
							Efforts Logged!</td>
					</tr>
				</c:if>
				<c:if test="${!(userEfforts eq 0)}">
					<c:forEach var="i" begin="${effortBegin}" end="${effortEnd}"
						varStatus="j">
						<tr>
							<td>${ i }</td>
							<td>${ recentUserEfforts[i].effortDate }</td>
							<td>${ recentUserEfforts[i].effortName }</td>
							<td>${ recentUserEfforts[i].effortDescription }</td>
							<td>${ recentUserEfforts[i].effortTimeHours }h${ recentUserEfforts[i].effortTimeMinutes }m</td>
							<td><c:if
									test="${recentUserEfforts[i].effortStatus eq 'PENDING'}">
									<span style="color: #FF9800; font-weight: bold"><i
										class="mdi mdi-timer-sand"></i></span>
								</c:if> <c:if test="${recentUserEfforts[i].effortStatus eq 'APPROVED'}">
									<span style="color: #8BC34A; font-weight: bold"><i
										class="mdi mdi-check-circle"></i></span>
								</c:if> <c:if test="${recentUserEfforts[i].effortStatus eq 'REJECTED'}">
									<span style="color: #FF5252; font-weight: bold"><i
										class="mdi mdi-close-circle"></i></span>
								</c:if></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</section>
	<section>
		<h3>Recent Bugs</h3>
		<table>
			<thead>
				<tr>
					<th>SR</th>
					<th>Date</th>
					<th>Effort Name</th>
					<th>Description</th>
					<th>Status</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${userBugs < 3}">
					<c:set var="bugBegin" value="0"></c:set>
					<c:set var="bugEnd" value="${userBugs-1}"></c:set>
				</c:if>
				<c:if test="${!(userBugs < 3)}">
					<c:set var="bugBegin" value="${userBugs-3}"></c:set>
					<c:set var="bugEnd" value="${userBugs-1}"></c:set>
				</c:if>
				<c:if test="${userBugs eq 0}">
					<tr>
						<td colspan="5" style="color: red; font-weight: bold;">No
							Bugs Reported!</td>
					</tr>
				</c:if>
				<c:if test="${!(userBugs eq 0)}">
					<c:forEach var="i" begin="${bugBegin}" end="${bugEnd}"
						varStatus="j">
						<tr>
							<td>${ i }</td>
							<td>${ recentUserBugs[i].bugDate }</td>
							<td>${ recentUserBugs[i].bugName }</td>
							<td>${ recentUserBugs[i].bugDescription }</td>
							<td><c:if test="${recentUserBugs[i].bugStatus eq 'ONGOING'}">
									<span style="color: #FF9800; font-weight: bold"><i
										class="mdi mdi-timer-sand"></i></span>
								</c:if> <c:if test="${recentUserBugs[i].bugStatus eq 'RESOLVED'}">
									<span style="color: #8BC34A; font-weight: bold"><i
										class="mdi mdi-check-circle"></i></span>
								</c:if> <c:if test="${recentUserBugs[i].bugStatus eq 'OPEN'}">
									<span style="color: #03A9F4; font-weight: bold"><i
										class="mdi mdi-clock-outline"></i></span>
								</c:if></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</section>
	</main>
</body>
</html>
