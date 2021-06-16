package BasicServlet;

import java.sql.*;

public class DNET {
	
	// All Table Names
	public String Employee="Employee";
	public String MPR_All="MPR_All";
	public String MPR_Cep="MPR_Cep";
	public String MPR_FabricationVisits="MPR_FabricationVisits";
	public String MPR_Leaves="MPR_Leaves";
	public String MPR_Meetings="MPR_Meetings";
	public String MPR_Papers="MPR_Papers";
	public String MPR_Reports="MPR_Reports";
	public String MPR_TC="MPR_TC";
	public String MPR_TD="MPR_TD";
	public String MPR_WorkProgress="MPR_WorkProgress";
	public String Project="Project";
	public String Passwords="Passwords";
	
	
	// DB URL
	private String URL="jdbc:oracle:thin:@localhost:1521:xe";
	// DB username
	private String username="adarsh";
	// DB password
	private String password="1501";

	// Connects to DB and Return connection object
	public Connection getSurveyThinConnection() {
		Connection dbConnection = null;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			dbConnection=DriverManager.getConnection(URL, username, password);
		} catch(Exception e){ 
			System.out.println(e);
		}
		return dbConnection;
	}
}