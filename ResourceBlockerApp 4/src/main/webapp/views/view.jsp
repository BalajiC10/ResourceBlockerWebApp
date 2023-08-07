 	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View</title>
<style>
body {
   font-family: Verdana, sans-serif;
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

.table-container {
  margin: 20px auto;
  
  background-color: white;
  border-radius: 5px;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
  overflow: hidden;
}

.table-container table {
  width: 100%;
  border-collapse: collapse;
}

.table-container th,
.table-container td {
  padding: 10px;
  text-align: left;
}

.table-container th {
  background-color: #333;
  color: white;
}

.table-container tr:nth-child(even) {
  background-color: #f2f2f2;
}

.table-container .edit-link,
.table-container .delete-link {
  color: black;
  text-decoration: none;
}

.table-container .edit-link:hover,
.table-container .delete-link:hover {
  background-color: #ddd;
}
.topnav-right {
  float: right;
}
</style>
</head>
<body bgcolor="white">
<div class="topnav">

  <a href="../admin/" >Home</a>
  <a href="insert">Add Resource</a>
  <a href="view">View</a>
  <div class="topnav-right">
    <a href="reservation">View Reservation</a>
    <a href="../changepass"> Change Password</a>
    <a href="../logout">Logout</a>
  </div>
</div>


<div class="table-container">
    <c:if test="${not empty message}">
        <p style="color: red">${message}</p>
    </c:if>
	<table border="1" class="table table-hover">
		
		<thead class="table-dark">
			<tr>
				<th scope="col">Resource_Id</th>
				<th scope="col">Category</th>
				<th scope="col">Name</th>
				<th scope="col">Location</th>
				<th scope="col">Capacity</th>
				<th scope="col">Edit</th>
				<th scope="col">Delete</th>
			</tr>					
		</thead>
		<tbody>
			<c:forEach var="res" items="${resource}">
				<tr>
					<td>${res.rid}</td>
					<td>${res.rtype}</td>
					<td>${res.rname}</td>
					<td>${res.location}</td>
					<td>${res.capacity}</td>
					
					<td><a href="update?rid=${res.rid}" style="color:black" class="edit-link">Edit</a></td>
					<td><a href="delete?rid=${res.rid}" style="color:black" class="delete-link">Delete</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

</body>
</html>