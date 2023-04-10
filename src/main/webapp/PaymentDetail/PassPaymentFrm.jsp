<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="operations.*"%>
<%@page import="java.sql.*"%>
<%@page import="connection.*"%>
<%@page import="modelGetSet.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
session = request.getSession();
session.setMaxInactiveInterval(60 * 60);

float price = (Float) session.getAttribute("price");
float pymt = (Float) session.getAttribute("pymt");
float total = price * pymt;

Date currentDate = new Date();

SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String currentTime = dateFormat.format(currentDate);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
	crossorigin="anonymous"></script>
</head>
<body>

	<form name="frmPayment" method="POST" action="AddPayment.jsp">
		<table style='text-align: center'
			class="table table-dark table-striped">
			<tr>
				<td>Passenger ID</td>
				<td><select name="ddlPId">
						<option>Passenger ID</option>
						<%
						PassRegOper pro = new PassRegOper();
						ResultSet rs = pro.ShowAllPassRegDetail();
						while (rs.next()) {
						%>
						<option value="<%=rs.getInt("P_id")%>"><%=rs.getString("Pname")%></option>

						<%
						}
						%>
				</select></td>
			</tr>

			<tr>
				<td>Amount</td>
				<td><%=total%><input type="hidden" name="amt"
					value="<%=total%>"></td>
			</tr>
			<tr>
				<td>Payment Method :</td>
				<td>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="TransType"
							id="exampleRadios1" value="Credit/Debit Card" checked> <label
							class="form-check-label" for="exampleRadios1">
							Credit/Debit Card </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="TransType"
							id="exampleRadios1" value="NetBanking" checked> <label
							class="form-check-label" for="exampleRadios1"> NetBanking
						</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="TransType"
							id="exampleRadios1" value="UPI" checked> <label
							class="form-check-label" for="exampleRadios1"> UPI </label>
					</div>
				</td>

			</tr>
			<tr>
				<td>Transaction Date</td>
				<td><%=currentTime%><input type="hidden" name="pymttime"
					value="<%=currentTime%>"></td>
			</tr>
		</table>
		<div class="col-auto">
			<button type="submit" class="btn btn-primary mb-3">Pay</button>
		</div>
	</form>
</body>
</html>