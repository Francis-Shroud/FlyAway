<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="connection.*"%>
<%@page import="modelGetSet.*"%>
<%@page import="operations.*"%>
<%@page import="java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
session = request.getSession();
session.setMaxInactiveInterval(60 * 60);

String airline_code = request.getParameter("aircode");
String bookedseat = request.getParameter("noofbook");
String booked = request.getParameter("noofbook");
String date = request.getParameter("hiddate");

PassBooking pb = new PassBooking();
pb.setAirlineCode(airline_code);
pb.setBookedseat(Integer.parseInt(bookedseat));
pb.setBooked(Integer.parseInt(booked));
pb.setBdate(date);

PassBookingOper pbo = new PassBookingOper();
String res = pbo.UpdateSeat(pb);





if(res.equals("Success"))
{
	
	response.sendRedirect("PassRegFrm.jsp");
	
	
}	

%>



