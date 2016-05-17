<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'register.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style>
	#title{			/*设置登录窗口的标题样式*/
	padding:1px;
	background-color:#FCFBF0;
	color:#1B7F5D;
	font-size: 30px;
	font-weight:bold;
	margin:0px;
	}
    #login{
    margin:0 auto auto;/*居中显示*/
    background-image:url("images/2457331_041915083318_2.jpg");/*设置背景图片*/
     padding-top:35px;/*设置顶内边距*/   
    font-weight:bold;/*设置文字加粗显示*/
    color:black;/*设置文字颜色*/
    }
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	    </style>
      	<script type="text/javascript">
  		function check(obj){
  			if(obj.username.value==""){
  				alert("用户名称不能为空！");
  				return false;
  			}
  			if(obj.pwd.value==""){
  				alert("密码不能为空！");
  				return false;
  			}
			if(obj.pwd1.value==""){
  				alert("确定密码不能为空！");
  				return false;
  			} 
  			if(obj.email.value==""){
  			alert("E-mail不能为空！");
  			return false;
  			}
  			if(obj.question.value==""){
  			alert("密码提示问题不能为空！");
  			return false;
  			}
  			if(obj.answer.value==""){
  			alert("提示问题答案不能为空！");
  			return false;
  			}  			
  		}
  	
  	</script>

  </head>
  
  <body>
 <center>
  <div id="title"><h3>用户注册</h3></div>
  <hr/>
  	<form action="register_deal.jsp" method="post" onsubmit="return check(this)" >
  	
  	<table id="login">
  		<tr>
  			<td><h3>用户名称：</h3></td>
  			<td><input type="text" name="username"/></td>
  		</tr>

  		<tr>
  			<td><h3>密&nbsp;&nbsp;&nbsp;&nbsp;码：</h3></td>
  			<td><input type="password" name="pwd"/></td>
  		</tr>
  		<tr>
  			<td><h3>确定密码：</h3></td>
  			<td><input type="password" name="pwd1"/></td>
  		</tr>
  		<tr>
  		<td><h3>E-mail地址：</h3></td>
  		<td><input type="text" name="email"/>* 请输入E-mail地址，在找回密码时应用</td>
  		</tr>
  		<tr>
  		<td><h3>密码提示问题：</h3></td>
  		<td><input type="text" name="question">如：我的学校</td>
  		</tr>
  		<tr>
  		<td><h3>提示问题答案:</h3></td>
  		<td><input type="text" name="answer">如：江西理工大学</td>
  		</tr>
  		<tr>
  			<td><input type="submit" value="提交" style="font-size:13px;font-weight:bold"/></td>
  			<td><input type="reset" value="重置"style="font-size:13px;font-weight:bold"></td>
  		</tr>
  	</table>
  	</form>
  	</center>
  </body>
</html>
