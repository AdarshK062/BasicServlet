/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.108
 * Generated at: 2021-06-09 18:33:59 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import BasicServlet.*;

public final class add6_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<title>Add Visits</title>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"./downloadedStyles/css/style.css\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");

HttpSession s= request.getSession(true);
Employee emp=(Employee) s.getAttribute("emp");
String start=(String) s.getAttribute("start");
String end=(String) s.getAttribute("end");
s.setAttribute("add",1);

      out.write("\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("\tfunction addRow(tableID) {    \r\n");
      out.write("\t\tvar start=document.getElementById(\"start\").value;\r\n");
      out.write("\t\tvar end=document.getElementById(\"end\").value;\r\n");
      out.write("        var table = document.getElementById(tableID);  \r\n");
      out.write("        var rowCount = table.rows.length;  \r\n");
      out.write("        var row = table.insertRow(rowCount);\r\n");
      out.write("        \r\n");
      out.write("        var cell0 = row.insertCell(0);\r\n");
      out.write("        var cell1 = row.insertCell(1);\r\n");
      out.write("        var cell2 = row.insertCell(2);\r\n");
      out.write("        var cell3 = row.insertCell(3);\r\n");
      out.write("        var cell4 = row.insertCell(4);\r\n");
      out.write("        cell0.innerHTML = rowCount+1; \r\n");
      out.write("        \r\n");
      out.write("        var element1 = document.createElement(\"input\");\r\n");
      out.write("        element1.type = \"date\";\r\n");
      out.write("        element1.setAttribute('required', '');\r\n");
      out.write("        element1.setAttribute('value', '');\r\n");
      out.write("        element1.setAttribute('name', 'from'+rowCount);\r\n");
      out.write("        element1.setAttribute('min',start);\r\n");
      out.write("        element1.setAttribute('max',end);\r\n");
      out.write("        cell1.appendChild(element1);\r\n");
      out.write("        \r\n");
      out.write("        var element2 = document.createElement(\"input\");\r\n");
      out.write("        element2.type = \"date\";\r\n");
      out.write("        element2.setAttribute('required', '');\r\n");
      out.write("        element2.setAttribute('name', 'to'+rowCount);\r\n");
      out.write("        element2.setAttribute('min',start);\r\n");
      out.write("        cell2.appendChild(element2);\r\n");
      out.write("        \r\n");
      out.write("        var element3 = document.createElement(\"input\");\r\n");
      out.write("        element3.type = \"text\";\r\n");
      out.write("        element3.setAttribute('required', '');\r\n");
      out.write("        element3.setAttribute('value', '');\r\n");
      out.write("        element3.setAttribute('name', 'nature'+rowCount);\r\n");
      out.write("        cell3.appendChild(element3);\r\n");
      out.write("        \r\n");
      out.write("        var element4 = document.createElement(\"input\");  \r\n");
      out.write("        element4.type = \"button\";\r\n");
      out.write("        element4.name = \"button\"+rowCount;\r\n");
      out.write("        element4.setAttribute('value', 'Delete');\r\n");
      out.write("        element4.onclick = function () { removeRow(\"button\"+rowCount); }\r\n");
      out.write("        cell4.appendChild(element4);\r\n");
      out.write("    }\r\n");
      out.write("    function removeRow(btnName) {  \r\n");
      out.write("        try {\r\n");
      out.write("            var table = document.getElementById('dataTable');  \r\n");
      out.write("            var rowCount = table.rows.length;\r\n");
      out.write("            for(var i = 0; i < rowCount; i++){\r\n");
      out.write("                var row = table.rows[i];\r\n");
      out.write("                var rowObj = row.cells[4].childNodes[0];\r\n");
      out.write("                if (rowObj.name == btnName) {\r\n");
      out.write("                    table.deleteRow(i);\r\n");
      out.write("                    for(var j=i;j<rowCount-1;j++){\r\n");
      out.write("              \t\t\ttable.rows[j].cells[0].innerHTML=j+1;\r\n");
      out.write("              \t\t}\r\n");
      out.write("                    break;\r\n");
      out.write("                }  \r\n");
      out.write("            }  \r\n");
      out.write("        }  \r\n");
      out.write("        catch (e) {  \r\n");
      out.write("            alert(e);\r\n");
      out.write("        }  \r\n");
      out.write("    }  \r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"card\" style=\"margin: auto; width:90%;\">\r\n");
      out.write("\t<fieldset>\r\n");
      out.write("\t\t<legend>Details of leave taken during the month</legend>\r\n");
      out.write("\t\t<div style=\"margin-bottom: 10px;\">\r\n");
      out.write("\t\t<input type=\"hidden\" value=");
      out.print(start );
      out.write(" id=\"start\"/>\r\n");
      out.write("\t\t<input type=\"hidden\" value=");
      out.print(end );
      out.write(" id=\"end\"/>\r\n");
      out.write("            <form action=\"home.jsp\" method=\"post\">\r\n");
      out.write("\t\t\t<table class=\"tab\" style=\"width:100%;\">\r\n");
      out.write("\t\t\t\t<thead>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<th width=\"8%\">Sr. No.</th>\r\n");
      out.write("\t\t\t\t\t\t<th width=\"23%\">From Date</th>\r\n");
      out.write("\t\t\t\t\t\t<th width=\"23%\">To Date</th>\r\n");
      out.write("\t\t\t\t\t\t<th width=\"33%\">Nature of leave</th>\r\n");
      out.write("                        <th></th>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t</thead>\r\n");
      out.write("\t\t\t\t<tbody id=\"dataTable\">\r\n");
      out.write("                    <tr>\r\n");
      out.write("\t\t\t\t\t<td>1</td>\r\n");
      out.write("                    <td><input type=\"date\" required value=\"\" min=");
      out.print(start );
      out.write(" max=");
      out.print(end );
      out.write(" name=\"from1\"></td>\r\n");
      out.write("                    <td><input type=\"date\" required value=\"\" min=");
      out.print(start );
      out.write(" name=\"to1\"></td>\r\n");
      out.write("                    <td><input type=\"text\" required value=\"\" name=\"nature1\"></td>\r\n");
      out.write("                    <td><input type=\"button\" class=\"del\" name=\"button1\" value=\"Delete\" onclick=\"removeRow('button1')\"></td>\r\n");
      out.write("\t\t\t\t    </tr>\r\n");
      out.write("                </tbody>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("            <br>\r\n");
      out.write("            <input type=\"button\" id=\"add\" value=\"Add Row\" style=\"float:right;\" onclick=\"addRow('dataTable')\" />\r\n");
      out.write("            <br>\r\n");
      out.write("            <input type=\"hidden\" value=\"add6\" name=\"add6\"/>\r\n");
      out.write("            <input type=\"submit\" value=\"Save\"/>\r\n");
      out.write("            </form>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</fieldset>\r\n");
      out.write("</div>\r\n");
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
