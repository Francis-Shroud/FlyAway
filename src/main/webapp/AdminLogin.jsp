<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Administrator Login </title>
<link rel = "Stylesheet" href = "login.css">
</head>
<body>
<div class="background">
		<div class="shape"></div>
		<div class="shape"></div>
	</div>
	<form name="frmLogin" method="POST" action="LoginDetail.jsp">
		<h3>Login Here</h3>

		<label>Email</label>
		<input type="email" placeholder="Email" name="txtUsername" id="username"> 
		
		<label>Password</label> 
		<input type="password" placeholder="Password" name="txtPass" id="password">

		<button type="submit">Log In</button>
	</form>
</body>
</html>