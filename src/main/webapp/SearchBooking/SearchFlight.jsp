<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="connection.*"%>
<%@page import="modelGetSet.*"%>
<%@page import="operations.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
					aria-current="page" href = "../Home.jsp" >Home</a></li>
				<li class="nav-item"><a class="nav-link text-light fs-4"
					href = "../AdminLogin.jsp" >Login</a></li>
			</ul>
		</div>
	</nav>
	
	<br>
	<h2 >Book a Flight</h2>
	<br>

	<form name="SearchFlight" method="POST" >

		<label>From : </label> 
		<select name="srcfli"><option> Source </option>
			<%
		AdminAirportOper aao = new AdminAirportOper();
		
		ResultSet rs = aao.ShowAllAirport();
		
		while(rs.next()){
		%>
			<option value='<%=rs.getString("a_code") %>'><%=rs.getString("a_name") %></option>
			<% 
		}
		%>
		</select>  
		&nbsp;&nbsp;
		
		<label>To :</label> <select name="desfli">
			<option> Destination </option>
			<%
		AdminAirportOper aao1 = new AdminAirportOper();
		
		ResultSet rs1 = aao1.ShowAllAirport();
		
		while(rs1.next()){
		%>
			<option value='<%=rs1.getString("a_code") %>'><%=rs1.getString("a_name") %></option>
			<% 
		}
		%>
		</select> 
		&nbsp;&nbsp;
		
		<label>Date of travel</label> 
		<input type="date" name="TravDate">
		
		<br><br> 
		<div class="col-auto">
			<button type="submit" class="btn btn-primary mb-3">Submit</button>
		</div>
		</form>

<form name="frmselect" method="POST" action="updateseats.jsp">
	<table style='text-align: center'
			class="table table-dark table-striped">
			<tr class="table-active">
			<th>Airline Code</th>
			<th>Flight ID</th>
			<th>Source Code</th>
			<th>Destination Code</th>
			<th>Price</th>
			<th>Seats Available</th>
			<th>Booking Date</th>
			<th>Add Number of Passengers
			<th>Book</th>
		</tr>
		<% 
						try{
							String source_code = request.getParameter("srcfli");
							String destination_code = request.getParameter("desfli");
							String bdate = request.getParameter("TravDate");
							
							AdminFlight stflight = new AdminFlight();
							stflight.setFlightSource(source_code);
							stflight.setFlightDest(destination_code);
							stflight.setBdate(bdate);
							
							AdminFlightOper afo = new  AdminFlightOper();
							ResultSet rs3 = afo.ShowAllSelectFlight(stflight);
						
						
						while(rs3.next())
						{
							%>

		<tr>
			<td><%= rs3.getString("airline_code") %><input type="hidden" name="aircode" value="<%= rs3.getString("airline_code") %>"></td>
			<td><%= rs3.getString("F_id") %><input type="hidden" name="hidfid" value="<%= rs3.getString("F_id") %>"></td>
			<td><%= rs3.getString("source_code") %> <input type="hidden" name="hidsrc" value="<%= rs3.getString("source_code") %>"></td>
			<td><%= rs3.getString("destination_code") %><input type="hidden" name="hiddes" value="<%= rs3.getString("destination_code") %>"></td>
			<td><%= rs3.getString("price") %><input type="hidden" name="hidprice" value="<%= rs3.getString("price") %>"></td>
			<td><%= rs3.getString("noofbookings") %><input type="hidden" name="hidseats" value="<%= rs3.getString("noofbookings") %>"></td>
			<td><%= rs3.getString("bdate") %><input type="hidden" name="hiddate" value="<%= rs3.getString("bdate") %>"></td>
			<td><input type ="number" name="noofbook" required></td>
			<td><input type ="submit" value="BOOK"></td>
			<% 
				String airlineCode = rs3.getString("airline_code");
				String fid = rs3.getString("F_id");
			   	String sourceCode = rs3.getString("source_code");
			   	String destinationCode = rs3.getString("destination_code");
			  	float price = rs3.getFloat("price");
			  	String seatsAvailable = rs3.getString("noofbookings");
			   	String bookingDate = rs3.getString("bdate");
			   	
	
			   session.setAttribute("airlineCode", airlineCode);
			   session.setAttribute("fid", fid);
			   session.setAttribute("sourceCode", sourceCode);
			   session.setAttribute("destinationCode", destinationCode);
			   session.setAttribute("price", price);
			   session.setAttribute("seatsAvailable", seatsAvailable);
			   session.setAttribute("bookingDate", bookingDate);
			   session = request.getSession();
			   session.setMaxInactiveInterval(60 * 60);
						}
				int count = 1;
				session.setAttribute("count", count);
				float pymt = 1;
				session.setAttribute("pymt", pymt);
			
						}
					catch(Exception ex)
					{
						System.out.print(ex);
					}
					%>

		</tr>
	</table>
	</form>
</body>
</html>


