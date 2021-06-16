<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Progress</title>
<style>
    body{
			background: #eddeff;
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
        input[type=text]{
            border:none;
            width:90%;
            height: 100%;
            margin:auto;
            outline: none;
        }
		.card {
			background-color: white;
			height: auto;
			padding: 40px 30px;
			box-shadow: 0 0 10px 0 #000;
			/* position: relative; */
			border-radius: 5px;
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
        input[type=text]:focus {
			border: none;
            outline: none;
		}
		table, th, td {
			border: 0.5px solid rgb(139, 137, 137);
			border-collapse: collapse;
			/* padding: 15px; */
            
  align-items: center;
  text-align: center;
		}

table thead tr {
  height: 60px;
  background: #36304a;
  color: whitesmoke;
}
tbody tr:nth-child(even) {
  background-color: #f5f5f5;
}
tbody tr:nth-child(even) input[type="text"]{
  background-color: #f5f5f5;
}
tbody tr:nth-child(even) input[type="date"]{
  background-color: #f5f5f5;
}
</style>
</head>
<body>
<%@ page import="BasicServlet.*" %>
<%
HttpSession s= request.getSession(true);
Employee emp=(Employee) s.getAttribute("emp");
s.setAttribute("add",1);
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
</script> 
<div class="card" style="margin: auto; width:90%;height: auto; overflow:auto; ">
	<fieldset>
		<legend>Work in Progress</legend>
		<div style="margin-bottom: 10px;">
            <form action="home.jsp" method="post">
			<table class="tab" id="dataTable" style="width:100%;">
				<thead>
					<tr>
						<th width="4%">Sr. No.</th>
						<th>Project ID</th>
						<th>Project Name</th>
                        <th>Project Description</th>
						<th>WP Date</th>
						<th>Status</th>
                        <th>PDC</th>
                        <th></th>
					</tr>
				</thead>
				<tbody id="dataTable">
                    <tr>
					<td>1</td>
                    <td><input type="text" required value="" name="projectId1"></td>
                    <td><input type="text" required value="" name="projectName1"></td>
                    <td><input type="text" required value="" name="projectDesc1"></td>
                    <td><input type="date" required value="" name="WPDate1"></td>
                    <td><input type="text" required value="" name="status1"></td>
                    <td><input type="date" required value="" name="PDC1"></td>
                    <td><input type="button" name="button1" value="Delete" onclick="removeRow('button1')"></td>
				</tbody>
			</table>
            <br>
            <input type="button" value="Add Row" style="float:right;" onclick="addRow('dataTable')" />
            <br>
            <input type="hidden" value="addWork" name="addWork"/>
            <input type="submit" value="Save"/>
            </form>
		</div>
		</div>
	</fieldset>
</div>
</body>
</html>