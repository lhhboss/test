<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <style>
#notClickDiv{
	position:absolute;							/*设置定位方式为绝对位置*/
	display:none;								/*设置该<div>标记显示*/
	z-index:9;									/*设置层叠顺序*/
	top:0px;									/*设置顶边距*/
	left:0px;									/*设置左边距*/
	margin: 0px;
	padding: 0px;
	width:100%;	/*设置宽度*/
	height:100%;	/*设置高度*/
}

</style>
	<style>
	#top{
	background-image:url(images/bg_top.jpg);
	width:100%;
	height:176px;
	font-size:20px;
	}
	#navigation{			
	background-image:url(images/navigation_bg.jpg);
	width:100%;
	height:26px;
	padding:5px 5px 0px 5px;
	margin: 0px;
	}
	#greeting{
		font-size:15px;
	}
	#noo{
		font-size:15px;
		font-weight:bold;
	}
	 </style>
<link rel="stylesheet" href="style.css">
  <div id="notClickDiv"></div>
  <div id="top">
	  <%
	  String username=(String)session.getAttribute("username");
	   %>
  	<div style="padding-left:1150px;color:yellow;">你好!<%=username %></div>
  </div>
  <div id="navigation">
   <div style="float:left;color:#006700;">
   	<div id="greeting">
			<jsp:useBean id="now" class="java.util.Date"/>
			<c:choose>
				<c:when test="${now.hours>=0 && now.hours<5}">
					凌晨好！
				</c:when>
				<c:when test="${now.hours>=5 && now.hours<8}">
					早上好！
				</c:when>	
				<c:when test="${now.hours>=8 && now.hours<11}">
					上午好！
				</c:when>
				<c:when test="${now.hours>=11 && now.hours<13}">
					中午好！
				</c:when>
				<c:when test="${now.hours>=13 && now.hours<17}">
					下午好！
				</c:when>	
				<c:otherwise>
				晚上好！
				</c:otherwise>
			</c:choose>
			现在时间是：${now.hours}时${now.minutes}分${now.seconds}秒
		</div>
	</div>
	<div style="float:right;text-align:right；" id="noo">
	<a href="">首页</a>
	<c:if test="${empty sessionScope.userName}">	
		&nbsp; | &nbsp;<a href="login.jsp">登录</a>
		&nbsp; | &nbsp;<a href="register.jsp">注册</a>
		&nbsp; | &nbsp;<a href="forgetPwd_1.jsp">找回密码</a>	 
		&nbsp; | &nbsp;<a href="logout.jsp">退出登录</a>
	</c:if>
	</div>
  </div>
