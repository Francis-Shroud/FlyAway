<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="connection.*"%>
<%@page import="modelGetSet.*"%>
<%@page import="operations.*"%>

<%    	
		String a_code = request.getParameter("a_code");
	
		AdminAirportOper aopr = new AdminAirportOper();
		
		String res = aopr.DeleteAirport(a_code);
		
		if(res.equals("Success"))
			response.sendRedirect("AirportFrm.jsp");
	
%>
	