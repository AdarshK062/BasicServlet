<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Monthly Progress Report</title>
<style>
*{
margin-bottom:10px;
margin-left:20px;
margin-top:10px;}
.header{
text-align:center;
align-items:center;
}
b{
margin-bottom:10px;
font-size:21px;
}
#print{
float:right;
margin:auto;
margin-right: 10px;
}
table{
width:90%;
margin-left:25px;
font-size:20px;
border: 1px black solid;
border-collapse: collapse;
}
input{
font-size:15px;
}
span{
font-size:20px;}
th,td{
font-size:20px;
border: 1px black solid;
border-collapse: collapse;
height:25px;
padding:10px;
}
.dim{
color:lightgrey;
}
.textBox{
width:90%;
margin-left:25px;
font-size:20px;
border: 1px black solid;
min-height:25px;
}
</style>
</head>
<body>
<%@ page import="BasicServlet.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
HttpSession s= request.getSession(true);
Employee emp=(Employee) s.getAttribute("emp");
String period=(String)request.getParameter("month");
String strPeriod=period;
String empName, empPersno;
if(request.getParameter("reportType")!=null){
	if(request.getParameter("reportType").equals("director")){
		empName=(String)request.getParameter("empName");
		empPersno=(String)request.getParameter("persNo");
	}
	else{
		empName=emp.name;
		empPersno=emp.persno;
	}
	s.setAttribute("empName",empName);
	s.setAttribute("persNo",empPersno);
}
else{
	empName=(String)s.getAttribute("empName");
	empPersno=(String)s.getAttribute("persNo");
}
if(period!=null && !period.equals("")){
	s.setAttribute("period",period);
	//System.out.println(period+"hi");
	SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM");
	java.util.Date date=formatter.parse(period); 
	SimpleDateFormat formatter1=new SimpleDateFormat("MMMM, yyyy");  
	 strPeriod=formatter1.format(date);
}
else{
	period=(String)s.getAttribute("period");
}
if(strPeriod==null || strPeriod==""){
	strPeriod="Select";
}
DNET DNet=new DNET();
Connection dbConnection=DNet.getSurveyThinConnection();
PreparedStatement pStatement;

ResultSet res1=null;
try{
	pStatement=dbConnection.prepareStatement("SELECT REP_NO, TO_CHAR(REP_DATE, 'dd/mm/yyyy') as REPD, TITLE FROM "+DNet.MPR_Reports+" WHERE F_CPERSNO=? AND TO_CHAR(REP_DATE,'YYYY-MM') LIKE ? ORDER BY REP_DATE");
	pStatement.setString(1, empPersno); 
	pStatement.setString(2, period);
	res1=pStatement.executeQuery();
} catch (SQLException e){
	e.printStackTrace();
}

