package db;

import java.sql.*;

public class Db_func {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String db_url = "jdbc:oracle:thin:@203.247.239.1:1521:myora";
	String db_id = "jsh";
	String db_pw = "jsh2022";
	String driver = "oracle.jdbc.driver.OracleDriver";
	String sql;
	public boolean connect_confirm = false;
	public boolean YN = false;

	
	public void db_connection(){
		try{
			Class.forName(driver);
			conn = DriverManager.getConnection(db_url,db_id,db_pw);
			connect_confirm = true;
			
		}catch(Exception e){
			e.printStackTrace();
			
		}
	}

	public void db_indata(String email){
		sql = "SELECT * FROM user_info WHERE email = \'"+ email+"\'";
		try{
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) YN = true;
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}
	}
	
	public void db_close() throws SQLException {
		try {
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	public void insert_into(String email) {
		sql = "INSERT INTO user_info VALUES(?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,email);
			int r = pstmt.executeUpdate();
			if(r>0) {
				YN = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void schedule_db_insert(String area, String place, String addr, String tel, String email, String day_of) {
		sql = "INSERT INTO user_schedule(area,place,addr,tel,email,day_of) VALUES(?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,area);
			pstmt.setString(2,place);
			pstmt.setString(3,addr);
			pstmt.setString(4,tel);
			pstmt.setString(5, email);
			pstmt.setString(6,day_of);
			int r = pstmt.executeUpdate();
			if(r>0) {
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public ResultSet schedule_search_day(String day, String email) {
		sql = "SELECT * from user_schedule where day_of = '"+day+"' and email = '"+email+"'";
		try {
			pstmt = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				rs.previous();
				return rs;
			}
			return null;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
