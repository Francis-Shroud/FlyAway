<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="connection.*"%>
<%@page import="modelGetSet.*"%>
<%@page import="operations.*"%>
<%@page import="java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%

String airlinecode = request.getParameter("aircode");
String passname = request.getParameter("PassName");
String gender = request.getParameter("Gender");
String age = request.getParameter("PassAge");
String passportno = request.getParameter("PassPassNo");
session = request.getSession();
session.setMaxInactiveInterval(60 * 60);


PassReg pr = new PassReg();
pr.setAirline_code(airlinecode);
pr.setPname(passname);
pr.setGender(gender);
pr.setAge(Integer.parseInt(age));
pr.setPassportno(passportno);

PassRegOper pro = new PassRegOper();
String res = pro.AddNewPassReg(pr);

String booked = request.getParameter("bs");
int bookedInt = Integer.parseInt(booked);
String airlineCode1 = (String) session.getAttribute("airlineCode");
String bookingDate1 = (String) session.getAttribute("bookingDate");
int count = (Integer) session.getAttribute("count");




if(bookedInt==1)
{
	
	response.sendRedirect("../PassTravelDetail/PassTravelDetFrm.jsp");
		
}
else
{
	
	count++;
	session.setAttribute("count", count);
	
	PassBooking pb = new PassBooking();
	pb.setAirlineCode(airlineCode1);
	pb.setBdate(bookingDate1);
	
	

	PassBookingOper pbo = new PassBookingOper();
	String res1 = pbo.UpdateBooked(pb);
	
	%><jsp:forward  page="PassRegFrm.jsp" /><%			

}


%>