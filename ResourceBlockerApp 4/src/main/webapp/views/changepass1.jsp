<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Password</title>
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

.form {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 50vh;
}

.form-container {
	background-color: white;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
}

table {
	margin-top: 20px;
	width: 100%;
}

table td {
	padding: 5px;
}

.error {
	color: red;
}

.success {
	color: green;
}

.button {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 3px 2px;
	transition-duration: 0.4s;
	cursor: pointer;
}

.button5 {
	background-color: #333;
	color: white;
	border: 2px solid #555555;
}

.button5:hover {
	background-color: #ddd;
	color: black;
}
</style>
</head>
<body>

	<div class="topnav">
		<a href="../employeeDashboard/">Home</a>
		<div class="topnav-right">

			<a href="../logout">logout</a>
		</div>

	</div>
	<div class="form">
		<div class="form-container">
			<form action="changepass" method="post">
				<h2 align="center">Change Password</h2>
				<table>
					<tr>
						<td><label for="oldPassword">Current Password:</label></td>
						<td><input type="password" id="oldPassword" name="oldpass"
							required></td>
					</tr>
					<tr>
						<td><label for="newPassword">New Password:</label></td>
						<td><input type="password" id="newPassword" name="newpass"
							required></td>
					</tr>
					<tr>
						<td><label for="confirmPassword">Confirm Password:</label></td>
						<td><input type="password" id="confirmPassword"
							name="confirmpass" required></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input class="button button5"
							type="submit" value="Submit"></td>
					</tr>
				</table>
			</form>
			<% if (request.getAttribute("errorMsg") != null) { %>
			<div class="error">
				<p><%= request.getAttribute("errorMsg") %></p>
			</div>
			<% } %>
			<% if (request.getAttribute("successMsg") != null) { %>
			<p class="success"><%= request.getAttribute("successMsg") %></p>
			<% } %>
		</div>
	</div>



</body>
</html>