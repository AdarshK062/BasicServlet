<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
.div-table {
  display: table;         
  width: auto;                 
  border: 2px solid #666666;
}
.div-table-row {
  display: table-row;
  width: auto;
  clear: both;
}
.div-table-col {
margin: 2px;
text-align: center;
border:2px solid #666666;
  float: left;
  display: table-column;         
  width: 200px;
  height:30px;          
}
</style>
</head>
<body>
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
s.setAttribute("month", month);
ResultSet res=db.DisplayData(month,emp.persno);
if(res==null){
	RequestDispatcher rd=request.getRequestDispatcher("index1.jsp");
	rd.forward(request, response);
}
int i=1;
%>


<script>
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

<h2>Modify Work in Progress</h2>
<br>
<br>
<div class="div-table" id="dataTable">
			<div class="div-table-row">
				<div class="div-table-col" style="width:60px">Sr. No.</div>
				<div class="div-table-col">Project ID</div>
				<div class="div-table-col">Project Name</div>
				<div class="div-table-col">Project Description</div>
				<div class="div-table-col">WP Date</div>
				<div class="div-table-col">Status</div>
				<div class="div-table-col">PDC</div>
				<div class="div-table-col" style="width:60px"></div>
				<div class="div-table-col" style="width:60px"></div>
			</div>
			<%while(res!=null && res.next()){ %>
			<div class="div-table-row">
			<form action="UpdateServlet" method="post">
				<div class="div-table-col" style="width:60px"><%=i %></div>
				<div class="div-table-col"><%=res.getString("project_Id") %>
					<input type="hidden"  value=<%=res.getString("project_Id") %> name="projectId">
				</div>
				<div class="div-table-col">
					<p id="pnameL<%=i %>"><%=res.getString("project_Name") %></p>
					<input type="text" id="pnameI<%=i %>" style="display: none;"value=<%=res.getString("project_Name") %> name="projectName">
				</div>
				<div class="div-table-col">
					<p id="descL<%=i %>"><%=res.getString("Description") %></p>
					<input type="text" id="descI<%=i %>" style="display: none;"value=<%=res.getString("Description") %> name="projectDesc">
				</div>
				<div class="div-table-col"><%=res.getString("wpd") %>
					<input type="hidden"  value=<%=res.getString("wpd") %> name="wpd">
				</div>
				<div class="div-table-col">
					<p id="stsL<%=i %>"><%=res.getString("status") %></p>
					<input type="text" id="stsI<%=i %>" style="display: none;" value=<%=res.getString("status") %> name="status">
				</div>
				<div class="div-table-col">
					<p id="pdcL<%=i %>"><%=res.getString("PDC") %></p>
					<input type="date" id="pdcI<%=i %>" style="display: none;"value=<%=res.getString("PDC") %> name="PDC">
				</div>
				<div class="div-table-col" style="width:60px">
				<input type="button" onclick="update('<%=i %>')" id="upd<%=i %>" value="Update"/>
				<input type="submit" style="display: none;" id="sub<%=i %>" value="Save"/></div>
				</form>
				<form action="DeleteServlet" method="post">
				<div class="div-table-col" style="width:60px">
				<input type="hidden" value="<%=res.getString("project_Id") %>" name="projectId"/>
				<input type="hidden" value="<%=res.getString("wpd") %>" name="wpd"/>
				<input type="hidden" value="<%=emp.persno %>" name="persno"/>
				<input type="submit" value="Delete"></div>
				</form>
			</div>
			<%i++; %>
			<%} %>
		</div>
		<form action="index1.jsp" method="post">
			<input type="submit" value="save"/>
		</form>
</body>
</html>