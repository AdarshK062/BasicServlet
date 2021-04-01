<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
	body{
			background:#eddeff
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
  margin: auto; 
  margin-left: 1%;           
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
	width: 85%;
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
if(month==null){
	//System.out.println("hi");
}
else{
//System.out.println(month);
s.setAttribute("month", month);
res=db.DisplayData(month,emp.persno);
}
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
	document.getElementById('pnameL'+i).style.display="none";
	document.getElementById('pnameI'+i).style.display="block";
	document.getElementById('descL'+i).style.display="none";
	document.getElementById('descI'+i).style.display="block";
	document.getElementById('stsL'+i).style.display="none";
	document.getElementById('stsI'+i).style.display="block";
	document.getElementById('pdcL'+i).style.display="none";
	document.getElementById('pdcI'+i).style.display="block";
}
</script>
<div class="card" style="width:25%;margin-left:3.5%;">
	<fieldset>
		<legend style="font-weight: bold;font-size: large;">Select Month</legend>
		<div style="text-align: center;align-items: center;">
<form action="index3.jsp" method="post">
<input type="month" id="start" name="start" required style="margin-right: 30px;height: 40px;" value=<%=month %>>
<input type="submit" value="Next"/>
</form>
</div>
</fieldset>
</div>
<div class="card" style="width:90%;margin:auto;">
	<fieldset>
		<legend style="font-weight: bold;font-size: large;">Work in Progress</legend>
<div class="div-table" id="dataTable">
			<div class="div-table-row">
				<div class="div-table-col-head" style="width:5%">Sr. No.</div>
				<div class="div-table-col-head" style="width:12%">Project ID</div>
				<div class="div-table-col-head" style="width:12%">Project Name</div>
				<div class="div-table-col-head" style="width:18%">Project Description</div>
				<div class="div-table-col-head" style="width:9%">WP Date</div>
				<div class="div-table-col-head" style="width:10%">Status</div>
				<div class="div-table-col-head" style="width:12%">PDC</div>
				<div class="div-table-col-head" style="width:9.5%"></div>
				<div class="div-table-col-head" style="width:9.5%"></div>
			</div>
			<%while(res!=null && res.next()){ %>
			<div class="div-table-row">
			<form action="UpdateServlet" method="post">
				<div class="div-table-col" style="width:5%"><%=i %></div>
				<div class="div-table-col"  style="width:12%"><%=res.getString("project_Id") %>
					<input type="hidden"  value=<%=res.getString("project_Id") %> name="projectId">
				</div>
				<div class="div-table-col" style="width:12%">
					<p id="pnameL<%=i %>"><%=res.getString("project_Name") %></p>
					<input type="text" id="pnameI<%=i %>" style="display: none;"value=<%=res.getString("project_Name") %> name="projectName">
				</div>
				<div class="div-table-col" style="width:18%">
					<p id="descL<%=i %>"><%=res.getString("Description") %></p>
					<input type="text" id="descI<%=i %>" style="display: none;"value=<%=res.getString("Description") %> name="projectDesc">
				</div>
				<div class="div-table-col" style="width:9%"><%=res.getString("wpd") %>
					<input type="hidden"  value=<%=res.getString("wpd") %> name="wpd">
				</div>
				<div class="div-table-col" style="width:10%">
					<p id="stsL<%=i %>"><%=res.getString("status") %></p>
					<input type="text" id="stsI<%=i %>" style="display: none;" value=<%=res.getString("status") %> name="status">
				</div>
				<div class="div-table-col" style="width:12%">
					<p id="pdcL<%=i %>"><%=res.getString("PDC") %></p>
					<input type="date" id="pdcI<%=i %>" style="display: none;"value=<%=res.getString("PDC") %> name="PDC">
				</div>
				<div class="div-table-col" style="width:9.5%">
				<input type="button" onclick="update('<%=i %>')" id="upd<%=i %>" value="Update"/>
				<input type="submit" style="display: none;" id="sub<%=i %>" value="Save"/></div>
				</form>
				<form action="DeleteServlet" method="post">
				<div class="div-table-col" style="width:9.5%">
				<input type="hidden" value="<%=res.getString("project_Id") %>" name="projectId"/>
				<input type="hidden" value="<%=res.getString("wpd") %>" name="wpd"/>
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