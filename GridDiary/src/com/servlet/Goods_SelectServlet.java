package com.servlet;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
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
import com.connsql.connDB;

public class Goods_SelectServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public Goods_SelectServlet() {
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

		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		try{	
		  	connDB db = new connDB();
			String hno1=request.getParameter("goodsname");
			hno1=db.getString(hno1);
		  	Connection conn = db.getConnection();
		  	Statement stmt = conn.createStatement();
			String sql="select * from tb_goods where goodsname='"+hno1+"'";			   
		  	ResultSet rs = stmt.executeQuery(sql);
		  	List<goodsbean> list=new ArrayList<goodsbean>();
		  	while(rs.next()){
		  		goodsbean goods=new goodsbean();
		  		goods.setGoodsname(rs.getString("goodsname"));
		  		goods.setGoodsprice(rs.getString("goodsprice"));
		  		goods.setAdress(rs.getString("adress"));
		  		goods.setNumber(rs.getString("number"));
		  		list.add(goods);
		  	}
		  	request.setAttribute("list", list);
		  	db.closeConn(conn);
		  	stmt.close();
		  	rs.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		request.getRequestDispatcher("FindServlet").forward(request, response);
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
