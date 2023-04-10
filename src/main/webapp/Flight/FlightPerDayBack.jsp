<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="connection.*"%>
<%@page import="modelGetSet.*"%>
<%@page import="operations.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% 
String airline_code = request.getParameter("ddlAirlineCode");
String bdate = request.getParameter("BookDate");
String noofbookings = request.getParameter("NoBooking");

PassBooking sc = new PassBooking();
sc.setAirlineCode(airline_code);
sc.setBdate(bdate);
sc.setNoBooking(Integer.parseInt(noofbookings));




PassBookingOper pbo = new PassBookingOper();


String str = pbo.AddNewPassBooking(sc);


if(str.equals("Success"))
{
	response.sendRedirect("FlightsPerDay.jsp");
}
else
{
	response.sendRedirect("../error.html");
}

%>