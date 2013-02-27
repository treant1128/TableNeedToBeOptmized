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
   <h3>Opml Details</h3>
   <form action="empaction!update" method="post">
  	OpmlID:	            <input type="text" name="o.opmlId" value="<s:property value='#request.o.opmlId'/>"/><br>
    OpmlHeadTitle:      <input type="text" name="o.opmlHeadTitle" value="<s:property value='#request.o.opmlHeadTitle'/>"/><br> 
    OpmlOutlineTitle:   <input type="text" name="o.opmlOutlineTitle" value="<s:property value='#request.o.opmlOutlineTitle'/>"/><br>   
    OpmlOutlineXmlURL:  <input type="text" name="o.opmlOutlineXmlUrl" value="<s:property value='#request.o.opmlOutlineXmlUrl'/>"/><br>   
    OpmlOutlineHtmlURL: <input type="text" name="o.opmlOutlineHtmlUrl" value="<s:property value='#request.o.opmlOutlineHtmlUrl'/>"/><br>   
   	<input type="submit" value="¸üUpdateÐÂ"/>
   </form>
  </body>
</html>
