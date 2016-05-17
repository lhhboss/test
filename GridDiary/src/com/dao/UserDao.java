package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.connsql.connDB;
import com.model.User;

public class UserDao {
	private static connDB conn=null;
	
	public UserDao(){
		conn =new connDB();
	}
	public int login(User user){
		@SuppressWarnings("unused")
		int flag=0;
		String sql="select * from tb_user where userName='"+user.getUsername()+"'";
		ResultSet rs=conn.executeQuery(sql);
		try{
			if(rs.next()){
				String pwd=user.getPwd();
				int uid=rs.getInt(1);
				if(pwd.equals(rs.getString(3))){
					flag=uid;
					rs.last();
					int rowSum=rs.getRow();
					rs.first();
					if(rowSum!=1){
						flag=0;
					}
				}else{
					flag=0;
				}
			}else{
				flag=0;
			}
		}catch(SQLException ex){
			ex.printStackTrace();
			flag=0;
		}finally{
			conn.close();
		}
		int result = 0;
		return result;
	}
	public String forgetPwd1(String username) {
		String sql = "SELECT question FROM tb_user WHERE username='" + username
				+ "'";
		ResultSet rs = conn.executeQuery(sql);
		String result = "";
		try {
			if (rs.next()) {
				result = rs.getString(1);
			} else {
				result = "您输入的用户名不存在！";
			}
		} catch (SQLException e) {
			e.printStackTrace(); // 输出异常信息
			result = "您输入的用户名不存在！"; // 表示输入的用户名不存在
		} finally {
			conn.close(); // 关闭数据库连接
		}
		return result;	
			}
	public String forgetPwd2(String username, String question, String answer) {
		String sql = "SELECT pwd FROM tb_user WHERE username='" + username
				+ "' AND question='" + question + "' AND answer='" + answer
				+ "'";
		ResultSet rs = conn.executeQuery(sql);// 执行SQL语句
		String result = "";
		try {
			if (rs.next()) {
				result = rs.getString(1);// 获取第一列的数据
			} else {
				result = "您输入的密码提示问题答案错误！"; // 表示输入的密码提示问题答案错误
			}
		} catch (SQLException e) {
			e.printStackTrace();// 输出异常信息
		} finally {
			conn.close(); // 关闭数据库连接
		}
		return result;
	}
	public static String checkUser(String sql) {
		// TODO Auto-generated method stub
		ResultSet rs=conn.executeQuery(sql);
		String result="";
		try{
			if(rs.next()){
				result="很抱歉，[" + rs.getString(2) + "]已经被注册！";
			}else{
				result="1";
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			conn.close();
		}
		return result;
	}
	public String save(String sql){
		int rtn = conn.executeUpdate(sql); 
		String result="";
		if(rtn>0){
			result="用户注册成功！";
		}else{
			result="用户注册失败！";
		}
		conn.close();
		return result;
		
	}

}
