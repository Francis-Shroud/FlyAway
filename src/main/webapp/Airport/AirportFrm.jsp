<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="operations.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Airpots</title>
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
		<div class="container-fluid">
			<ul class="navbar-nav me-autonmy-2 my-lg-0 navbar-nav-scroll"
				style="-bs-scroll-height: 100px;">
				<li class="nav-item"><a class="nav-link active text-light fs-4"
					aria-current="page" href="../AdminMain.jsp">Home</a></li>
				<li class="nav-item"><a class="nav-link text-light fs-4"
					href="../Airline/AirlineFrm.jsp">Airlines</a></li>
				<li class="nav-item"><a class="nav-link text-light fs-4"
					href="../Flight/FlightFrm.jsp">Flight</a></li>
				<li class="nav-item"><a class="nav-link text-light fs-4"
					href="../change_password.jsp">Change Password</a></li>
				<li class="nav-item"><a class="nav-link text-light fs-4"
					href="../AdminLogin.jsp">Logout</a></li>
			</ul>
		</div>
	</nav>


	<form name="frmAirport" method="POST" action="AddAirport.jsp">
		<h3>Airport Detail</h3>
		<table style='text-align: center'
			class="table table-dark table-striped">
			<tr class="table-active">
				<td>Airport Code</td>
				<td><input type="text" placeholder="Max 3 Character"
					name="PortCode" required></td>
			</tr>
			<tr>
				<td>Airport Name</td>
				<td><input type="text" placeholder="Airport Name"
					name="PortName" required></td>
			</tr>
			<tr>
				<td>City</td>
				<td><input type="text" placeholder="City Name"
					name="PortCityName" required></td>
			</tr>
			<tr>
				<td>Country</td>
				<td><input type="text" placeholder="Country Name"
					name="PortCountryName" required></td>
			</tr>
		</table>
		<div class="col-auto">
			<button type="submit" class="btn btn-primary mb-3">Submit</button>
		</div>
	</form>
	<h2>Show all Airports</h2>

	<table width='50%' border='1' style='text-align: center'
		class="table table-dark table-striped">
		<tr class="table-active">
			<th>Airport Code</th>
			<th>Airport Name</th>
			<th>Airport City</th>
			<th>Airport Country</th>
			<th></th>
		</tr>
		<%
			try {
				AdminAirportOper AFO1 = new AdminAirportOper();
				ResultSet rs1 = AFO1.ShowAllAirport();

				while (rs1.next()) {
			%>

		<tr>
			<td><%=rs1.getString("a_code")%></td>
			<td><%=rs1.getString("a_name")%></td>
			<td><%=rs1.getString("city")%></td>
			<td><%=rs1.getString("country")%></td>
			<td><a
				href="DeleteAirport.jsp?a_code=<%=rs1.getString("a_code")%>">Delete</a></td>
		</tr>
		<%
			}
			} catch (Exception ex) {
			System.out.print(ex);
			}
			%>

	</table>

</body>
</html>