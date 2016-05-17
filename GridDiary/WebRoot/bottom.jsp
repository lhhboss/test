<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'bottom.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
	#bottom{
	background-image:url(images/bg_bottom.jpg);
	width:100%;
	height:60px;
	cleat:both;
	text-align:center;
	padding-top:10px;
	}
	#bottom ul{
	color:#ffffff;
	list-style:none;
	line-height:20px;
	}
	</style>

  </head>
  
  <body>
  <div id="bottom">
  <ul>
  <li>技术服务热线：400-675-1066 传真：0431-1536552368 企业邮箱：mingrisoft@mingrisoft.com</li>
  <li>copyright &copy;www.mrbccd.com ALL Rights Reserved!</li>
  </ul>
  </div>
  </body>
</html>
