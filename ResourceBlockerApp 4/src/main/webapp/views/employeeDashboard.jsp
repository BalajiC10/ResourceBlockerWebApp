<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Dashboard</title>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
	background: linear-gradient(90deg, #00d2ff 0%, #3a47d5 100%);
}

.topnav {
	overflow: hidden;
	background-color: #333;
}

.topnav a {
	float: left;
	color: #f2f2f2;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-size: 17px;
}

.topnav a:hover {
	background-color: #ddd;
	color: black;
}

.topnav a.active {
	background-color: #04AA6D;
	color: white;
}

.div {
	font-size: 40px;
	text-align: center;
	margin-top: 20%;
	color: #ffffff;
	font-family: "Montserrat";
	font-weight: 400;
}

.topnav-right {
	float: right;
}

.p {color =white;
	
}
</style>
</head>
<body>

	<div class="topnav">
		<a href="../employeeDashboard/">Home</a> <a href="bookResource">Book
			Resources</a> <a href="viewResources">View Resources</a>
		<div class="topnav-right">
			<a href="viewReservations"> View Bookings</a> <a
				href="../changepass1"> Change Password</a> <a href="../logout">logout</a>
		</div>

	</div>


	<div
		style="font-size: 40px; text-align: center; margin-top: 20%; color: #333; font-family:"Montserrat";
       font-weight: 400;"
       >

		<p>Welcome to Resource Blocker App</p>
		<h2>Employee Page</h2>
	</div>

</body>
</html>
