<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Page</title>
<style>
body {
 
 background: linear-gradient(90deg, #00d2ff 0%, #3a47d5 100%);
  font-family: Verdana, sans-serif;
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
.div{
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
<body bgcolor="white">

	<div class="topnav">
 	<a ref="../admin/"color=" " >Home</a>
   	<a href="insert">Add Resource</a>
	<a href="update">Update</a>
	<a href="delete">Delete</a>
	<a href="view">View</a>
	<div class="topnav-right">
   	<a href="reservation"> View Reservation</a>
   	<a href="../changepass"> Change Password</a>
    <a href="../logout">logout</a>
    </div>
	
</div>
	<div>
	
<c:if test="${msg}">
	<h2>Please Enter the valid id</h2>
	</c:if>
	
		
		
		<form action="update" method="post" >
		
		Enter Resource Id:<input type="number" name="rid"> 
		
				<input class="button button5" type="submit" value="Submit">
		
		</form><br><br>


		</div>
</body>
</html>
