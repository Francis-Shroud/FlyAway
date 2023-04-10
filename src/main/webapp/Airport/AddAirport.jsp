<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="connection.*"%>
<%@page import="modelGetSet.*"%>
<%@page import="operations.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% 
String a_code = request.getParameter("PortCode");
String a_name = request.getParameter("PortName");
String city = request.getParameter("PortCityName");
String country = request.getParameter("PortCountryName");

AdminAirport sc = new AdminAirport();
sc.setPortCode(a_code);
sc.setPortName(a_name);
sc.setPortCity(city);
sc.setPortCountry(country);


AdminAirportOper ao = new AdminAirportOper();


String str = ao.AddNewAirport(sc);


if(str.equals("Success")){
	session.setAttribute("info", "New Airline Added Successfully");
	response.sendRedirect("AirportFrm.jsp");
}
else{
	session.setAttribute("info", "New Airline not added");
	response.sendRedirect("error.html");
}

%>