ResultSet res2=null;
try {
	pStatement=dbConnection.prepareStatement("SELECT TITLE, JOUR_NAME, TO_CHAR(PAPER_DATE, 'dd/mm/yyyy') AS PPD FROM "+DNet.MPR_Papers+" WHERE F_CPERSNO=? AND TO_CHAR(PAPER_DATE,'YYYY-MM') LIKE ? ORDER BY PAPER_DATE");
	pStatement.setString(1, empPersno);  
	pStatement.setString(2, period);
	res2=pStatement.executeQuery();
} catch (SQLException e) {
	e.printStackTrace();
}
ResultSet res3=null;
try {
	pStatement=dbConnection.prepareStatement("SELECT TO_CHAR(FROM_DATE, 'dd/mm/yyyy') AS FMD, TO_CHAR(TO_DATE, 'dd/mm/yyyy') AS TOD, TITLE FROM "+DNet.MPR_Cep+" WHERE F_CPERSNO=? AND TO_CHAR(FROM_DATE,'YYYY-MM') LIKE ? ORDER BY FROM_DATE");
	pStatement.setString(1, empPersno);  
	pStatement.setString(2, period);
	res3=pStatement.executeQuery();
} catch (SQLException e) {
	e.printStackTrace();
}
ResultSet res4=null;
try {
	pStatement=dbConnection.prepareStatement("SELECT TO_CHAR(TC_DATE, 'dd/mm/yyyy') AS TCD, TITLE FROM "+DNet.MPR_TC+" WHERE F_CPERSNO=? AND TO_CHAR(TC_DATE,'YYYY-MM') LIKE ? ORDER BY TC_DATE");
	pStatement.setString(1, empPersno);  
	pStatement.setString(2, period);
	res4=pStatement.executeQuery();
} catch (SQLException e) {
	e.printStackTrace();
}
ResultSet res5=null;
try {
	pStatement=dbConnection.prepareStatement("SELECT TO_CHAR(FROM_DATE, 'dd/mm/yyyy') AS FMD, TO_CHAR(TO_DATE, 'dd/mm/yyyy') AS TOD, PLACE, PURPOSE FROM "+DNet.MPR_TD+" WHERE F_CPERSNO=? AND TO_CHAR(FROM_DATE,'YYYY-MM') LIKE ? ORDER BY FROM_DATE");
	pStatement.setString(1, empPersno);  
	pStatement.setString(2, period);
	res5=pStatement.executeQuery();
} catch (SQLException e) {
	e.printStackTrace();
}
ResultSet res6=null;
try {
	pStatement=dbConnection.prepareStatement("SELECT TO_CHAR(FROM_DATE, 'dd/mm/yyyy') AS FMD, TO_CHAR(TO_DATE, 'dd/mm/yyyy') AS TOD, LEAVE_TYPE FROM "+DNet.MPR_Leaves+" WHERE F_CPERSNO=? AND TO_CHAR(FROM_DATE,'YYYY-MM') LIKE ? ORDER BY FROM_DATE");
	pStatement.setString(1, empPersno);  
	pStatement.setString(2, period);
	res6=pStatement.executeQuery();
} catch (SQLException e) {
	e.printStackTrace();
}
ResultSet res7=null;
try {
	pStatement=dbConnection.prepareStatement("SELECT INDUSTRY, TO_CHAR(VISIT_DATE, 'dd/mm/yyyy') as VISD, PURPOSE FROM "+DNet.MPR_FabricationVisits+" WHERE F_CPERSNO=? AND TO_CHAR(VISIT_DATE,'YYYY-MM') LIKE ? ORDER BY VISIT_DATE");
	pStatement.setString(1, empPersno);  
	pStatement.setString(2, period);
	res7=pStatement.executeQuery();
} catch (SQLException e) {
	e.printStackTrace();
}
ResultSet res8=null;
try {
	pStatement=dbConnection.prepareStatement("SELECT PROJECT_NAME, TO_CHAR(MEETING_DATE, 'dd/mm/yyyy') as MD, PURPOSE FROM "+DNet.MPR_Meetings+" WHERE F_CPERSNO=? AND TO_CHAR(MEETING_DATE,'YYYY-MM') LIKE ? ORDER BY MEETING_DATE");
	pStatement.setString(1, empPersno);  
	pStatement.setString(2, period);
	res8=pStatement.executeQuery();
} catch (SQLException e) {
	e.printStackTrace();
}
ResultSet res9=null;
try {
	pStatement=dbConnection.prepareStatement("SELECT PROJECT_NAME, TO_CHAR(PDC, 'dd/mm/yyyy') AS PCD, DESCRIPTION, STATUS FROM "+DNet.MPR_WorkProgress+" WHERE F_CPERSNO=? AND TO_CHAR(WP_DATE, 'yyyy-mm') LIKE ? ORDER BY PDC");
	pStatement.setString(1, empPersno);  
	pStatement.setString(2, period);
	res9=pStatement.executeQuery();
} catch (SQLException e) {
	e.printStackTrace();
}
ResultSet res10=null;
try {
	pStatement=dbConnection.prepareStatement("SELECT * FROM "+DNet.MPR_All+" WHERE F_CPERSNO=? AND TO_CHAR(FDATE,'YYYY-MM') LIKE ? ORDER BY FDATE", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	pStatement.setString(1, empPersno);  
	pStatement.setString(2, period);
	res10=pStatement.executeQuery();
} catch (SQLException e) {
	e.printStackTrace();
}
int i=1;
%>
<script>
function update(){
	document.getElementById('monthLabel').style.display="none";
	document.getElementById('monthInput').style.display="block";
}
</script>
<button id='print' onclick="window.print()">Print</button>
<div class="header">
<h1>Monthly Progress Report</h1><br>
<h2 class="dim">(Period from - to)</h2>
<div style="align-items:center; text-align:center;cursor:pointer;">
<form action="reportGen.jsp" method="post" id="reportForm">
<span id="monthLabel" onclick="update()"><%=strPeriod %>&nbsp;<span style="font-size:15px;">&#9660;</span></span>
<input type="month" id="monthInput" name="month" style="display:none;margin:auto;" onchange="document.getElementById('reportForm').submit()" onblur="document.getElementById('reportForm').submit()" value= <%=period %> required/>
</form>
</div>
</div>
<br>
<b>1)&nbsp;&nbsp;&nbsp;Name of the Personnel&nbsp;&nbsp;:</b>
<span><%= empName%></span>
<br>
<br>
<b>2)&nbsp;&nbsp;&nbsp;Nos. of reports generated during the month with list&nbsp;&nbsp;:</b>
<br>
<table>
	<tr>
		<th width="5.5%">Sr No.</th>
		<th width="37%">Report No.</th>
		<th width="17.5%">Date</th>
		<th width="40%">Title</th>
	<tr>
	<%i=1; %>
						<%while(res1!=null && res1.next()){ %>
							<tr>
								<td><%=i %></td>
								<td>
									<%=res1.getString("REP_NO") %>
								</td>
								<td>
									<%=res1.getString("REPD") %>
								</td>
								<td>
									<%=res1.getString("TITLE") %>
								</td>
							</tr>
							<%i++;} %>
