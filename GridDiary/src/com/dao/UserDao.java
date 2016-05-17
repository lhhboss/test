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
				result = "��������û��������ڣ�";
			}
		} catch (SQLException e) {
			e.printStackTrace(); // ����쳣��Ϣ
			result = "��������û��������ڣ�"; // ��ʾ������û���������
		} finally {
			conn.close(); // �ر����ݿ�����
		}
		return result;	
			}
	public String forgetPwd2(String username, String question, String answer) {
		String sql = "SELECT pwd FROM tb_user WHERE username='" + username
				+ "' AND question='" + question + "' AND answer='" + answer
				+ "'";
		ResultSet rs = conn.executeQuery(sql);// ִ��SQL���
		String result = "";
		try {
			if (rs.next()) {
				result = rs.getString(1);// ��ȡ��һ�е�����
			} else {
				result = "�������������ʾ����𰸴���"; // ��ʾ�����������ʾ����𰸴���
			}
		} catch (SQLException e) {
			e.printStackTrace();// ����쳣��Ϣ
		} finally {
			conn.close(); // �ر����ݿ�����
		}
		return result;
	}
	public static String checkUser(String sql) {
		// TODO Auto-generated method stub
		ResultSet rs=conn.executeQuery(sql);
		String result="";
		try{
			if(rs.next()){
				result="�ܱ�Ǹ��[" + rs.getString(2) + "]�Ѿ���ע�ᣡ";
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
			result="�û�ע��ɹ���";
		}else{
			result="�û�ע��ʧ�ܣ�";
		}
		conn.close();
		return result;
		
	}

}
