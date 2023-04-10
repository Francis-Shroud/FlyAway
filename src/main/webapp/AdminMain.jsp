<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="operations.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin HomePage</title>
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
<body class="bg-gradient">
	<nav class="navbar navbar-expand-lg bg-dark">
		<div class="container-fluid">
			<ul class="navbar-nav me-autonmy-2 my-lg-0 navbar-nav-scroll"
				style="-bs-scroll-height: 100px;">
				<li class="nav-item"><a class="nav-link active text-light fs-4"
					aria-current="page" href="AdminMain.jsp">Home</a></li>
				<li class="nav-item"><a class="nav-link text-light fs-4"
					href="Airport/AirportFrm.jsp">Add Airports</a></li>
				<li class="nav-item"><a class="nav-link text-light fs-4"
					href="Airline/AirlineFrm.jsp">Airlines</a></li>
				<li class="nav-item"><a class="nav-link text-light fs-4"
					href="Flight/FlightFrm.jsp">Flight</a></li>
				<li class="nav-item"><a class="nav-link text-light fs-4"
					href="change_password.jsp">Change Password</a></li>
				<li class="nav-item"><a class="nav-link text-light fs-4"
					href="Home.jsp">Logout</a></li>
			</ul>
		</div>
	</nav>


	<%
	try {
		AdminFlightOper AFO = new AdminFlightOper();
		ResultSet rs = AFO.ShowAllFlights();

		AdminAirportOper AFO1 = new AdminAirportOper();
		ResultSet rs1 = AFO1.ShowAllAirport();

		AdminAirlinesOper AFO2 = new AdminAirlinesOper();
		ResultSet rs2 = AFO2.ShowAllAirlines();
	%>
	<hr class="border border-secondary border-2 opacity-50">
	
	<h2 class="display-3">Show all Flight</h2>
	
	<hr class="border border-secondary border-2 opacity-50">

	<table width='50%' border='1' style='text-align: center'
		class="table table-dark table-striped">
		<tr class="table-active">
			<th>Fight ID</th>
			<th>Airline Code</th>
			<th>Source Code</th>
			<th>Destination Code</th>
			<th>Price</th>
		</tr>
		<%
		while (rs.next()) {
		%>

		<tr class="table-active">
			<td><%=rs.getInt("F_id")%></td>
			<td><%=rs.getString("airline_code")%></td>
			<td><%=rs.getString("source_code")%></td>
			<td><%=rs.getString("destination_code")%></td>
			<td><%=rs.getInt("price")%></td>
		</tr>
		<%
		}
		%>

	</table>

	<hr class="border border-secondary border-2 opacity-50">

	<h2 class="display-3">Show all Airports</h2>
	
	<hr class="border border-secondary border-2 opacity-50">

	<table width='50%' border='1' style='text-align: center'
		class="table table-dark table-striped">
		<tr class="table-active">
			<th>Airport Code</th>
			<th>Airport Name</th>
			<th>Airport City</th>
			<th>Airport Country</th>
		</tr>
		<%
		while (rs1.next()) {
		%>

		<tr class="table-active">
			<td><%=rs1.getString("a_code")%></td>
			<td><%=rs1.getString("a_name")%></td>
			<td><%=rs1.getString("city")%></td>
			<td><%=rs1.getString("country")%></td>
		</tr>
		<%
		}
		%>

	</table>

	<hr class="border border-secondary border-2 opacity-50">

	<h2 class="display-3">Show all Airlines</h2>
	
	<hr class="border border-secondary border-2 opacity-50">

	<table width='50%' border='1' style='text-align: center'
		class="table table-dark table-striped">
		<tr class="table-active">
			<th>Airline Code</th>
			<th>Airline Name</th>
		</tr>
		<%
		while (rs2.next()) {
		%>

		<tr class="table-active">
			<td><%=rs2.getString("code")%></td>
			<td><%=rs2.getString("name")%></td>
		</tr>
		<%
		}
		%>

	</table>


	<%
	} catch (Exception ex) {
	System.out.println(ex);
	}
	%>
</body>
</html>