<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="connection.*"%>
<%@page import="modelGetSet.*"%>
<%@page import="operations.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% 
session = request.getSession();
session.setMaxInactiveInterval(60 * 60);

String P_id = request.getParameter("ddlpid");
String airlineCode = (String) session.getAttribute("airlineCode");
String sourceCode = (String) session.getAttribute("sourceCode");
String destinationCode = (String) session.getAttribute("destinationCode");
String bookingDate = (String) session.getAttribute("bookingDate");
String fid = (String) session.getAttribute("fid");
String booktime = request.getParameter("time"); 


PassTravelDetail sc = new PassTravelDetail();

sc.setP_int(Integer.parseInt(P_id));
sc.setTravelDate(bookingDate);
sc.setTravelTime(booktime);
sc.setAirline_Code(airlineCode);
sc.setSource_code(sourceCode);
sc.setDest_code(destinationCode);
sc.setF_id(fid);


PassTravelDetailOper pbo = new PassTravelDetailOper();


String str = pbo.AddNewPassTravelDetail(sc);


int count = (Integer) session.getAttribute("count");
float pymt = (Float) session.getAttribute("pymt");


if(count==1)
{
	response.sendRedirect("../PaymentDetail/PassPaymentFrm.jsp");
}
else
{
	count--;
	session.setAttribute("count", count);
	pymt++;
	session.setAttribute("pymt", pymt);
	
	response.sendRedirect("PassTravelDetFrm.jsp");
}

%>