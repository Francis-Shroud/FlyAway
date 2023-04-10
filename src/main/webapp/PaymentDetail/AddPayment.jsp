<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="connection.*"%>
<%@page import="modelGetSet.*"%>
<%@page import="operations.*"%>
<%@page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% 
session = request.getSession();
session.setMaxInactiveInterval(60 * 60);


String P_id = request.getParameter("ddlPId");
String Amt = request.getParameter("amt");
session.setAttribute("Amt", Amt);
String Transection_type = request.getParameter("TransType");
String Transection_Date = request.getParameter("pymttime");


PassPayment sc = new PassPayment();

sc.setP_id(Integer.parseInt(P_id));
sc.setAmt(Float.parseFloat(Amt));
sc.setTranType(Transection_type);
sc.setTranDate(Transection_Date);

PassPaymentOper ppo = new PassPaymentOper();
String str = ppo.AddNewPassPayment(sc);


if(str.equals("Success"))
{
	response.sendRedirect("Ticket.jsp");
}	
else
{
	
	response.sendRedirect("PassPaymentFrm.jsp");
}

%>