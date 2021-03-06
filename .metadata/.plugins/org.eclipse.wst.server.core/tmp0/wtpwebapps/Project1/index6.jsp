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
ResultSet res=db.DisplayData1(month,emp.persno);
if(res==null){
	RequestDispatcher rd=request.getRequestDispatcher("index4.jsp");
	rd.forward(request, response);
}
int i=1;
%>


<script>
function update(i){
	document.getElementById('upd'+i).style.display="none";
	document.getElementById('sub'+i).style.display="block";
	document.getElementById('insL'+i).style.display="none";
	document.getElementById('insI'+i).style.display="block";
	document.getElementById('purL'+i).style.display="none";
	document.getElementById('purI'+i).style.display="block";
}
</script>

<h2>Modify Visits to Fabrication Agencies</h2>
<br>
<br>
<div class="div-table" id="dataTable">
			<div class="div-table-row">
				<div class="div-table-col" style="width:60px">Sr. No.</div>
				<div class="div-table-col">Name of Industry</div>
				<div class="div-table-col">Date</div>
				<div class="div-table-col">Purpose/Outcome</div>
				<div class="div-table-col" style="width:60px"></div>
				<div class="div-table-col" style="width:60px"></div>
			</div>
			<%while(res!=null && res.next()){ %>
			<div class="div-table-row">
			<form action="UpdateServlet1" method="post">
				<div class="div-table-col" style="width:60px"><%=i %></div>
				<div class="div-table-col">
					<p id="insL<%=i %>"><%=res.getString("industry") %></p>
					<input type="text" id="insI<%=i %>" style="display: none;" value=<%=res.getString("industry") %> name="industry">
				</div>
				<div class="div-table-col">
					<p ><%=res.getString("visitdate") %></p>
					<input type="hidden" style="display: none;"value=<%=res.getString("visitdate") %> name="visit_date">
				</div>
				<div class="div-table-col">
					<p id="purL<%=i %>"><%=res.getString("purpose") %></p>
					<input type="text" id="purI<%=i %>" style="display: none;" value=<%=res.getString("purpose") %> name="purpose">
				</div>
				<div class="div-table-col" style="width:60px">
				<input type="button" onclick="update('<%=i %>')" id="upd<%=i %>" value="Update"/>
				<input type="submit" style="display: none;" id="sub<%=i %>" value="Save"/></div>
				</form>
				<form action="DeleteServlet1" method="post">
				<div class="div-table-col" style="width:60px">
				<input type="hidden" value="<%=res.getString("visitdate") %>" name="visitdate"/>
				<input type="hidden" value="<%=emp.persno %>" name="persno"/>
				<input type="submit" value="Delete"></div>
				</form>
			</div>
			<%i++; %>
			<%} %>
		</div>
		<form action="index4.jsp" method="post">
			<input type="submit" value="save"/>
		</form>
</body>
</html>