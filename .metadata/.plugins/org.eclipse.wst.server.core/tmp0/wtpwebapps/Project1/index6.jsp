<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
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
</style>
</head>
<body onload="myFunction()">
<%@ page import="BasicServlet.*" %>
<%@ page import="java.sql.*" %>
<%
HttpSession s= request.getSession(true);
Employee emp=(Employee) s.getAttribute("emp");
DBConnect db=(DBConnect)s.getAttribute("db");
String month=request.getParameter("start");
if(month==null){
	month=(String) s.getAttribute("month");
}
ResultSet res=null;
if(month==null){//System.out.println("month");
}
else{
//System.out.println(month);
s.setAttribute("month", month);
res=db.DisplayData1(month,emp.persno);
}
/*if(res==null){
	RequestDispatcher rd=request.getRequestDispatcher("index6.jsp");
	rd.forward(request, response);
}*/
int i=1;
s.setAttribute("update",1);
%>


<script>
	function myFunction() {
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
function update(i){
	document.getElementById('upd'+i).style.display="none";
	document.getElementById('sub'+i).style.display="block";
	document.getElementById('insL'+i).style.display="none";
	document.getElementById('insI'+i).style.display="block";
	document.getElementById('purL'+i).style.display="none";
	document.getElementById('purI'+i).style.display="block";
}
</script>
<div class="card" style="width:25%;margin-left:40px;">
	<fieldset>
		<legend style="font-weight: bold;font-size: large;">Select Month</legend>
		<div style="text-align: center;align-items: center;">
<form id="hie" action="index6.jsp" method="post">
<input type="month" id="start" name="start" style="margin-right: 30px;height: 40px;" required value=<%=month %>>
<input type="submit" value="Next"/>
</form>
</div>
</fieldset>
</div>
<div class="card" style="width:90%;margin:auto;">
	<fieldset>
		<legend style="font-weight: bold;font-size: large;">Fabrication Visits</legend>
<div class="div-table" id="dataTable">
			<div class="div-table-row" id="head">
				<div class="div-table-col-head" style="width:5%">Sr. No.</div>
				<div class="div-table-col-head"  style="width:25%">Name of Industry</div>
				<div class="div-table-col-head"  style="width:15%">Date</div>
				<div class="div-table-col-head" style="width:25%">Purpose/Outcome</div>
				<div class="div-table-col-head" style="width:12%"></div>
				<div class="div-table-col-head" style="width:12%"></div>
			</div>
			<%while(res!=null && res.next()){ %>
			<div class="div-table-row">
			<form action="UpdateServlet1" method="post">
				<div class="div-table-col"  style="width:5%"><%=i %></div>
				<div class="div-table-col" style="width:25%">
					<p id="insL<%=i %>"><%=res.getString("industry") %></p>
					<input type="text" id="insI<%=i %>" style="display: none;" value=<%=res.getString("industry") %> name="industry">
				</div>
				<div class="div-table-col" style="width:15%">
					<p ><%=res.getString("visitdate") %></p>
					<input type="hidden" style="display: none;"value=<%=res.getString("visitdate") %> name="visit_date">
				</div>
				<div class="div-table-col" style="width:25%">
					<p id="purL<%=i %>"><%=res.getString("purpose") %></p>
					<input type="text" id="purI<%=i %>" style="display: none;" value=<%=res.getString("purpose") %> name="purpose">
				</div>
				<div class="div-table-col" style="width:12%">
				<input type="button" onclick="update('<%=i %>')" id="upd<%=i %>" value="Update"/>
				<input type="submit" style="display: none;" id="sub<%=i %>" value="Save"/></div>
				</form>
				<form action="DeleteServlet1" method="post">
				<div class="div-table-col" style="width:12%">
				<input type="hidden" value="<%=res.getString("visitdate") %>" name="visitdate"/>
				<input type="hidden" value="<%=emp.persno %>" name="persno"/>
				<input type="submit" value="Delete"></div>
				</form>
			</div>
			<%i++; %>
			<%} %>
		</div>
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
</body>
</html>