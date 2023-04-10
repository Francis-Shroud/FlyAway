<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="connection.*"%>
<%@page import="modelGetSet.*"%>
<%@page import="operations.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% 
String F_id = request.getParameter("FlightId");
String airline_code = request.getParameter("ddlAirlineCode");
String source_code = request.getParameter("ddlAirlineCode1");
String destination_code = request.getParameter("ddlAirlineCode2");
String price = request.getParameter("FlightPrice");
String seats = request.getParameter("fseats");

AdminFlight sc = new AdminFlight();
sc.setFlightID(Integer.parseInt(F_id));
sc.setFlightCode(airline_code);
sc.setFlightSource(source_code);
sc.setFlightDest(destination_code);
sc.setFlightPrice(Integer.parseInt(price));
sc.setFlightSeats(Integer.parseInt(seats));


AdminFlightOper ao = new AdminFlightOper();


String str = ao.AddNewFlight(sc);


if(str.equals("Success")){
	session.setAttribute("info", "New Flight Added Successfully");
	response.sendRedirect("FlightFrm.jsp");
}
else{
	session.setAttribute("info", "New Flight not added");
	response.sendRedirect("error.html");
}

%>