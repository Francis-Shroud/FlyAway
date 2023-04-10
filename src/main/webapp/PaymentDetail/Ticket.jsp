<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="connection.*"%>
<%@page import="modelGetSet.*"%>
<%@page import="operations.*"%>
<%@page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% 
session = request.getSession();
session.setMaxInactiveInterval(60 * 60);

String airlineCode = (String) session.getAttribute("airlineCode");
String sourceCode = (String) session.getAttribute("sourceCode");
String destinationCode = (String) session.getAttribute("destinationCode");
String seatsAvailable = (String) session.getAttribute("seatsAvailable");
String bookingDate = (String) session.getAttribute("bookingDate");
String fid = (String) session.getAttribute("fid");
float price = (Float) session.getAttribute("price");
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ticket</title>
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
	
	<h1>Payment Successful</h1><br>
		<h3>Here is your Ticket</h3>
	
		<table style='text-align: center'
			class="table table-info table-striped">
			<tr>
			<th>Passenger Name</th><th>Airline</th><th>Flight ID</th><th>From</th><th>To</th><th>Price</th>
			</tr>
			<% 
				try
				{
				String airlineCode1 = (String) session.getAttribute("airlineCode");
				PassReg pr = new PassReg();
				pr.setAirline_code(airlineCode1);
			
				PassRegOper pro = new PassRegOper();
				ResultSet res = pro.ShowSelectPassRegDetail(pr);
				
				while(res.next())
				{
			%>
			
			<tr align="center">
			<td><%=res.getString("pname")%></td>
			
			<td><%=session.getAttribute("airlineCode") %></td>
			<td><%=session.getAttribute("fid") %></td>
			<td><%=session.getAttribute("sourceCode") %></td>
			<td><%=session.getAttribute("destinationCode") %></td>
			<td><%=session.getAttribute("price") %></td>
			<%	} 
				}
				catch(Exception ex)
				{
					System.out.print(ex);
				}
			%>
			</tr>
		</table>
</body>
</html>