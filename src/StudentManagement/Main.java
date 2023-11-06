package StudentManagement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Types;
import java.sql.ResultSet;
import java.util.Scanner;
import java.sql.CallableStatement;
 


public class Main {

	public static void main(String[] args) {
		Connection conn = null;
		ResultSet rs = null;
		CallableStatement cstmt = null;
		Scanner sc = new Scanner(System.in);
		boolean exitFlag = true;
		int n;
		boolean isValid;
		
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
				System.out.println("|Choose [2] to Add student grade           |");
				System.out.println("|Choose [3] to Calculate student GPA       |");
				System.out.println("|Choose [4] to Calculate yearly tuition    |");
				System.out.println("|Choose [5] to View student report card    |");
				System.out.println("|Choose [6] to View instructor schedule    |");
				System.out.println("|Choose [7] to Fetch student by department |");
				System.out.println("|Choose [8] to Exit                        |");
				System.out.println("+------------------------------------------+");
				System.out.print("Make your input: ");
				
				try {
					int input = sc.nextInt();
					sc.nextLine();
					
					switch (input) {
						case 1: //Add a new student
							isValid = true;
		                    cstmt = conn.prepareCall("{call ADD_STUDENT(?, ?, ?, ?, ?)}");
		                    
		                    while(isValid) {
		                    	try {
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
				                    
				                    isValid =  false;
		                    	}catch(SQLException e) {
		                    		System.out.println("[ERROR]: " + e.getMessage());
		                			isValid = true;
		                    	}
		                    }
		                    break;
		                    
		                case 2: //Add student grade
		                	isValid = true;
		                	cstmt = conn.prepareCall("{call ADD_GRADE(?, ?, ?, ?, ?,?)}");
		                	
		                	while(isValid) {
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
				                    
				                    isValid = false;
		                		}catch (SQLException e) {
		                			System.out.println("[ERROR]: " + e.getMessage());
		                			isValid = true;
		                		}
		                	}
		                    break;  
		                    
		                case 3: //Calculate student GPA 
		                	cstmt = conn.prepareCall("{? = call CALCULATE_GPA (?)}"); 
		                	 
				            cstmt.registerOutParameter(1, Types.FLOAT);  
				            System.out.print("Enter student's ID: ");
				            String ID = sc.nextLine(); 
				            cstmt.setString(2, ID);
				            cstmt.execute();
				            
				            float gpa = (float) (cstmt.getFloat(1) / 2.5);

				            if(gpa < 0) { 
				            	System.out.println("Student ID " + ID + " not found.");
				            }else if (gpa <= 1.6) {
				                System.out.println("The GPA of student " + ID + " is: " + gpa + " (F)");
				            }else if (gpa <= 2.0) {
				                System.out.println("The GPA of student " + ID + " is: " + gpa + " (D)");
				            }else if (gpa <= 2.2) {
				                System.out.println("The GPA of student " + ID + " is: " + gpa + " (D+)");
				            }else if (gpa <= 2.6) {
				                System.out.println("The GPA of student " + ID + " is: " + gpa + " (C)");
				            }else if (gpa <= 2.8) {
				                System.out.println("The GPA of student " + ID + " is: " + gpa + " (C+)");
				            }else if (gpa <= 3.2) {
				                System.out.println("The GPA of student " + ID + " is: " + gpa + " (B)");
				            }else if (gpa <= 3.6) {
				                System.out.println("The GPA of student " + ID + " is: " + gpa + " (B+)");
				            }else{
				                System.out.println("The GPA of student " + ID + " is: " + gpa + " (A)");
				            }            
				                    
				            isValid = true;
			   
		                	System.out.println("");
		                    break;
		                    
		                case 4: //Calculate yearly tuition
			                	cstmt = conn.prepareCall("{? = call YEARLY_TUITION (?, ?)}");		                	
			                	cstmt.registerOutParameter(1, Types.FLOAT);
			                	
			                	System.out.print("Enter student ID: ");
			                	String IDm = sc.nextLine();
			                	cstmt.setString(2, IDm);
			                	System.out.print("Enter year: ");
			                	int yea = sc.nextInt();
			                	cstmt.setInt(3, yea);
			                	cstmt.execute();
			                	System.out.println("(1 credit = 280.000 VND)");
			                	System.out.println("Student " + IDm + "'s yearly tuition (" + yea +") is: " + cstmt.getFloat(1));

		                	System.out.println("");
		                	break;
		                    
		                case 5: //View student report card
		                	isValid = true;
		                	
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
			                    	System.out.println("No. \tCourse ID \t Course name \t\t\t\t Instructor ID \t Semester \t Year \t Grade");
			                    	do {
			                    		String cID = rs.getString("cID");
			                    		String cName = rs.getString("cName");
			                    		String iID = rs.getString("iID");
			                    		int semester = rs.getInt("semester");
			                    		int year = rs.getInt("year");
			                    		float grade = rs.getFloat("grade");
			                    		
			                    		//Set cName's width = 25 spaces from left to right (a fixed amount), including the string itself
			                    		String NewcName = String.format("%-25s", cName);
			                    		
				                    	System.out.println(n + ".\t" + cID + "\t\t" + NewcName + "\t\t    " + iID + "\t     " + semester + "\t\t " + year + "\t  " + grade);
				                    	n++;
			                    	}while(rs.next());
			                    	isValid = false;
			                    	
			                    }else {
			                    	 System.out.println("[ERROR]: Invalid student ID!");
			                    }
		                	}while(isValid);
		                	
		                    System.out.println("");
		                    break;
		                    
		                case 6: //View instructor schedule
		                	isValid = true;
		                    
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
		                    		System.out.println("No. \tCourse ID \tCourse name \t\t\t\tSemester \t Year");
		                    		do {
		                    			String cID = rs.getString("cID");
		                    			String cName = rs.getString("cName");
		                    			int semester = rs.getInt("semester");
		                    			int year = rs.getInt("year");
		                    			
		                    			String NewcName = String.format("%-25s", cName);
			                    		
				                    	System.out.println(n + ".\t" + cID + "\t\t" + NewcName + "\t\t    " + semester + "\t\t " + year); 
		                    			n++;
		                    		}while(rs.next());
		                    		isValid = false;
		                    	}else {
		                    		System.out.println("[ERROR]: Invalid instructor ID!");
		                    	}
		                    }while(isValid);
		                    
		                    System.out.println("");
		                    break;
		                    
		                case 7: //Fetch student by department
		                	isValid = true;
		                	
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
			                    	System.out.println("No. \tStudent ID \tStudent name");
			                    	do {
			                    		String sID = rs.getString("sID");
			                    	    String sName = rs.getString("sName");
				                    	System.out.println(n + ".\t" + sID + "\t\t" + sName);
				                    	n++;
			                    	}while(rs.next());
			                    	isValid = false;
			                    }else {
			                    	 System.out.println("[ERROR]: Invalid department ID!");
			                    }
		                	}while(isValid);
		                	
		                    System.out.println("");
		                    break;
		                    
		                case 8: //Exit
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
		
		
		sc.close();
	}

}