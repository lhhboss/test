<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.connsql.*" %>
<%@ page import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'register_deal.jsp' starting page</title>
    
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
  String username=request.getParameter("username");
  String pwd=request.getParameter("pwd");
  String pwd1=request.getParameter("pwd1");
  String email=request.getParameter("email");
  String question=request.getParameter("question");
  String answer=request.getParameter("answer");
  
  connDB db=new connDB();
  
  username=db.getString(username);
  pwd=db.getString(pwd);
  pwd1=db.getString(pwd1);
  email=db.getString(email);
  question=db.getString(question);
  answer=db.getString(answer);
  ResultSet rs=null;
  	try { 
    		Connection conn = db.getConnection(); 
    		Statement stmt = conn.createStatement();
    		String sql="select username from tb_user where username='"+username+"'";
    		rs=stmt.executeQuery(sql);
    		boolean flag=false;
    	    if(rs.next()){
    		flag=true;
    		}
    		if(flag){
  			out.println("<script language=javascript>alert('用户名已存在！');window.location='register.jsp'</script>");
  			}else{
  			if(pwd.equals(pwd1)){
  			String sql2 = "INSERT INTO tb_user(username,pwd,email,question,answer) values(" + "'" + username + "'"+ "," + "'" + pwd1 + "'" + "," + "'" + email + "'" + "," + "'" + question + "'" + "," + "'" + answer + "'" + ")";
  			int i = stmt.executeUpdate(sql2); 
    		if (i > 0) { 
    			out.println("<script language=javascript>alert('注册成功！');window.location.href='main.jsp'</script>"); 
    		}else{ 
			out.println("<script language=javascript>alert('前后密码不一致,请重新输入！');window.location='register.jsp'</script>"); 
		    }     		
    		}else{ 
			out.println("<script language=javascript>alert('注册失败！');window.location='register.jsp'</script>");    		
           }
           }
           }catch (Exception e) { 
            e.printStackTrace(); 
    	}
   %>
  
  </body>
</html>
