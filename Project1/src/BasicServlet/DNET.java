package BasicServlet;

import java.sql.*;

public class DNET {
	
	// All Table Names
	public String Employee="Employee";
	public String MPR_WorkProgress="MPR_WorkProgress";
	public String MPR_FabricationVisits="MPR_FabricationVisits";
	public String Project="Project";
	
	// DB URL
	private String URL="jdbc:oracle:thin:@localhost:1521:xe";
	// DB username
	private String username="adarsh";
	// DB password
	private String password="1501";

	// Connects to DB and Return connection object
	public Connection getConnection() {
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