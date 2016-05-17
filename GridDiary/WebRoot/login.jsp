<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>欢迎登入</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		function mycheck() {
			if (form1.username.value == "") {//判断用户名是不为空
				alert("请输入用户名！");
				form1.username.focus();
				return;
			}
			if (form1.pwd.value == "") {//判断密码是否为空
				alert("请输入密码！");
				form1.pwd.focus();
				return;
			}
			if (form1.yanzheng.value == "") {//判断验证码是否为空
				alert("请输入验证码!");
				form1.yanzheng.focus();
				return;
			}
			if (form1.yanzheng.value != form1.verifycode2.value) {//判断验证码是否正确
				alert("请输入正确的验证码!!");
				form1.yanzheng.focus();
				return;
			}
			form1.submit();
		}
	</script>
	<style>
	body{
	margin:0 auto auto;
	background-image:url("");
	padding-top:150px;
	padding-left:700px;
	font-weight:bold;
	color:black;
	}
	#box{
	background-image:url("");
	width:60%;
	height:310px;	
	margin:10px;
	padding:0px;
	border:1px solid red;
	}
	#loginTitle{		
	padding:15px;
	background-color:#FCFBF0;
	color:#1B7F5D;
	font-size: 28px;
	font-weight:bold;
	margin:0px;
	}
	</style>

  </head>
  
  <body>
  <center>
  <form action="login_deal.jsp" method="post" name="form1">
  <div id="box">
  <div id="loginTitle">用户登入</div>
  <table cellpadding="17">
  <tr>
  <td><font size=5>用户名：</font></td>
  <td><input type="text" name="username"></td>
  </tr>
  <tr>
  <td><font size=5>密&nbsp;&nbsp;码：</font></td>
  <td><input type="password" name="pwd"><a href="forgetPwd_1.jsp">找回密码</a></td>
  </tr>
  <tr>
  <td><font size=5>验证码:</font></td>
  <td><input name="yanzheng" type="text" onKeyDown="if(event.keyCode==13){form1.Submit.focus();}">
  <%
			int intmethod = (int) ((((Math.random()) * 11)) - 1);
			int intmethod2 = (int) ((((Math.random()) * 11)) - 1);
			int intmethod3 = (int) ((((Math.random()) * 11)) - 1);
			int intmethod4 = (int) ((((Math.random()) * 11)) - 1);
			String intsum = intmethod + "" + intmethod2 + intmethod3 + intmethod4;
	%>
	<input type="hidden" name="verifycode2" value="<%=intsum%>">
	<img src="num/<%=intmethod%>.gif"> <img src="num/<%=intmethod2%>.gif"> 
	<img src="num/<%=intmethod3%>.gif"> <img src="num/<%=intmethod4%>.gif"></td>
  </tr>
  <tr>
  <td>&nbsp;&nbsp;&nbsp;&nbsp;<input name="Submit" type="button" class="submit1" value="登入" onClick="mycheck()" style="font-size:17px;font-weight:bold"></td>
  <td>&nbsp;&nbsp;&nbsp;&nbsp;<input name="Submit2" type="reset"  class="submit1" value="重置" style="font-size:17px;font-weight:bold"></td>
  </tr>
  </table>
  </div>
  </form>
  </center>
  </body>
</html>
