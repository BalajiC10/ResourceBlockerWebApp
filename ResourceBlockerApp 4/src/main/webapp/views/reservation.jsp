<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 


<!DOCTYPE html>
 <html>
<head>
<meta charset="UTF-8">
<title>Reservation</title>
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

.table-container .approve-link,
.table-container .reject-link,
.table-container .export-link {
  color: black;
  text-decoration: none;
}

.table-container .approve-link:hover,
.table-container .reject-link:hover,
.table-container .export-link:hover {
  background-color: #ddd;
}
.topnav-right {
  float: right;
}
</style>
</head>
<body bgcolor="white">

<div class="topnav">
  <a href="../admin/">Home</a>
  <a href="insert">Add Resource</a>
  <a href="view">View</a>
  <div class="topnav-right">
    <a href="reservation">View Reservation</a>
    <a href="../changepass"> Change Password</a>
    <a href="../logout">Logout</a>
  </div>
</div>

<div class="table-container">
  <table border="1" class="table table-hover">
    <thead class="table-dark">
      <tr>
        <th>Reservation_Id</th>
        <th>User_Id</th>
        <th>Resource_Id</th>
        <th>StartDate</th>
        <th>Duration</th>
        <th>Status</th>
        <th>ActionApproved</th>
        <th>ActionRejected</th>
        <th>Export Reservations</th>
        <th>Booking Status</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="n" items="${reservationlist}">
        <tr>
          <td>${n.resid}</td>
          <td>${n.user.sl_no}</td>
          <td>${n.res.rid}</td>
          <td>${n.startDate}</td>
          <td>${n.duration}</td>
          <td>${n.status}</td>
          
          <td>
            <a href="approve?resid=${n.resid}" class="approve-link btn btn-warning">Approve</a>
          </td>
          <td>
            <a href="reject?resid=${n.resid}" class="reject-link btn btn-danger">Reject</a>
          </td>
          <td>
            <a href="/admin/export-reservations" class="export-link btn btn-primary">Export</a>
          </td>
          <td>${n.cancelStatus}</td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</div>

</body>
</html>