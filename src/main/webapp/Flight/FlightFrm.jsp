<%@page import="operations.*"%>
<%@page import="java.sql.*"%>
<%@page import="connection.*"%>
<%@page import="modelGetSet.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Flights</title>
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
					href="FlightsPerDay.jsp">Flights Per Day</a></li>
				<li class="nav-item"><a class="nav-link text-light fs-4"
					href="../Airport/AirportFrm.jsp">Add Airports</a></li>
				<li class="nav-item"><a class="nav-link text-light fs-4"
					href="../Airline/AirlineFrm.jsp">Airlines</a></li>
				<li class="nav-item"><a class="nav-link text-light fs-4"
					href="../change_password.jsp">Change Password</a></li>
				<li class="nav-item"><a class="nav-link text-light fs-4"
					href="../Home.jsp">Logout</a></li>
			</ul>
		</div>
	</nav>
	<form name="frmFlight" method="POST" action="AddFlight.jsp">
		<h3>Flight Detail</h3>

		<table width='50%' border='1' style='text-align: center'
			class="table table-dark table-striped">
			<tr class="table-active">
				<td>Flight ID</td>
				<td><input type="number" placeholder="Max 3 Character"
					name="FlightId" required></td>
			</tr>
			<tr>
				<td>Airline Code</td>
				<td><select name="ddlAirlineCode">
						<option>Select Airline Code</option>
						<%
						AdminAirlinesOper AAO = new AdminAirlinesOper();
						ResultSet rs = AAO.ShowAllAirlines();
		
						while(rs.next())
						{
						%>
						<option value='<%=rs.getString("code") %>'><%=rs.getString("name") %></option>
						<% 
						}
						%>
				</select></td>
			</tr>
			<tr>
				<td>Source Code</td>
				<td><select name="ddlAirlineCode1">
						<option>Select Source Code</option>
						<%
							AdminAirportOper AAO1 = new AdminAirportOper();
							ResultSet rs1 = AAO1.ShowAllAirport();
		
							while(rs1.next()){
							%>
						<option value='<%=rs1.getString("a_code") %>'><%=rs1.getString("a_name") %></option>
						<% 
							}
						%>
				</select></td>
			</tr>
			<tr>
				<td>Destination Code</td>
				<td><select name="ddlAirlineCode2">
						<option>Select Source Code</option>
						<%
							AdminAirportOper AAO2 = new AdminAirportOper();
							ResultSet rs2 = AAO2.ShowAllAirport();
							
							while(rs2.next()){
							%>
						<option value='<%=rs2.getString("a_code") %>'><%=rs2.getString("a_name") %></option>
						<% 
							}
						%>
				</select></td>
			</tr>
			<tr>
				<td>Price</td>
				<td><input type="number" placeholder="Price" name="FlightPrice"
					required></td>
			</tr>

			<tr>
				<td>Seats</td>
				<td><input type="number" placeholder="Number of Seats"
					name="fseats" required></td>
			</tr>
		</table>
		<div class="col-auto">
			<button type="submit" class="btn btn-primary mb-3">Submit</button>
		</div>
	</form>

	<h2>Flight Details</h2>

	<table width='50%' border='1' style='text-align: center'
		class="table table-dark table-striped">
		<tr class="table-active">
			<th>Fight ID</th>
			<th>Airline Code</th>
			<th>Source Code</th>
			<th>Destination Code</th>
			<th>Price</th>
			<th>Seats</th>
			<th></th>
		</tr>
		<%
		AdminFlightOper AFO = new AdminFlightOper();
		ResultSet rs3 = AFO.ShowAllFlights();
		
		try
		{
		while (rs3.next()) {
		%>

		<tr>
			<td><%=rs3.getInt("F_id")%></td>
			<td><%=rs3.getString("airline_code")%></td>
			<td><%=rs3.getString("source_code")%></td>
			<td><%=rs3.getString("destination_code")%></td>
			<td><%=rs3.getInt("price")%></td>
			<td><%=rs3.getInt("seats")%></td>
			<td><a href="DeleteFlight.jsp?F_id=<%=rs3.getInt("F_id") %>">Delete</a>
		</tr>
		<%
		}
		}
		catch(Exception ex)
		{
			System.out.print(ex);
		}
		%>

	</table>



</body>
</html>