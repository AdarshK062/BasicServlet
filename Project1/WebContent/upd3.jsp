<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="./style.css">
</head>
<body onload="myFunction()">
<%@ page import="BasicServlet.*" %>
<%@ page import="java.sql.*" %>
<%
HttpSession s= request.getSession(true);
Employee emp=(Employee) s.getAttribute("emp");
String period=(String) s.getAttribute("period");

DNET DNet=new DNET();
Connection dbConnection=DNet.getSurveyThinConnection();
PreparedStatement pStatement;
ResultSet res=null;


if(request.getParameter("update")!=null){
	try {
		//System.out.println(request.getParameter("toDate"));
		pStatement=dbConnection.prepareStatement("UPDATE "+DNet.MPR_Cep+" SET TO_DATE=TO_DATE(?, 'YYYY-MM-DD'), TITLE=? WHERE F_CPERSNO=? AND TO_CHAR(FROM_DATE,'DD/MM/YYYY') LIKE ?");
		pStatement.setString(1,request.getParameter("toDate"));
		pStatement.setString(2,request.getParameter("title"));
		pStatement.setString(3,emp.persno);
		pStatement.setString(4,request.getParameter("fromDate"));
		pStatement.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	s.setAttribute("upd", 1);
}

if(request.getParameter("delete")!=null){
	try {
		pStatement=dbConnection.prepareStatement("DELETE FROM "+DNet.MPR_Cep+" WHERE F_CPERSNO=? AND TO_CHAR(FROM_DATE,'DD/MM/YYYY') LIKE ?");
		pStatement.setString(1,emp.persno);
		pStatement.setString(2,(String)request.getParameter("fromDate"));
		pStatement.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	s.setAttribute("del", 1);
}

if(period!=null){
try {
	pStatement=dbConnection.prepareStatement("SELECT TO_CHAR(FROM_DATE,'DD/MM/YYYY') AS FMD, TO_CHAR(TO_DATE,'DD/MM/YYYY') AS TOD, TO_CHAR(TO_DATE,'YYYY-MM-DD') AS TOD1, TITLE FROM "+DNet.MPR_Cep+" WHERE F_CPERSNO=? AND TO_CHAR(FROM_DATE,'YYYY-MM') LIKE ?");
	pStatement.setString(1,emp.persno);
	pStatement.setString(2, period);
	res=pStatement.executeQuery();
} catch (SQLException e) {
	e.printStackTrace();
}
}
int i=1;
s.setAttribute("update",1);
%>


<script>
	function myFunction() {
		var Table = document.getElementsByClassName("div-table")[0];
		var rowCount = Table.getElementsByClassName("div-table-row").length;
		if(rowCount<2){
			Table.getElementsByClassName("noData")[0].style.display = "block";
			Table.getElementsByClassName("noData")[0].textContent = "No data to show";
		}
		if(document.getElementById("toast")!=null){
			var x = document.getElementById("snackbar");
			  x.className = "show";
			  setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
		  }
		  if(document.getElementById("toast1")!=null){
			var x = document.getElementById("snackbar1");
			  x.className = "show";
			  setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
		  }
		}
function updateForm(i){
	document.getElementById('upd'+i).style.display="none";
	document.getElementById('sub'+i).style.display="block";
	document.getElementById('todL'+i).style.display="none";
	document.getElementById('todI'+i).style.display="block";
	document.getElementById('titL'+i).style.display="none";
	document.getElementById('titI'+i).style.display="block";
}
</script>

<div class="card" style="width:90%;margin:auto;">
	<fieldset>
		<legend>Details of CEP/ Conference/ Lectures attended during the month</legend>
<div class="div-table" id="dataTable">
			<div class="div-table-row" id="head">
				<div class="div-table-col-head" style="width:5%">Sr. No.</div>
				<div class="div-table-col-head"  style="width:20%">From Date</div>
				<div class="div-table-col-head" style="width:20%">To Date</div>
				<div class="div-table-col-head"  style="width:25%">Title</div>
				<div class="div-table-col-head" style="width:15%"></div>
				<div class="div-table-col-head" style="width:14.2%"></div>
			</div>
			<%while(res!=null && res.next()){ %>
			<div class="div-table-row">
			<form action="upd3.jsp" method="post">
				<div class="div-table-col"  style="width:5%"><%=i %></div>
				<div class="div-table-col" style="width:20%">
					<p><%=res.getString("FMD") %></p>
					<input type="hidden" style="display: none;" value='<%=res.getString("FMD") %>' name="fromDate">
				</div>
				<div class="div-table-col" style="width:20%">
					<p id="todL<%=i %>"><%=res.getString("TOD") %></p>
					<input type="date" required id="todI<%=i %>" style="display: none;" value='<%=res.getString("TOD1") %>' name="toDate">
				</div>
				<div class="div-table-col" style="width:25%">
					<p id="titL<%=i %>"><%=res.getString("TITLE") %></p>
					<input type="text" required id="titI<%=i %>" style="display: none;" value='<%=res.getString("TITLE") %>' name="title">
				</div>
				<div class="div-table-col" style="width:15%">
				<input type="hidden" value="upd" name="update"/>
				<input type="button" onclick="updateForm('<%=i %>')" id="upd<%=i %>" value="Update"/>
				<input type="submit" style="display: none;" id="sub<%=i %>" value="Save"/></div>
				</form>
				<form action="upd3.jsp" method="post">
				<div class="div-table-col" style="width:14.2%">
				<input type="hidden" value="del" name="delete"/>
				<input type="hidden" value="<%=res.getString("FMD") %>" name="fromDate"/>
				<input type="hidden" value="<%=emp.persno %>" name="persno"/>
				<input type="submit" value="Delete"></div>
				</form>
			</div>
			<%i++; %>
			<%} %>
			<div class="noData"></div>
		</div>
		<br>
		<form action="home.jsp" method="post">
			<input type="submit" value="Save"/>
		</form>
		</fieldset>
		</div>
		<div id="snackbar">Updated Successfully</div>
		<div id="snackbar1">Deleted Successfully</div>
		<%if(s.getAttribute("upd")!=null){ %>
			<div id="toast" style="display:none;"></div>
			<%s.setAttribute("upd",null);} %>
			<%if(s.getAttribute("del")!=null){%>
			<div id="toast1" style="display:none;"></div>
			<%s.setAttribute("del",null);}%>
			<% dbConnection.close(); %>
</body>
</html>