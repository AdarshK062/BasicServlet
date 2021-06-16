<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Visits</title>
<link rel="stylesheet" href="./downloadedStyles/css/style.css">
</head>
<body>
<%@ page import="BasicServlet.*" %>
<%
HttpSession s= request.getSession(true);
Employee emp=(Employee) s.getAttribute("emp");
String start=(String) s.getAttribute("start");
String end=(String) s.getAttribute("end");
s.setAttribute("add",1);
%>

<script>
	function addRow(tableID) {  
		var start=document.getElementById("start").value;
		var end=document.getElementById("end").value;
        var table = document.getElementById(tableID);  
        var rowCount = table.rows.length;  
        var row = table.insertRow(rowCount);
        
        var cell0 = row.insertCell(0);
        var cell1 = row.insertCell(1);
        var cell2 = row.insertCell(2);
        var cell3 = row.insertCell(3);
        cell0.innerHTML = rowCount+1; 
        
        var element1 = document.createElement("input");
        element1.type = "date";
        element1.setAttribute('required', '');
        element1.setAttribute('value', '');
        element1.setAttribute('name', 'dt'+rowCount);
        element1.setAttribute('min',start);
        element1.setAttribute('max',end);
        cell1.appendChild(element1);
        
        var element2 = document.createElement("input");
        element2.type = "text";
        element2.setAttribute('required', '');
        element2.setAttribute('value', '');
        element2.setAttribute('name', 'title'+rowCount);
        cell2.appendChild(element2);
        
        var element3 = document.createElement("input");  
        element3.type = "button";
        element3.name = "button"+rowCount;
        element3.setAttribute('value', 'Delete');
        element3.onclick = function () { removeRow("button"+rowCount); }
        cell3.appendChild(element3);
    }
    function removeRow(btnName) {  
        try {
            var table = document.getElementById('dataTable');  
            var rowCount = table.rows.length;
            for(var i = 0; i < rowCount; i++){
                var row = table.rows[i];
                var rowObj = row.cells[3].childNodes[0];
                if (rowObj.name == btnName) {
                    table.deleteRow(i);
                    for(var j=i;j<rowCount-1;j++){
              			table.rows[j].cells[0].innerHTML=j+1;
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


<div class="card" style="margin: auto; width:90%;">
	<fieldset>
		<legend>Details of TC/ any presentations you have made last</legend>
		<div style="margin-bottom: 10px;">
		<input type="hidden" value=<%=start %> id="start"/>
		<input type="hidden" value=<%=end %> id="end"/>
            <form action="home.jsp" method="post">
			<table class="tab" style="width:100%;">
				<thead>
					<tr>
						<th width="8%">Sr. No.</th>
						<th width="35%">Date</th>
						<th width="40%">Title</th>
                        <th></th>
					</tr>
				</thead>
				<tbody id="dataTable">
                    <tr>
                        <td>1</td>
                        <td><input type="date" required min=<%=start %> max=<%=end %> value="" name="dt1"></td>
                        <td><input type="text" required value="" name="title1"></td>
                        <td><input type="button" class="del" name="button1" value="Delete" onclick="removeRow('button1')"></td>
                    </tr>
				</tbody>
			</table>
            <br>
            <input type="button" id="add" value="Add Row" style="float:right;" onclick="addRow('dataTable')" />
            <br>
            <input type="hidden" value="add4" name="add4"/>
            <input type="submit" value="Save"/>
            </form>
		</div>
		</div>
	</fieldset>
</div>

</body>
</html>