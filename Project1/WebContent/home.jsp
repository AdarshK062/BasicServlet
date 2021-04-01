<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<style>
body{
	background: #eddeff
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

/* .container-table100 {
  width: 100%;
  background: #c850c0;
  background: -webkit-linear-gradient(45deg, #4158d0, #c850c0);
  background: -o-linear-gradient(45deg, #4158d0, #c850c0);
  background: -moz-linear-gradient(45deg, #4158d0, #c850c0);
  background: linear-gradient(45deg, #4158d0, #c850c0); 
  display: flex;
  align-items: center;
  justify-content: center;
  flex-wrap: wrap;
  padding: 33px 30px;
} */


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
		

</style>
</head>
<body onload="myFunction()">
<%@ page import="BasicServlet.*" %>
<%@ page import="java.sql.*" %>
<%
HttpSession s= request.getSession(true);
Employee emp=(Employee) s.getAttribute("emp");
DBConnect db=(DBConnect)s.getAttribute("db");
ResultSet res=db.GetProgress(emp.persno);
ResultSet res1=db.GetVisits(emp.persno);
int i=1,j=1;
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
	</script>
<div style="display: flex;">
<div class="card" style="width: 15%;float:left;">
	<div>
		<img src="icon.png" width="100%">
	</div>
	<div style="border-top: 0.5px solid rgb(133, 128, 128);"></div>
	<div style="text-align: center;margin-top: 10px;">
		<b><%= emp.name%></b>
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

<div class="card" style="width:81%;height: auto; overflow:hidden;max-height:500px; float:left;">
	<fieldset style="height: 100%; overflow-y: auto;padding: 20px;">
		<legend style="font-weight: bold;font-size: large;">Work in Progress</legend>
		<div style="margin-bottom: 10px;">
			<table class="tab" style="width:100%;">
				<thead>
					<tr>
						<th width="4%">Sr. No.</th>
						<th>Project ID</th>
						<th>Project Name</th>
						<th>WP Date</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody style="overflow-y: auto;max-height: 150px;">
					<%while(res!=null && res.next()){ %>
						<tr>
							<td><%=i %></td>
							<td>
								<%=res.getString("pid") %>
							</td>
							<td>
								<%=res.getString("pname") %>
							</td>
							<td>
								<%=res.getString("wpd") %>
							</td>
							<td>
								<%=res.getString("status") %>
							</td>
						</tr>
						<%i++;} %>
				</tbody>
			</table>
		</div>
			<div style="display: flex;">
				<form action="index2.jsp" method="post">
					<input type="submit" value="Add" />
				</form>
		
				<form action="index3.jsp" method="post">
					<input type="submit" value="Update" />
				</form>
			</div>
		</div>
	</fieldset>
</div>


<div class="card" style="width:81%;height: auto; overflow:hidden;max-height:500px; float:left;">
	<fieldset style="height: 100%; overflow-y: auto;padding: 20px;">
		<legend style="font-weight: bold;font-size: large;">Visits to Fabrication Agencies</legend>
		<div style="margin-bottom: 10px;">
			<table class="tab" style="width:100%;">
				<thead>
					<tr>
						<th width="4%">Sr. No.</th>
						<th>Industry</th>
						<th>Visit Date</th>
						<th>Purpose</th>
					</tr>
				</thead>
				<tbody style="overflow-y: auto;max-height: 150px;">
					<%while(res1!=null && res1.next()){ %>
						<tr>
							<td><%=j%></td>
							<td>
								<%=res1.getString("ind") %>
							</td>
							<td>
								<%=res1.getString("vd") %>
							</td>
							<td>
								<%=res1.getString("pur") %>
							</td>
						</tr>
						<%j++;} %>
				</tbody>
			</table>
		</div>
			<div style="display: flex;">
				<form action="index5.jsp" method="post">
					<input type="submit" value="Add" />
				</form>
		
				<form action="index6.jsp" method="post">
					<input type="submit" value="Update" />
				</form>
			</div>
		</div>
	</fieldset>
</div>


<div id="logout">
<form action="end.jsp" method="post">
	<input type="submit" value="Logout"/>
</form>
</div>

<div id="snackbar">Added Successfully</div>
<div id="snackbar1">Updated Successfully</div>

<%if(s.getAttribute("add")!=null){ %>
<div id="toast" style="display:none;"></div>
<%s.setAttribute("add",null);} %>
<%if(s.getAttribute("update")!=null){%>
<div id="toast1" style="display:none;"></div>
<%s.setAttribute("update",null);}%>
</body>
</html>