package StudentManagement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.Scanner;
import java.sql.PreparedStatement;
import java.sql.CallableStatement;



public class Main {

	public static void main(String[] args) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			String connStr = "jdbc:mysql://localhost/StudentManagement?user=project&password=123";
			conn = DriverManager.getConnection(connStr);
			System.out.println("Connected!");
			
			stmt = conn.createStatement();
			String sql = "Select * from Student";
			rs = stmt.executeQuery(sql);
			System.out.println("Query executed");
			
			System.out.println("-------List of Student-------");
			while(rs.next()) {
				System.out.println("Student's ID: " + rs.getString("sID"));
				System.out.println("Student's name: " + rs.getString("sName"));
				System.out.println("Student's sex: " + rs.getString("sex"));
				System.out.println("Student's department ID: " + rs.getString("dID"));
				System.out.println("Student's address: " + rs.getString("address"));
				System.out.println("------------------------------");
				System.out.println("");
			}
			
			
			
			
		}catch(Exception e) {
			System.out.println("Cannot connect:" + e.getMessage());
		}
		
	}

}