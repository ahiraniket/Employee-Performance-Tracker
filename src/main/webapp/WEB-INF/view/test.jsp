<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>EffortLogger - User Dashboard</title>
<style>
body {
	font-family: Open Sans, sans-serif;
	margin: 10px;
	padding: 0;
	position: relative;
	background-image: url("../adminResources/image/4.jpg");
	background-size: cover;
	background-position: center no-repeat;
}

body::before {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	z-index: -1;
	background-color: rgba(255, 255, 255, 0.8);
	filter: blur(10px);
	opacity: 0.8;
}

#menu {
	margin: 10px;
	margin-top: 25px;
	background: #1A1B41;
	color: #F1FFE7;
	height: 52px;
	padding-left: 18px;
	border-radius: 5px;
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
	line-height: 52px;
	padding: 0 25px;
	text-decoration: none;
	color: #F1FFE7;
	font-size: 16px;
}

#menu a.dropdown-arrow:after {
	content: "\23F7";
	margin-left: 5px;
}

#menu li a:hover {
	color: #1A1B41;
	background: #C2E7DA;
	border-radius: 5px;
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
	width: 170px;
	background: #0099CC;
	position: absolute;
	z-index: 99;
	display: none;
	overflow: hidden;
	width: 170px;
	background: #0099CC;
	position: absolute;
	z-index: 99;
	display: none;
	border-radius: 5px;
}

#menu ul.sub-menus li {
	display: block;
	width: 100%;
}

#menu ul.sub-menus a {
	color: #F1FFE7;
	font-size: 16px;
}

#menu li:hover ul.sub-menus {
	display: block
}

#menu ul.sub-menus a:hover {
	background: #C2E7DA;
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
	text-align: center;
	margin: 20px 0;
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
	background: rgba(26, 27, 65, 0.8);
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
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
	color: #C2E7DA;
	text-align: center;
	font-weight: lighter;
}

.box p {
	text-align: center;
	font-size: 34px;
	padding: 0px;
	margin: 0px;
	color: #F1FFE7;
	font-weight: bolder;
	text-decoration: underline;
	margin: 0px;
	color: #F1FFE7;
	font-weight: bolder;
	color: #F1FFE7;
	font-weight: bolder;
}

h3 {
	margin: auto;
	padding: 10px;
	text-align: center;
	color: #1A1B41;
	text-align: center;
}

table {
	border-collapse: collapse;
	width: 80%;
	text-align: center;
	margin: auto;
}

th {
	background-color: #1A1B41;
	color: #F1FFE7;
	padding: 10px;
}

th, td {
	border: 1px solid #ddd;
	padding: 10px;
}

tr:nth-child(even) {
	background-color: #C2E7DA;
}
</style>
</head>
<body>
	<header>
		<nav id='menu'>
			<ul>
				<li><a class='dropdown-arrow'>Welcome User!</a>
					<ul class='sub-menus'>
						<li><a href='test'>Logout</a></li>
					</ul></li>
				<li><a href='test'>Home</a></li>
				<li><a class='dropdown-arrow'>Efforts</a>
					<ul class='sub-menus'>
						<li><a href='test'>Add Efforts</a></li>
						<li><a href='test'>View Efforts</a></li>
					</ul></li>
				<li><a class='dropdown-arrow'>Bugs</a>
					<ul class='sub-menus'>
						<li><a href='test'>Add Bugs</a></li>
						<li><a href='test'>View Bugs</a></li>
					</ul></li>
			</ul>
		</nav>
	</header>
	<main>
	<h1>Dashboard</h1>
	<div class='container'>
		<div class='box'>
			<p>100</p>
			<h2>Total Efforts</h2>
		</div>
		<div class='box'>
			<p>10</p>
			<h2>Total Bugs</h2>
		</div>
	</div>
	<section>
		<h3>Recent Efforts</h3>
		<table>
			<thead>
				<tr>
					<th>Effort ID</th>
					<th>Date</th>
					<th>Description</th>
					<th>Hours</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>2023-04-17</td>
					<td>Implemented login functionality</td>
					<td>4</td>
				</tr>
				<tr>
					<td>2</td>
					<td>2023-04-18</td>
					<td>Refactored codebase</td>
					<td>3</td>
				</tr>
				<tr>
					<td>3</td>
					<td>2023-04-19</td>
					<td>Debugged issue with database connection</td>
					<td>2</td>
				</tr>
			</tbody>
		</table>
	</section>
	<section>
		<h3>Recent Bugs</h3>
		<table>
			<thead>
				<tr>
					<th>Bug ID</th>
					<th>Date Reported</th>
					<th>Description</th>
					<th>Status</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>2023-04-17</td>
					<td>Unable to upload image</td>
					<td>Open</td>
				</tr>
				<tr>
					<td>2</td>
					<td>2023-04-18</td>
					<td>Dropdown menu not displaying options</td>
					<td>Resolved</td>
				</tr>
				<tr>
					<td>3</td>
					<td>2023-04-19</td>
					<td>Application crashing on startup</td>
					<td>Open</td>
				</tr>
			</tbody>
		</table>
	</section>
	</main>
</body>
</html>
