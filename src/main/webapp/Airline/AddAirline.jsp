<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import ="modelGetSet.*" %>	
<%@page import ="operations.*" %>
<%@page import ="java.sql.*" %>


<% 
	String code = request.getParameter("AirCode");
	String name = request.getParameter("AirName");

	Adminairlines sc = new Adminairlines();
	sc.setAirCode(code);
	sc.setAirName(name);
	AdminAirlinesOper aao = new AdminAirlinesOper();
	String str = aao.AddNewAirlines(sc);
	try
	{
		if(str.equals("Success"))
		{
		
			response.sendRedirect("AirlineFrm.jsp");
		}
		else
		{
		
			response.sendRedirect("Error.html");
		}
	}
	catch(Exception ex)
	{
		System.out.println(ex);
	}
	

%>