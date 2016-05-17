<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.model.goodsbean"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'goodsList.jsp' starting page</title>
    
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
    <div width="98%" align="center">
		<h2>所以购买商品信息</h2>
	</div>
	<table width="98%" border="0" align="center" cellpadding="0"
		cellspacing="1" bgcolor="#666666">
		<tr>
			<th bgcolor="#FFFFFF">商品名称</th>
			<th bgcolor="#FFFFFF">商品价格</th>
			<th bgcolor="#FFFFFF">地址</th>
			<th bgcolor="#FFFFFF">数量</th>
		</tr>
		<%
			// 获取图书信息集合
			List<goodsbean> list = (List<goodsbean>) request.getAttribute("list");
			// 判断集合是否有效
			if (list == null || list.size() < 1) {
				out.print("<tr><td bgcolor='#FFFFFF' colspan='5'>没有任何图书信息！</td></tr>");
			} else {
				// 遍历图书集合中的数据
				for (goodsbean goods : list) {
		%>
		<tr align="center">
			<td bgcolor="#FFFFFF"><%=goods.getGoodsname()%></td>
			<td bgcolor="#FFFFFF"><%=goods.getGoodsprice()%></td>
			<td bgcolor="#FFFFFF"><%=goods.getAdress()%></td>
			<td bgcolor="#FFFFFF"><%=goods.getNumber()%></td>
		</tr>
		<%
			}
		}
		%>
	</table>
  </body>
</html>
