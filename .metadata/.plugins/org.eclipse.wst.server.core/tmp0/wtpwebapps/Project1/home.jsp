<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="./downloadedStyles/css/style.css">
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
String start=null,end=null;
if(period!=null){
	int month=Integer.parseInt(period.substring(5));
	int year=Integer.parseInt(period.substring(0, 4));
	int daysInMonth = month != 2 ? 
			  31 - (((month - 1) % 7) % 2) : 
			  28 + (year % 4 == 0 ? 1 : 0) - (year % 100 == 0 ? 1 : 0) + (year % 400 == 0 ? 1 : 0);
	start=period+"-01";
	end=period+"-"+String.format("%02d", daysInMonth);
}
s.setAttribute("start", start);
s.setAttribute("end", end);
DNET DNet=new DNET();
Connection dbConnection=DNet.getSurveyThinConnection();
PreparedStatement pStatement;

if(request.getParameter("add1")!=null){
	int i=1;
	String no=request.getParameter("no"+i);
	while(no!=null) {
		String date=request.getParameter("date"+i);
		String title=request.getParameter("title"+i);
		try {
			pStatement=dbConnection.prepareStatement("INSERT INTO "+DNet.MPR_Reports+" VALUES(?,TO_DATE(?,'YYYY/MM/DD'),?,?)");
			pStatement.setString(1,emp.persno);
			pStatement.setString(2,date);
			pStatement.setString(3,no);
			pStatement.setString(4,title);
			pStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		i++;
		no=request.getParameter("no"+i);
	}
}


if(request.getParameter("add2")!=null){
	int i=1;
	String jour=request.getParameter("jour"+i);
	while(jour!=null) {
		String date=request.getParameter("date"+i);
		String title=request.getParameter("title"+i);
		try {
			pStatement=dbConnection.prepareStatement("INSERT INTO "+DNet.MPR_Papers+" VALUES(?,TO_DATE(?,'YYYY/MM/DD'),?,?)");
			pStatement.setString(1,emp.persno);
			pStatement.setString(2,date);
			pStatement.setString(3,title);
			pStatement.setString(4,jour);
			pStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		i++;
		jour=request.getParameter("jour"+i);
	}
}


if(request.getParameter("add3")!=null){
	int i=1;
	String from=request.getParameter("from"+i);
	while(from!=null) {
		String to=request.getParameter("to"+i);
		String title=request.getParameter("title"+i);
		try {
			pStatement=dbConnection.prepareStatement("INSERT INTO "+DNet.MPR_Cep+" VALUES(?,TO_DATE(?,'YYYY/MM/DD'),TO_DATE(?,'YYYY/MM/DD'),?)");
			pStatement.setString(1,emp.persno);
			pStatement.setString(2,from);
			pStatement.setString(3,to);
			pStatement.setString(4,title);
			pStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		i++;
		from=request.getParameter("from"+i);
	}
}

if(request.getParameter("add4")!=null){
	int i=1;
	String tcd=request.getParameter("dt"+i);
	while(tcd!=null) {
		String title=request.getParameter("title"+i);
		try {
			pStatement=dbConnection.prepareStatement("INSERT INTO "+DNet.MPR_TC+" VALUES(?,TO_DATE(?,'YYYY/MM/DD'),?)");
			pStatement.setString(1,emp.persno);
			pStatement.setString(2,tcd);
			pStatement.setString(3,title);
			pStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		i++;
		tcd=request.getParameter("dt"+i);
	}
}


if(request.getParameter("add5")!=null){
	int i=1;
	String from=request.getParameter("from"+i);
	while(from!=null) {
		String to=request.getParameter("to"+i);
		String place=request.getParameter("place"+i);
		String purpose=request.getParameter("purpose"+i);
		try {
			pStatement=dbConnection.prepareStatement("INSERT INTO "+DNet.MPR_TD+" VALUES(?,TO_DATE(?,'YYYY/MM/DD'),TO_DATE(?,'YYYY/MM/DD'),?,?)");
			pStatement.setString(1, emp.persno);
			pStatement.setString(2, from);
			pStatement.setString(3, to);
			pStatement.setString(4, place);
			pStatement.setString(5, purpose);
			pStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		i++;
		from=request.getParameter("from"+i);
	}
}

if(request.getParameter("add6")!=null){
	int i=1;
	String from=request.getParameter("from"+i);
	while(from!=null) {
		String to=request.getParameter("to"+i);
		String nature=request.getParameter("nature"+i);
		try {
			pStatement=dbConnection.prepareStatement("INSERT INTO "+DNet.MPR_Leaves+" VALUES(?,TO_DATE(?,'YYYY/MM/DD'),TO_DATE(?,'YYYY/MM/DD'),?)");
			pStatement.setString(1, emp.persno);
			pStatement.setString(2, from);
			pStatement.setString(3, to);
			pStatement.setString(4, nature);
			pStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		i++;
		from=request.getParameter("from"+i);
	}
}


if(request.getParameter("add7")!=null){
	int i=1;
	String name=request.getParameter("name"+i);
	while(name!=null) {
		String date=request.getParameter("date"+i);
		String purpose=request.getParameter("purpose"+i);
		try {
			pStatement=dbConnection.prepareStatement("INSERT INTO "+DNet.MPR_FabricationVisits+" VALUES(?,TO_DATE(?,'YYYY/MM/DD'),?,?)");
			pStatement.setString(1,emp.persno);
			pStatement.setString(2,date);
			pStatement.setString(3,name);
			pStatement.setString(4,purpose);
			pStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		i++;
		name=request.getParameter("name"+i);
	}
}


if(request.getParameter("add8")!=null){
	int i=1;
	String name=request.getParameter("name"+i);
	while(name!=null) {
		String date=request.getParameter("date"+i);
		String purpose=request.getParameter("purpose"+i);
		try {
			pStatement=dbConnection.prepareStatement("INSERT INTO "+DNet.MPR_Meetings+" VALUES(?,TO_DATE(?,'YYYY/MM/DD'),?,?)");
			pStatement.setString(1,emp.persno);
			pStatement.setString(2,date);
			pStatement.setString(3,name);
			pStatement.setString(4,purpose);
			pStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		i++;
		name=request.getParameter("name"+i);
	}
}


if(request.getParameter("add9")!=null){
	int i=1;
	String projectName=request.getParameter("projectName"+i);
	while(projectName!=null) {
		String projectDesc=request.getParameter("projectDesc"+i);
		String status=request.getParameter("status"+i);
		String PDC=request.getParameter("PDC"+i);
		try {
			pStatement=dbConnection.prepareStatement("INSERT INTO "+DNet.MPR_WorkProgress+" VALUES(?,TO_DATE(?,'YYYY-MM'),?,?,?,TO_DATE(?,'YYYY/MM/DD'))");
			pStatement.setString(1,emp.persno)
;			pStatement.setString(2, period);
			pStatement.setString(3,projectName);
			pStatement.setString(4,projectDesc);
			pStatement.setString(5,status);
			pStatement.setString(6,PDC);
			pStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		i++;
		projectName=request.getParameter("projectName"+i);
	}
}

if(request.getParameter("add10")!=null){
	for(int j=1;j<7;j++){
		int i=1;
		String inputData=request.getParameter("inputData"+j+""+i);
		while(inputData!=null) {
			String inputFlag=request.getParameter("inputFlag"+j+""+i);
			try {
				pStatement=dbConnection.prepareStatement("INSERT INTO "+DNet.MPR_All+" VALUES(?,TO_DATE(?,'YYYY-MM'),?,?)");
				pStatement.setString(1, emp.persno);
				pStatement.setString(2, period);
				pStatement.setString(3, inputData);
				pStatement.setString(4, inputFlag);
				pStatement.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			i++;
			inputData=request.getParameter("inputData"+j+""+i);
		}
	}
}


ResultSet res1=null;
try{
	pStatement=dbConnection.prepareStatement("SELECT REP_NO, TO_CHAR(REP_DATE, 'dd/mm/yyyy') as REPD, TITLE FROM "+DNet.MPR_Reports+" WHERE F_CPERSNO=? AND TO_CHAR(REP_DATE,'YYYY-MM') LIKE ? ORDER BY REP_DATE");
	pStatement.setString(1, emp.persno); 
	pStatement.setString(2, period);
	res1=pStatement.executeQuery();
} catch (SQLException e){
	e.printStackTrace();
}

ResultSet res2=null;
try {
	pStatement=dbConnection.prepareStatement("SELECT TITLE, JOUR_NAME, TO_CHAR(PAPER_DATE, 'dd/mm/yyyy') AS PPD FROM "+DNet.MPR_Papers+" WHERE F_CPERSNO=? AND TO_CHAR(PAPER_DATE,'YYYY-MM') LIKE ? ORDER BY PAPER_DATE");
	pStatement.setString(1, emp.persno);  
	pStatement.setString(2, period);
	res2=pStatement.executeQuery();
} catch (SQLException e) {
	e.printStackTrace();
}
ResultSet res3=null;
try {
	pStatement=dbConnection.prepareStatement("SELECT TO_CHAR(FROM_DATE, 'dd/mm/yyyy') AS FMD, TO_CHAR(TO_DATE, 'dd/mm/yyyy') AS TOD, TITLE FROM "+DNet.MPR_Cep+" WHERE F_CPERSNO=? AND TO_CHAR(FROM_DATE,'YYYY-MM') LIKE ? ORDER BY FROM_DATE");
	pStatement.setString(1, emp.persno);  
	pStatement.setString(2, period);
	res3=pStatement.executeQuery();
} catch (SQLException e) {
	e.printStackTrace();
}
ResultSet res4=null;
try {
	pStatement=dbConnection.prepareStatement("SELECT TO_CHAR(TC_DATE, 'dd/mm/yyyy') AS TCD, TITLE FROM "+DNet.MPR_TC+" WHERE F_CPERSNO=? AND TO_CHAR(TC_DATE,'YYYY-MM') LIKE ? ORDER BY TC_DATE");
	pStatement.setString(1, emp.persno);  
	pStatement.setString(2, period);
	res4=pStatement.executeQuery();
} catch (SQLException e) {
	e.printStackTrace();
}
ResultSet res5=null;
try {
	pStatement=dbConnection.prepareStatement("SELECT TO_CHAR(FROM_DATE, 'dd/mm/yyyy') AS FMD, TO_CHAR(TO_DATE, 'dd/mm/yyyy') AS TOD, PLACE, PURPOSE FROM "+DNet.MPR_TD+" WHERE F_CPERSNO=? AND TO_CHAR(FROM_DATE,'YYYY-MM') LIKE ? ORDER BY FROM_DATE");
	pStatement.setString(1, emp.persno);  
	pStatement.setString(2, period);
	res5=pStatement.executeQuery();
} catch (SQLException e) {
	e.printStackTrace();
}
ResultSet res6=null;
try {
	pStatement=dbConnection.prepareStatement("SELECT TO_CHAR(FROM_DATE, 'dd/mm/yyyy') AS FMD, TO_CHAR(TO_DATE, 'dd/mm/yyyy') AS TOD, LEAVE_TYPE FROM "+DNet.MPR_Leaves+" WHERE F_CPERSNO=? AND TO_CHAR(FROM_DATE,'YYYY-MM') LIKE ? ORDER BY FROM_DATE");
	pStatement.setString(1, emp.persno);  
	pStatement.setString(2, period);
	res6=pStatement.executeQuery();
} catch (SQLException e) {
	e.printStackTrace();
}
ResultSet res7=null;
try {
	pStatement=dbConnection.prepareStatement("SELECT INDUSTRY, TO_CHAR(VISIT_DATE, 'dd/mm/yyyy') as VISD, PURPOSE FROM "+DNet.MPR_FabricationVisits+" WHERE F_CPERSNO=? AND TO_CHAR(VISIT_DATE,'YYYY-MM') LIKE ? ORDER BY VISIT_DATE");
	pStatement.setString(1, emp.persno);  
	pStatement.setString(2, period);
	res7=pStatement.executeQuery();
} catch (SQLException e) {
	e.printStackTrace();
}
ResultSet res8=null;
try {
	pStatement=dbConnection.prepareStatement("SELECT PROJECT_NAME, TO_CHAR(MEETING_DATE, 'dd/mm/yyyy') as MD, PURPOSE FROM "+DNet.MPR_Meetings+" WHERE F_CPERSNO=? AND TO_CHAR(MEETING_DATE,'YYYY-MM') LIKE ? ORDER BY MEETING_DATE");
	pStatement.setString(1, emp.persno);  
	pStatement.setString(2, period);
	res8=pStatement.executeQuery();
} catch (SQLException e) {
	e.printStackTrace();
}
ResultSet res9=null;
try {
	pStatement=dbConnection.prepareStatement("SELECT PROJECT_NAME, TO_CHAR(PDC, 'dd/mm/yyyy') AS PCD, DESCRIPTION, STATUS FROM "+DNet.MPR_WorkProgress+" WHERE F_CPERSNO=? AND TO_CHAR(WP_DATE, 'yyyy-mm') LIKE ? ORDER BY PDC");
	pStatement.setString(1, emp.persno);  
	pStatement.setString(2, period);
	res9=pStatement.executeQuery();
} catch (SQLException e) {
	e.printStackTrace();
}
ResultSet res10=null;
try {
	pStatement=dbConnection.prepareStatement("SELECT * FROM "+DNet.MPR_All+" WHERE F_CPERSNO=? AND TO_CHAR(FDATE,'YYYY-MM') LIKE ? ORDER BY FDATE", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	pStatement.setString(1, emp.persno);  
	pStatement.setString(2, period);
	res10=pStatement.executeQuery();
} catch (SQLException e) {
	e.printStackTrace();
}
int i=1;
%>
<script>
	function myFunction() {
		var Tables = document.getElementsByClassName("tabDiv");
		for (var i=0; i<Tables.length; i++){
			var rowCount = Tables[i].getElementsByTagName("table")[0].rows.length;
			if(rowCount<2){
				Tables[i].getElementsByTagName("div")[0].style.display = "block";
				Tables[i].getElementsByTagName("div")[0].textContent = "No data to show";
			}
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
	function options(x){
		var element=document.getElementById('display');
		if(document.getElementById('mth').value==''){
			alert('Enter month');
		}
		else{
			if(element.style.display='none'){
				element.style.display='block';
			}
			element.innerHTML = document.getElementById(x).innerHTML;
		}
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
		<form id="mnth" action="home.jsp" method="post">
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
<div>
	<div class="card" style="width:18%; height:auto; float:left; padding:20px 20px 20px 20px;">
		<fieldset style="float:left">
			<legend>Options</legend>
			<div>
				<ul>
					<li><button onclick="options('1')">Nos. of reports generated during the month with list</button></li>
					<br>
					<li><button onclick="options('2')">Title of research paper submitted</button></li>
					<br>
					<li><button onclick="options('3')">Details of CEP/ Conference/ Lectures attended during the month</button></li>
					<br>
					<li><button onclick="options('4')">Details of TC/any presentations you have made last</button></li>
					<br>
					<li><button onclick="options('5')">Details of TDs during the month</button></li>
					<br>
					<li><button onclick="options('6')">Details of leave taken during the month</button></li>
					<br>
					<li><button onclick="options('7')">Visits to Fabrication agencies during the month</button></li>
					<br>
					<li><button onclick="options('8')">Details of meetings attended during the month</button></li>
					<br>
					<li><button onclick="options('9')">Details of work in Progress</button></li>
					<br>
					<li><button onclick="options('10')">Other</button></li>
				</ul>
			</div>
		</fieldset>
	</div>

	<div class="card" id="display" style="width:65%; max-height:800px; float:left; display:none;"></div>


<div class="card" id="1" style="width:70%; max-height:800px; display:none;">
		<fieldset>
			<legend>Nos. of reports generated during the month</legend>
			<div class="tabDiv" style="margin-bottom: 10px;">
				<table class="tab" style="width:100%;">
					<thead>
						<tr>
							<th width="4%">Sr. No.</th>
							<th>Report No.</th>
							<th>Date</th>
							<th>Title</th>
						</tr>
					</thead>
					<tbody>
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
					</tbody>
				</table>
				<div class="noData"></div>
			</div>
				<div style="display: flex;">
					<form action="add1.jsp" method="post">
						<input type="submit" value="Add" />
					</form>
			
					<form action="upd1.jsp" method="post">
						<input type="submit" value="Update" />
					</form>
				</div>
			</div>
		</fieldset>
	</div>
	
	<div class="card" id="2" style="width:65%; max-height:800px; float:left; display:none;">
		<fieldset>
			<legend>Title of research paper submitted</legend>
			<div class="tabDiv" style="margin-bottom: 10px;">
				<table class="tab" style="width:100%;">
					<thead>
						<tr>
							<th width="4%">Sr. No.</th>
							<th>Title of Research Paper</th>
							<th>Journal/ Conference name</th>
							<th>Dates</th>
						</tr>
					</thead>
					<tbody>
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
					</tbody>
				</table>
				<div class="noData"></div>
			</div>
				<div style="display: flex;">
					<form action="add2.jsp" method="post">
						<input type="submit" value="Add" />
					</form>
			
					<form action="upd2.jsp" method="post">
						<input type="submit" value="Update" />
					</form>
				</div>
			</div>
		</fieldset>
	</div>



<div class="card" id="3" style="width:65%; max-height:800px; float:left; display:none;">
		<fieldset>
			<legend>Details of CEP/ Conference/ Lectures attended during the month</legend>
			<div class="tabDiv" style="margin-bottom: 10px;">
				<table class="tab" style="width:100%;">
					<thead>
						<tr>
							<th width="4%">Sr. No.</th>
							<th>From Date</th>
							<th>To Date</th>
							<th>Title</th>
						</tr>
					</thead>
					<tbody>
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
					</tbody>
				</table>
				<div class="noData"></div>
			</div>
				<div style="display: flex;">
					<form action="add3.jsp" method="post">
						<input type="submit" value="Add" />
					</form>
			
					<form action="upd3.jsp" method="post">
						<input type="submit" value="Update" />
					</form>
				</div>
			</div>
		</fieldset>
	</div>

<div class="card" id="4" style="width:65%; max-height:800px; float:left; display:none;">
		<fieldset>
			<legend>Details of TC/ any presentations you have made last</legend>
			<div class="tabDiv" style="margin-bottom: 10px;">
				<table class="tab" style="width:100%;">
					<thead>
						<tr>
							<th width="6%">Sr. No.</th>
							<th width="40%">Date</th>
							<th>Title</th>
						</tr>
					</thead>
					<tbody>
						<%i=1; %>
						<%while(res4!=null && res4.next()){ %>
							<tr>
								<td><%=i %></td>
								<td>
									<%=res4.getString("TCD") %>
								</td>
								<td>
									<%=res4.getString("TITLE") %>
								</td>
							</tr>
							<%i++;} %>
					</tbody>
				</table>
				<div class="noData"></div>
			</div>
				<div style="display: flex;">
					<form action="add4.jsp" method="post">
						<input type="submit" value="Add" />
					</form>
			
					<form action="upd4.jsp" method="post">
						<input type="submit" value="Update" />
					</form>
				</div>
			</div>
		</fieldset>
	</div>

<div class="card" id="5" style="width:65%; max-height:800px; float:left; display:none;">
		<fieldset>
			<legend>Details of TDs during the month</legend>
			<div class="tabDiv" style="margin-bottom: 10px;">
				<table class="tab" style="width:100%;">
					<thead>
						<tr>
							<th width="4%">Sr. No.</th>
							<th>From Date</th>
							<th>To Date</th>
							<th>Place</th>
							<th>Purpose of visit</th>
						</tr>
					</thead>
					<tbody>
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
					</tbody>
				</table>
				<div class="noData"></div>
			</div>
				<div style="display: flex;">
					<form action="add5.jsp" method="post">
						<input type="submit" value="Add" />
					</form>
			
					<form action="upd5.jsp" method="post">
						<input type="submit" value="Update" />
					</form>
				</div>
			</div>
		</fieldset>
	</div>
	
	
<div class="card" id="6" style="width:65%; max-height:800px; float:left; display:none;">
		<fieldset>
			<legend>Details of leave taken during the month</legend>
			<div class="tabDiv" style="margin-bottom: 10px;">
				<table class="tab" style="width:100%;">
					<thead>
						<tr>
							<th width="4%">Sr. No.</th>
							<th>From Date</th>
							<th>To Date</th>
							<th>Nature of leave</th>
						</tr>
					</thead>
					<tbody>
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
					</tbody>
				</table>
				<div class="noData"></div>
			</div>
				<div style="display: flex;">
					<form action="add6.jsp" method="post">
						<input type="submit" value="Add" />
					</form>
			
					<form action="upd6.jsp" method="post">
						<input type="submit" value="Update" />
					</form>
				</div>
			</div>
		</fieldset>
	</div>
	
	
	<div class="card" id="7" style="width:65%; max-height:800px; float:left; display:none;">
		<fieldset>
			<legend>Visits to Fabrication agencies during the month</legend>
			<div class="tabDiv" style="margin-bottom: 10px;">
				<table class="tab" style="width:100%;">
					<thead>
						<tr>
							<th width="4%">Sr. No.</th>
							<th>Industry</th>
							<th>Visit Date</th>
							<th>Purpose/ Outcome</th>
						</tr>
					</thead>
					<tbody>
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
					</tbody>
				</table>
				<div class="noData"></div>
			</div>
				<div style="display: flex;">
					<form action="add7.jsp" method="post">
						<input type="submit" value="Add" />
					</form>
			
					<form action="upd7.jsp" method="post">
						<input type="submit" value="Update" />
					</form>
				</div>
			</div>
		</fieldset>
	</div>
</div>
	
	
	
	
<div class="card" id="8" style="width:65%; max-height:800px; float:left; display:none;">
		<fieldset>
			<legend>Details of meetings attended during the month</legend>
			<div class="tabDiv" style="margin-bottom: 10px;">
				<table class="tab" style="width:100%;">
					<thead>
						<tr>
							<th width="4%">Sr. No.</th>
							<th>Project/ Place Name</th>
							<th>Date</th>
							<th>Purpose/ Outcome</th>
						</tr>
					</thead>
					<tbody>
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
					</tbody>
				</table>
				<div class="noData"></div>
			</div>
				<div style="display: flex;">
					<form action="add8.jsp" method="post">
						<input type="submit" value="Add" />
					</form>
			
					<form action="upd8.jsp" method="post">
						<input type="submit" value="Update" />
					</form>
				</div>
			</div>
		</fieldset>
	</div>
	
	

	<div class="card" id="9" style="width:65%; max-height:800px; float:left; display:none;">
		<fieldset>
			<legend>Details of work in Progress</legend>
			<div class="tabDiv" style="margin-bottom: 10px;">
				<table class="tab" style="width:100%;">
					<thead>
						<tr>
							<th width="4%">Sr. No.</th>
							<th>Project</th>
							<th>Description</th>
							<th>Status</th>
							<th>PDC</th>
						</tr>
					</thead>
					<tbody>
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
					</tbody>
				</table>
				<div class="noData"></div>
			</div>
				<div style="display: flex;">
					<form action="add9.jsp" method="post">
						<input type="submit" value="Add" />
					</form>
			
					<form action="upd9.jsp" method="post">
						<input type="submit" value="Update" />
					</form>
				</div>
			</div>
		</fieldset>
	</div>

	<div class="card" id="10" style="width:70%; overflow:auto; max-height:800px; float:left; display:none;">
		<fieldset>
			<legend>Other Details</legend>
			<div class="tabDiv" style="margin-bottom: 10px;">
				<b>Details of DWGs generated during the month</b><br><br>
				<table class="tab">
					<tr style="display: none;"></tr>
				<%i=1; %>
				<%while(res10.next()){ %>
					<%if(res10.getString("INPUT_FLAG").equals("DRAWING_DETAILS")){ %>
					<tr>
						<th width="8%"><%=i %></th>
						<td width="2%">:</td>
						<td><%=res10.getString("INPUT_DATA") %></td>
					</tr>
					<%i++; %>
					<%} %>
				<%} %>
				</table>
				<div class="noData"></div>
				<br>
			</div>
				<%res10.beforeFirst(); %>
				<div class="tabDiv" style="margin-bottom: 10px;">

				<b>Details of administrative work done during the month</b><br><br>
				<table class="tab">
					<tr style="display: none;"></tr>
				<%i=1; %>
				<%while(res10.next()){ %>
					<%if(res10.getString("INPUT_FLAG").equals("WORK_DETAILS")){ %>
					<tr>
						<th width="8%"><%=i %></th>
						<td width="2%">:</td>
						<td><%=res10.getString("INPUT_DATA") %></td>
					</tr>
					<%i++; %>
					<%} %>
				<%} %>
				</table>
				<div class="noData"></div>
				<br>
			</div>
				<%res10.beforeFirst(); %>
				<div class="tabDiv" style="margin-bottom: 10px;">

				<b>Details of research work done on the topic assigned to you</b><br><br>
				<table class="tab">
					<tr style="display: none;"></tr>
				<%i=1; %>
				<%while(res10.next()){ %>
					<%if(res10.getString("INPUT_FLAG").equals("RESEARCH")){ %>
					<tr>
						<th width="8%"><%=i %></th>
						<td width="2%">:</td>
						<td><%=res10.getString("INPUT_DATA") %></td>
					</tr>
					<%i++; %>
					<%} %>
				<%} %>
				</table>
				<div class="noData"></div>
				<br>
			</div>
				<%res10.beforeFirst(); %>
				<div class="tabDiv" style="margin-bottom: 10px;">

				<b>Details of internal technical work review</b><br><br>
				<table class="tab">
					<tr style="display: none;"></tr>
				<%i=1; %>
				<%while(res10.next()){ %>
					<%if(res10.getString("INPUT_FLAG").equals("INT_TECH")){ %>
					<tr>
						<th width="8%"><%=i %></th>
						<td width="2%">:</td>
						<td><%=res10.getString("INPUT_DATA") %></td>
					</tr>
					<%i++; %>
					<%} %>
				<%} %>
				</table>
				<div class="noData"></div>
				<br>
			</div>
				<%res10.beforeFirst(); %>
				<div class="tabDiv" style="margin-bottom: 10px;">

				<b>Details of technical work done during the month</b><br><br>
				<table class="tab">
					<tr style="display: none;"></tr>
				<%i=1; %>
				<%while(res10.next()){ %>
					<%if(res10.getString("INPUT_FLAG").equals("TECH_DETAILS")){ %>
					<tr>
						<th width="8%"><%=i %></th>
						<td width="2%">:</td>
						<td><%=res10.getString("INPUT_DATA") %></td>
					</tr>
					<%i++; %>
					<%} %>
				<%} %>
				</table>
				<div class="noData"></div>
				<br>
			</div>
				<%res10.beforeFirst(); %>
				<div class="tabDiv" style="margin-bottom: 10px;">

				<b>Details of any input awaited from project</b><br><br>
				<table class="tab">
					<tr style="display: none;"></tr>
				<%i=1; %>
				<%while(res10.next()){ %>
					<%if(res10.getString("INPUT_FLAG").equals("INPUT_PROJECT")){ %>
					<tr>
						<th width="8%"><%=i %></th>
						<td width="2%">:</td>
						<td><%=res10.getString("INPUT_DATA") %></td>
					</tr>
					<%i++; %>
					<%} %>
				<%} %>
				</table>
				<div class="noData"></div>
				<br>
			</div>
				<div style="display: flex;">
					<form action="add10.jsp" method="post">
						<input type="submit" value="Add" />
					</form>
			
					<form action="upd10.jsp" method="post">
						<input type="submit" value="Update" />
					</form>
				</div>
			</div>
		</fieldset>
	</div>
	


<div id="logout">
<form action="login.jsp" method="post">
	<input type="hidden" value="logout" name="logout"/>
	<input type="submit" value="Logout"></input>
</form>
<br>
<form action="reportGen.jsp" method="post" target="_blank">
	<input type="hidden" value="user" name="reportType"/>
	<input type="submit" value="View Report">
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
<% dbConnection.close(); %>
</body>
</html>