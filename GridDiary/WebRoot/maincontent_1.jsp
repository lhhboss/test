<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'maincontent_1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
		#content_left{width:100%;height:430px;float:left;}
		#con_activity{width:250px;height:400px;float:left;margin:0px 0px;}
		#con_classNews{width:705px;height:430x;float:left;margin-left:10px;}
		#schedule{width:365px;height:430px;background:#e7b5ee;float:right;margin:0px;}
		
		#kji ul li{position:relative;}
		#kji{width:200px;border:0px solid #ccc;padding-left:40px;}
		#kji ul{list-style:none;margin:0px;padding:0px;}
		#kji ul li{background:red;padding:0px 8px;height:35px;line-height:35px;border-bottom:1px solid #ccc;}
		#kji ul li ul{display:none;position:absolute;left:200px;top:0px;width:200px;border:1px solid #ccc;border-bottom:none;}
		#kji ul li.current ul{display:block;}
		#kji ul li:hover ul{display:block;}
		
		body{font-family:Verdana;font-size:20px;line-height:1.5;}
		a{color:#000;text-decoration:none;}
		a:hover{color:#f00;}
		#menu2{width:200px;border:1px solid #ccc;}
		#menu2 ul{list-style:none;margin:0px;padding:0px;}
		#menu2 ul li{background:#eee;padding:0px 8px;height:30px;line-height:30px;border-bottom:1px solid #ccc;}
	</style>

  </head>
  
  <body>
    <div id="content_left">
  		<div id="con_activity">
  			<div id="kji">
    	<ul>
    		<li><a href="goods.jsp"><font size="3px" color="white">家用电器</font></a></li>
    		<li><a href="#"><font size="3px" color="white">图书</font></a>
    			<ul>
    			<li><a href="#"><font size="3px" color="white">少儿</font></a></li>
    			<li><a href="#"><font size="3px" color="white">外语</font></a></li>
    			</ul>
    		</li>
    		<li><a href="#"><font size="3px" color="white">百货</font></a>
    			<ul>
    				<li><a href="#"><font size="3px" color="white">生活</font></a></li>
    				<li><a href="#"><font size="3px" color="white">家具</font></a></li>
    			</ul>
    		</li>
    		<li><a href="#"><font size="3px" color="white">家居</font></a></li>
    		<li><a href="#"><font size="3px" color="white">服装</font></a></li>
    		<li><a href="#"><font size="3px" color="white">食品</font></a></li>
    		<li><a href="#"><font size="3px" color="white">汽车</font></a></li>
    	</ul>
    	</div>
  		</div>
  		<div id="con_classNews">
  			<a href="goods.jsp"><img src="images/mobile.PNG"/></a>
  		</div>
    	<div id="schedule">
    		&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/time.jpg"/>
    		<div id="menu2">
    			<h3>生活服务</h3>
    			<ul>
    				<li><a href="#">【公告】</a></li>
    				<li><a href="#">【图书】</a></li>
    			</ul>
    		</div>
    	</div>
  	</div>
  </body>
</html>
