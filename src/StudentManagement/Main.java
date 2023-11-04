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
		//Statement stmt = null;
		ResultSet rs = null;
		CallableStatement cstmt = null;
		Scanner sc = new Scanner(System.in);
		boolean exitFlag = true;
		int n;
		boolean validID;
		//System.out.println("");
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			String connStr = "jdbc:mysql://localhost/StudentManagement?user=project&password=123";
			conn = DriverManager.getConnection(connStr);
			System.out.println("Connected!");
			
			while(exitFlag) {
				System.out.println("+------------------------------------------+");
				System.out.println("|      STUDENT MANAGEMENT SYSTEM           |");
				System.out.println("+------------------------------------------+");
				System.out.println("|Choose [1] to Add a new student           |");
				System.out.println("|Choose [2] to Calculate student GPA       |");
				System.out.println("|Choose [3] to Fetch students by department|");
				System.out.println("|Choose [4] to View instructor schedule    |");
				System.out.println("|Choose [5] to Add student grade           |");
				System.out.println("|Choose [6] to View student report card    |");
				System.out.println("|Choose [7] to Calculate yearly tuition    |");
				System.out.println("|Choose [8] to exit                        |");
				System.out.println("+------------------------------------------+");
				System.out.print("Make your input: ");
				
				try {
					int input = sc.nextInt();
					sc.nextLine();
							
					switch (input) {
						case 1:
		                    cstmt = conn.prepareCall("{call ADD_STUDENT(?, ?, ?, ?, ?)}");
		                    
		                    System.out.print("Enter student ID: ");
		                    String ID = sc.nextLine();
		                    cstmt.setString(1, ID);
		                    
		                    System.out.print("Enter student name: ");
		                    String name = sc.nextLine();
		                    cstmt.setString(2, name);
		                    
		                    System.out.print("Enter student gender: ");
		                    String gender = sc.nextLine();
		                    cstmt.setString(3, gender);
		                    
		                    System.out.print("Enter student department ID: ");
		                    String deptID = sc.nextLine();
		                    cstmt.setString(4, deptID);
		                    
		                    System.out.print("Enter student address: ");
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
		                    
		                    if(gpa < 0) {
		                    	System.out.println("Student ID " + ID + " not found.");
		                    }else if (gpa <= 1.6) {
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
		                    }else{
		                    	System.out.println("GPA for student " + ID + " is: " + gpa + " (A)");
		                    }            
		                    
		                    System.out.println("");
		                    break;
		                    
		                case 3:
		                	validID = false;
		                	
		                	do {
			                	cstmt = conn.prepareCall("{call STUDENT_BY_DEPARTMENT(?)}");
			                	System.out.print("Enter department ID: ");
			                    String dID = sc.nextLine();
			                    cstmt.setString(1, dID);
			                	n = 1;
			                    rs = cstmt.executeQuery();
			                    
			                    if(rs.next()) {
			                    	String dName = rs.getString("dName");
			                    	System.out.println("\t\tList of students from " + dName + " department: ");
			                    	do {
			                    		String sID = rs.getString("sID");
			                    	    String sName = rs.getString("sName");
				                    	System.out.println("No." + n + ". Student ID: " + sID + "\t Student name: " + sName);
				                    	n++;
			                    	}while(rs.next());
			                    	validID = true;
			                    }else {
			                    	 System.out.println("[ERROR]: Invalid department ID!");
			                    }
		                	}while(!validID);
		                	
		                    System.out.println("");
		                    break;
		                case 4:
		                    validID = false;
		                    
		                    do {
		                    	cstmt = conn.prepareCall("{call INSTRUCTOR_SCHEDULE(?)}");
		                    	System.out.print("Enter instructor ID: ");
		                    	String iID = sc.nextLine();
		                    	cstmt.setString(1, iID);
		                    	n = 1;
		                    	rs = cstmt.executeQuery();
		                    	
		                    	if(rs.next()) {
		                    		String iName = rs.getString("iName");
		                    		System.out.println("\t\tInstructor " + iName + " (ID: " + iID + ") sssignments: ");
		                    		do {
		                    			String cID = rs.getString("cID");
		                    			String cName = rs.getString("cName");
		                    			int semester = rs.getInt("semester");
		                    			int year = rs.getInt("year");
		                    			System.out.println("No." + n + ". Course ID: " + cID + "\t Course name: " + cName + "\t Semester: " + semester + "\t Year: " + year);
		                    			n++;
		                    		}while(rs.next());
		                    		validID = true;
		                    	}else {
		                    		System.out.println("[ERROR]: Invalid instructor ID!");
		                    	}
		                    }while(!validID);
		                    
		                    System.out.println("");
		                    break;
		                case 5:
		                	validID = false;
		                	cstmt = conn.prepareCall("{call ADD_GRADE(?, ?, ?, ?, ?,?)}");
		                	while(!validID) {
		                		try {
				                    System.out.print("Enter student ID: ");
				                    String IDs = sc.nextLine();
				                    cstmt.setString(1, IDs);
				                    
				                    System.out.print("Enter course ID: ");
				                    String IDc = sc.nextLine();
				                    cstmt.setString(2, IDc);
				                    
				                    System.out.print("Enter instructor ID: ");
				                    String IDi = sc.nextLine();
				                    cstmt.setString(3, IDi);
				                    
				                    System.out.print("Enter semester: ");
				                    String sems = sc.nextLine();
				                    cstmt.setString(4, sems);
				                    
				                    System.out.print("Enter year: ");
				                    String yer = sc.nextLine();
				                    cstmt.setString(5, yer);
				        
				                    System.out.print("Enter grade: ");
				                    String gra = sc.nextLine();
				                    cstmt.setString(6, gra);
				                    
				                    cstmt.executeQuery();
				                    System.out.println("-> Grade added successfully!");
				                    System.out.println("");
				                    
				                    validID = true;
		                		}catch (SQLException e) {
		                			System.out.println("[ERROR]: " + e.getMessage());
		                			validID = false;
		                		}
		                	}
		                    break;
		                    
		                case 6:
		                	validID = false;
		                	
		                	do {
			                	cstmt = conn.prepareCall("{call REPORT_CARD(?)}");
			                	System.out.print("Enter student ID: ");
			                    String IDa = sc.nextLine();
			                    cstmt.setString(1, IDa);
			                	n = 1;
			                    rs = cstmt.executeQuery();
			                    
			                    if(rs.next()) {
			                    	String sName = rs.getString("sName");
			                    	System.out.println("\t\tReport card of student " + sName + " (ID: " + IDa + "): ");
			                    	do {
			                    		String cID = rs.getString("cID");
			                    		String cName = rs.getString("cName");
			                    		String iID = rs.getString("iID");
			                    		int semester = rs.getInt("semester");
			                    		int year = rs.getInt("year");
			                    		float grade = rs.getFloat("grade");
				                    	System.out.println("No." + n + ". Course ID: " + cID + "\t Course name: " + cName + "\t Instructor ID: " + iID + "\t Semester: " + semester + "\t Year: " + year + "\t Grade: " + grade);
				                    	n++;
			                    	}while(rs.next());
			                    	validID = true;
			                    }else {
			                    	 System.out.println("[ERROR]: Invalid student ID!");
			                    }
		                	}while(!validID);
		                	
		                    System.out.println("");
		                    break;
		                    
		                case 7:
		                	cstmt = conn.prepareCall("{? = call YEARLY_TUITION (?, ?)}");
		                	
		                	cstmt.registerOutParameter(1, Types.FLOAT);
		                	
		                	System.out.println("Enter student ID: ");
		                	ID = sc.nextLine();
		                	cstmt.setString(2, ID);
		                	System.out.println("Enter year: ");
		                	int year = sc.nextInt();
		                	cstmt.setInt(3, year);
		                	cstmt.execute();
		                	
		                	System.out.println("Student " + ID + "'s yearly tuition (" + year +") is: " + cstmt.getFloat(1));
		                	
		                	System.out.println("");
		                	break;
		                    
		                case 8:
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