<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Progress</title>
<style>
    table{
        width: 80%;
        margin: auto;
    }
    table,th,td{
        border: 1.5px solid black;
        padding: auto;
    }
    ol{
        font-size: large;
    }
    li span{
        font-weight: bold;
    }
    li{
        margin-top: 18px;
        margin-bottom: 18px;
    }
</style>
</head>
<body>
<%@ page import="BasicServlet.*" %>
<%
HttpSession s= request.getSession(true);
Employee emp=(Employee) s.getAttribute("emp");
%>

<h1 style="text-align: center;">Monthly Progress Report</h1>
<h2 style="text-align: center;">( January, 2021 )</h2>
<ol>
    <li><span>Name of the Personnel   : </span></li>
    <li><span>Nos. of reports generated during the month with list   :</span></li>
    <table>
        <tr>
            <th>Sr. No.</th>
            <th>Report No.</th>
            <th>Date</th>
            <th>Title</th>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
    </table>
    <li><span>Title of research paper submitted if any:</span></li>
    <table>
        <tr>
            <th>Sr. No.</th>
            <th>Title of Research paper</th>
            <th>Journal / Conference names</th>
            <th>Dates</th>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
    </table>
</ol>

</body>
</html>