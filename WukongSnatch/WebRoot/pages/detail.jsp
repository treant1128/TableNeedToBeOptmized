<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'detail.jsp' starting page</title>
    
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
   <h3>OpmlœÍ«È~~</h3>
         Opml.ID:<s:property value="#request.o.opmlId"/><br>
         OpmlHeadTitle:<s:property value="#request.o.opmlHeadTitle"/><br>
         OpmlOutLineTitle:<s:property value="#request.o.opmlOutlineTitle"/><br>
         OpmlOutLineXmlURL:<s:property value="#request.o.opmlOutlineXmlUrl"/><br>
         OpmlOutLineHtmlURL:<s:property value="#request.o.opmlOutlineHtmlUrl"/><br>
  </body>
</html>
