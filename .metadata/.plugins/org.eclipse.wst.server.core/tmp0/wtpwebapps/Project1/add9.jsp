<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Progress</title>
<link rel="stylesheet" href="./downloadedStyles/css/style.css">
</head>
<body>
<%@ page import="BasicServlet.*" %>
<%@ page import="java.sql.*" %>
<%
HttpSession s= request.getSession(true);
Employee emp=(Employee) s.getAttribute("emp");
s.setAttribute("add",1);
String period=(String) s.getAttribute("period");

DNET DNet=new DNET();
Connection dbConnection=DNet.getSurveyThinConnection();
PreparedStatement pStatement;
ResultSet res=null;
try {
	pStatement=dbConnection.prepareStatement("SELECT * FROM "+DNet.Project, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	res=pStatement.executeQuery();
} catch (SQLException e) {
	e.printStackTrace();
}
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
        cell0.innerHTML = rowCount+1; 

        var element1 = document.createElement("select");
        element1.innerHTML=document.getElementById("dropdown").innnerHTML;
        for (const val of document.getElementById("dropdown").getElementsByClassName("options")) {
            var option = document.createElement("option");
            option.value = val.value;
            option.text = val.value;
            element1.appendChild(option);
          }
        element1.setAttribute('required', '');
        element1.setAttribute('name', 'projectName'+rowCount);
        cell1.appendChild(element1);
        
        var element2 = document.createElement("input");
        element2.type = "text";
        element2.setAttribute('required', '');
        element2.setAttribute('value', '');
        element2.setAttribute('name', 'projectDesc'+rowCount);
        cell2.appendChild(element2);
        
        var element3 = document.createElement("input");
        element3.type = "text";
        element3.setAttribute('required', '');
        element3.setAttribute('value', '');
        element3.setAttribute('name', 'status'+rowCount);
        cell3.appendChild(element3);
        
        var element4 = document.createElement("input");
        element4.type = "date";
        element4.setAttribute('required', '');
        element4.setAttribute('name', 'PDC'+rowCount);
        cell4.appendChild(element4);
        
        var element5 = document.createElement("input");  
        element5.type = "button";
        element5.name = "button"+rowCount;
        element5.setAttribute('value', 'Delete');
        element5.onclick = function () { removeRow("button"+rowCount); }
        cell5.appendChild(element5);
    }
    function removeRow(btnName) {  
        try {
            var table = document.getElementById('dataTable');  
            var rowCount = table.rows.length;
            for(var i = 0; i < rowCount; i++){
                var row = table.rows[i];
                var rowObj = row.cells[5].childNodes[0];
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
<div class="card" style="margin: auto; width:90%; ">
	<fieldset>
		<legend>Work in Progress</legend>
		<div style="margin-bottom: 10px;">
            <form action="home.jsp" method="post">
			<table class="tab" style="width:100%;">
				<thead>
					<tr>
						<th width="8%">Sr. No.</th>
						<th width="18%">Project</th>
                        <th width="23%">Description</th>
						<th width="23%">Status</th>
                        <th width="18%">PDC</th>
                        <th></th>
					</tr>
				</thead>
				<tbody id="dataTable">
                    <tr>
					<td>1</td>
					<td>
						<select name="projectName1">
						  <% while(res.next()){ %>
							<option value=<%=res.getString("PROJECT_NAME") %>><%=res.getString("PROJECT_NAME") %></option>
							<%} %>
						</select>
					</td>
                    <td><input type="text" required value="" name="projectDesc1"></td>
                    <td><input type="text" required value="" name="status1"></td>
                    <td><input type="date" required value="" name="PDC1"></td>
                    <td><input type="button" name="button1" value="Delete" onclick="removeRow('button1')"></td>
				    </tr>
                </tbody>
			</table>
            <br>
            <input type="button" value="Add Row" style="float:right;" onclick="addRow('dataTable')" />
            <br>
            <input type="hidden" value="add9" name="add9"/>
            <input type="submit" value="Save"/>
            </form>
		</div>
		<div style="display:none">
			<select id="dropdown">
                <%res.beforeFirst(); %>
				<% while(res.next()){ %>
					<option class="options" value=<%=res.getString("PROJECT_NAME") %>><%=res.getString("PROJECT_NAME") %></option>
				<%} %>
			</select>
		</div>
		</div>
	</fieldset>
</div>
<% dbConnection.close(); %>
</body>
</html>