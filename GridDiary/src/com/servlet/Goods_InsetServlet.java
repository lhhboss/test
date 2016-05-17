package com.servlet;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connsql.connDB;

public class Goods_InsetServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public Goods_InsetServlet() {
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
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
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

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String goodsname=request.getParameter("goodsname");
    	String goodsprice =request.getParameter("goodsprice");
    	String adress=request.getParameter("adress");
    	String number =request.getParameter("number");
    	
		connDB db = new connDB(); 
		
		goodsname=db.getString(goodsname);
		goodsprice=db.getString(goodsprice);
		adress=db.getString(adress);
		number=db.getString(number);
		
		try {   
		    		
		    	Connection conn = db.getConnection();
		    	Statement stmt = conn.createStatement();
		    	String sql = "INSERT INTO tb_goods values(" + "'" + goodsname + "'"+ "," + "'" + goodsprice + "'"+ "," + "'" + adress + "'"+ "," + "'" + number + "'" + ")";
		    	int i = stmt.executeUpdate(sql);
		    	if (i > 0) {
		       		out.println("<script language=javascript>alert('����ɹ���');window.location.href='goods.jsp'</script>");     			
		    	}
		    	else{
		       		out.println("<script language=javascript>alert('����ʧ�ܣ�');</script>");   			
		    	}
		    } catch (Exception e) {
		           e.printStackTrace();
		    }
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
