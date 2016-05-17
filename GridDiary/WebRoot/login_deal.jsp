<%@ page language="java" import="java.util.*,com.connsql.connDB,java.sql.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login_deal.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	<%
  		String username =new String( request.getParameter("username").getBytes("iso-8859-1"),"utf-8");
  		String password = request.getParameter("pwd");
  		connDB db = new connDB();
  		Connection conn = db.getConnection();
  		Statement stmt = conn.createStatement();
  		ResultSet rs = stmt.executeQuery("select * from tb_user where username='"+ username + "' and pwd='" + password + "'");
  		boolean flat=false;
  		if(rs.next()) {
  		flat = true;
  		}
  		if (flat) {
  		session.setAttribute("username",username);
  		response.sendRedirect("main.jsp");
  		}else{
  			out.println("<script language=javascript>alert('用户名或密码错误,请重新输入！');window.location='login.jsp';</script>");
  			}
  		db.closeConn(conn);
  		stmt.close();
  		rs.close();
  	 %>
  </body>
</html>
