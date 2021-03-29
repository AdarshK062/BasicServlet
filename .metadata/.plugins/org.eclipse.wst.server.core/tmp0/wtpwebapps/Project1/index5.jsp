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
        cell0.innerHTML = rowCount; 
        
        var element1 = document.createElement("input");
        element1.type = "text";
        element1.setAttribute('value', '');
        element1.setAttribute('name', 'name'+rowCount);
        cell1.appendChild(element1);
        
        var element2 = document.createElement("input");
        element2.type = "date";
        element2.setAttribute('name', 'date'+rowCount);
        cell2.appendChild(element2);
        
        var element3 = document.createElement("input");
        element3.type = "text";
        element3.setAttribute('value', '');
        element3.setAttribute('name', 'purpose'+rowCount);
        cell3.appendChild(element3);
        
        var element4 = document.createElement("input");  
        element4.type = "button";
        element4.name = "button"+rowCount;
        element4.setAttribute('value', 'Delete');
        element4.onclick = function () { removeRow("button"+rowCount); }
        cell4.appendChild(element4);
    }
    function removeRow(btnName) {  
        try {
            var table = document.getElementById('dataTable');  
            var rowCount = table.rows.length;
            for(var i = 1; i < rowCount; i++){
                var row = table.rows[i];
                var rowObj = row.cells[4].childNodes[0];
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
<h2>Modify Visits to Fabrication Agencies</h2>
<br>
<br>
	<form action="SaveServlet1" method="post">
		<TABLE id="dataTable" border="1">
			<TR>
				<TH>Sr.<br> No.</TH>
				<TH>Name of Industry</TH>
				<TH>Date</TH>
				<TH>Purpose/Outcome</TH>
				<TH></TH>
			</TR>
			<TR>
				<TD>1</TD>
				<TD><input type="text" value="" name="name1"></TD>
				<TD><input type="date" value="" name="date1"></TD>
				<TD><input type="text" value="" name="purpose1"></TD>
				<TD><input type="button" name="button1" value="Delete" onclick="removeRow('button1')"></TD>
			</TR>
		</TABLE>
		<input type="submit" value="save"/>
		<INPUT type="button" value="Add Row" onclick="addRow('dataTable')" />
	</form>
</body>
</html>