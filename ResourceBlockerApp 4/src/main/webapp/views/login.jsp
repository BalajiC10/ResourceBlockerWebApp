<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="https://media.istockphoto.com/id/1258101935/vector/brainstorming-creative-idea-icon-design.jpg?s=1024x1024&w=is&k=20&c=FBPLpIOc_Khbk__TGVZn4F5mdvLjmEBXJgNlM4vN9Fs=" />
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
  margin: 80px auto;
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
<script>
function validateForm() {
    var userType = document.forms["loginForm"]["userType"].value;
    var username = document.forms["loginForm"]["username"].value;
    var password = document.forms["loginForm"]["password"].value;

    if (userType === "" || username === "" || password === "") {
        alert("Please fill in all fields.");
        return false;
    }
}
</script>
</head>
<body>
<form action="login1" method="post" onsubmit="return validateForm()" name="loginForm">
    <div class="container">
        <h1>Login</h1>
        <p>Login Here</p>
        <hr>

        <div class="input-field">
            <label for="userType">User Type</label>
            <select name="userType" required>
                <option value="" disabled selected>Select User Type</option>
                <option value="admin">Admin</option>
                <option value="user">Employee</option>
            </select>
        </div>

        <div class="input-field">
            <label for="username">Username</label>
            <input type="text" placeholder="Enter UserName" name="username" id="username" required>
        </div>

        <div class="input-field">
            <label for="password">Password</label>
            <input type="password" placeholder="Enter Password" name="password" id="password" required>
        </div>

        <div class="button-container">
            <button type="submit" class="registerbtn">Login</button>
        </div>

        <div class="signin-link">
            <a href="register">Don't have an account? Register here</a>
        </div>
    </div>
</form>
</body>
</html>
