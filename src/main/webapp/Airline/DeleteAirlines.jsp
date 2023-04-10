<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="connection.*"%>
<%@page import="modelGetSet.*"%>
<%@page import="operations.*"%>

<%    	String code = request.getParameter("AirCode");
	
		AdminAirlinesOper aopr = new AdminAirlinesOper();
		
		String res = aopr.DeleteAirline(code);
		
		if(res.equals("Success"))
			response.sendRedirect("AirlineFrm.jsp");
	
%>
	