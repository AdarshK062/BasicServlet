<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Home - Director</title>
	<link rel="stylesheet" href="./style.css">
</head>

<body onload="myFunction()">

<%@ page import="BasicServlet.*" %>
<%@ page import="java.sql.*" %>

<%
	HttpSession s= request.getSession(true);
	Employee emp=(Employee) s.getAttribute("emp");
	String period=(String)request.getParameter("month");

	if(period!=null){
		s.setAttribute("period",period);
	}
	else{
		period=(String)s.getAttribute("period");
	}

	DNET DNet=new DNET();
	Connection dbConnection=DNet.getSurveyThinConnection();
	PreparedStatement pStatement;

	ResultSet res=null;
	try{
		pStatement=dbConnection.prepareStatement("SELECT F_CPERSNO, F_VC2NAME FROM "+DNet.Employee+" WHERE F_VC2DIVISION=?");
		pStatement.setString(1, emp.division);
		res=pStatement.executeQuery();
	} catch (SQLException e){
		e.printStackTrace();
	}
	int i=1;
%>

<script>
	function myFunction() {
		document.getElementById('mth1').value=document.getElementById('mth').value;
	}
</script>

<div style="display: flex;">

	<div class="card" style="width: 15%;float:left;">
		<div style="text-align: center;">
			<img src="icon.png" width="80%">
		</div>
		<div style="border-top: 0.5px solid rgb(133, 128, 128);"></div>
		<div style="text-align: center;margin-top: 10px;">
			<b><%= emp.name%></b>
		</div>
		<br>
		<div style="text-align: center;">
			<form id="mnth" action="directorHome.jsp" method="post">
				<input type="month" id="mth" name="month" onblur="document.getElementById('mnth').submit()" onchange="document.getElementById('mnth').submit()" value= <%=period %> required/>
			</form>
		</div>
	</div>

	<div class="card" style="width:60%; float:left; margin:auto">
		<div>
			<h2><b>
				Details
			</b></h2>
		</div>
		<div>
			<table class="tab">
				<tr>
					<th width="30%">Persno</th>
					<td width="2%">:</td>
					<td><%= emp.persno%></td>
				</tr>
				<tr>
					<th width="30%">Name</th>
					<td width="2%">:</td>
					<td><%= emp.name %></td>
				</tr>
				<tr>
					<th width="30%">Designation</th>
					<td width="2%">:</td>
					<td><%= emp.designation %></td>
				</tr>
				<tr>
					<th width="30%">Division</th>
					<td width="2%">:</td>
					<td><%= emp.division %></td>
				</tr>
			</table>
		</div>
	</div>

	<div style="clear: both;"></div>
</div>


<div class="card" id="display" style="width:85%; height: auto; margin: auto">
	<fieldset>
		<legend>List of Employees</legend>
		<div class="div-table" id="dataTable">
			<div class="div-table-row" id="head">
				<div class="div-table-col-head" style="width:8%">Sr. No.</div>
				<div class="div-table-col-head" style="width:30%">Employee ID</div>
				<div class="div-table-col-head" style="width:40%">Employee Name</div>
				<div class="div-table-col-head"  style="width:20%">Report</div>
			</div>

			<%while(res!=null && res.next()){ %>
			<div class="div-table-row">
				<form action="reportGen.jsp" method="post"  target="_blank">
					<div class="div-table-col"  style="width:8%"><%=i %></div>
					<div class="div-table-col" style="width:30%">
						<p><%=res.getString("F_CPERSNO") %></p>
						<input type="hidden" value='<%=res.getString("F_CPERSNO") %>' name="persNo">
					</div>
					<div class="div-table-col" style="width:40%">
						<p><%=res.getString("F_VC2NAME") %></p>
						<input type="hidden" value='<%=res.getString("F_VC2NAME") %>' name="empName">
					</div>
					<div class="div-table-col" style="width:20%">
						<input type="hidden" name="month" id="mnth1"/>
						<input type="hidden" value="director" name="reportType"/>
						<input type="submit" value="View"/>
					</div>
				</form>
			</div>
			<%i++; %>
			<%} %>
		</div>
	</fieldset>
</div>


<div id="logout">
	<form action="login.jsp" method="post">
		<input type="hidden" value="logout" name="logout"/>
		<input type="submit" value="Logout"/>
	</form>
</div>

<% dbConnection.close(); %>

</body>
</html>