</table>
<br>
<b>3)&nbsp;&nbsp;&nbsp;Title of research paper submitted if any&nbsp;&nbsp;:</b>
<br>
<table>
	<tr>
		<th width="5.5%">Sr No.</th>
		<th width="37%">Title of Research Paper</th>
		<th width="17.5%">Journal / Conference name</th>
		<th width="40%">Dates</th>
	<tr>
	<%i=1; %>
						<%while(res2!=null && res2.next()){ %>
							<tr>
								<td><%=i %></td>
								<td>
									<%=res2.getString("TITLE") %>
								</td>
								<td>
									<%=res2.getString("JOUR_NAME") %>
								</td>
								<td>
									<%=res2.getString("PPD") %>
								</td>
							</tr>
							<%i++;} %>
</table>
<br>
<b>4)&nbsp;&nbsp;&nbsp;Details of CEP/Conference/Lectures attended during the month&nbsp;&nbsp;:</b>
<br>
<table>
	<tr>
		<th width="8.5%">Sr No.</th>
		<th width="14.5%">From Date</th>
		<th width="14.5%">To Date</th>
		<th width="62.5%">Title</th>
	<tr>
	<%i=1; %>
						<%while(res3!=null && res3.next()){ %>
							<tr>
								<td><%=i %></td>
								<td>
									<%=res3.getString("FMD") %>
								</td>
								<td>
									<%=res3.getString("TOD") %>
								</td>
								<td>
									<%=res3.getString("TITLE") %>
								</td>
							</tr>
							<%i++;} %>
</table>
<br>
<b>5)&nbsp;&nbsp;&nbsp;Details of TC/ any presentations you have made last&nbsp;&nbsp;:</b>
<br>
<table>
	<tr>
		<th width="23%">Date</th>
		<th width="77%">Title</th>
	<tr>
						<%while(res4!=null && res4.next()){ %>
							<tr>
								<td>
									<%=res4.getString("TCD") %>
								</td>
								<td>
									<%=res4.getString("TITLE") %>
								</td>
							</tr>
							<%} %>
</table>
<br>
<b>6)&nbsp;&nbsp;&nbsp;Details of TDs during the month&nbsp;&nbsp;:</b>
<br>
<table>
	<tr>
		<th width="9%">Sr No.</th>
		<th width="14.4%">From Date</th>
		<th width="14.5%">To Date</th>
		<th width="31%">Place of visit</th>
		<th width="31%">Purpose of visit</th>
	<tr>
	<%i=1; %>
						<%while(res5!=null && res5.next()){ %>
							<tr>
								<td><%=i %></td>
								<td>
									<%=res5.getString("FMD") %>
								</td>
								<td>
									<%=res5.getString("TOD") %>
								</td>
								<td>
									<%=res5.getString("PLACE") %>
								</td>
								<td>
									<%=res5.getString("PURPOSE") %>
								</td>
							</tr>
							<%i++;} %>
</table>
<br>
<b>7)&nbsp;&nbsp;&nbsp;Details of leave taken during the month&nbsp;&nbsp;:</b>
<br>
<table>
	<tr>
		<th width="9%">Sr No.</th>
		<th width="22%">From Date</th>
		<th width="22%">To Date</th>
		<th width="47%">Nature of leave</th>
	<tr>
	<%i=1; %>
						<%while(res6!=null && res6.next()){ %>
							<tr>
								<td><%=i %></td>
								<td>
									<%=res6.getString("FMD") %>
								</td>
								<td>
									<%=res6.getString("TOD") %>
								</td>
								<td>
									<%=res6.getString("LEAVE_TYPE") %>
								</td>
							</tr>
							<%i++;} %>
</table>
<br>
<b>8)&nbsp;&nbsp;&nbsp;Details of DWGs generated during the month&nbsp;&nbsp;:</b>
<br>
<div class="textBox">
<ol>
				<%while(res10.next()){ %>
					<%if(res10.getString("INPUT_FLAG").equals("DRAWING_DETAILS")){ %>
<li><%=res10.getString("INPUT_DATA") %></li>
					<%} %>
				<%} %>
