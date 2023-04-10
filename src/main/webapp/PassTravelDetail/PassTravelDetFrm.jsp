<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="operations.*"%>
<%@page import="java.sql.*"%>
<%@page import="connection.*"%>
<%@page import="modelGetSet.*"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>


<%
session = request.getSession();
session.setMaxInactiveInterval(60 * 60);

  	 String airlineCode = (String) session.getAttribute("airlineCode");
  	 String sourceCode = (String) session.getAttribute("sourceCode");
   	 String destinationCode = (String) session.getAttribute("destinationCode");
   	 String seatsAvailable = (String) session.getAttribute("seatsAvailable");
   	 String bookingDate = (String) session.getAttribute("bookingDate");
  	 String fid = (String) session.getAttribute("fid");
  	 
  	
     
     Date currentDate = new Date();

     SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
     String currentTime = dateFormat.format(currentDate);
   	
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

	<h3>Passenger Travel Detail</h3>
	<form name="frmPassTravDet" method="POST" action="AddPassTravDet.jsp">
		<table style='text-align: center'
			class="table table-dark table-striped">
			<tr>
				<td>Passenger ID</td>
				<td><select name="ddlpid"><option> Select Name </option>
				
				<% 	PassRegOper pro = new PassRegOper();
					ResultSet rs = pro.ShowAllPassRegDetail();
					while(rs.next())
						{
				%>
				<option value='<%=rs.getString("P_id") %>'><%=rs.getString("Pname") %></option>
				<% 
						}
				%>
			</select>
			</td>  
			</tr>
			
			<tr>
				<td> Airline Code</td>
				<td><%=session.getAttribute("airlineCode") %></td>
				
			</tr>
			
			<tr>
				<td>Flight ID</td>
				<td><%=session.getAttribute("fid") %></td>
			</tr>
			<tr>
				<td>From : </td>
				<td><%=session.getAttribute("sourceCode") %></td>
				
				
			</tr>
			<tr>
			<td> To :</td>
				<td><%=session.getAttribute("destinationCode") %></td>
			</tr>
			
			<tr>
				<td>Date</td>
				<td><%=session.getAttribute("bookingDate") %></td>
			</tr>
			
			<tr>
				<td>Time</td>
				<td><%=currentTime%><input type="hidden" name="time" value="<%=currentTime%>"></td>
			</tr>
			
		</table>	
		<div class="col-auto">
			<button type="submit" class="btn btn-primary mb-3">Confirm Details</button>
		</div>	
	</form>
</body>
</html>