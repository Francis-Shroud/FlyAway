<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "modelGetSet.*"%>
<%@ page import = "operations.*"%>
<%@ page import = "java.sql.*"%>

<%

String logid = request.getParameter("logid");
String logpass = request.getParameter("logpass");

AdminLog al = new AdminLog();
al.setLogid(logid);
al.setLogpass(logpass);

AdminLogOpr alo = new AdminLogOpr();
String str = alo.ChangePassword(al);

if(str.equals("Success"))
{
	response.sendRedirect("AdminLogin.jsp");
}
else
{
	response.sendRedirect("change_password.jsp");
}

%>