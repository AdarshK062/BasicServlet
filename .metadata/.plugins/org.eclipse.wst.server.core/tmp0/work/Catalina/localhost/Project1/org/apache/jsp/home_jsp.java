/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.108
 * Generated at: 2021-04-15 18:49:39 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import BasicServlet.*;
import java.sql.*;

public final class home_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"ISO-8859-1\">\r\n");
      out.write("<title>Home</title>\r\n");
      out.write("<style>\r\n");
      out.write("body{\r\n");
      out.write("\tbackground: #eddeff\r\n");
      out.write("}\r\n");
      out.write("\t#logout{\r\n");
      out.write("\t\tposition:absolute;\r\n");
      out.write("\t\ttop: 5%;\r\n");
      out.write("\t\tright: 5%;\r\n");
      out.write("\t}\r\n");
      out.write("\tinput[type=submit]{\r\n");
      out.write("\t\t\tbackground-color: #555555;\r\n");
      out.write("\t\t\tborder-radius: 5px;\r\n");
      out.write("\t\t\theight:40px;\r\n");
      out.write("\t\t\tborder:none;\r\n");
      out.write("\t\t\tcolor:whitesmoke;\r\n");
      out.write("\t\t\tfont-size: medium;\r\n");
      out.write("\t\t\t/* padding: 15px; */\r\n");
      out.write("\t\t\tbox-shadow: 0 0 7px 0 #000;\r\n");
      out.write("\t\t\t/* padding-bottom: 20px; */\r\n");
      out.write("\t\t\tpadding-left: 15px;\r\n");
      out.write("\t\t\tpadding-right: 15px;\r\n");
      out.write("\t\t\tmargin: 10px;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t.card {\r\n");
      out.write("\t\t\tbackground-color: white;\r\n");
      out.write("\t\t\theight: auto;\r\n");
      out.write("\t\t\tpadding: 40px 30px;\r\n");
      out.write("\t\t\tbox-shadow: 0 0 10px 0 #000;\r\n");
      out.write("\t\t\t/* position: relative; */\r\n");
      out.write("\t\t\tborder-radius: 5px;\r\n");
      out.write("\t\t\tmargin: 15px 15px;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t.tab{\r\n");
      out.write("\t\t\tborder: 0.5px solid rgb(139, 137, 137);\r\n");
      out.write("\t\t\tfont-size: large;\r\n");
      out.write("\t\t\tmax-height: 250px;\r\n");
      out.write("\t\t\t\r\n");
      out.write("\twidth: 100%;\r\n");
      out.write("\toverflow-y: auto;\r\n");
      out.write("\toverflow-x: hidden;\r\n");
      out.write("  border-radius: 10px;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\ttable, th, td {\r\n");
      out.write("\t\t\tborder: 0.5px solid rgb(139, 137, 137);\r\n");
      out.write("\t\t\tborder-collapse: collapse;\r\n");
      out.write("\t\t\tpadding: 15px;\r\n");
      out.write("\t\t}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("table thead tr {\r\n");
      out.write("  height: 60px;\r\n");
      out.write("  background: #36304a;\r\n");
      out.write("  color: whitesmoke;\r\n");
      out.write("}\r\n");
      out.write("tbody tr:nth-child(even) {\r\n");
      out.write("  background-color: #f5f5f5;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#snackbar,#snackbar1 {\r\n");
      out.write("  visibility: hidden;\r\n");
      out.write("  min-width: 250px;\r\n");
      out.write("  float:right;\r\n");
      out.write("  background-color: rgb(75, 74, 74);\r\n");
      out.write("  color: #fff;\r\n");
      out.write("  text-align: center;\r\n");
      out.write("  border-radius: 2px;\r\n");
      out.write("  padding: 16px;\r\n");
      out.write("  position: fixed;\r\n");
      out.write("  z-index: 1;\r\n");
      out.write("  right:5%;\r\n");
      out.write("  bottom: 30px;\r\n");
      out.write("  font-size: 17px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("#snackbar.show,#snackbar1.show {\r\n");
      out.write("  visibility: visible;\r\n");
      out.write("  -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;\r\n");
      out.write("  animation: fadein 0.5s, fadeout 0.5s 2.5s;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("@-webkit-keyframes fadein {\r\n");
      out.write("  from {bottom: 0; opacity: 0;} \r\n");
      out.write("  to {bottom: 30px; opacity: 1;}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("@keyframes fadein {\r\n");
      out.write("  from {bottom: 0; opacity: 0;}\r\n");
      out.write("  to {bottom: 30px; opacity: 1;}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("@-webkit-keyframes fadeout {\r\n");
      out.write("  from {bottom: 30px; opacity: 1;} \r\n");
      out.write("  to {bottom: 0; opacity: 0;}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("@keyframes fadeout {\r\n");
      out.write("  from {bottom: 30px; opacity: 1;}\r\n");
      out.write("  to {bottom: 0; opacity: 0;}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("ul {\r\n");
      out.write("  list-style: none;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("ul li::before {\r\n");
      out.write("  content: \"\\2022\";\r\n");
      out.write("  color: red;\r\n");
      out.write("  font-weight: bold;\r\n");
      out.write("  display: inline-block; \r\n");
      out.write("  width: 1em;\r\n");
      out.write("  margin-left: -1em;\r\n");
      out.write("font-size: 25px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("li button {\r\n");
      out.write("\tbackground: none;\r\n");
      out.write("\tcolor: inherit;\r\n");
      out.write("\tborder: none;\r\n");
      out.write("\tpadding: 0;\r\n");
      out.write("\tcursor:pointer;\r\n");
      out.write("\toutline: inherit;\r\n");
      out.write("  margin-bottom: 2%;\r\n");
      out.write("  font-size: 17px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body onload=\"myFunction()\">\r\n");
      out.write("\r\n");
      out.write("\r\n");

HttpSession s= request.getSession(true);
Employee emp=(Employee) s.getAttribute("emp");

DNET DNet=new DNET();
Connection dbConnection=DNet.getConnection();
PreparedStatement pStatement;
if(request.getParameter("addWork")!=null){
	WorkProgress wpr=null;
	int i=1;
	String projectId=request.getParameter("projectId"+i);
	while(projectId!=null) {
		String projectName=request.getParameter("projectName"+i);
		String projectDesc=request.getParameter("projectDesc"+i);
		String WPDate=request.getParameter("WPDate"+i);
		String status=request.getParameter("status"+i);
		String PDC=request.getParameter("PDC"+i);
		wpr=new WorkProgress(emp.persno,WPDate,projectId,projectName,projectDesc,status,PDC);
		try {
			pStatement=dbConnection.prepareStatement("INSERT INTO "+DNet.MPR_WorkProgress+" VALUES(?,TO_DATE(?,'YYYY/MM/DD'),?,?,TO_DATE(?,'YYYY/MM/DD'))");
			pStatement.setString(1,wpr.persno)
;			pStatement.setString(2, wpr.wpDate);
			pStatement.setString(3,wpr.projectId);
			pStatement.setString(4,wpr.status);
			pStatement.setString(5,wpr.PDC);
			pStatement.executeUpdate();
			pStatement=dbConnection.prepareStatement("INSERT INTO "+DNet.Project+" VALUES(?,?,?)");
			pStatement.setString(1,wpr.projectId);
			pStatement.setString(2,wpr.projectName);
			pStatement.setString(3,wpr.projectDescription);
			pStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		i++;
		projectId=request.getParameter("projectId"+i);
	}
}
if(request.getParameter("addVisit")!=null){
	Fabrication fb=null;
	int i=1;
	String name=request.getParameter("name"+i);
	while(name!=null) {
		String date=request.getParameter("date"+i);
		String purpose=request.getParameter("purpose"+i);
		fb=new Fabrication(emp.persno,date,name,purpose);
		try {
			pStatement=dbConnection.prepareStatement("INSERT INTO "+DNet.MPR_FabricationVisits+" VALUES(?,TO_DATE(?,'YYYY/MM/DD'),?,?)");
			pStatement.setString(1,fb.persno);
			pStatement.setString(2,fb.visitDate);
			pStatement.setString(3,fb.industry);
			pStatement.setString(4,fb.purpose);
			pStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		i++;
		name=request.getParameter("name"+i);
	}
}
ResultSet res=null;
try {
	pStatement=dbConnection.prepareStatement("SELECT W.PROJECT_ID as pid, P.PROJECT_NAME as pname, TO_CHAR(w.WP_Date, 'dd/mm/yyyy') as wpd, W.STATUS as status FROM "+DNet.Project+" P, "+DNet.MPR_WorkProgress+" W WHERE P.PROJECT_ID=W.PROJECT_ID AND W.F_CPERSNO=? ORDER BY W.WP_DATE");
	pStatement.setString(1, emp.persno);
	res=pStatement.executeQuery();
} catch (SQLException e) {
	e.printStackTrace();
}

ResultSet res1=null;
try {
	pStatement=dbConnection.prepareStatement("SELECT INDUSTRY as ind, TO_CHAR(VISIT_DATE, 'dd/mm/yyyy') as vd, PURPOSE as pur FROM "+DNet.MPR_FabricationVisits+" WHERE F_CPERSNO=? ORDER BY VISIT_DATE");
	pStatement.setString(1, emp.persno);
	res1=pStatement.executeQuery();
} catch (SQLException e) {
	e.printStackTrace();
}

int i=1,j=1;

      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("\tfunction myFunction() {\r\n");
      out.write("\t\tif(document.getElementById(\"toast\")!=null){\r\n");
      out.write("\t\t\tvar x = document.getElementById(\"snackbar\");\r\n");
      out.write("\t\t\tx.className = \"show\";\r\n");
      out.write("\t\t\tsetTimeout(function(){ x.className = x.className.replace(\"show\", \"\"); }, 3000);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tif(document.getElementById(\"toast1\")!=null){\r\n");
      out.write("\t\t\tvar x = document.getElementById(\"snackbar1\");\r\n");
      out.write("\t\t\tx.className = \"show\";\r\n");
      out.write("\t\t\tsetTimeout(function(){ x.className = x.className.replace(\"show\", \"\"); }, 3000);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\tfunction options(x){\r\n");
      out.write("\t\tvar element=document.getElementById('display');\r\n");
      out.write("\t\tif(element.style.display='none'){\r\n");
      out.write("\t\t\telement.style.display='block';\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\telement.innerHTML = document.getElementById(x).innerHTML;\r\n");
      out.write("\t\t// document.getElementById(x).style.display='block';\r\n");
      out.write("\t}\r\n");
      out.write("\t</script>\r\n");
      out.write("<div style=\"display: flex;\">\r\n");
      out.write("<div class=\"card\" style=\"width: 15%;float:left;\">\r\n");
      out.write("\t<div>\r\n");
      out.write("\t\t<img src=\"icon.png\" width=\"100%\">\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div style=\"border-top: 0.5px solid rgb(133, 128, 128);\"></div>\r\n");
      out.write("\t<div style=\"text-align: center;margin-top: 10px;\">\r\n");
      out.write("\t\t<b>");
      out.print( emp.name);
      out.write("</b>\r\n");
      out.write("\t</div>\r\n");
      out.write("</div>\r\n");
      out.write("<div class=\"card\" style=\"width:60%; float:left;\">\r\n");
      out.write("\t<div>\r\n");
      out.write("\t\t<h2><b>\r\n");
      out.write("\t\t\tDetails\r\n");
      out.write("\t\t</b></h2>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div>\r\n");
      out.write("\t\t<table class=\"tab\">\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th width=\"30%\">Persno</th>\r\n");
      out.write("\t\t\t\t<td width=\"2%\">:</td>\r\n");
      out.write("\t\t\t\t<td>");
      out.print( emp.persno);
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th width=\"30%\">Name</th>\r\n");
      out.write("\t\t\t\t<td width=\"2%\">:</td>\r\n");
      out.write("\t\t\t\t<td>");
      out.print( emp.name );
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th width=\"30%\">Designation</th>\r\n");
      out.write("\t\t\t\t<td width=\"2%\">:</td>\r\n");
      out.write("\t\t\t\t<td>");
      out.print( emp.designation );
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<th width=\"30%\">Division</th>\r\n");
      out.write("\t\t\t\t<td width=\"2%\">:</td>\r\n");
      out.write("\t\t\t\t<td>");
      out.print( emp.division );
      out.write("</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t</div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<div style=\"clear: both;\"></div>\r\n");
      out.write("</div>\r\n");
      out.write("<div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t<div class=\"card\" style=\"width:16%;height: auto; max-height:800px; float:left;padding: 20px 20px;\">\r\n");
      out.write("\t\t<fieldset style=\"height: 100%; overflow-y: auto;\">\r\n");
      out.write("\t\t\t<legend style=\"font-weight: bold;font-size: large;\">Options</legend>\r\n");
      out.write("\t\t\t<div>\r\n");
      out.write("\t\t\t\t<ul>\r\n");
      out.write("\t\t\t\t\t<li><button style=\"text-align: left;margin-left: 0.5px;\" onclick=\"options('1')\">Details of work in Progress</button></li>\r\n");
      out.write("\t\t\t\t\t<br>\r\n");
      out.write("\t\t\t\t\t<li><button style=\"text-align: left;margin-left: 0.5px;\" onclick=\"options('2')\">Visits to Fabrication agencies during the month</button></li>\r\n");
      out.write("\t\t\t\t</ul>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</fieldset>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div class=\"card\" id=\"display\" style=\"width:70%;height: auto; max-height:800px; float:left;display:none;\">\r\n");
      out.write("\t</div>\r\n");
      out.write("\r\n");
      out.write("<div class=\"card\" id=\"1\" style=\"width:70%;height: auto; max-height:800px; float:left;display:none;\">\r\n");
      out.write("\t<fieldset style=\"height: 100%; overflow-y: auto;padding: 20px;\">\r\n");
      out.write("\t\t<legend style=\"font-weight: bold;font-size: large;\">Work in Progress</legend>\r\n");
      out.write("\t\t<div style=\"margin-bottom: 10px;\">\r\n");
      out.write("\t\t\t<table class=\"tab\" style=\"width:100%;\">\r\n");
      out.write("\t\t\t\t<thead>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<th width=\"4%\">Sr. No.</th>\r\n");
      out.write("\t\t\t\t\t\t<th>Project ID</th>\r\n");
      out.write("\t\t\t\t\t\t<th>Project Name</th>\r\n");
      out.write("\t\t\t\t\t\t<th>WP Date</th>\r\n");
      out.write("\t\t\t\t\t\t<th>Status</th>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t</thead>\r\n");
      out.write("\t\t\t\t<tbody style=\"overflow-y: auto;max-height: 150px;\">\r\n");
      out.write("\t\t\t\t\t");
while(res!=null && res.next()){ 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td>");
      out.print(i );
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t");
      out.print(res.getString("pid") );
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t");
      out.print(res.getString("pname") );
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t");
      out.print(res.getString("wpd") );
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t");
      out.print(res.getString("status") );
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t");
i++;} 
      out.write("\r\n");
      out.write("\t\t\t\t</tbody>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\t<div style=\"display: flex;\">\r\n");
      out.write("\t\t\t\t<form action=\"addWork.jsp\" method=\"post\">\r\n");
      out.write("\t\t\t\t\t<input type=\"submit\" value=\"Add\" />\r\n");
      out.write("\t\t\t\t</form>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t\t<form action=\"updWork.jsp\" method=\"post\">\r\n");
      out.write("\t\t\t\t\t<input type=\"submit\" value=\"Update\" />\r\n");
      out.write("\t\t\t\t</form>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</fieldset>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"card\" id=\"2\" style=\"width:70%;height: auto; max-height:800px; float:left;display:none;\">\r\n");
      out.write("\t<fieldset style=\"height: 100%; overflow-y: auto;padding: 20px;\">\r\n");
      out.write("\t\t<legend style=\"font-weight: bold;font-size: large;\">Visits to Fabrication Agencies</legend>\r\n");
      out.write("\t\t<div style=\"margin-bottom: 10px;\">\r\n");
      out.write("\t\t\t<table class=\"tab\" style=\"width:100%;\">\r\n");
      out.write("\t\t\t\t<thead>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<th width=\"4%\">Sr. No.</th>\r\n");
      out.write("\t\t\t\t\t\t<th>Industry</th>\r\n");
      out.write("\t\t\t\t\t\t<th>Visit Date</th>\r\n");
      out.write("\t\t\t\t\t\t<th>Purpose</th>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t</thead>\r\n");
      out.write("\t\t\t\t<tbody style=\"overflow-y: auto;max-height: 150px;\">\r\n");
      out.write("\t\t\t\t\t");
while(res1!=null && res1.next()){ 
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td>");
      out.print(j);
      out.write("</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t");
      out.print(res1.getString("ind") );
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t");
      out.print(res1.getString("vd") );
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t\t\t");
      out.print(res1.getString("pur") );
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t");
j++;} 
      out.write("\r\n");
      out.write("\t\t\t\t</tbody>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\t<div style=\"display: flex;\">\r\n");
      out.write("\t\t\t\t<form action=\"addVisit.jsp\" method=\"post\">\r\n");
      out.write("\t\t\t\t\t<input type=\"submit\" value=\"Add\" />\r\n");
      out.write("\t\t\t\t</form>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t\t<form action=\"updVisit.jsp\" method=\"post\">\r\n");
      out.write("\t\t\t\t\t<input type=\"submit\" value=\"Update\" />\r\n");
      out.write("\t\t\t\t</form>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</fieldset>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div id=\"logout\">\r\n");
      out.write("<form action=\"end.jsp\" method=\"post\">\r\n");
      out.write("\t<input type=\"submit\" value=\"Logout\"/>\r\n");
      out.write("</form>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<div id=\"snackbar\">Added Successfully</div>\r\n");
      out.write("<div id=\"snackbar1\">Updated Successfully</div>\r\n");
      out.write("\r\n");
if(s.getAttribute("add")!=null){ 
      out.write("\r\n");
      out.write("<div id=\"toast\" style=\"display:none;\"></div>\r\n");
s.setAttribute("add",null);} 
      out.write('\r');
      out.write('\n');
if(s.getAttribute("update")!=null){
      out.write("\r\n");
      out.write("<div id=\"toast1\" style=\"display:none;\"></div>\r\n");
s.setAttribute("update",null);}
      out.write('\r');
      out.write('\n');
 dbConnection.close(); 
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
