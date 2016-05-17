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
			Statement stmt = conn.createStatement();		// 获取Statement
			String sql = "select * from tb_goods";			// 添加图书信息的SQL语句	
			ResultSet rs = stmt.executeQuery(sql);			// 执行查询	
			List<goodsbean> list =new ArrayList<goodsbean>();		// 实例化List对象	
			while(rs.next()){								// 光标向后移动，并判断是否有效
				goodsbean goods = new goodsbean();
				goods .setGoodsname(rs.getString("goodsname"));		// 对name属性赋值
				goods .setGoodsprice(rs.getString("goodsprice"));		// 对price属性赋值
				goods .setAdress(rs.getString("adress"));	// 对bookCount属性赋值
				goods .setNumber(rs.getString("number"));		// 对author属性赋值
				list.add(goods); 							// 将图书对象添加到集合中
			}
			request.setAttribute("list", list); 			// 将图书集合放置到request中
			rs.close();									// 关闭ResultSet
			stmt.close();									// 关闭Statement
			conn.close();									// 关闭Connection
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// 请求转发到bookList.jsp
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
