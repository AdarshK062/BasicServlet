<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Add Other Details</title>
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
	function DispRows(x){
		document.getElementById(x+"L").style.display="none";
		document.getElementById(x+"I").style.display="block";
	}

	function addRow(id, tableID) {  
        var table = document.getElementById(tableID);  
        var rowCount = table.rows.length;
        var tableLength = rowCount+1;
        var row = table.insertRow(rowCount);
        
        var cell0 = row.insertCell(0);
        var cell1 = row.insertCell(1);
        var cell2 = row.insertCell(2);
        var cell3 = row.insertCell(3);

		cell0.setAttribute('width',"8%");
		cell1.setAttribute('width',"2%");
		cell2.setAttribute('width',"75%");

        cell0.innerHTML = tableLength; 
        cell1.innerHTML = ":";
        
        var element2 = document.createElement("textarea");
        element2.setAttribute('placeholder', "Some Text...");
        element2.setAttribute('value', '');
        element2.setAttribute('required', '');
        element2.setAttribute('name', 'inputData'+id+tableLength);
        cell2.appendChild(element2);
        
        var element3 = document.createElement("input");
        element3.type="hidden";
        element3.setAttribute('name', 'inputFlag'+id+tableLength);
        
        if(id=="1"){
        	element3.setAttribute('value','DRAWING_DETAILS');
        }
        else if(id=="2"){
        	element3.setAttribute('value','WORK_DETAILS');
        }
        else if(id=="3"){
        	element3.setAttribute('value','RESEARCH');
        }
        else if(id=="4"){
        	element3.setAttribute('value','INT_TECH');
        }
        else if(id=="5"){
        	element3.setAttribute('value','TECH_DETAILS');
        }
        else{
        	element3.setAttribute('value','INPUT_PROJECT');
        }
        
        cell2.appendChild(element3);
        
        var element4 = document.createElement("input");  
        element4.type = "button";
        element4.name = "button"+tableLength;
        element4.setAttribute('value', 'Delete');
        element4.onclick = function () { removeRow(id, "button"+tableLength); }
        cell3.appendChild(element4);
    }

    function removeRow(id,btnName) { 
        try {
			console.log(btnName);
            var table = document.getElementById('dataTable'+id);
            var rowCount = table.rows.length;
            var tableLength = rowCount+1;
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
		<legend>Other Details</legend>
		<div style="margin-bottom: 10px;">
		<input type="hidden" value=<%=start %> id="start"/>
		<input type="hidden" value=<%=end %> id="end"/>
            <form action="home.jsp" method="post">
				<br>
				<b>Details of DWGs generated during the month</b><br><br>
				<div>
					<div class="boxed" id="1L" onclick="DispRows('1')">
						<img alt="Add" src="Add.png" width="80px" height="80px" style="float:left;">&nbsp;&nbsp;&nbsp;
						<b>Add Rows</b>
					</div>
					<div id="1I" style="display:none;">
						<table class="tab" id="dataTable1" style="width:100%;">
                    <tr>
								<th width="8%">1</th>
								<td width="2%">:</td>
								<td width="75%">
									<textarea placeholder="Some Text..." name="inputData11"></textarea>
									<input type="hidden" name="inputFlag11" value="DRAWING_DETAILS">
								</td>
								<td><input type="button" name="button1" value="Delete" onclick="removeRow('1','button1')"></td>
							    </tr>
						</table>
						<br>
			            <input type="button" id="add" value="Add Row" style="float:right;" onclick="addRow('1','dataTable1')" />
			            <br>
					</div>
				</div>
				<br>
				<br>
				<b>Details of administrative work done during the month</b><br>
				<br>
				<div>
					<div class="boxed" id="2L" onclick="DispRows('2')">
						<img alt="Add" src="Add.png" width="80px" height="80px" style="float:left;">&nbsp;&nbsp;&nbsp;
						<b>Add Rows</b>
					</div>
					<div id="2I" style="display:none;">
						<table class="tab" id="dataTable2" style="width:100%;">
							<tr>
								<th width="8%">1</th>
								<td width="2%">:</td>
								<td width="75%">
									<textarea placeholder="Some Text..." name="inputData21"></textarea>
									<input type="hidden" name="inputFlag21" value="WORK_DETAILS">
								</td>
								<td><input type="button" class="del" name="button1" value="Delete" onclick="removeRow('2','button1')"></td>
							</tr>
						</table>
						<br>
			            <input type="button" id="add" value="Add Row" style="float:right;" onclick="addRow('2','dataTable2')" />
			            <br>
					</div>
				</div>
				<br>
				<br>
				<b>Details of research work done on the topic assigned to you</b><br>
				<br>
				<div>
					<div class="boxed" id="3L" onclick="DispRows('3')">
						<img alt="Add" src="Add.png" width="80px" height="80px" style="float:left;">&nbsp;&nbsp;&nbsp;
						<b>Add Rows</b>
					</div>
					<div id="3I" style="display:none;">
						<table class="tab" id="dataTable3" style="width:100%;">
							<tr>
								<th width="8%">1</th>
								<td width="2%">:</td>
								<td width="75%">
									<textarea placeholder="Some Text..." name="inputData31"></textarea>
									<input type="hidden" name="inputFlag31" value="RESEARCH">
								</td>
								<td><input type="button" class="del" name="button1" value="Delete" onclick="removeRow('3','button1')"></td>
							</tr>
						</table>
						<br>
			            <input type="button" id="add" value="Add Row" style="float:right;" onclick="addRow('3','dataTable3')" />
			            <br>
					</div>
				</div>
				<br>
				<br>
				<b>Details of internal technical work review</b><br>
				<br>
				<div>
					<div class="boxed" id="4L" onclick="DispRows('4')">
						<img alt="Add" src="Add.png" width="80px" height="80px" style="float:left;">&nbsp;&nbsp;&nbsp;
						<b>Add Rows</b>
					</div>
					<div id="4I" style="display:none;">
						<table class="tab" id="dataTable4" style="width:100%;">
							<tr>
								<th width="8%">1</th>
								<td width="2%">:</td>
								<td width="75%">
									<textarea placeholder="Some Text..." name="inputData41"></textarea>
									<input type="hidden" name="inputFlag41" value="INT_TECH">
								</td>
								<td><input type="button" class="del" name="button1" value="Delete" onclick="removeRow('4','button1')"></td>
							</tr>
						</table>
						<br>
			            <input type="button" id="add" value="Add Row" style="float:right;" onclick="addRow('4','dataTable4')" />
			            <br>
					</div>
				</div>
				<br>
				<br>
				<b>Details of technical work done during the month</b><br>
				<br>
				<div>
					<div class="boxed" id="5L" onclick="DispRows('5')">
						<img alt="Add" src="Add.png" width="80px" height="80px" style="float:left;">&nbsp;&nbsp;&nbsp;
						<b>Add Rows</b>
					</div>
					<div id="5I" style="display:none;">
						<table class="tab" id="dataTable5" style="width:100%;">
							<tr>
								<th width="8%">1</th>
								<td width="2%">:</td>
								<td width="75%">
									<textarea placeholder="Some Text..." name="inputData51"></textarea>
									<input type="hidden" name="inputFlag51" value="TECH_DETAILS">
								</td>
								<td><input type="button" class="del" name="button1" value="Delete" onclick="removeRow('5','button1')"></td>
							</tr>
						</table>
						<br>
			            <input type="button" id="add" value="Add Row" style="float:right;" onclick="addRow('5','dataTable5')" />
			            <br>
					</div>
				</div>
				<br>
				<br>
				<b>Details of any input awaited from project</b><br>
				<br>
				<div>
					<div class="boxed" id="6L" onclick="DispRows('6')">
						<img alt="Add" src="Add.png" width="80px" height="80px" style="float:left;">&nbsp;&nbsp;&nbsp;
						<b>Add Rows</b>
					</div>
					<div id="6I" style="display:none;">
						<table class="tab" id="dataTable6" style="width:100%;">
							<tr>
								<th width="8%">1</th>
								<td width="2%">:</td>
								<td width="75%">
									<textarea placeholder="Some Text..." name="inputData61"></textarea>
									<input type="hidden" name="inputFlag61" value="INPUT_PROJECT">
								</td>
								<td><input type="button" class="del" name="button1" value="Delete" onclick="removeRow('6','button1')"></td>
							</tr>
						</table>
						<br>
			            <input type="button" id="add" value="Add Row" style="float:right;" onclick="addRow('6','dataTable6')" />
			            <br>
					</div>
				</div>
            <br>
            <br>
            <input type="hidden" value="add10" name="add10"/>
            <input type="submit" value="Save"/>
            </form>
		</div>
		</div>
	</fieldset>
</div>

</body>
</html>