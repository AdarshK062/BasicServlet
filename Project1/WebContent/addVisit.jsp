<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Visits</title>
<style>
    body{
			background: #eddeff
		}
    input[type=submit]{
        background-color: #555555;
        border-radius: 5px;
        height:40px;
        border:none;
        color:whitesmoke;
        font-size: medium;
        /* padding: 15px; */
        box-shadow: 0 0 5px 0 #000;
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
        box-shadow: 0 0 5px 0 #000;
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
        margin: auto;
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


<div class="card" style="margin: auto; width:90%;height: auto; overflow:auto;">
	<fieldset style="height: 100%; overflow-y: auto;padding: 20px;">
		<legend style="font-weight: bold;font-size: large;">Fabrication Visits</legend>
		<div style="margin-bottom: 10px;">
            <form action="home.jsp" method="post">
			<table class="tab" id="dataTable" style="width:100%;">
				<thead>
					<tr>
						<th width="8%">Sr. No.</th>
						<th>Name of Industry</th>
						<th>Visit Date</th>
                        <th>Purpose/ Outcome</th>
                        <th></th>
					</tr>
				</thead>
				<tbody style="overflow-y: auto;max-height: 150px;">
					<td>1</td>
                    <td><input type="text" value="" name="name1"></td>
                    <td><input type="date" value="" name="date1"></td>
                    <td><input type="text" value="" name="purpose1"></td>
                    <td><input type="button" class="del" name="button1" value="Delete" onclick="removeRow('button1')"></td>
				</tbody>
			</table>
            <br>
            <input type="button" id="add" value="Add Row" style="float:right;" onclick="addRow('dataTable')" />
            <br>
            <input type="hidden" value="addVisit" name="addVisit"/>
            <input type="submit" value="Save"/>
            </form>
		</div>
		</div>
	</fieldset>
</div>



</body>
</html>