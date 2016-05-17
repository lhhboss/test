<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'main.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
		#box{
		width:1200px;
		height:0px;	
		margin:10px;
		padding:0px;
		border:1px solid red;
		}
		
		#menu{
		width:1000xp;height:130px;line-height:30px;color:#6a7794;
		font-weight:bold;font-size:14px;background-color:#ffffff;
		border-bottom:2px solid #2e3033;
		}
		
		#aoo{
		padding-top:40px;
		padding-left:600px;
		}
		
		#boo ul li{float:left;padding:10px 40px;}
		
		#kji ul li{position:relative;}
		#kji{width:200px;border:0px solid #ccc;padding-left:40px;}
		#kji ul{list-style:none;margin:0px;padding:0px;}
		#kji ul li{background:red;padding:0px 8px;height:35px;line-height:35px;border-bottom:1px solid #ccc;}
		#kji ul li ul{display:none;position:absolute;left:200px;top:0px;width:200px;border:1px solid #ccc;border-bottom:none;}
		#kji ul li.current ul{display:block;}
		#kji ul li:hover ul{display:block;}
	</style>
	<script type="text/javascript">
	    function formSubmit(){
	    document.form1.method="get";
	    document.form1.action="Goods_SelectServlet";
	    document.form1.target="downFrame";
	    document.form1.submit();
	    }
	 </script>

  </head>
  
  <body>
  	<section>
  		<c:import url="top.jsp"/>
  		<div id="menu">
  			<form name="form1" action="" method="post" id="aoo">
  				<input type="text" style="width:300px;height:31px">
  				<input type="button" value="搜索" onClick="return formSubmit();" style="font-size:20px;font-weight:bold;">
  				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="FindServlet"><font size="2">我的购物车</font></a>
  			</form>
  			<div id="boo">
  		    <ul>
    			<li><font size="4px">全部商品分类</font>
    			<li><a href="goods.jsp"><font size="3px">服装城</font></a>
    			<li><a href=""><font size="3px">美妆馆</font></a>
    			<li><a href=""><font size="3px">超市</font></a>
    			<li><a href=""><font size="3px">全球购</font></a>
    			<li><a href=""><font size="3px">金融</font></a>
    			<li><a href=""><font size="3px">智能</font></a>
    		</ul>
  			</div>
  		</div>
  		<c:import url="maincontent_1.jsp"></c:import>
  		<div id=box></div>
  		<c:import url="bottom.jsp"/>	
  	</section>
  </body>
</html>