</ol>
</div>
<br>
<b>9)&nbsp;&nbsp;&nbsp;Visits to Fabrication agencies(related to hardware) during the month&nbsp;&nbsp;:</b>
<br>
<table>
	<tr>
		<th width="9%">Sr No.</th>
		<th width="21%">Name of Industry</th>
		<th width="15%">Date</th>
		<th width="55%">Purpose / Outcome</th>
	<tr>
	<%i=1; %>
						<%while(res7!=null && res7.next()){ %>
							<tr>
								<td><%=i%></td>
								<td>
									<%=res7.getString("INDUSTRY") %>
								</td>
								<td>
									<%=res7.getString("VISD") %>
								</td>
								<td>
									<%=res7.getString("PURPOSE") %>
								</td>
							</tr>
							<%i++;} %>
</table>
<br>
<b>10)&nbsp;&nbsp;&nbsp;Details of administrative work done during the month&nbsp;&nbsp;:</b>
<br>
<div class="textBox">
<ol>

				<%res10.beforeFirst(); %>
				<%while(res10.next()){ %>
					<%if(res10.getString("INPUT_FLAG").equals("WORK_DETAILS")){ %>
<li><%=res10.getString("INPUT_DATA") %></li>
					<%} %>
				<%} %>
</ol>
</div>
<br>
<b>11)&nbsp;&nbsp;&nbsp;Details of research work done on the topic assigned to you&nbsp;&nbsp;:</b>
<br>
<div class="textBox">
<ol>

				<%res10.beforeFirst(); %>
				<%while(res10.next()){ %>
					<%if(res10.getString("INPUT_FLAG").equals("RESEARCH")){ %>
<li><%=res10.getString("INPUT_DATA") %></li>
					<%} %>
				<%} %>
</ol>
</div>
<br>
<b>12)&nbsp;&nbsp;&nbsp;Details of meetings attended during the month&nbsp;&nbsp;:</b>
<br>
<table>
	<tr>
		<th width="7%">Sr No.</th>
		<th width="21%">Project/Place Name</th>
		<th width="15%">Date</th>
		<th width="57%">Purpose / Outcome</th>
	<tr>
	<%i=1; %>
						<%while(res8!=null && res8.next()){ %>
							<tr>
								<td><%=i %></td>
								<td>
									<%=res8.getString("PROJECT_NAME") %>
								</td>
								<td>
									<%=res8.getString("MD") %>
								</td>
								<td>
									<%=res8.getString("PURPOSE") %>
								</td>
							</tr>
							<%i++;} %>
</table>
<br>
<b>13)&nbsp;&nbsp;&nbsp;Details of internal technical work review&nbsp;&nbsp;:</b>
<br>
<div class="textBox">
<ol>
				<%res10.beforeFirst(); %>
				<%while(res10.next()){ %>
					<%if(res10.getString("INPUT_FLAG").equals("INT_TECH")){ %>
<li><%=res10.getString("INPUT_DATA") %></li>
					<%} %>
				<%} %>
</ol>
</div>
<br>
<b>14)&nbsp;&nbsp;&nbsp;Details of technical work done during the month&nbsp;&nbsp;:</b>
<br>
<div class="textBox">
<ol>
				<%res10.beforeFirst(); %>
				<%while(res10.next()){ %>
					<%if(res10.getString("INPUT_FLAG").equals("TECH_DETAILS")){ %>
<li><%=res10.getString("INPUT_DATA") %></li>
					<%} %>
				<%} %>
</ol>
</div>
<br>
<b>15)&nbsp;&nbsp;&nbsp;Details of any input awaited from Project&nbsp;&nbsp;:</b>
<br>
<div class="textBox">
<ol>
				<%res10.beforeFirst(); %>
				<%while(res10.next()){ %>
					<%if(res10.getString("INPUT_FLAG").equals("INPUT_PROJECT")){ %>
<li><%=res10.getString("INPUT_DATA") %></li>
					<%} %>
				<%} %>
</ol>
</div>
<br>
<b>16)&nbsp;&nbsp;&nbsp;Details of work in Progress&nbsp;&nbsp;:</b>
<br>
<table>
	<tr>
		<th width="6.2%">Sr No.</th>
		<th width="10.6%">Project</th>
		<th width="49%">Description</th>
		<th width="18%">Status</th>
		<th width="16.2%">PDC</th>
	<tr>
	<%i=1; %>
						<%while(res9!=null && res9.next()){ %>
							<tr>
								<td><%=i %></td>
								<td>
									<%=res9.getString("PROJECT_NAME") %>
								</td>
								<td>
									<%=res9.getString("DESCRIPTION") %>
								</td>
								<td>
									<%=res9.getString("STATUS") %>
								</td>
								<td>
									<%=res9.getString("PCD") %>
								</td>
							</tr>
							<%i++;} %>
</table>
<br>
</body>
</html>