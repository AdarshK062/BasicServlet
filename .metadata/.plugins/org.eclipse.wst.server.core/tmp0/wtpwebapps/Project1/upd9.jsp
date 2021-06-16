<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="./downloadedStyles/css/style.css">
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
		pStatement=dbConnection.prepareStatement("UPDATE "+DNet.MPR_WorkProgress+" SET DESCRIPTION=?, STATUS=? WHERE F_CPERSNO=? AND TO_CHAR(WP_DATE,'YYYY-MM') LIKE ? AND PROJECT_NAME=? AND TO_CHAR(PDC,'DD/MM/YYYY') LIKE ?");
		pStatement.setString(1,request.getParameter("description"));
		pStatement.setString(2,request.getParameter("status"));
		pStatement.setString(3,emp.persno);
		pStatement.setString(4,period);
		pStatement.setString(5,request.getParameter("projectName"));
		pStatement.setString(6,request.getParameter("pdc"));
		//System.out.println(request.getParameter("description"));
		//System.out.println(request.getParameter("status"));
		//System.out.println(request.getParameter("pdc"));
		//System.out.println(emp.persno);
		//System.out.println(period);
		//System.out.println(request.getParameter("projectName"));
		pStatement.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	s.setAttribute("upd", 1);
}

if(request.getParameter("delete")!=null){
	try {
		pStatement=dbConnection.prepareStatement("DELETE FROM "+DNet.MPR_WorkProgress+" WHERE F_CPERSNO=? AND TO_CHAR(WP_DATE,'YYYY-MM') LIKE ? AND PROJECT_NAME=? AND TO_CHAR(PDC,'DD/MM/YYYY') LIKE ?");
		pStatement.setString(1,emp.persno);
		pStatement.setString(2,period);
		pStatement.setString(3,(String)request.getParameter("projectName"));
		pStatement.setString(4,(String)request.getParameter("pdc"));
		pStatement.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	s.setAttribute("del", 1);
}

if(period!=null){
try {
	pStatement=dbConnection.prepareStatement("SELECT PROJECT_NAME, TO_CHAR(PDC, 'DD/MM/YYYY') AS PCD, DESCRIPTION, STATUS FROM "+DNet.MPR_WorkProgress+" WHERE F_CPERSNO=? AND TO_CHAR(WP_DATE,'YYYY-MM') LIKE ? ORDER BY PDC");
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
	document.getElementById('desL'+i).style.display="none";
	document.getElementById('desI'+i).style.display="block";
	document.getElementById('staL'+i).style.display="none";
	document.getElementById('staI'+i).style.display="block";
}

</script>

<div class="card" style="width:90%;margin:auto;">
	<fieldset>
		<legend>Work in Progress</legend>
<div class="div-table" id="dataTable">
			<div class="div-table-row" id="head">
				<div class="div-table-col-head" style="width:5%">Sr. No.</div>
				<div class="div-table-col-head"  style="width:15%">Project Name</div>
				<div class="div-table-col-head"  style="width:20%">Description</div>
				<div class="div-table-col-head" style="width:20%">Status</div>
				<div class="div-table-col-head" style="width:15%">PDC</div>
				<div class="div-table-col-head" style="width:12%"></div>
				<div class="div-table-col-head" style="width:12%"></div>
			</div>
			<%while(res!=null && res.next()){ %>
			<div class="div-table-row">
			<form action="upd9.jsp" method="post">
				<div class="div-table-col"  style="width:5%"><%=i %></div>
				<div class="div-table-col" style="width:15%">
					<p><%=res.getString("PROJECT_NAME") %></p>
					<input type="hidden" value='<%=res.getString("PROJECT_NAME") %>' name="projectName"/>
				</div>
				<div class="div-table-col" style="width:20%">
					<p id="desL<%=i %>"><%=res.getString("DESCRIPTION") %></p>
					<input id="desI<%=i %>" type="text" style="display: none;" value='<%=res.getString("DESCRIPTION") %>' name="description">
				</div>
				<div class="div-table-col" style="width:20%">
					<p id="staL<%=i %>"><%=res.getString("STATUS") %></p>
					<input type="text" required id="staI<%=i %>" style="display: none;" value='<%=res.getString("STATUS") %>' name="status">
				</div>
				<div class="div-table-col" style="width:15%">
					<p><%=res.getString("PCD") %></p>
					<input type="hidden" value='<%=res.getString("PCD") %>' name="pdc">
				</div>
				<div class="div-table-col" style="width:12%">
				<input type="hidden" value="upd" name="update"/>
				<input type="button" onclick="updateForm('<%=i %>')" id="upd<%=i %>" value="Update"/>
				<input type="submit" style="display: none;" id="sub<%=i %>" value="Save"/></div>
				</form>
				<form action="upd9.jsp" method="post">
				<div class="div-table-col" style="width:12%">
				<input type="hidden" value="del" name="delete"/>
				<input type="hidden" value="<%=res.getString("PROJECT_NAME") %>" name="projectName"/>
				<input type="hidden" value="<%=res.getString("PCD") %>" name="pdc"/>
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