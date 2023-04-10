<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@page import="connection.*"%>
<%@page import="modelGetSet.*"%>
<%@page import="operations.*"%>	
<%@page import= "java.sql.*" %>
<%
	session = request.getSession();
	session.setMaxInactiveInterval(60 * 60);

   String airlineCode = (String) session.getAttribute("airlineCode");
   String sourceCode = (String) session.getAttribute("sourceCode");
   String destinationCode = (String) session.getAttribute("destinationCode");
   String seatsAvailable = (String) session.getAttribute("seatsAvailable");
   String bookingDate = (String) session.getAttribute("bookingDate");
  	
 
   	
%>
	
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
	
	<h3>Passenger Registration Form</h3>
	<form name="frmpassreg" method="POST" action="AddPassReg.jsp">
		<table style='text-align: center'
			class="table table-dark table-striped">
		<% 
		try
   {

		String airlineCode1 = (String) session.getAttribute("airlineCode");
		String bookingDate1 = (String) session.getAttribute("bookingDate");
		PassBooking pb = new PassBooking();
		pb.setAirlineCode(airlineCode1);
		pb.setBdate(bookingDate1);
		
		PassBookingOper pbo = new PassBookingOper();
		ResultSet rs = pbo.ShowAllPassBooking(pb);
		while (rs.next())
		{%>
		<tr>
		<td></td>
		<td><input type="hidden" name="bs" value="<%=rs.getString("booked") %>"></td>
		</tr>
		<% }
   }
   catch(Exception ex)
   {
	   System.out.print(ex);
   }%>
		
		<tr>
		<td>Airline Code</td>
		<td><%= session.getAttribute("airlineCode") %><input type="hidden" name="aircode" value="<%=session.getAttribute("airlineCode") %>"></td>
		</tr>
		<tr>
		<td>Passenger Name : </td>
		<td><input type="text" placeholder=" Name" name="PassName"></td>
		</tr>
		<tr>
		<td>Gender : </td>
		<td>
			Male<input type="Radio" name="Gender" value="Male" />
			Female<input type="Radio" name="Gender" value="Female" />
		</td>
		</tr>
		<tr>
		<td>Age :</td>
		<td> <input type="number" placeholder=" Age" name="PassAge"></td>
		</tr>
		<tr>
		<td>Passport : </td>
		<td><input type="Text" placeholder="Passport Number" name="PassPassNo"></td>
		</tr>
		
		<tr>
		<td><input type = "submit" value="Resigter"></td>
		<td><input type = "reset" value = "Clear"></td>
		</tr>
		</table>
		
	</form>
	
</body>
</html>
