<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  background: linear-gradient(90deg, #00d2ff 0%, #3a47d5 100%);
  margin: 0;
  padding: 0;
}

.container {
  width: 360px;
  margin: 60px auto;
  padding: 30px;
  background-color: white;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

.input-field {
  margin-bottom: 20px;
}

.input-field label {
  font-weight: bold;
}

.input-field select,
.input-field input[type="text"],
.input-field input[type="password"] {
  width: 100%;
  padding: 12px;
  border: none;
  background-color: #f1f1f1;
  border-radius: 5px;
}

.input-field select:focus,
.input-field input[type="text"]:focus,
.input-field input[type="password"]:focus {
  background-color: #ddd;
  outline: none;
}

.button-container {
  text-align: center;
  margin-top: 20px;
}

.registerbtn {
  background-color: black;
  color: white;
  padding: 12px 24px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

.registerbtn:hover {
  background-color: #333;
}

.signin-link {
  display: block;
  text-align: center;
  margin-top: 10px;
  color: dodgerblue;
  text-decoration: none;
}

</style>
</head>
<body>
<form action="register" method="post" name="registerForm">
    <div class="container">
        <h1>Register Here</h1>
        <p>Please fill in this form to create an account.</p>
        <hr>

        <div class="input-field">
            <label for="name">Name</label>
            <input type="text" placeholder="Enter Name" name="name" id="name" required>
        </div>

        <div class="input-field">
            <label for="email">Email</label>
            <input type="text" placeholder="Enter Email" name="email" id="email" required>
        </div>

        <div class="input-field">
            <label for="username">Username</label>
            <input type="text" placeholder="Enter Username" name="username" id="username" required>
        </div>

        <div class="input-field">
            <label for="password">Password</label>
            <input type="password" placeholder="Enter Password" name="password" id="password" required>
        </div>

        <div class="input-field">
            <label for="userType">User Type</label>
            <select id="userType" name="userType">
                <option value="admin">Admin</option>
                <option value="user">Employee</option>
            </select>
        </div>

        <div class="button-container">
            <button type="submit" class="registerbtn">Register</button>
        </div>

        <div class="signin-link">
            <a href="login">Already have an account? Login here</a>
        </div>
    </div>
</form>
</body>
</html>
