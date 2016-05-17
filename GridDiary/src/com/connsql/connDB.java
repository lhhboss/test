package com.connsql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class connDB {
	private static final String DRIVER="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	static {
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	private static final String USER = "sa";
	private static final String PASS = "123";
	private static final String URL = "jdbc:sqlserver://localhost:1433;databaseName=db_griddiary";
	
	public Connection getConnection() throws SQLException{
		return DriverManager.getConnection(URL,USER,PASS);
	}
	
	public void closeConn(Connection conn){
			try {
				if(conn!=null)
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}		
	}
	public String getString(String str) {
		if (str == null) {
			str = "";
		} else {
			try {
				byte[] b = str.getBytes("ISO-8859-1");
				str = new String(b,"UTF-8");
			} catch (Exception e) {
			    str="";
				e.printStackTrace();
			}
		}
		return str;
	}

	@SuppressWarnings("unused")
	public ResultSet executeQuery(String sql) {
		// TODO Auto-generated method stub
		try{
			Connection conn = getConnection();
			Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			ResultSet rs = stmt.executeQuery(sql);
		}catch(SQLException ex){
			System.err.println(ex.getMessage());
		}
		ResultSet rs = null;
		return rs;
	}

	@SuppressWarnings("unused")
	public void close() {
		// TODO Auto-generated method stub
		try{
			Object rs = null;
			if(rs!=null){
				((Connection) rs).close();	
			}
			Object stmt = null;
			if(stmt!=null){
				((Connection) stmt).close();
			}
			Object conn = null;
			if(conn!=null){
				((Connection) conn).close();
			}
		}catch(Exception e){
			e.printStackTrace(System.err);
		}
		
	}

	public int executeUpdate(String sql) {
		// TODO Auto-generated method stub
		int result=0;
		try{
			Connection conn = getConnection();
			Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			result=stmt.executeUpdate(sql);
		}catch(SQLException ex){
			result=0;
		}
		return result;
	}
	
}
