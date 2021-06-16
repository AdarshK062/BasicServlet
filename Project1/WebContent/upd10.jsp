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
		//System.out.println("try");
		pStatement=dbConnection.prepareStatement("UPDATE "+DNet.MPR_All+" SET INPUT_DATA=? WHERE F_CPERSNO=? AND TO_CHAR(FDATE,'YYYY-MM') LIKE ? AND INPUT_FLAG=? AND INPUT_DATA=?");
		pStatement.setString(1,request.getParameter("inputData"));
		pStatement.setString(2,emp.persno);
		pStatement.setString(3,period);
		pStatement.setString(4,request.getParameter("inputFlag"));
		pStatement.setString(5,request.getParameter("inputDataPrev"));
		pStatement.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	s.setAttribute("upd", 1);
}

if(request.getParameter("delete")!=null){
	try {
		pStatement=dbConnection.prepareStatement("DELETE FROM "+DNet.MPR_All+" WHERE F_CPERSNO=? AND TO_CHAR(FDATE,'YYYY-MM') LIKE ? AND INPUT_DATA=? AND INPUT_FLAG=?");
		pStatement.setString(1,emp.persno);
		pStatement.setString(2,period);
		pStatement.setString(3,(String)request.getParameter("inputDataPrev"));
		pStatement.setString(4,(String)request.getParameter("inputFlag"));
		pStatement.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	s.setAttribute("del", 1);
}

if(period!=null){
try {
	pStatement=dbConnection.prepareStatement("SELECT * FROM "+DNet.MPR_All+" WHERE F_CPERSNO=? AND TO_CHAR(FDATE,'YYYY-MM') LIKE ? ORDER BY FDATE", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	pStatement.setString(1,emp.persno);
	pStatement.setString(2, period);
	res=pStatement.executeQuery();
} catch (SQLException e) {
	e.printStackTrace();
}
}
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
function updateForm(i,j){
	document.getElementById('upd'+i+j).style.display="none";
	document.getElementById('sub'+i+j).style.display="block";
	document.getElementById('txtA'+i+j).removeAttribute("readonly");
	//console.log(document.getElementById('txtA'+i+j));
}

</script>
<div class="card" style="width:90%;margin:auto;">
	<fieldset>
		<legend>Details of meetings attended during the month</legend>
		<br>
		<b>Details of DWGs generated during the month</b><br><br>
		<div class="div-table" id="dataTable1">
			<div class="div-table-row">
				<div class="div-table-col-head" style="width:8%">Sr. No.</div>
				<div class="div-table-col-head"  style="width:2%">:</div>
				<div class="div-table-col-head"  style="width:62%">Description</div>
				<div class="div-table-col-head" style="width:12%"></div>
				<div class="div-table-col-head" style="width:12%"></div>
			</div>
			<%int i=1; %>
			<%while(res!=null && res.next()){ %>
			<%if(res.getString("INPUT_FLAG").equals("DRAWING_DETAILS")){ %>
			<div class="div-table-row">
			<form action="upd10.jsp" method="post">
				<div class="div-table-col1"  style="width:8%"><%=i %></div>
				<div class="div-table-col1"  style="width:2%">:</div>
				<div class="div-table-col1" style="width:62%">
					<textarea readonly name="inputData" id="txtA1<%=i %>"><%=res.getString("INPUT_DATA") %></textarea>
					<input type="hidden" value="<%=res.getString("INPUT_DATA") %>" name="inputDataPrev"/>
					<input type="hidden" value="<%=res.getString("INPUT_FLAG") %>" name="inputFlag"/>
				</div>
				<div class="div-table-col1" style="width:12%">
				<input type="hidden" value="upd" name="update"/>
				<input type="button" onclick="updateForm('1','<%=i %>')" id="upd1<%=i %>" value="Update"/>
				<input type="submit" style="display: none;" id="sub1<%=i %>" value="Save"/></div>
				</form>
				<form action="upd10.jsp" method="post">
				<div class="div-table-col1" style="width:12%">
				<input type="hidden" value="del" name="delete"/>
				<input type="hidden" value="<%=res.getString("INPUT_DATA") %>" name="inputDataPrev"/>
				<input type="hidden" value="<%=res.getString("INPUT_FLAG") %>" name="inputFlag"/>
				<input type="submit" value="Delete"></div>
				</form>
			</div>
			<%i++; %>
			<%} %>
					<%} %>
		</div>
		<br>
		<%res.beforeFirst(); %>
		<b>Details of administrative work done during the month</b><br><br>
		<div class="div-table" id="dataTable2">
			<div class="div-table-row">
				<div class="div-table-col-head" style="width:8%">Sr. No.</div>
				<div class="div-table-col-head"  style="width:2%">:</div>
				<div class="div-table-col-head"  style="width:62%">Description</div>
				<div class="div-table-col-head" style="width:12%"></div>
				<div class="div-table-col-head" style="width:12%"></div>
			</div>
			<%i=1; %>
			<%while(res!=null && res.next()){ %>
			<%if(res.getString("INPUT_FLAG").equals("WORK_DETAILS")){ %>
			<div class="div-table-row">
			<form action="upd10.jsp" method="post">
				<div class="div-table-col1"  style="width:8%"><%=i %></div>
				<div class="div-table-col1"  style="width:2%">:</div>
				<div class="div-table-col1" style="width:62%">
					<textarea readonly name="inputData" id="txtA2<%=i %>"><%=res.getString("INPUT_DATA") %></textarea>
					<input type="hidden" value="<%=res.getString("INPUT_DATA") %>" name="inputDataPrev"/>
					<input type="hidden" value="<%=res.getString("INPUT_FLAG") %>" name="inputFlag"/>
				</div>
				<div class="div-table-col1" style="width:12%">
				<input type="hidden" value="upd" name="update"/>
				<input type="button" onclick="updateForm('2','<%=i %>')" id="upd2<%=i %>" value="Update"/>
				<input type="submit" style="display: none;" id="sub2<%=i %>" value="Save"/></div>
				</form>
				<form action="upd10.jsp" method="post">
				<div class="div-table-col1" style="width:12%">
				<input type="hidden" value="del" name="delete"/>
				<input type="hidden" value="<%=res.getString("INPUT_DATA") %>" name="inputDataPrev"/>
				<input type="hidden" value="<%=res.getString("INPUT_FLAG") %>" name="inputFlag"/>
				<input type="submit" value="Delete"></div>
				</form>
			</div>
			<%i++; %>
			<%} %>
					<%} %>
		</div>
		<br>
		<%res.beforeFirst(); %>
		<b>Details of research work done on the topic assigned to you</b><br><br>
		<div class="div-table" id="dataTable3">
			<div class="div-table-row">
				<div class="div-table-col-head" style="width:8%">Sr. No.</div>
				<div class="div-table-col-head"  style="width:2%">:</div>
				<div class="div-table-col-head"  style="width:62%">Description</div>
				<div class="div-table-col-head" style="width:12%"></div>
				<div class="div-table-col-head" style="width:12%"></div>
			</div>
			<%i=1; %>
			<%while(res!=null && res.next()){ %>
			<%if(res.getString("INPUT_FLAG").equals("RESEARCH")){ %>
			<div class="div-table-row">
			<form action="upd10.jsp" method="post">
				<div class="div-table-col1"  style="width:8%"><%=i %></div>
				<div class="div-table-col1"  style="width:2%">:</div>
				<div class="div-table-col1" style="width:62%">
					<textarea readonly name="inputData" id="txtA3<%=i %>"><%=res.getString("INPUT_DATA") %></textarea>
					<input type="hidden" value="<%=res.getString("INPUT_DATA") %>" name="inputDataPrev"/>
					<input type="hidden" value="<%=res.getString("INPUT_FLAG") %>" name="inputFlag"/>
				</div>
				<div class="div-table-col1" style="width:12%">
				<input type="hidden" value="upd" name="update"/>
				<input type="button" onclick="updateForm('3','<%=i %>')" id="upd3<%=i %>" value="Update"/>
				<input type="submit" style="display: none;" id="sub3<%=i %>" value="Save"/></div>
				</form>
				<form action="upd10.jsp" method="post">
				<div class="div-table-col1" style="width:12%">
				<input type="hidden" value="del" name="delete"/>
				<input type="hidden" value="<%=res.getString("INPUT_DATA") %>" name="inputDataPrev"/>
				<input type="hidden" value="<%=res.getString("INPUT_FLAG") %>" name="inputFlag"/>
				<input type="submit" value="Delete"></div>
				</form>
			</div>
			<%i++; %>
			<%} %>
					<%} %>
		</div>
		<br>
		<%res.beforeFirst(); %>
		<b>Details of internal technical work review</b><br><br>
		<div class="div-table" id="dataTable4">
			<div class="div-table-row">
				<div class="div-table-col-head" style="width:8%">Sr. No.</div>
				<div class="div-table-col-head"  style="width:2%">:</div>
				<div class="div-table-col-head"  style="width:62%">Description</div>
				<div class="div-table-col-head" style="width:12%"></div>
				<div class="div-table-col-head" style="width:12%"></div>
			</div>
			<%i=1; %>
			<%while(res!=null && res.next()){ %>
			<%if(res.getString("INPUT_FLAG").equals("INT_TECH")){ %>
			<div class="div-table-row">
			<form action="upd10.jsp" method="post">
				<div class="div-table-col1"  style="width:8%"><%=i %></div>
				<div class="div-table-col1"  style="width:2%">:</div>
				<div class="div-table-col1" style="width:62%">
					<textarea readonly name="inputData" id="txtA4<%=i %>"><%=res.getString("INPUT_DATA") %></textarea>
					<input type="hidden" value="<%=res.getString("INPUT_DATA") %>" name="inputDataPrev"/>
					<input type="hidden" value="<%=res.getString("INPUT_FLAG") %>" name="inputFlag"/>
				</div>
				<div class="div-table-col1" style="width:12%">
				<input type="hidden" value="upd" name="update"/>
				<input type="button" onclick="updateForm('4','<%=i %>')" id="upd4<%=i %>" value="Update"/>
				<input type="submit" style="display: none;" id="sub4<%=i %>" value="Save"/></div>
				</form>
				<form action="upd10.jsp" method="post">
				<div class="div-table-col1" style="width:12%">
				<input type="hidden" value="del" name="delete"/>
				<input type="hidden" value="<%=res.getString("INPUT_DATA") %>" name="inputDataPrev"/>
				<input type="hidden" value="<%=res.getString("INPUT_FLAG") %>" name="inputFlag"/>
				<input type="submit" value="Delete"></div>
				</form>
			</div>
			<%i++; %>
			<%} %>
					<%} %>
		</div>
		<br>
		<%res.beforeFirst(); %>
		<b>Details of technical work done during the month</b><br><br>
		<div class="div-table" id="dataTable5">
			<div class="div-table-row">
				<div class="div-table-col-head" style="width:8%">Sr. No.</div>
				<div class="div-table-col-head"  style="width:2%">:</div>
				<div class="div-table-col-head"  style="width:62%">Description</div>
				<div class="div-table-col-head" style="width:12%"></div>
				<div class="div-table-col-head" style="width:12%"></div>
			</div>
			<%i=1; %>
			<%while(res!=null && res.next()){ %>
			<%if(res.getString("INPUT_FLAG").equals("TECH_DETAILS")){ %>
			<div class="div-table-row">
			<form action="upd10.jsp" method="post">
				<div class="div-table-col1"  style="width:8%"><%=i %></div>
				<div class="div-table-col1"  style="width:2%">:</div>
				<div class="div-table-col1" style="width:62%">
					<textarea readonly name="inputData" id="txtA5<%=i %>"><%=res.getString("INPUT_DATA") %></textarea>
					<input type="hidden" value="<%=res.getString("INPUT_DATA") %>" name="inputDataPrev"/>
					<input type="hidden" value="<%=res.getString("INPUT_FLAG") %>" name="inputFlag"/>
				</div>
				<div class="div-table-col1" style="width:12%">
				<input type="hidden" value="upd" name="update"/>
				<input type="button" onclick="updateForm('5','<%=i %>')" id="upd5<%=i %>" value="Update"/>
				<input type="submit" style="display: none;" id="sub5<%=i %>" value="Save"/></div>
				</form>
				<form action="upd10.jsp" method="post">
				<div class="div-table-col1" style="width:12%">
				<input type="hidden" value="del" name="delete"/>
				<input type="hidden" value="<%=res.getString("INPUT_DATA") %>" name="inputDataPrev"/>
				<input type="hidden" value="<%=res.getString("INPUT_FLAG") %>" name="inputFlag"/>
				<input type="submit" value="Delete"></div>
				</form>
			</div>
			<%i++; %>
			<%} %>
					<%} %>
		</div>
		<br>
		<%res.beforeFirst(); %>
		<b>Details of any input awaited from project</b><br><br>
		<div class="div-table" id="dataTable6">
			<div class="div-table-row">
				<div class="div-table-col-head" style="width:8%">Sr. No.</div>
				<div class="div-table-col-head"  style="width:2%">:</div>
				<div class="div-table-col-head"  style="width:62%">Description</div>
				<div class="div-table-col-head" style="width:12%"></div>
				<div class="div-table-col-head" style="width:12%"></div>
			</div>
			<%i=1; %>
			<%while(res!=null && res.next()){ %>
			<%if(res.getString("INPUT_FLAG").equals("INPUT_PROJECT")){ %>
			<div class="div-table-row">
			<form action="upd10.jsp" method="post">
				<div class="div-table-col1"  style="width:8%"><%=i %></div>
				<div class="div-table-col1"  style="width:2%">:</div>
				<div class="div-table-col1" style="width:62%">
					<textarea readonly name="inputData" id="txtA6<%=i %>"><%=res.getString("INPUT_DATA") %></textarea>
					<input type="hidden" value="<%=res.getString("INPUT_DATA") %>" name="inputDataPrev"/>
					<input type="hidden" value="<%=res.getString("INPUT_FLAG") %>" name="inputFlag"/>
				</div>
				<div class="div-table-col1" style="width:12%">
				<input type="hidden" value="upd" name="update"/>
				<input type="button" onclick="updateForm('6','<%=i %>')" id="upd6<%=i %>" value="Update"/>
				<input type="submit" style="display: none;" id="sub6<%=i %>" value="Save"/></div>
				</form>
				<form action="upd10.jsp" method="post">
				<div class="div-table-col1" style="width:12%">
				<input type="hidden" value="del" name="delete"/>
				<input type="hidden" value="<%=res.getString("INPUT_DATA") %>" name="inputDataPrev"/>
				<input type="hidden" value="<%=res.getString("INPUT_FLAG") %>" name="inputFlag"/>
				<input type="submit" value="Delete"></div>
				</form>
			</div>
			<%i++; %>
			<%} %>
					<%} %>
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