package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCTemplate {

	public static Connection getConnection(){
		
		// 1. class.forName -> 드라이버 뭐쓰겠다
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("01. Driver 연결");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("01. Driver 연결 실패");
		}
		
		// 2. 계정 연결
		
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String id="kh";
		String pw="kh";
		
		Connection con=null;
		
		try {
			con=DriverManager.getConnection(url,id,pw);
			System.out.println("02. 계정 연결");
			con.setAutoCommit(false);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("02. 계정 연결 실패");
		}
		
		// 3.  
		
		
		
		return con;
	}
	
	
	public static boolean isConnection(Connection con) {
		
		boolean valid=true;
		
		try {
			if(con==null || con.isClosed()) {
				valid=false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			valid=true;
		}
		
		return valid;
	}
	
	public static void close(Connection con) {
		if(isConnection(con)) {
			try {
				con.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public static void close(Statement stmt) {
		if(stmt!=null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	public static void close(ResultSet rs) {
		if(rs!=null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	public static void commit(Connection con) {
		if(isConnection(con)) {
			try {
				con.commit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	public static void rollback(Connection con) {
		if(isConnection(con)) {
			try {
				con.commit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
}









