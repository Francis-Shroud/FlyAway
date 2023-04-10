<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="connection.*"%>
<%@page import="modelGetSet.*"%>
<%@page import="operations.*"%>

<%    	
		String flid = request.getParameter("F_id");
	
		AdminFlightOper aopr = new AdminFlightOper();
		
		String res = aopr.DeleteFlight(Integer.parseInt(flid));
		
		if(res.equals("Success"))
			response.sendRedirect("FlightFrm.jsp");
	
%>
	