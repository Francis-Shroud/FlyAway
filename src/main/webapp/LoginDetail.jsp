<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="connection.*"%>
<%@page import="modelGetSet.*"%>
<%@page import="operations.*"%>
<%@page import = "java.sql.*" %>
<%

String uname = request.getParameter("txtUsername");
String pwd = request.getParameter("txtPass");

AdminLogOpr alop = new AdminLogOpr();
ResultSet rs =alop.ShowAdminlog();

while(rs.next())
{
	String id = rs.getString("logid");
	String pass = rs.getString("logpass");

if(uname.equals(id) && pwd.equals(pass))
{
	response.sendRedirect("AdminMain.jsp");
}
else{
	response.sendRedirect("AdminLogin.jsp");
}
}

%>