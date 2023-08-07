<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Resource</title>
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
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

.error-msg {
  color: red;
  font-size: 14px;
  margin-top: 5px;
}

</style>
</head>
<body bgcolor="white">

<div class="topnav">
  <a  href="../admin/" >Home</a>
   <a href="insert">Add Resource</a>
	<a href="view">View</a>
	<div class="topnav-right">
   	<a href="reservation"> View Reservation</a>
   	<a href="../changepass"> Change Password</a>
    <a href="../logout">logout</a>
    </div>
	
</div>
<div class="form">
  <div class="form-container">
    <form action="addresource" method="post">
      <h2 align="center">Add Resource Here</h2>
      <input type="hidden" name="rid" value="${res.rid}">
      <table>
        <tr>
          <td><label for="fname">Resource Category:</label></td>
          <td><input type="text" id="fname" name="rtype" value="${res.rtype}" pattern="[A-Z a-z]*" required="required"></td>
        </tr>
        <tr>
          <td><label for="lname">Resource Name:</label></td>
          <td><input type="text" id="lname" name="rname" value="${res.rname}" pattern="[A-Z a-z]*" required="required"></td>
        </tr>
        <tr>
          <td><label for="fname">Resource Location:</label></td>
          <td><input type="text" id="fname" name="location" value="${res.location}" pattern="[A-Z a-z]*" required="required"></td>
        </tr>
        <tr>
          <td><label for="lname">Resource Capacity:</label></td>
          <td>
            <input type="number" id="lname" name="capacity" min="1" value="${res.capacity}" required="required">
          </td>
        </tr>
        <tr>
          <td colspan="2" align="center">
            <input class="button button5" type="submit" value="Submit">
          </td>
        </tr>
      </table>
    </form>
  </div>
</div>


		
</body>
</html>
