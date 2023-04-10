<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="changePassword.jsp" method="post">
		<table>
			<tr>
				<td>Current Password</td>
				<td><input type="password" name="current"></td>
			</tr>
			<tr>
				<td>New Password</td>
				<td><input type="password" name="new"></td>
			</tr>
			<tr>
				<td>Confirm Password</td>
				<td><input type="password" name="confirm"></td>
			</tr>
			<tr>
				<td><input type="submit" value="Change Password"></td>
			</tr>
		</table>
	</form>

</body>
</html>