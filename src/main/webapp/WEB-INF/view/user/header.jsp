<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<header>
		<div class="application-heading">
			<h1>Effort Logger</h1>
			<nav id='menu'>
				<ul>

					<li><a href='./index'>Home</a></li>
					<li><a class='dropdown-arrow'>Efforts</a>
						<ul class='sub-menus'>
							<li><a href='./addEfforts'>Add Efforts</a></li>
							<li><a href='./viewEfforts'>View Efforts</a></li>
						</ul></li>
					<li><a class='dropdown-arrow'>Bugs</a>
						<ul class='sub-menus'>
							<li><a href='./addBugs'>Add Bugs</a></li>
							<li><a href='./viewBugs'>View Bugs</a></li>
						</ul></li>
					<li><a class='dropdown-arrow'>Welcome User!</a>
						<ul class='sub-menus'>
							<li><a href='/logout'>Logout</a></li>
						</ul></li>
				</ul>
			</nav>
	</header>
</body>
</html>
