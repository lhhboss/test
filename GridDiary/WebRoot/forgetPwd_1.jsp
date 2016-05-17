<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>找回密码第一步</title>
    
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
	if(form.username.value==""){
	alert("请输入用户名！");form.username.focus();return false;
	}
	}
	</script>
	<style>
	#forgetPwd1{
	float:left;
	list-style:none;
	padding:50px opx opx 200px;
	}
	#forgetPwd1 li{
	float:left;
	}
	</style>

  </head>
  
  <body>
  <div id="forgetPwd" style="height:356px;">
  <form name="form_forgetPwd" method="post" action="servlet/UserServlet?action=forgetPwd1" onsubmit="">
  <ul id="forgetPwd1">
  <li style="padding-top:5px;">请输入用户名：</li>
  <li><input type="text" name="username"></li>
  <li style="padding-left:10px;"><input name="Submit" type="submit" value="下一步"></li>
  </ul>
  </form>
  </div>
  
  </body>
</html>
