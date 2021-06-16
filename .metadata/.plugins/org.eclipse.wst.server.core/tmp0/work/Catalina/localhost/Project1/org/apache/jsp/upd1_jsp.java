/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.108
 * Generated at: 2021-06-10 09:06:16 UTC
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

public final class upd1_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<title>Insert title here</title>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"./downloadedStyles/css/style.css\">\r\n");
      out.write("</head>\r\n");
      out.write("<body onload=\"myFunction()\">\r\n");
      out.write("\r\n");
      out.write("\r\n");

HttpSession s= request.getSession(true);
Employee emp=(Employee) s.getAttribute("emp");
String period=(String) s.getAttribute("period");

DNET DNet=new DNET();
Connection dbConnection=DNet.getSurveyThinConnection();
PreparedStatement pStatement;
ResultSet res=null;


if(request.getParameter("update")!=null){
	try {
		pStatement=dbConnection.prepareStatement("UPDATE "+DNet.MPR_Reports+" SET REP_NO=?, TITLE=? WHERE F_CPERSNO=? AND TO_CHAR(REP_DATE,'DD/MM/YYYY') LIKE ?");
		pStatement.setString(1,request.getParameter("reportNo"));
		pStatement.setString(2,request.getParameter("title"));
		pStatement.setString(3,emp.persno);
		pStatement.setString(4,request.getParameter("reportDate"));
		pStatement.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	s.setAttribute("upd", 1);
}

if(request.getParameter("delete")!=null){
	try {
		pStatement=dbConnection.prepareStatement("DELETE FROM "+DNet.MPR_Reports+" WHERE F_CPERSNO=? AND TO_CHAR(REP_DATE,'DD/MM/YYYY') LIKE ?");
		pStatement.setString(1,emp.persno);
		pStatement.setString(2,(String)request.getParameter("reportDate"));
		pStatement.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	s.setAttribute("del", 1);
}

if(period!=null){
try {
	pStatement=dbConnection.prepareStatement("SELECT REP_NO, TO_CHAR(REP_DATE,'DD/MM/YYYY') AS REPD, TITLE FROM "+DNet.MPR_Reports+" WHERE F_CPERSNO=? AND TO_CHAR(REP_DATE,'YYYY-MM') LIKE ?");
	pStatement.setString(1,emp.persno);
	pStatement.setString(2, period);
	res=pStatement.executeQuery();
} catch (SQLException e) {
	e.printStackTrace();
}
}
int i=1;
s.setAttribute("update",1);

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("\tfunction myFunction() {\r\n");
      out.write("\t\tvar Table = document.getElementsByClassName(\"div-table\")[0];\r\n");
      out.write("\t\tvar rowCount = Table.getElementsByClassName(\"div-table-row\").length;\r\n");
      out.write("\t\tif(rowCount<2){\r\n");
      out.write("\t\t\tTable.getElementsByClassName(\"noData\")[0].style.display = \"block\";\r\n");
      out.write("\t\t\tTable.getElementsByClassName(\"noData\")[0].textContent = \"No data to show\";\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tif(document.getElementById(\"toast\")!=null){\r\n");
      out.write("\t\t\tvar x = document.getElementById(\"snackbar\");\r\n");
      out.write("\t\t\t  x.className = \"show\";\r\n");
      out.write("\t\t\t  setTimeout(function(){ x.className = x.className.replace(\"show\", \"\"); }, 3000);\r\n");
      out.write("\t\t  }\r\n");
      out.write("\t\t  if(document.getElementById(\"toast1\")!=null){\r\n");
      out.write("\t\t\tvar x = document.getElementById(\"snackbar1\");\r\n");
      out.write("\t\t\t  x.className = \"show\";\r\n");
      out.write("\t\t\t  setTimeout(function(){ x.className = x.className.replace(\"show\", \"\"); }, 3000);\r\n");
      out.write("\t\t  }\r\n");
      out.write("\t\t}\r\n");
      out.write("function updateForm(i){\r\n");
      out.write("\tdocument.getElementById('upd'+i).style.display=\"none\";\r\n");
      out.write("\tdocument.getElementById('sub'+i).style.display=\"block\";\r\n");
      out.write("\tdocument.getElementById('rnoL'+i).style.display=\"none\";\r\n");
      out.write("\tdocument.getElementById('rnoI'+i).style.display=\"block\";\r\n");
      out.write("\tdocument.getElementById('titL'+i).style.display=\"none\";\r\n");
      out.write("\tdocument.getElementById('titI'+i).style.display=\"block\";\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<div class=\"card\" style=\"width:90%;margin:auto;\">\r\n");
      out.write("\t<fieldset>\r\n");
      out.write("\t\t<legend>Nos. of reports generated during the month</legend>\r\n");
      out.write("<div class=\"div-table\" id=\"dataTable\">\r\n");
      out.write("\t\t\t<div class=\"div-table-row\" id=\"head\">\r\n");
      out.write("\t\t\t\t<div class=\"div-table-col-head\" style=\"width:5%\">Sr. No.</div>\r\n");
      out.write("\t\t\t\t<div class=\"div-table-col-head\"  style=\"width:25%\">Report No.</div>\r\n");
      out.write("\t\t\t\t<div class=\"div-table-col-head\"  style=\"width:15%\">Date</div>\r\n");
      out.write("\t\t\t\t<div class=\"div-table-col-head\" style=\"width:25%\">Title</div>\r\n");
      out.write("\t\t\t\t<div class=\"div-table-col-head\" style=\"width:15%\"></div>\r\n");
      out.write("\t\t\t\t<div class=\"div-table-col-head\" style=\"width:14.2%\"></div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t");
while(res!=null && res.next()){ 
      out.write("\r\n");
      out.write("\t\t\t<div class=\"div-table-row\">\r\n");
      out.write("\t\t\t<form action=\"upd1.jsp\" method=\"post\">\r\n");
      out.write("\t\t\t\t<div class=\"div-table-col\"  style=\"width:5%\">");
      out.print(i );
      out.write("</div>\r\n");
      out.write("\t\t\t\t<div class=\"div-table-col\" style=\"width:25%\">\r\n");
      out.write("\t\t\t\t\t<p id=\"rnoL");
      out.print(i );
      out.write('"');
      out.write('>');
      out.print(res.getString("REP_NO") );
      out.write("</p>\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" required id=\"rnoI");
      out.print(i );
      out.write("\" style=\"display: none;\" value='");
      out.print(res.getString("REP_NO") );
      out.write("' name=\"reportNo\">\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"div-table-col\" style=\"width:15%\">\r\n");
      out.write("\t\t\t\t\t<p >");
      out.print(res.getString("REPD") );
      out.write("</p>\r\n");
      out.write("\t\t\t\t\t<input type=\"hidden\" style=\"display: none;\"value='");
      out.print(res.getString("REPD") );
      out.write("' name=\"reportDate\">\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"div-table-col\" style=\"width:25%\">\r\n");
      out.write("\t\t\t\t\t<p id=\"titL");
      out.print(i );
      out.write('"');
      out.write('>');
      out.print(res.getString("TITLE") );
      out.write("</p>\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" required id=\"titI");
      out.print(i );
      out.write("\" style=\"display: none;\" value='");
      out.print(res.getString("TITLE") );
      out.write("' name=\"title\">\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"div-table-col\" style=\"width:15%\">\r\n");
      out.write("\t\t\t\t<input type=\"hidden\" value=\"upd\" name=\"update\"/>\r\n");
      out.write("\t\t\t\t<input type=\"button\" onclick=\"updateForm('");
      out.print(i );
      out.write("')\" id=\"upd");
      out.print(i );
      out.write("\" value=\"Update\"/>\r\n");
      out.write("\t\t\t\t<input type=\"submit\" style=\"display: none;\" id=\"sub");
      out.print(i );
      out.write("\" value=\"Save\"/></div>\r\n");
      out.write("\t\t\t\t</form>\r\n");
      out.write("\t\t\t\t<form action=\"upd1.jsp\" method=\"post\">\r\n");
      out.write("\t\t\t\t<div class=\"div-table-col\" style=\"width:14.2%\">\r\n");
      out.write("\t\t\t\t<input type=\"hidden\" value=\"del\" name=\"delete\"/>\r\n");
      out.write("\t\t\t\t<input type=\"hidden\" value=\"");
      out.print(res.getString("REPD") );
      out.write("\" name=\"reportDate\"/>\r\n");
      out.write("\t\t\t\t<input type=\"hidden\" value=\"");
      out.print(emp.persno );
      out.write("\" name=\"persno\"/>\r\n");
      out.write("\t\t\t\t<input type=\"submit\" value=\"Delete\"></div>\r\n");
      out.write("\t\t\t\t</form>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t");
i++; 
      out.write("\r\n");
      out.write("\t\t\t");
} 
      out.write("\r\n");
      out.write("\t\t\t<div class=\"noData\"></div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<br>\r\n");
      out.write("\t\t<form action=\"home.jsp\" method=\"post\">\r\n");
      out.write("\t\t\t<input type=\"submit\" value=\"Save\"/>\r\n");
      out.write("\t\t</form>\r\n");
      out.write("\t\t</fieldset>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div id=\"snackbar\">Updated Successfully</div>\r\n");
      out.write("\t\t<div id=\"snackbar1\">Deleted Successfully</div>\r\n");
      out.write("\t\t");
if(s.getAttribute("upd")!=null){ 
      out.write("\r\n");
      out.write("\t\t\t<div id=\"toast\" style=\"display:none;\"></div>\r\n");
      out.write("\t\t\t");
s.setAttribute("upd",null);} 
      out.write("\r\n");
      out.write("\t\t\t");
if(s.getAttribute("del")!=null){
      out.write("\r\n");
      out.write("\t\t\t<div id=\"toast1\" style=\"display:none;\"></div>\r\n");
      out.write("\t\t\t");
s.setAttribute("del",null);}
      out.write("\r\n");
      out.write("\t\t\t");
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
