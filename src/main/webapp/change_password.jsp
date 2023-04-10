<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="modelGetSet.*"%>
<%@ page import="operations.*"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Password</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
	crossorigin="anonymous"></script>
</head>
<body>

<nav class="navbar navbar-expand-lg bg-dark">
		<div class="container-fluid ">
			<ul class="navbar-nav me-autonmy-2 my-lg-0 navbar-nav-scroll "
				style="-bs-scroll-height: 100px;">
				<li class="nav-item"><a class="nav-link active text-light fs-4 "
					aria-current="page" href="AdminMain.jsp">Back</a></li>
				<li class="nav-item"><a class="nav-link text-light fs-4"
					href="AdminLogin.jsp">Logout</a></li>
			</ul>
		</div>
	</nav>
	<h2>Change Password</h2>
	<form name="passchng" method="post" action="newlogpwd.jsp">

		<div class="mb-3 row">
			<label for="staticEmail" class="col-sm-2 col-form-label">New
				login ID</label>
			<div class="col-sm-10">
				<input type="email" class="form-control" id="staticEmail"
					name="logid" required>
			</div>
		</div>
		<div class="mb-3 row">
			<label for="inputPassword" class="col-sm-2 col-form-label">New
				login Password</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="inputPassword"
					name="logpass" required>
			</div>
		</div>
		<div class="col-auto">
			<button type="submit" class="btn btn-primary mb-3">Change
				Password</button>
			<button type="reset" class="btn btn-primary mb-3">Clear</button>
		</div>

	</form>
	<br>
	<br>

	<%
	AdminLogOpr alop = new AdminLogOpr();
	ResultSet rs = alop.ShowAdminlog();

	try {
		while (rs.next()) {
	%>
	<h2>Current details</h2>
	<table width='50%' border='1' style='text-align: center'
		class="table table-dark table-striped">
		<tr class="table-active">
			<th>Current Login ID</th>
			<th>Current Password</th>
		</tr>
		<tr>
			<td align=center><%=rs.getString("logid")%></td>
			<td align=center><%=rs.getString("logpass")%></td>
		</tr>
		<%
		}
		} catch (Exception ex) {
		System.out.println(ex);
		}
		%>
	</table>

</body>
</html>


