<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'goods.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	    #aoo{
	    margin:0 auto auto auto;
	    padding-top:40px;
	    padding-left:10px;
	    }
	    #content_left{width:100%;height:250px;float:left;margin-top:100px;}
	    #con_classNews{width:705px;height:350x;float:left;margin-left:120px;}
	    #schedule{width:365px;height:345px;background:#e7b5ee;float:left;margin:0px;}
    </style>
	<script type="text/javascript">
		function check(form1){
			if (form1.goodsname.value == "") {//判断用户名是不为空
				alert("请输入商品名称！");
				return false;
			}
			if(form1.goodsprice.value==""){
			alert("请输入商品价格！");
			return false;
			}
			if(form1.adress.value==""){
			alert("请输入地址！");
			return false;
			}
			if(form1.number.value==""){
			alert("请输入商品数量!");
			return false;
			}
		}
	</script>

  </head>
  
  <body>
  	<div id="content_left">
  	<div id="con_classNews">
  		<a href=""><img src="images/cloth.PNG"/></a>
  	</div>
  	<div id="schedule">
  	<form action="Goods_InsetServlet" method="post" onsubmit="return check(this)" id="aoo">
  		<table cellpadding="17">
  			<tr>
  			<td><font size="4px">商品名称：</font></td>
  			<td><input type="text" name="goodsname"></td>
  			</tr>
  			<tr>
  			<td><font size="4px">商品价格：</font></td>
  			<td><input type="text" name="goodsprice"></td>
  			</tr>
  			<tr>
  			<td><font size="4px">地址：</font></td>
  			<td><input type="text" name="adress"></td>
  			</tr>
  			<tr>
  			<td><font size="4px">数量：</font></td>
  			<td><input type="text" name="number"></td>
  			</tr>
  			<tr>
  			<td><input name="Submit" type="submit" value="购买"></td>
  			<td><input name="Submit2" type="reset" value="重置"></td>
  			</tr>
  		</table>
  	</form>
  	</div>
  	</div>
  </body>
</html>
