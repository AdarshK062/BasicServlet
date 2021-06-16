<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<style>
@import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap');

	* {
		/* margin: 0;
		padding: 0;*/
		/* box-sizing: border-box;  */
		font-family: 'Poppins', sans-serif;
	}
body{
	background: #eddeff
}
body{
			background: #eddeff
		}
	input[type=submit]{
			background-color: #555555;
			border-radius: 5px;
			height:40px;
			border:none;
			color:whitesmoke;
			font-size: medium;
			/* padding: 15px; */
			box-shadow: 0 0 7px 0 #000;
			/* padding-bottom: 20px; */
			padding-left: 15px;
			padding-right: 15px;
			margin: 10px;
		}
		.div-table-row input[type=submit]{
			background-color: #555555;
			border-radius: 5px;
			height:30px;
			border:none;
			color:whitesmoke;
			font-size: medium;
			/* padding: 15px; */
			box-shadow: 0 0 7px 0 #000;
			/* padding-bottom: 20px; */
			padding-left: 15px;
			padding-right: 15px;
			margin: 5px;
		}
		input[type=button]{
			background-color: #555555;
			border-radius: 5px;
			height:30px;
			border:none;
			color:whitesmoke;
			font-size: medium;
			/* padding: 15px; */
			box-shadow: 0 0 7px 0 #000;
			/* padding-bottom: 20px; */
			padding-left: 15px;
			padding-right: 15px;
			margin: 5px;
		}
		.card {
			background-color: white;
			height: auto;
			padding: 40px 30px;
			box-shadow: 0 0 10px 0 #000;
			/* position: relative; */
			border-radius: 5px;
			margin: 15px 15px;
		}
.div-table {
  display: table;         
  width: auto;     
  margin: auto;            
font-size: large;
	max-height: 250px;
	width: 100%;
	overflow-y: auto;
	overflow-x: hidden;
  border-radius: 10px;
  border-collapse: collapse;
  align-items: center;
  text-align: center;
}
.div-table-row {
  display: table-row;
  width: auto;
  clear: both;
  border-collapse: collapse;
  align-items: center;
  text-align: center;
  width: 100%;
  font-size: large;
}
.div-table-col {
text-align: center;
font-size: large;
border: 0.5px solid rgb(139, 137, 137);  float: left;
  display: table-column;
  height:40px;   
  border-collapse: collapse;
  align-items: center;  
  vertical-align: middle;
  display: flex;
  justify-content: center;
  align-content: center;
  flex-direction: column; 
}
.div-table-col-head{
	height: 55px;
	border: 0.5px solid rgb(139, 137, 137);
  background: #36304a;
  color: whitesmoke;
  border-collapse: collapse;
  align-items: center;
  text-align: center;
  float: left;
  font-size:20px;
  display: table-column; 
  vertical-align: middle;
  display: flex;
  justify-content: center;
  align-content: center;
  flex-direction: column;
}
input[type=text]{
	font-size: large;
}
p{
	font-size:20px;

}

	#logout{
		position:absolute;
		top: 5%;
		right: 5%;
	}
	input[type=submit]{
			background-color: #555555;
			border-radius: 5px;
			height:40px;
			border:none;
			color:whitesmoke;
			font-size: medium;
			/* padding: 15px; */
			box-shadow: 0 0 7px 0 #000;
			/* padding-bottom: 20px; */
			padding-left: 15px;
			padding-right: 15px;
			margin: 10px;
		}
		.card {
			background-color: white;
			height: auto;
			padding: 40px 30px;
			box-shadow: 0 0 10px 0 #000;
			/* position: relative; */
			border-radius: 5px;
			margin: 15px 15px;
		}
		.tab{
			border: 0.5px solid rgb(139, 137, 137);
			font-size: large;
			max-height: 250px;
	width: 100%;
	overflow-y: auto;
	overflow-x: hidden;
  border-radius: 10px;
		}
		table, th, td {
			border: 0.5px solid rgb(139, 137, 137);
			border-collapse: collapse;
			padding: 15px;
		}



table thead tr {
  height: 60px;
  background: #36304a;
  color: whitesmoke;
}
tbody tr:nth-child(even) {
  background-color: #f5f5f5;
}

#snackbar,#snackbar1 {
  visibility: hidden;
  min-width: 250px;
  float:right;
  background-color: rgb(75, 74, 74);
  color: #fff;
  text-align: center;
  border-radius: 2px;
  padding: 16px;
  position: fixed;
  z-index: 1;
  right:5%;
  bottom: 30px;
  font-size: 17px;
}

#snackbar.show,#snackbar1.show {
  visibility: visible;
  -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
  animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

@-webkit-keyframes fadein {
  from {bottom: 0; opacity: 0;} 
  to {bottom: 30px; opacity: 1;}
}

@keyframes fadein {
  from {bottom: 0; opacity: 0;}
  to {bottom: 30px; opacity: 1;}
}

@-webkit-keyframes fadeout {
  from {bottom: 30px; opacity: 1;} 
  to {bottom: 0; opacity: 0;}
}

@keyframes fadeout {
  from {bottom: 30px; opacity: 1;}
  to {bottom: 0; opacity: 0;}
}

ul {
  list-style: none;
}

ul li::before {
  content: "\2022";
  color: red;
  font-weight: bold;
  display: inline-block; 
  width: 1em;
  margin-left: -1em;
font-size: 25px;
}

li button {
	background: none;
	color: inherit;
	border: none;
	padding: 0;
	cursor:pointer;
	outline: inherit;
  margin-bottom: 2%;
  font-size: 17px;
  text-align: left;
  margin-left: 0.5px;
}



</style>
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
<div class="card" style="width:60%; float:left;">
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

<div class="card" id="display" style="width:85%;height: auto; margin:auto;overflow:auto;max-height:800px;">
	<fieldset style="height: 100%; overflow: auto;">
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