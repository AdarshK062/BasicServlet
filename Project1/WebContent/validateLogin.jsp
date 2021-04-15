<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="BasicServlet.*" %>
	<%@ page import="java.sql.*" %>
	<%
		String userId=request.getParameter("userId");
		String password=request.getParameter("password");
		DNET DNet=new DNET();
		Connection dbConnection=DNet.getConnection();
		Employee emp = null;
		ResultSet result;
		RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
		PreparedStatement pStatement;
        try {
			pStatement=dbConnection.prepareStatement("SELECT * FROM "+DNet.Employee+" WHERE USERID=? AND PASSWORD=?");
			pStatement.setString(1,userId);
			pStatement.setString(2,password);
			result=pStatement.executeQuery();
			
			if(result.next()) {
				String persno=result.getString("f_cPersno");
				String name=result.getString("f_vc2name");
				String designation=result.getString("f_vc2designation");
				String division=result.getString("f_vc2division");
				emp=new Employee(persno,name,designation,division);
				
				HttpSession s= request.getSession(true);
				s.setAttribute("emp", emp);
				rd=request.getRequestDispatcher("home.jsp");
			}
			else{
				HttpSession s= request.getSession(true);
				s.setAttribute("invalid", 1);
				rd=request.getRequestDispatcher("index.jsp");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dbConnection.close();
		rd.forward(request, response);
	%>
</body>
</html>