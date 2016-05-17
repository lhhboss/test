package com.servlet;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.goodsbean;

public class FindServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public FindServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {	
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String url="jdbc:sqlserver://localhost:1433;databaseName=db_griddiary";
			String username="sa";
			String password="123";
			Connection conn=DriverManager.getConnection(url,username,password);
			Statement stmt = conn.createStatement();		// ��ȡStatement
			String sql = "select * from tb_goods";			// ���ͼ����Ϣ��SQL���	
			ResultSet rs = stmt.executeQuery(sql);			// ִ�в�ѯ	
			List<goodsbean> list =new ArrayList<goodsbean>();		// ʵ����List����	
			while(rs.next()){								// �������ƶ������ж��Ƿ���Ч
				goodsbean goods = new goodsbean();
				goods .setGoodsname(rs.getString("goodsname"));		// ��name���Ը�ֵ
				goods .setGoodsprice(rs.getString("goodsprice"));		// ��price���Ը�ֵ
				goods .setAdress(rs.getString("adress"));	// ��bookCount���Ը�ֵ
				goods .setNumber(rs.getString("number"));		// ��author���Ը�ֵ
				list.add(goods); 							// ��ͼ�������ӵ�������
			}
			request.setAttribute("list", list); 			// ��ͼ�鼯�Ϸ��õ�request��
			rs.close();									// �ر�ResultSet
			stmt.close();									// �ر�Statement
			conn.close();									// �ر�Connection
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// ����ת����bookList.jsp
		request.getRequestDispatcher("goodsList.jsp").forward(request, response);

	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
