<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>找回密码第二步</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
	function checkForm(form){
	if(form.answer.value==""){
	alert("请输入密码提示问题答案！");form.answer.focus();return false;
	}
	}
	</script>
	<style>
	#forgetPwd2{
	float:left;
	list-style:none;
	padding:50px 0px 0px 200px;
	}
	#forgetPwd2 li{
	padding:10px;
	}
	</style>

  </head>
  
  <body>
  <div id="forgetPwd" style="height:356px;">
  <form name="form_forgetPwd" method="post" action="UserServlet?action=forgetPwd2" onsubmit="">
  <ul id="forgetPwd2"><li style="padding-top:5px;">密码提示问题： <input type="hidden" name="username" value="${requestScope.username}">
  <input type="text" name="question" value="${requestScope.question}" readonly="readonly"></li>
  <li>提示问题答案：
  <input type="text" name="answer" value=""></li>
  <li style="padding-left:100px;">
  <input name="Submit" type="submit" value="下一步">
  </li>
  </ul>
  </form></div>
  </body>
</html>
