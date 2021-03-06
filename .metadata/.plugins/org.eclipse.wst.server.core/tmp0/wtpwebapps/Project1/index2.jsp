<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="BasicServlet.*" %>
<%
HttpSession s= request.getSession(true);
Employee emp=(Employee) s.getAttribute("emp");
DBConnect db=(DBConnect)s.getAttribute("db");
%>

<script>
	function addRow(tableID) {  
        var table = document.getElementById(tableID);  
        var rowCount = table.rows.length;  
        var row = table.insertRow(rowCount);
        
        var cell0 = row.insertCell(0);
        var cell1 = row.insertCell(1);
        var cell2 = row.insertCell(2);
        var cell3 = row.insertCell(3);
        var cell4 = row.insertCell(4);
        var cell5 = row.insertCell(5);
        var cell6 = row.insertCell(6);
        var cell7 = row.insertCell(7);
        cell0.innerHTML = rowCount; 
        
        var element1 = document.createElement("input");
        element1.type = "text";
        element1.setAttribute('value', '');
        element1.setAttribute('name', 'projectId'+rowCount);
        cell1.appendChild(element1);
        
        var element2 = document.createElement("input");
        element2.type = "text";
        element2.setAttribute('value', '');
        element2.setAttribute('name', 'projectName'+rowCount);
        cell2.appendChild(element2);
        
        var element3 = document.createElement("input");
        element3.type = "text";
        element3.setAttribute('value', '');
        element3.setAttribute('name', 'projectDesc'+rowCount);
        cell3.appendChild(element3);
        
        var element4 = document.createElement("input");
        element4.type = "date";
        element4.setAttribute('name', 'WPDate'+rowCount);
        cell4.appendChild(element4);
        
        var element5 = document.createElement("input");
        element5.type = "text";
        element5.setAttribute('value', '');
        element5.setAttribute('name', 'status'+rowCount);
        cell5.appendChild(element5);
        
        var element6 = document.createElement("input");
        element6.type = "date";
        element6.setAttribute('name', 'PDC'+rowCount);
        cell6.appendChild(element6);
        
        var element7 = document.createElement("input");  
        element7.type = "button";
        element7.name = "button"+rowCount;
        element7.setAttribute('value', 'Delete');
        element7.onclick = function () { removeRow("button"+rowCount); }
        cell7.appendChild(element7);
    }
    function removeRow(btnName) {  
        try {
            var table = document.getElementById('dataTable');  
            var rowCount = table.rows.length;
            for(var i = 1; i < rowCount; i++){
                var row = table.rows[i];
                var rowObj = row.cells[7].childNodes[0];
                if (rowObj.name == btnName) {
                    table.deleteRow(i);
                    for(var j=i;j<rowCount-1;j++){
              			table.rows[j].cells[0].innerHTML=j;
              		}
                    break;
                }  
            }  
        }  
        catch (e) {  
            alert(e);
        }  
    }  
</SCRIPT> 
<h2>Modify Work in Progress</h2>
<br>
<br>
	<form action="SaveServlet" method="post">
		<TABLE id="dataTable" border="1">
			<TR>
				<TH>Sr.<br> No.</TH>
				<TH>Project ID</TH>
				<TH>Project Name</TH>
				<TH>Project Description</TH>
				<TH>WP Date</TH>
				<TH>Status</TH>
				<TH>PDC</TH>
				<TH></TH>
			</TR>
			<TR>
				<TD>1</TD>
				<TD><input type="text" value="" name="projectId1"></TD>
				<TD><input type="text" value="" name="projectName1"></TD>
				<TD><input type="text" value="" name="projectDesc1"></TD>
				<TD><input type="date" value="" name="WPDate1"></TD>
				<TD><input type="text" value="" name="status1"></TD>
				<TD><input type="date" value="" name="PDC1"></TD>
				<TD><input type="button" name="button1" value="Delete" onclick="removeRow('button1')"></TD>
			</TR>
		</TABLE>
		<input type="submit" value="save"/>
		<INPUT type="button" value="Add Row" onclick="addRow('dataTable')" />
	</form>
</body>
</html>