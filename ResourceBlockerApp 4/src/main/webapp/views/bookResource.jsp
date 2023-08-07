<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>book resource</title>
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

.topnav-right {
	float: right;
}

.p {color =white;
	
}

.container {
	text-align: center;
	margin-top: 10%;
}

.form-container {
	display: inline-block;
	background-color: #f2f2f2;
	padding: 20px;
	border-radius: 5px;
	max-width: 400px;
	margin: 0 auto;
}

.form-container label {
	font-size: 18px;
	display: block;
}

.form-container input {
	padding: 8px;
	margin: 5px 0;
	width: 100%;
	border: 1px solid #ccc;
	border-radius: 3px;
	box-sizing: border-box;
}

.form-container input[type="submit"] {
	background-color: #04AA6D;
	color: white;
	cursor: pointer;
	width: 100%;
}

.form-container input[type="submit"]:hover {
	background-color: #45a049;
}

.form-container p {
	color: white;
}
</style>
</head>
<body>
	<div class="topnav">
		<a href="../employeeDashboard/">Home</a> <a href="bookResource">Book
			Resources</a> <a href="viewResources">View Resources</a>
		<div class="topnav-right">
			<a href="viewReservations">View Bookings</a> <a href="../changepass1">Change
				Password</a> <a href="../logout">Logout</a>
		</div>
	</div>

	<div class="container">
		<div class="form-container">
			<c:if test="${not empty message}">
				<p style="color: green">${message}</p>
			</c:if>
			<h1>Book a Resource</h1>
			<form action="bookResource" method="post">
				<label for="startDate">Start Date:</label> <input type="date"
					id="startDate" name="startDate" required> <label
					for="duration">Duration:</label> <input type="number" id="duration"
					name="duration" required> <label for="resid">Resource
					ID:</label> <input type="number" id="resid" name="resid" required>

				<input type="submit" value="Book Resource">
			</form>
		</div>
	</div>
</body>
</html>
