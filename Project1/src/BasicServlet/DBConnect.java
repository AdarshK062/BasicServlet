package BasicServlet;

import java.sql.*;

public class DBConnect {
	Connection dbConnection;
	Statement statement;
	String Employee="Employee";
	String MPR_WorkProgress="MPR_WorkProgress";
	String MPR_FabricationVisits="MPR_FabricationVisits";
	String Project="Project";
	public DBConnect(){
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			dbConnection=DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe","adarsh","1501");
			statement=dbConnection.createStatement();
			} catch(Exception e){ 
				System.out.println(e);
			} 
	}
	
	public void AddWorkProgress(WorkProgress wpr){
		if(wpr==null) {
			return;
		}
		String query1= "INSERT INTO " + MPR_WorkProgress + " VALUES('" + 
				wpr.persno + "'," + 
				"TO_DATE('" + wpr.wpDate + "'," + "'yyyy/mm/dd')" + ",'" +
				wpr.projectId + "','" + 
				wpr.status + "'," + 
				"TO_DATE('" + wpr.PDC + "'," + "'yyyy/mm/dd'))";
		String query2= "INSERT INTO " + Project + " VALUES('" + 
				wpr.projectId + "','" + 
				wpr.projectName + "','" + 
				wpr.projectDescription + "')";
		System.out.println(query1);
		try {
			statement.executeUpdate(query1);
			statement.executeUpdate(query2);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void AddFabrication(Fabrication fb){
		if(fb==null) {
			return;
		}
		String query= "INSERT INTO " + MPR_FabricationVisits + " VALUES('" + 
				fb.persno + "'," + 
				"TO_DATE('" + fb.visitDate + "'," + "'yyyy/mm/dd')" + ",'" +
				fb.industry + "','" + 
				fb.purpose + "')";
		System.out.println(query);
		try {
			statement.executeUpdate(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void UpdateWorkProgress(WorkProgress wpr){
		if(wpr==null) {
			return;
		}
		String query1= "UPDATE " + MPR_WorkProgress + " SET STATUS='" + wpr.status + 
				"',PDC=" + "TO_DATE('" + wpr.PDC + "'," + "'yyyy/mm/dd') " + 
				"WHERE F_CPERSNO='" + wpr.persno + "' AND " + 
				"PROJECT_ID='" + wpr.projectId + "' AND " + 
				"TO_CHAR(WP_Date, 'dd/mm/yyyy') like '" + wpr.wpDate + "'";
		String query2= "UPDATE " + Project + " SET PROJECT_NAME='" + wpr.projectName + "'," + 
				"DESCRIPTION='" + wpr.projectDescription + "' " +
				"WHERE PROJECT_ID='" + wpr.projectId + "'";
		System.out.println(query1);
		try {
			statement.executeUpdate(query1);
			statement.executeUpdate(query2);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void DeleteWorkProgress(String projectId, String wpd, String persno){
		String query1="DELETE FROM "+MPR_WorkProgress + 
				" WHERE F_CPERSNO='" + persno + "' AND " + 
				"PROJECT_ID='" + projectId + "' AND " + 
				"TO_CHAR(WP_Date, 'dd/mm/yyyy') like '" + wpd + "'";
		String query2= "DELETE FROM " + Project + 
				" WHERE PROJECT_ID='" + projectId + "'";
		System.out.println(query1);
		try {
			statement.executeUpdate(query1);
			statement.executeUpdate(query2);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void UpdateFabrication(Fabrication fb){
		if(fb==null) {
			return;
		}
		String query1= "UPDATE " + MPR_FabricationVisits + " SET INDUSTRY='" + fb.industry + 
				"',PURPOSE='" + fb.purpose + 
				"' WHERE F_CPERSNO='" + fb.persno + "' AND " + 
				"TO_CHAR(VISIT_DATE, 'dd/mm/yyyy') like '" + fb.visitDate + "'";
		System.out.println(query1);
		try {
			statement.executeUpdate(query1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void DeleteFabrication(String visitdate, String persno){
		String query1="DELETE FROM " + MPR_FabricationVisits + 
				" WHERE F_CPERSNO='" + persno + "' AND " + 
				"TO_CHAR(VISIT_DATE, 'dd/mm/yyyy') like '" + visitdate + "'";
		System.out.println(query1);
		try {
			statement.executeUpdate(query1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	public ResultSet DisplayData(String month,String persno) {
		ResultSet result=null;
		System.out.println(month);
		String[] arr = month.split("-");
		String year = arr[0];
		String mm = arr[1];
		String query="SELECT w.project_Id,p.project_Name,p.Description,TO_CHAR(w.WP_Date, 'dd/mm/yyyy') AS wpd,w.status,w.PDC FROM project p,mpr_workprogress w where p.project_Id=w.project_Id and TO_CHAR(w.WP_Date, 'dd/mm/yyyy') like '___"+mm+"_"+year+"' and w.f_cpersno='"+persno+"'";
//		System.out.println(query);
		try {
			result=statement.executeQuery(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	public ResultSet DisplayData1(String month,String persno) {
		ResultSet result=null;
		System.out.println(month);
		String[] arr = month.split("-");
		String year = arr[0];
		String mm = arr[1];
		String query="SELECT industry, TO_CHAR(VISIT_DATE, 'dd/mm/yyyy') AS visitdate, purpose FROM mpr_FabricationVisits where TO_CHAR(VISIT_DATE, 'dd/mm/yyyy') like '___"+mm+"_"+year+"' and f_cpersno='"+persno+"'";
//		System.out.println(query);
		try {
			result=statement.executeQuery(query);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public Employee LoginStatus(String userId,String password) {
		Employee emp = null;
		ResultSet result;
		String query="SELECT * FROM " + Employee + 
				" WHERE USERID='" + userId + "' AND PASSWORD='" + password + "'";
		System.out.println(query);
        try {
			result=statement.executeQuery(query);
			if(result.next()) {
				String persno=result.getString("f_cPersno");
				String name=result.getString("f_vc2name");
				String designation=result.getString("f_vc2designation");
				String division=result.getString("f_vc2division");
				emp=new Employee(persno,name,designation,division);
				return emp;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return emp;
	}
	public void End(){
		try {
			dbConnection.close();
		} catch (SQLException e){
			e.printStackTrace();
		}
	}
}
