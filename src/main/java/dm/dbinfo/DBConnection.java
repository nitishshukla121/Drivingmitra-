package dm.dbinfo;
import java.sql.*;
public class DBConnection 
{
	private static Connection con; //Connection hold the address of data base
		
	public static Connection openConnection() {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");//for name is a factory method for used to create object
			
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/drivingmitra_db","root","root");
		
		}
		//protocol
		//local host is the address of that  machine where dsta base has been insatalled
		//port number is the logical number where database listens
		//database name
		// uderid
		//password
		
		 catch(SQLException|ClassNotFoundException se) 
		{
			 
			 se.printStackTrace();
		 }
		return con;
	}//method close
	
	/*
	 * public static void main(String[] args) { Connection c =
	 * DBConnection.openConnection(); System.out.println(c); }
	 */

}
