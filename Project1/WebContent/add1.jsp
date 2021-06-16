<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Add Reports generated</title>
    <link rel="stylesheet" href="./style.css">
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
        var rowCount = table.rows.length+1;  
        var row = table.insertRow(rowCount-1);
        
        var cell0 = row.insertCell(0);
        var cell1 = row.insertCell(1);
        var cell2 = row.insertCell(2);
        var cell3 = row.insertCell(3);
        var cell4 = row.insertCell(4);
        cell0.innerHTML = rowCount; 
        
        var element1 = document.createElement("input");
        element1.type = "text";
        element1.setAttribute('required', '');
        element1.setAttribute('value', '');
        element1.setAttribute('name', 'no'+rowCount);
        cell1.appendChild(element1);
        
        var element2 = document.createElement("input");
        element2.type = "date";
        element2.setAttribute('required', '');
        element2.setAttribute('name', 'date'+rowCount);
        element2.setAttribute('min',start);
        element2.setAttribute('max',end);
        cell2.appendChild(element2);
        
        var element3 = document.createElement("input");
        element3.type = "text";
        element3.setAttribute('required', '');
        element3.setAttribute('value', '');
        element3.setAttribute('name', 'title'+rowCount);
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
            for(var i = 0; i < rowCount; i++){
                var row = table.rows[i];
                var rowObj = row.cells[4].childNodes[0];
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
        <legend>Nos. of reports generated during the month</legend>
        <div style="margin-bottom: 10px;">
            <input type="hidden" value=<%=start %> id="start"/>
            <input type="hidden" value=<%=end %> id="end"/>
            <form action="home.jsp" method="post">
                <table class="tab" style="width:100%;">
                    <thead>
                        <tr>
                            <th width="8%">Sr. No.</th>
                            <th width="28%">Report No.</th>
                            <th width="18%">Date</th>
                            <th width="28%">Title</th>
                            <th width="8%"></th>
                        </tr>
                    </thead>
                    <tbody id="dataTable">
                        <tr>
                            <td>1</td>
                            <td><input type="text" required value="" name="no1"></td>
                            <td><input type="date" required value="" name="date1" min=<%=start %> max=<%=end %>></td>
                            <td><input type="text" required value="" name="title1"></td>
                            <td><input type="button" class="del" name="button1" value="Delete"
                                    onclick="removeRow('button1')"></td>
                        </tr>
                    </tbody>
                </table>
                <br>
                <input type="button" id="add" value="Add Row" style="float:right;" onclick="addRow('dataTable')" />
                <br>
                <input type="hidden" value="add1" name="add1" />
                <input type="submit" value="Save" />
            </form>
        </div>
    </fieldset>
</div>

</body>
</html>