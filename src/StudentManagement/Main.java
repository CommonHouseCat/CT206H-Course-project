package StudentManagement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.sql.ResultSet;
import java.util.Scanner;
import java.sql.PreparedStatement;
import java.sql.CallableStatement;



public class Main {

	public static void main(String[] args) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		CallableStatement cstmt = null;
		Scanner sc = new Scanner(System.in);
		boolean exitFlag = true;
		//System.out.println("||");
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			String connStr = "jdbc:mysql://localhost/StudentManagement?user=project&password=123";
			conn = DriverManager.getConnection(connStr);
			System.out.println("Connected!");
			
			while(exitFlag) {
				System.out.println("+-------------------------------------+");
				System.out.println("|      STUDENT MANAGEMENT SYSTEM      |");
				System.out.println("+-------------------------------------+");
				System.out.println("|Choose [1] to Add a new student      |");
				System.out.println("|Choose [2] to Calculate student GPA  |");
				System.out.println("|Choose [3] to do X                   |");
				System.out.println("|Choose [4] to do X                   |");
				System.out.println("|Choose [5] to do X                   |");
				System.out.println("|Choose [6] to do X                   |");
				System.out.println("|Choose [7] to exit                   |");
				System.out.println("+-------------------------------------+");
				System.out.print("Make your input: ");
				
				try {
					int input = sc.nextInt();
					sc.nextLine();
							
					switch (input) {
						case 1:
		                    cstmt = conn.prepareCall("{call ADD_STUDENT(?, ?, ?, ?, ?)}");
		                    System.out.print("Enter student's ID: ");
		                    String ID = sc.nextLine();
		                    cstmt.setString(1, ID);
		                    System.out.print("Enter student's name: ");
		                    String name = sc.nextLine();
		                    cstmt.setString(2, name);
		                    System.out.print("Enter student's gender: ");
		                    String gender = sc.nextLine();
		                    cstmt.setString(3, gender);
		                    System.out.print("Enter student's department ID: ");
		                    String deptID = sc.nextLine();
		                    cstmt.setString(4, deptID);
		                    System.out.print("Enter student's address: ");
		                    String addr = sc.nextLine();
		                    cstmt.setString(5, addr);
		                    
		                    cstmt.executeQuery();
		                    System.out.println("-> New student added successfully!");
		                    System.out.println("");
		                    break;
		                    
		                case 2:
		                    cstmt = conn.prepareCall("{? = call CALCULATE_GPA (?)}"); 
		                    
		                    cstmt.registerOutParameter(1, Types.FLOAT);
		                  
		                    System.out.print("Enter student's ID: ");
		                    ID = sc.nextLine();
		                    cstmt.setString(2, ID);
		                    cstmt.execute();
		                    
		                    float gpa = (float) (cstmt.getFloat(1) / 2.5);
		                    
		                    if (gpa <= 1.6) {
		                        System.out.println("GPA for student " + ID + " is: " + gpa + " (F)");
		                    }else if (gpa <= 2.0) {
		                    	System.out.println("GPA for student " + ID + " is: " + gpa + " (D)");
		                    }else if (gpa <= 2.2) {
		                    	System.out.println("GPA for student " + ID + " is: " + gpa + " (D+)");
		                    }else if (gpa <= 2.6) {
		                    	System.out.println("GPA for student " + ID + " is: " + gpa + " (C)");
		                    }else if (gpa <= 2.8) {
		                    	System.out.println("GPA for student " + ID + " is: " + gpa + " (C+)");
		                    }else if (gpa <= 3.2) {
		                    	System.out.println("GPA for student " + ID + " is: " + gpa + " (B)");
		                    }else if (gpa <= 3.6) {
		                    	System.out.println("GPA for student " + ID + " is: " + gpa + " (B+)");
		                    }else if (gpa <= 4.0) {
		                    	System.out.println("GPA for student " + ID + " is: " + gpa + " (A)");
		                    }else {
		                    	System.out.println("Student ID " + ID + " not found.");
		                    }            
		                    
		                    System.out.println("");
		                    break;
		                    
		                case 3:
		                    System.out.println("This is function 3!");
		                    System.out.println("");
		                    break;
		                case 4:
		                    System.out.println("This is function 4!");
		                    System.out.println("");
		                    break;
		                case 5:
		                    System.out.println("This is function 5!");
		                    System.out.println("");
		                    break;
		                case 6:
		                    System.out.println("This is function 6!");
		                    System.out.println("");
		                    break;
		                case 7:
		                    exitFlag = false; 
		                    System.out.println("Exit successfully!");
		                    System.out.println("");
		                    break;
		                default:
		                    System.out.println("[ERROR]: Please enter a valid number! ");
		                    System.out.println("");
		                    break;
					}
				}catch (java.util.InputMismatchException e){
					System.out.println("[ERROR]: Please enter a valid number!");
					System.out.println("");
					sc.nextLine();				
				}
				
			}
			
		}catch(Exception e) {
			System.out.println("Cannot connect:" + e.getMessage());
		}
		
	}

}