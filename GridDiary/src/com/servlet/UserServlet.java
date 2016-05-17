package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.model.User;

public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao=null;
	public UserServlet() {
		super();
		userDao =new UserDao();
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
		doPost(request,response);
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
		String action=request.getParameter("action");
		if("login".equals(action)){
			this.login(request,response);	
		}else if("exit".equals(action)){
			this.exit(request,response);
		}else if("checkUser".equals(action)){
			this.checkUser(request,response);
		}else if("forgetPwd1".equals(action)){
			this.forgetPwd1(request,response);
		}else if("forgetPwd2".equals(action)){
			this.forgetPwd2(request,response);
		}
	}

	private void forgetPwd2(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		String username=request.getParameter("username");
		String question=request.getParameter("question");
		String answer=request.getParameter("answer");
		String pwd = userDao.forgetPwd2(username, question, answer);
		PrintWriter out=response.getWriter();
		if("您输入的密码提示问题答案错误！".equals(pwd)){
			out.println("<script>alert('您输入的密码提示问题答案错误！');history.back();</script>");
		}else{out.println("<script>alert('您的密码是：\\r\\n"+ pwd+ "\\r\\n请牢记！');window.location.href='';</script>");}
		
	}

	private void forgetPwd1(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username=request.getParameter("username");
		String question=userDao.forgetPwd1(username);
		PrintWriter out=response.getWriter();
		if("".equals(question)){
			out.println("<script>alert('您没有设置密码提示问题，不能找回密码！'');history.back();</script>");
		}else if("您输入的用户名不存在！".equals(question)){
			out.println("<script>alert('您输入的用户名不存在！');history.back();</script>");
		}else{
			request.setAttribute("question",question);
			request.setAttribute("username",username);
			request.getRequestDispatcher("forgetPwd_2.jsp").forward(request, response);
		}
		
	}

	private void checkUser(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		String username=request.getParameter("usernaem");
		String sql="select * from tb_user where username='"+username+"'";
		String result=UserDao.checkUser(sql);
		response.setContentType("text/heml");
		PrintWriter out=response.getWriter();
		out.print(result);
		out.flush();
		out.close();
		
	}

	private void exit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		session.invalidate();
		request.getRequestDispatcher("").forward(request, response);
		
	}

	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		User f=new User();
		f.setUsername(request.getParameter("username"));
		f.setPwd(request.getParameter("pwd"));
		int r=userDao.login(f);
		if(r>0){
			HttpSession session=request.getSession();
			session.setAttribute("userName", f.getUsername());
			session.setAttribute("uid", r);
		    request.setAttribute("returnValue","登入成功！");
		    request.getRequestDispatcher("").forward(request,response);
		}else{
			request.setAttribute("returnValue","您输入的用户名或密码错误，请重新输入！");
			request.getRequestDispatcher("").forward(request,response);
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
